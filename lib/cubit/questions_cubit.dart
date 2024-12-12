import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/question.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  Map<int, String> answers = {};

  Future<void> loadQuestions() async {
    try {
      emit(QuestionsLoading());
      String jsonString = await rootBundle.loadString('assets/questions.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final questions =
          jsonList.map((json) => Question.fromJson(json)).toList();
      emit(QuestionsLoaded(
          questions: questions, pageIndex: 0, answers: answers));
    } catch (error) {
      emit(QuestionsError("Erro ao carregar as perguntas."));
    }
  }

  void setPage(int index) {
    if (state is QuestionsLoaded) {
      final currentState = state as QuestionsLoaded;
      emit(QuestionsLoaded(
        questions: currentState.questions,
        pageIndex: index,
        answers: currentState.answers,
      ));
    }
  }

  void updateAnswer(int questionIndex, String value) {
    answers[questionIndex] = value;
    if (state is QuestionsLoaded) {
      final currentState = state as QuestionsLoaded;
      emit(QuestionsLoaded(
        questions: currentState.questions,
        pageIndex: currentState.pageIndex,
        answers: answers,
      ));
    }
  }

  String getAnswer(int questionIndex) {
    return answers[questionIndex] ?? '';
  }
}

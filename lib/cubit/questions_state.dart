import '../models/question.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsLoaded extends QuestionsState {
  final List<Question> questions;
  final int pageIndex;
  final Map<int, String> answers;

  QuestionsLoaded({
    required this.questions,
    required this.pageIndex,
    required this.answers,
  });

  List<Object?> get props => [questions, pageIndex, answers];
}

class QuestionsError extends QuestionsState {
  final String message;
  QuestionsError(this.message);
}

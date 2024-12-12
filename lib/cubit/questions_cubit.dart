import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsCubit extends Cubit<int> {
  QuestionsCubit() : super(0);

  void setPage(int pageIndex) {
    emit(pageIndex);
  }
}

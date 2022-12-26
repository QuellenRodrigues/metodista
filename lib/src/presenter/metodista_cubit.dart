import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/domain/repositories/metodista_repository.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class MetodistaCubit extends Cubit<MetodistaState> {
  MetodistaCubit({required this.repository}) : super(InitialState()) {
  }

  final MetodistaRepository repository;

  void getTickets() async {
    try {
      emit(LoadingState());
      final movies = await repository.getData('boletim');
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState('Erro'));
    }
  }
  void getDataQuiz() async {
    try {
      emit(LoadingState());
      final quiz = await repository.getQuiz('quiz');
      emit(LoadedQuizState(quiz));
    } catch (e) {
      emit(ErrorState('Erro'));
    }
  }
  void getDataQuizFilter(String id) async {
    try {
      emit(LoadingState());
      final quiz = await repository.getQuizFilter('quiz',id);
      emit(LoadedQuizState(quiz));
    } catch (e) {
      emit(ErrorState('Erro'));
    }
  }
  void postData(String collection, Object json)async{
    try {
      emit(LoadingState());
      repository.postData(collection,json);
        emit(LoadedPostState('Criado'));
      Future.delayed(const Duration(seconds: 3), () {
        emit(FinishState());
      });
    } catch (e) {
    emit(ErrorState('Erro'));
    }
  }
}

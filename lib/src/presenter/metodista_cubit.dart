import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/domain/repositories/metodista_repository.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';
import 'package:simple_animations/simple_animations.dart';

class MetodistaCubit extends Cubit<MetodistaState> {
  MetodistaCubit({required this.repository}) : super(InitialState()) {
    getTickets();
  }

  final MetodistaRepository repository;

  void getTickets() async {
    try {
      emit(LoadingState());
      final movies = await repository.getData('homescreentop');
      emit(LoadedState(movies));
      print('final 0');

    } catch (e) {
      emit(ErrorState());
    }
  }
  void postData(String collection, Object json)async{
    try {
      emit(LoadingState());
      final itens = await repository.postData(collection,json);
        emit(LoadedPostState('Criado'));
        print('final');
    } catch (e) {
    emit(ErrorState());
    }
  }
}

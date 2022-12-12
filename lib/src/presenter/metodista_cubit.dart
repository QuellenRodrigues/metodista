import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/domain/repositories/metodista_repository.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class MetodistaCubit extends Cubit<MetodistaState> {
  MetodistaCubit({required this.repository}) : super(InitialState()) {
    getTickets();
  }

  final MetodistaRepository repository;

  void getTickets() async {
    try {
      emit(LoadingState());
      final movies = await repository.getData('bilhetes');
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}

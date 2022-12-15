
import 'package:equatable/equatable.dart';
import 'package:metodistaapp/src/infra/models/home_model.dart';
abstract class MetodistaState extends Equatable {}

class InitialState extends MetodistaState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MetodistaState {
  @override
  List<Object> get props => [];
}


class LoadedPostState extends MetodistaState{
  LoadedPostState(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
class LoadedState extends MetodistaState {
  LoadedState(this.itens);

  final List<HomeModel> itens;
  @override
  List<Object> get props => [itens];
}

class ErrorState extends MetodistaState {
  @override
  List<Object> get props => [];
}

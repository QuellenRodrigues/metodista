
import 'package:equatable/equatable.dart';
import 'package:metodistaapp/src/infra/models/home_model.dart';
import 'package:metodistaapp/src/infra/models/quiz_model.dart';
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
  final String message;
  LoadedPostState(this.message);
  @override
  List<Object> get props => [message];
}
class LoadedState extends MetodistaState {
  LoadedState(this.itens);

  final List<HomeModel> itens;
  @override
  List<Object> get props => [itens];
}
class LoadedQuizState extends MetodistaState {
  LoadedQuizState(this.itens);

  final List<QuizModel> itens;
  @override
  List<Object> get props => [itens];
}

class ErrorState extends MetodistaState {
  ErrorState(this.erro);
  final String erro;
  @override
  List<Object> get props => [erro];
}
class FinishState extends MetodistaState {
  @override
  List<Object> get props => [];
}


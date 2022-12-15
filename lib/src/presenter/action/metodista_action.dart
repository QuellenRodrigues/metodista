import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';


class PostAction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetodistaCubit,MetodistaState>(
        builder: (context, state){
          String message = "";
          return Container(
            child: Column(
              children: <Widget>[
                if(state is LoadedPostState)Text(message),
                if(state is LoadingState) CircularProgressIndicator()
              ],
            )
          );
        });
  }
}

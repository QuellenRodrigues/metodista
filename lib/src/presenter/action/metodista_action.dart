import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';


class MetodistaAction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetodistaCubit,MetodistaState>(
        builder: (context, state){
          String message = '';
          if(state is LoadedPostState){
            message = state.message;
          }
          if(state is FinishState){
            message = '';
          }
          return Container(
            width: 200,height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                if(state is FinishState)Center(
                    child: Text(message,style: GoogleFonts.quicksand(fontSize: 18,fontWeight: FontWeight.w700,),)),
                if(state is LoadedPostState)Center(
                  child: Text(message,style: GoogleFonts.quicksand(fontSize: 18,fontWeight: FontWeight.w700,),)),
                if(state is LoadingState) CircularProgressIndicator()
              ],
            )
          );
        });
  }
  
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/kids/quiz/quiz_screen.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

import '../../../domain/repositories/metodista_repository.dart';

class MenuQuizScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ) ,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagens/quiz-fundo.png'),fit: BoxFit.cover
            ),
        ),
        child: BlocBuilder<MetodistaCubit, MetodistaState>(
          builder: (context, state) {
            if (state is LoadingState) {
              print('Loading');
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              print('Error');

              return Center(
                child: Icon(Icons.close),
              );
            } else if (state is LoadedQuizState) {
              final itens = state.itens;
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height,
                  child:ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (context, index){
                        return ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider<MetodistaCubit>(
                            create: (context) => MetodistaCubit(
                                repository: MetodistaRepository(Dio()))..getDataQuizFilter(itens[index].id),
                            child: QuizScreen(),
                          ),));
                         }, child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  CircleAvatar(backgroundColor: Colors.deepPurple.shade900,radius: 40,
                                      backgroundImage: AssetImage('imagens/menuquiz.png')),
                                  SizedBox(width: 20),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight: Radius.circular(20)
                                            ),
                                            color: Colors.deepPurple.shade900
                                        ),
                                        child: Center(
                                          child: Text(itens[index].pergunta,
                                            style: GoogleFonts.quicksand(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                                        ),
                                      ))

                                ],
                              ),
                            )),style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),);
                      }));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class QuizScreen extends StatefulWidget {


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagens/quizquiz.png'),fit: BoxFit.cover
            )
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
                height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: itens.length,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      Divider(height: 100,),
                      Text('Hora do Quiz',style: GoogleFonts.prostoOne(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w700,fontSize: 28),),
                      Divider(height: 20,),
                      Container(
                          width: 300,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)
                                      )
                                  ),
                                  child: Center(
                                    child: Text(itens[index].pergunta,style:
                                    GoogleFonts.quicksand(
                                      fontSize: 18 ,color: Colors.white,fontWeight: FontWeight.w700,),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: itens[index].respostas.length,
                                    itemBuilder: (context, indice){
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedIndex = indice;
                                            print(itens[index].respostas[indice]);
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: selectedIndex == indice? Colors.deepPurple.shade900:Colors.deepOrange
                                            ),
                                            child: Center(
                                              child: Text(itens[index].respostas[indice],style: GoogleFonts.quicksand(color: Colors.white,
                                                  fontWeight: FontWeight.w700),),
                                            ),
                                          ),),
                                      );
                                    }),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),);
            } else {
              return Container(child: Text('aqui'),);
            }
          },
        ),
      ),
    );
  }
}

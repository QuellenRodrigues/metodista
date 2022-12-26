import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/domain/repositories/metodista_repository.dart';
import 'package:metodistaapp/src/presenter/kids/quiz/menuquiz_screen.dart';
import 'package:metodistaapp/src/presenter/kids/quiz/quiz_screen.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';

class MenuKidsScreen extends StatefulWidget {
  const MenuKidsScreen({Key? key}) : super(key: key);

  @override
  State<MenuKidsScreen> createState() => _MenuKidsScreenState();
}

class _MenuKidsScreenState extends State<MenuKidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagens/quiz-fundo.png',),fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                child: Image.asset('imagens/logo-play.png',fit: BoxFit.cover,)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: Image.asset('imagens/geracao-samue.png'),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider<MetodistaCubit>(
                    create: (context) => MetodistaCubit(
                        repository: MetodistaRepository(Dio()))..getDataQuiz(),
                    child: MenuQuizScreen(),
                    ),));
                  },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30.0),
                      child: Image.asset('imagens/criancas.png'),
                    ),style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

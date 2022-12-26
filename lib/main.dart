
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/domain/repositories/metodista_repository.dart';
import 'package:metodistaapp/src/presenter/homescreen/home_screen.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<MetodistaCubit>(
        create: (context) => MetodistaCubit(
            repository: MetodistaRepository(Dio()),)..getTickets(),
        child: HomeScreen(),
      ),
    );
  }
}

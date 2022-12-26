import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/homescreen/bilhetes_screen.dart';
import 'package:metodistaapp/src/presenter/homescreen/boletim_screen.dart';
import 'package:metodistaapp/src/presenter/homescreen/photosboletim_screen.dart';
import 'package:metodistaapp/src/presenter/homescreen/pixcopy_screen.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_drawer.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_homescreen.dart';

import 'aniversariantes.dart';
import 'socialmidia.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(elevation: 0.0,
          iconTheme:  IconThemeData(
              color: Colors.white),
          backgroundColor: Colors.transparent,),
        extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child:  Column(
            children: <Widget>[
              CustomHomeScreen(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // SocialMidia(),
                      _title(title: 'Pensamento do Dia:'),
                      ScreenBilhetes(),
                      _title(title: 'Nosso Pix:'),
                      ScreenPixCopy(),

                      _title(title: 'Boletim:'),
                      ScreenBoletim(),
                      _title(title: 'Aniversariantes:'),
                      Aniversariantes(),
                      Divider(color: Colors.transparent,),
                      ScreenPhotosBoletim(),

                    ],
                  ),)
            ],
          )
        )
    );
  }
  Widget _title({
    required String title,
}){
    return Column(
      children: [
        SizedBox(height: 10),
        Text(title,style: TextStyle(
          color: Colors.black54,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10),
      ],
    );

}
}

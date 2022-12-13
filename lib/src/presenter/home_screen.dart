import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/homescreen/screen_bilhetes.dart';
import 'package:metodistaapp/src/presenter/homescreen/screen_boletim.dart';
import 'package:metodistaapp/src/presenter/homescreen/screen_photosboletim.dart';
import 'package:metodistaapp/src/presenter/homescreen/screen_pixcopy.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_drawer.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_homescreen.dart';

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
                    children: <Widget>[
                      ScreenBilhetes(),
                      Divider(color: Colors.transparent,),
                      ScreenPixCopy(),
                      ScreenBoletim(),
                      Divider(color: Colors.transparent,),
                      ScreenPhotosBoletim(),

                    ],
                  ),)
            ],
          )
        )
    );
  }
}

import 'package:flutter/material.dart';
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
        child: Column(
          children: <Widget>[
            CustomHomeScreen()
          ],
        ),
      ),
    );
  }
}
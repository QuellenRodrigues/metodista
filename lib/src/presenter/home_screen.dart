import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_drawer.dart';
import 'package:metodistaapp/src/presenter/widgets/custom_homescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.white),
        backgroundColor: Colors.transparent,),
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomHomeScreen(),
            BlocBuilder<MetodistaCubit, MetodistaState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                } else if (state is LoadedState) {
                  final itens = state.itens;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage('imagens/pensamentos.png'),fit: BoxFit.cover)),
                    child: ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (context, index) => Column(
                        children: <Widget>[
                          Align(
                            child: SizedBox(
                              child: Text(itens[index].tickets_text),
                              height: 100,width: 200,
                            ),
                            alignment: Alignment.centerRight,
                          )
                        ],
                      ),
                  ),);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
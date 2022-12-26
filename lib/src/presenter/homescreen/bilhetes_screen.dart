import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class ScreenBilhetes extends StatelessWidget {
  const ScreenBilhetes({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
                    padding: EdgeInsets.all(10),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itens.length,
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        Align(
                          child: SizedBox(
                            child: Text(itens[index].tickets),
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
    );
  }
}

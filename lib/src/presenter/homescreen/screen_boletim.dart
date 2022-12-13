import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/constants/colors.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class ScreenBoletim extends StatelessWidget {

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
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage('imagens/boletimfundo.png'),fit: BoxFit.cover,opacity: 0.5)),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics() ,
                    itemCount: itens.length,
                    itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(20),
                      child: Stack(
                        children: <Widget>[
                          Text(itens[index].boletim_text,style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.w500),),
                          Padding(padding: EdgeInsets.only(top: 120),
                              child: Center(
                                  child: ElevatedButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(10),

                                                )
                                            ),
                                            context: context,
                                            builder: (BuildContext context){
                                              return  Padding(
                                                  padding: EdgeInsets.all(20),
                                                  child: SizedBox(
                                                      child: SingleChildScrollView(
                                                          child:Text(itens[index].boletim_text,style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.w400),),
                                                      )
                                                  ));
                                            }
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(300, 50),
                                          elevation: 10 ,
                                          backgroundColor: primarycolor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20))
                                      ),
                                      child: Text('Visualizar Pastoral',style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,color: Colors.white),))),
                            )
                        ],
                      ))
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
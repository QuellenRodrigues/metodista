import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/constants/colors.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';

class Aniversariantes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetodistaCubit,MetodistaState>(
        builder: (context, state){
          if(state is LoadingState){
            return CircularProgressIndicator();
          }else if(state is Error){
            return Icon(Icons.error);
          }else if(state is LoadedState){
            final itens = state.itens;
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: CarouselSlider.builder(
                          itemCount: itens[index].birthday.length,
                          itemBuilder: (context, indice, child){
                            return Padding(padding: EdgeInsets.only(left: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(
                                  child: Text(
                                    '${itens[index].birthday[indice]}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white, fontWeight: FontWeight.w700),
                                  ),
                                ),)
                            );
                          }, options: CarouselOptions(
                              viewportFraction: 0.3,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                      ),),
                    );
                  }),
            );
          }
          return Container();
        });
  }
}

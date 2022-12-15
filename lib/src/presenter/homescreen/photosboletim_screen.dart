import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/constants/colors.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';
import 'package:metodistaapp/src/presenter/state/metodista_state.dart';
class ScreenPhotosBoletim extends StatelessWidget {
  const ScreenPhotosBoletim({Key? key}) : super(key: key);

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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 250,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itens.length,
                      itemBuilder: (context, index) =>
                          CarouselSlider.builder(
                            itemCount: itens[index].photos_boletim.length,
                            itemBuilder: (context, indice, child){
                              var photos = itens[index].photos_boletim[indice];
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(image: NetworkImage(photos),fit: BoxFit.cover)),
                              );
                            },
                            options: CarouselOptions(
                              height: 250,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),)
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
import 'package:flutter/material.dart';
import 'package:metodistaapp/src/constants/colors.dart';

class CustomHomeScreen extends StatelessWidget {
  const CustomHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Ink(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
                'imagens/novotemplo.jpeg'),
                fit: BoxFit.fill),
          ),
        ),
        Ink(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
          ),
        ),

       Center(
         child:  Container(
           width: double.infinity,
           margin: const EdgeInsets.only(top: 20),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Padding(padding: EdgeInsets.only(left: 300),
                   child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       _socialMedia(img: 'whats_logo.png'),
                       _socialMedia(img: 'face_logo.png'),
                       _socialMedia(img: 'youtube_logo.png'),
                       _socialMedia(img: 'insta_logo.png'),
                     ],
                   )),
               SizedBox(
                 height: 80,
               ),
               Text(
                 'Metodista Jardim Belvedere',
                 style: TextStyle(
                     color: Colors.blueGrey.shade800
                 ),
               ),
               Text(
                 '15 Anos',
                 style: TextStyle(
                     color: Colors.grey
                 ),
               ),
             ],
           ),
         ),
       )
      ],
    );
  }
  Widget _socialMedia({
  required String img,
  
}){
    return Padding(padding: EdgeInsets.only(top: 5,right: 10),
    child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 7.0),
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'imagens/$img'),
            )
        ),
    ),

    // child:  CircleAvatar(
    //   backgroundColor: Colors.white,
    //   radius: 25,
    //   child: Image.asset('imagens/$img',fit: BoxFit.cover,),
    // ),
    );
}
}

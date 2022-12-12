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

        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 250),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey.shade400,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: primarycolor,
                    radius: 25,
                    child: Image.asset('imagens/metodista.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
      ],
    );
  }
}

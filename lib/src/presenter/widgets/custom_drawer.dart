import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metodistaapp/src/presenter/quiz_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        backgroundColor:Colors.black.withOpacity(0.8) ,
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(bottom: 20),),

                  ListTile(

                      leading:Icon(Icons.home_outlined,color: Colors.white,size: 30,),
                      title: Text("Inicio", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      onTap: () => {}
                  ),
                  ListTile(
                      leading:Icon(Icons.handshake,color: Colors.white,size: 30,),
                      title: Text("Testemunhos",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      //onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> TestemunhoInterface()))}
                  ),
                  ListTile(
                      leading:Icon(Icons.audiotrack,color: Colors.white,),
                      title: Text("Devocional", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      //onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> DevocionalListaCompletaInterface()))}
                  ),
                  ListTile(
                      leading:Icon(Icons.dock,color: Colors.white,),
                      title: Text("Documentos",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      //onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> DocumentoListaTema()))}
                  ),
                  ListTile(
                      leading:Icon(Icons.edit,color: Colors.white,),
                      title: Text("Incrições", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      onTap: () => {
                        //Get.toNamed('/listatividade')
                      }
                  ),
                  ListTile(
                      leading:Icon(Icons.child_care,color: Colors.white,),
                      title: Text("Quiz Ministério de Crianças", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      onTap: () => {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizScreen()))
                      }
                  ),
                  ListTile(
                      leading:Icon(Icons.church,color: Colors.white,),
                      title: Text("Igreja", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      onTap: () => {}
                  ),
                  ListTile(
                      leading:Icon(Icons.live_tv,color: Colors.white,),
                      title: Text("Youtube", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                     // onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> Cultos_Youtube()))}
                  ),
                  Divider(color: Colors.black.withOpacity(0.8),height: 10,),
                  ListTile(
                      leading: Icon(Icons.login,color: Colors.white),
                      title: Text("Login", style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16)),
                      onTap: () {
                        // FirebaseAuth auth = FirebaseAuth.instance;
                        // auth.signOut();
                        // Get.toNamed('/login');
                      }

                  ),

                  Padding(padding: EdgeInsets.only(bottom: 40),),


                ],
              ),
            ),
          ),
        )


    );
  }
}

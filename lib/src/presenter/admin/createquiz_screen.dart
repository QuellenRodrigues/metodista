import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:metodistaapp/src/constants/colors.dart';
import 'package:metodistaapp/src/presenter/action/metodista_action.dart';
import 'package:metodistaapp/src/presenter/metodista_cubit.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {

  List<String> answers = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerQuestion = TextEditingController();
  TextEditingController controllerAnswers = TextEditingController();
  int selectedIndex = 0;
  late String answer;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          FirebaseFirestore db = FirebaseFirestore.instance;
          String id = db.collection('quiz').doc().id;
          var postcubit = context.read<MetodistaCubit>();postcubit.postData('quiz', {
            "pergunta":controllerQuestion.text,
            "respostas":answers,
            "respostacerta": answer,
            "quemrespondeu": [],
            "id":id
            

          });
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              answers.clear();
              controllerQuestion.clear();
              controllerAnswers.clear();
            });  // Prints after 1 second.
          });

        },
        backgroundColor: primarycolor, label: Text('Criar Quiz',style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: primarycolor,
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Divider(color: Colors.transparent,),
                Container(
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Lottie.asset('imagens/quiz.json',width: 300,height: 300),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MetodistaAction(),)
                    ],
                  ),
                ),
                TextFormField(
                  controller: controllerQuestion,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O Campo Pergunta não pode estar vázio';
                    }
                    return null;
                  },
                  style: GoogleFonts.quicksand(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Pergunta',
                    labelStyle: GoogleFonts.quicksand(fontSize: 18),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 0.5,color: Colors.grey.shade400)
                    ),
                  ),
                ),
                Divider(color: Colors.transparent,),
                Row(
                  children: <Widget>[
                  Expanded(child: TextFormField(
                    controller: controllerAnswers,
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O Campo Resposta não pode estar vázio';
                      }
                      return null;
                    },
                    style: GoogleFonts.quicksand(fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Resposta',
                      labelStyle: GoogleFonts.quicksand(fontSize: 18),
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0.5,color: Colors.grey.shade400)
                      ),
                    ),
                  ),),

                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            answers.add(controllerAnswers.text);
                            print(answers);
                            controllerAnswers.clear();
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: primarycolor,
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.transparent,height: 5),

                Expanded(
                    child: ListView.builder(
                        itemCount: answers.length,
                        itemBuilder: (context, index){
                          final item = answers[index];
                          return Dismissible(
                              background:Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red,),
                                child: Icon(Icons.delete),),
                              key:Key(item),
                              onDismissed: (direction) {
                                setState(() {
                                  answers.removeAt(index);
                                  print(answers.length);

                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: Colors.grey.shade400),),
                                  child: ListTile(
                                    onTap: (){
                                      setState(() {
                                        selectedIndex = index;
                                        print(answers[index]);
                                        answer = answers[index];
                                      });
                                    },
                                    trailing: Icon(selectedIndex == index ? Icons.check_circle: Icons.quiz,color: selectedIndex == index ? Colors.blue.shade800 : primarycolor,),
                                    title:Text(answers[index],style: GoogleFonts.quicksand(fontSize: 18),),
                                  ),
                                ),
                              ));
                        }))
              ],
            ),
          ),
        ),
      )
    );
  }


}

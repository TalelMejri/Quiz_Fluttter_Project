import 'dart:math';
import 'package:flutter/material.dart';
import 'appBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:confetti/confetti.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
void main(){
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz APP",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(title: "Quiz App",)
    );
  }
}


class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});
   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  appBrain appbrain= appBrain();
  List<Padding>  answerresult=[];
    late ConfettiController _centerController;
      @override
  void initState() {
    super.initState();
    _centerController =
        ConfettiController(duration: const Duration(seconds: 5));
  }
  int rightAnswers=0;
  void changerText(bool check){
    setState(() {
       bool correctAnswer=appbrain.AnswerQuestion();
      if(correctAnswer==check){
          rightAnswers++;
          answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_up,color: Colors.green,),));
      }else{
          answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_down,color: Colors.red,),));
      }
      if(appbrain.isFinished()){
           if(rightAnswers>3){
            _centerController.play();
           }
           Future.delayed(const Duration(seconds: 2),(){
                 _centerController.stop(); 
          Alert(
      context: context,
      title: "Finished",
      desc: "you answer $rightAnswers correct",
      buttons: [
        DialogButton(
           onPressed: (){_centerController.stop();Navigator.pop(context);},
          width: 120,
          child:  const Text(
            "play again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
        });
          appbrain.reset();
          answerresult=[];
          rightAnswers=0;
      }else{
        appbrain.nextQuestion();
      }
    });
  }

  // List<String> question=[
  //   "test1",
  //   "test2",
  //   "test3",
  //   "test4"
  // ];

  // List<bool> reponse=[
  //   true,
  //   false,
  //   true,
  //   true
  // ];

  // List <String> imagesanswers=[
  //   "images/image-1.jpg",
  //   "images/image-2.jpg",
  //   "images/image-3.jpg",
  //   "images/image-4.jpg"
  // ];

  

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(title: Text(widget.title),),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(flex: 1,child:  Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _centerController,
                  blastDirection: pi / 2,
                  maxBlastForce: 5,
                  minBlastForce: 1,
                  emissionFrequency: 0.03,
                  numberOfParticles: 10,
                  gravity: 0,
                ),
              ),),
          Row(children: answerresult,),
          Expanded(flex:5,child: Column(children: [
            Image.asset(appbrain.ImageQuestion()),
            const SizedBox(height: 20,),
             Text(appbrain.TestQuestionj(),textAlign: TextAlign.center,style: const TextStyle(fontSize: 24.0),)
          ],)
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed:(){ changerText(true);},style: ElevatedButton.styleFrom(backgroundColor: Colors.green),child:const Text("Correct"),)
          ),),
            Expanded(child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: (){
             changerText(false);
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red),child: const Text("Incorrect"))
          ),)
        ],
      ),),
      // bottomNavigationBar:  CurvedNavigationBar(
      //   backgroundColor: Colors.deepPurple,
      //   color: Colors.deepPurple.shade200,
      //   items: <Widget> [
      //      Icon(Icons.home,color: Colors.white),
      //      Icon(Icons.account_balance,color:Colors.white),
      //      Icon(Icons.settings,color: Colors.white,),
      //   ],
      // ),
    );
  }
}
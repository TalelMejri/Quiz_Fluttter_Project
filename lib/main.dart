import 'package:flutter/material.dart';
import 'appBrain.dart';
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
          showDialog(context: context, builder: (BuildContext context){
             return AlertDialog(
                    title:Text("congrats"),
                    content: Text("hdhdhd ${rightAnswers}"),
                    actions: [Icon(Icons.close)],
             );
          });
          rightAnswers=0;
          appbrain.reset();
          answerresult=[];
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
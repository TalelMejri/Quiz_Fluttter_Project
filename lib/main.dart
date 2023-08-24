import 'package:flutter/material.dart';
import 'package:quiz_flutter/Question.dart';
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

  List<Padding>  answerresult=[];

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

  List<Question> questiongroup=[
    Question(q: "test",i: "images/image-1.jpg",a: true),
    Question(q: "test2",i: "images/image-2.jpg",a: false),
    Question(q: "test3",i: "images/image-3.jpg",a: true),
    Question(q: "test4",i: "images/image-4.jpg",a: false)
  ];

  int questionnumber=0;
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
            Image.asset(questiongroup[questionnumber].questionImage),
            const SizedBox(height: 20,),
             Text(questiongroup[questionnumber].questionText,textAlign: TextAlign.center,style: const TextStyle(fontSize: 24.0),)
          ],)
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: (){
              bool correctAnswer=questiongroup[questionnumber].questionAnswer;
              if(correctAnswer==true){
                answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_up,color: Colors.green,),));
              }else{
                  answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_down,color: Colors.red,),));
              }
              setState(() {
               questionnumber++;
              });
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.green),child:const Text("Correct"),)
          ),),
            Expanded(child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: (){
              bool correctAnswer=questiongroup[questionnumber].questionAnswer;
              if(correctAnswer==false){
                  answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_up,color: Colors.green,),));
              }else{
                  answerresult.add(const Padding(padding: EdgeInsets.all(3),child: Icon(Icons.thumb_down,color: Colors.red,),));
              }
                setState(() {
               questionnumber++;
              });
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
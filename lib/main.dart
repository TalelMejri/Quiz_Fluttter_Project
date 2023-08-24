import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz APP",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home:const MyHomePage(title: "Quiz App",)
    );
  }
}


class MyHomePage extends StatefulWidget{

  const MyHomePage({super.key,required this.title});
  final String title;
  @override
  State<MyHomePage> createState()=>_MyHomePage();
 
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
    );
  }
}
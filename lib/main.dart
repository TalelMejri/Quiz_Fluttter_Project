import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar:  CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
        items: <Widget> [
           Icon(Icons.home,color: Colors.white),
           Icon(Icons.account_balance,color:Colors.white),
           Icon(Icons.settings,color: Colors.white,),
        ],
      ),
    );
  }
}
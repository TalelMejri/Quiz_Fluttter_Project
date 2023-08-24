import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(title: Text(widget.title),),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex:5,child: Column(children: [
            Image.asset("images/image-1.jpg"),
            const SizedBox(height: 20,),
            const Text("test",textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0),)
          ],)
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.green),child:const Text("Correct"),)
          ),),
            Expanded(child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.red),child: const Text("Incorrect"))
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
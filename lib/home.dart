import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          scale: 8,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              debugPrint("Ação streaming");
            }, 
            icon: const Icon(Icons.connected_tv_outlined),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação videoCam");
            }, 
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação pesquisa");
            }, 
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação conta");
            }, 
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(

      )
    );
  }
}
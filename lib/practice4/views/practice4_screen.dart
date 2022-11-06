import 'package:flutter/material.dart';

class Practice4Screen extends StatefulWidget {
  const Practice4Screen({Key? key}) : super(key: key);

  @override
  State<Practice4Screen> createState() => _Practice4ScreenState();
}

class _Practice4ScreenState extends State<Practice4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Use api in flutter"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue
              )
            ]
          ),
          child: Center(
            child: Card(
              child: Text("CONGRATULATION'S", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold,
                color: Colors.lightBlue
              ),),
            ),
          ),
        ),
      ),
    );
  }
}

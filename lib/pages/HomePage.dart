import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Text("HomePage",style: new TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w900
      ),),
    );
  }
}

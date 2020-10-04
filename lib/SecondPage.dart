import 'package:flutter/material.dart';

import 'User.dart';

class SecondPage extends StatefulWidget {

  final User user;
  const SecondPage({Key key, @required this.user}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText:
                  widget.user.email
              ) ,
              style:  TextStyle(
                fontWeight:  FontWeight.bold
              )),
            Text(widget.user.email),
            Text(widget.user.password),
          //  Text(this.password)
          ],
        ),
      ),
    );
  }
}

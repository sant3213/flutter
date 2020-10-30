import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/Widgets.dart';

import 'SecondPage.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  User user = new User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(padding: EdgeInsets.all(10.0),
          children: <Widget>[
        Center(
      child: Form(
          key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Widgets().getTextFormFielEmaildWidget(emailController, 'Ingrese su correo', 'Correo *'),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Enter your password',
                            labelText: 'Password *',
                          ),
                        validator: (value)=> validateStructure(value) ? null: "Por favor ingrese una contraseña válida",
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text("Enviar dato"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                user.email = emailController.text;
                                user.password = passwordController.text;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SecondPage(user: user),
                                  ));
                            }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
      )
    )
      ])
    );
  }
bool validateStructure(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
}

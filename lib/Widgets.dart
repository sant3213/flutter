import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widgets{

  Widget getTextFormFielEmaildWidget(TextEditingController emailController, String hintTxt, String labelText){
    return TextFormField(
        controller: emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hintTxt,
      labelText: labelText,
    icon: Icon(Icons.person)
  ),
  validator: (value) => EmailValidator.validate(value) ? null: "Por favor ingrese un email válido",
  );
}
}
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final bool? email;
  final bool? name;
  final bool off;
  final String text;
  final bool password;
  final TextEditingController controller;

  const TextInput({
    super.key,
    this.email,
    this.name,
    required this.off,
    required this.text,
    required this.password,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        readOnly: off,
        controller: controller,
        validator: (value) {
          if (name == true) {
            if (value == null || value == "") {
              return "O valor do nome deve ser preenchido";
            }
          }

          if (email == true) {
            if (value == null || value == "") {
              return "O valor de e-mail deve ser preenchido";
            }
            if (!value.contains("@") ||
                !value.contains(".") ||
                value.length < 4) {
              return "O valor do e-mail deve ser válido";
            }
          } else if (password == true) {
            if (value == null || value.length < 4) {
              return "Insira uma senha válida.";
            }
          }

          return null;
        },
        obscureText: password,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // enabledBorder: InputBorder.none,
          //  errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          filled: true,

          hintText: text,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

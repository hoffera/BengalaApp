import 'package:bengalapp/enum/enum.dart';
import 'package:bengalapp/services/auth_services.dart';
import 'package:bengalapp/widgets/card_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Perfil",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 80.0),
            _card(context, user!.displayName!, TypeCard.name),
            const SizedBox(height: 20.0),
            _card(context, user.email!, TypeCard.email),
            const SizedBox(height: 20.0),
            _card(context, "0 Km", TypeCard.km),
            const SizedBox(height: 20.0),
            _logout(context),
          ],
        )),
      ),
    );
  }

  _card(context, String info, TypeCard type) {
    return CardUser(
      context,
      info: info,
      type: type,
    );
  }

  _logout(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          AuthService().deslogar().then((error) {
            if (error == null) {
              Navigator.pushNamed(context, '/HomePage');
            }
          });
        },
        child: const Text(
          'Desconectar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }
}

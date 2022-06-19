import 'package:flutter/material.dart';

import 'package:simulador_credito_rispar/pages/request_ammount/components/ammount_field.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              Container(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: const Text(
                    'De quanto você precisa?',
                    style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                  )),
              const SizedBox(height: 6.0),
              AmmountField(),

              const SizedBox(height: 12.0),

              const SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.WARRANTY),
                      child: const Text("VER TODOS"))
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

}

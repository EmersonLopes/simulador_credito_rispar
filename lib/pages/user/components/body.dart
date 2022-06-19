import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import '../../../utils/regex_util.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;

  late TextEditingController emailController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _image(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Text("Simule agora",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5,
                    )),
              ),
              const SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text("Crédito rápido, fácil e seguro! :) ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    )),
              ),

              const SizedBox(height: 40),
              buildNameFormField(),
              const SizedBox(height: 30),
              buildEmailFormField(),
              const SizedBox(height: 30),
              WidgetDefaultButtom(
                text: "Continuar",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    print('ok');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Verifique suas informações')));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _image(context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage("assets/images/user.png"),
          image: AssetImage("assets/images/user.png"),
        ),
      ),
    );
  }

  buildNameFormField() {
    return WidgetTextFormField(
      controller: nameController,
      labelText: "Qual seu nome completo?",
      hintText: "Nome completo",
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      // onChanged: signupController.setName,
      validator: (value) {
        if (value!.isEmpty) return "Nome inválido";

        return null;
      },
    );
  }

  buildEmailFormField() {
    return WidgetTextFormField(
      controller: emailController,
      labelText: "E seu Email?",
      hintText: "seuemail@email.com",
      keyboardType: TextInputType.emailAddress,
      // onChanged: signupController.setEmail,
      validator: (value) {
        if (!RegexUtil.isEmailValid(value!)) return 'E-mail inválido';

        return null;
      },
    );
  }
}

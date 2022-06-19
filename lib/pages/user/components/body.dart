import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import '../../../utils/regex_util.dart';
import 'label_text.dart';

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
                child: Row(
                  children: [
                    const Text("Simule",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.5,
                        )),
                    Text(" agora",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                          height: 1.5,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Text("Crédito rápido, fácil e seguro! :) ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    )),
              ),
              const SizedBox(height: 40),
              const LabelText(
                firstText: "Qual seu",
                secondText: " nome completo?",
              ),
              buildNameFormField(),
              const SizedBox(height: 30),
              const LabelText(
                firstText: "E seu",
                secondText: " e-mail?",
              ),
              buildEmailFormField(),
              const SizedBox(height: 30),
              WidgetDefaultButtom(
                text: "Continuar",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, AppRoutes.REQUEST_AMMOUNT);
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
      // labelText: "Qual seu nome completo?",
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

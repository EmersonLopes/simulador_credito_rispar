import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';

import 'package:simulador_credito_rispar/pages/request_ammount/components/ammount_field.dart';
import 'package:simulador_credito_rispar/pages/user/components/label_text.dart';
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
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _quantoPrecisa(),
              const SizedBox(height: 4),
              AmmountField(),
              const SizedBox(height: 12.0),
              WidgetDefaultButtom(
                text: "Continuar",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, AppRoutes.WARRANTY);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Informe o valor')));
                  }
                },
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  _quantoPrecisa() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Text("De quanto",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    height: 1.5,
                  )),
              const Text(" você precisa?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                  )),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: const LabelText(
              firstText: "Insira um valor entre",
              secondText: " R\$500 a R\$300.000",
            ),
          ),
        ],
      ),
    );
  }
}

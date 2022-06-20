import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'components/body.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.USER, (route) => false);
              },
              icon: Icon(Icons.close))
        ]),
        body: Body());
  }
}

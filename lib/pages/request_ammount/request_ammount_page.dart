import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'components/body.dart';

class RequestAmmountPage extends StatefulWidget {
  @override
  _RequestAmmountPageState createState() => _RequestAmmountPageState();
}

class _RequestAmmountPageState extends State<RequestAmmountPage> {
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
        body: const Body());
  }
}

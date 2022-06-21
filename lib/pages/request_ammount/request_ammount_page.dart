import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/components/widget_progress_indicator.dart';
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
        appBar: AppBar(elevation: 0, title: WidgetProgressIndicator(perctValue: 0.33,)),
        body: const Body());
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/components/widget_progress_indicator.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';

import 'components/body.dart';

class WarrantyPage extends StatefulWidget {
  const WarrantyPage({Key? key}) : super(key: key);

  @override
  State<WarrantyPage> createState() => _WarrantyPageState();
}

class _WarrantyPageState extends State<WarrantyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: WidgetProgressIndicator(
              perctValue: 0.66,
            )),
        body: Body());
  }
}

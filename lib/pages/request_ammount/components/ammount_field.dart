import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';

class AmmountField extends StatefulWidget {
  AmmountField({Key? key}) : super(key: key);

  @override
  State<AmmountField> createState() => _AmmountFieldState();
}

class _AmmountFieldState extends State<AmmountField> {
  final double _fontSize = 30.0;

  late SimulationController simulationController;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetTextFormField(
        autofocus: true,
        prefix: Text(
          'R\$ ',
          style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          // MaskTextInputFormatter(
          //   mask: "###.###",
          //   filter: {"#": RegExp(r'[0-9]')},
          // )
        ],
        validator: (value) {
          if ((value!.trim().isEmpty) ||
              (double.tryParse(
                      value.replaceAll('.', '').replaceAll(',', '.')) ==
                  null)) return 'Valor inválido';

          double? valor =
              double.tryParse(value.replaceAll('.', '').replaceAll(',', '.'));

          if (valor! < 500 || valor > 300000)
            return 'Valor deve estar entre R\$500 e R\$300.000';

          return null;
        },
        onChanged: (value) {
          try {
            simulationController.simulationRequest.amount =
                double.parse(value.replaceAll('.', '').replaceAll(',', '.'));
            print(simulationController.simulationRequest.amount);
          } on FormatException {
            simulationController.simulationRequest.amount = 0;
          }
        },
      ),
    );
  }
}

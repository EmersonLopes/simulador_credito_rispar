import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';

class AmmountField extends StatelessWidget {
  AmmountField({Key? key}) : super(key: key);

  final double _fontSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetTextFormField(
        // hintText: "Insira um valor",
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

                  double? valor = double.tryParse(
                      value.replaceAll('.', '').replaceAll(',', '.'));

                   if (valor! < 500 || valor > 300000) return 'Valor deve estar entre R\$500 e R\$300.000';

          return null;
        },
        onChanged: (value) {
          try {
            // supplyController.supplyToSave.price =
            //     num.parse(value.replaceAll('.', '').replaceAll(',', '.'))
            //         as double?;
          } on FormatException {
            // supplyController.supplyToSave.price = 0;
          }
        },
      ),
    );
  }
}

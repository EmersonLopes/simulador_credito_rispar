import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';

class AmmountField extends StatelessWidget {


  AmmountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: WidgetTextFormField(
        labelText: "Preço",
        hintText: "0.00",
        prefix: const Text('R\$ '),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CentavosInputFormatter(casasDecimais: 2)
        ],
        validator: (value) {
          if ((value!.trim().isEmpty) ||
              (double.tryParse(
                      value.replaceAll('.', '').replaceAll(',', '.')) ==
                  null)) return 'Valor inválido';

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

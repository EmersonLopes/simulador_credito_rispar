import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/utils/regex_util.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late TextEditingController emailController;
  late SimulationController simulationController;

  @override
  void initState() {
    emailController = TextEditingController();
    simulationController = context.read<SimulationController>();
  }

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

      WidgetTextFormField(
        controller: emailController,
        hintText: "seuemail@email.com",
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          simulationController.simulationRequest.email = value;
        },
        validator: (value) {
          if (!RegexUtil.isEmailValid(value!)) return 'E-mail inválido';

          return null;
        },
      );

  }
}

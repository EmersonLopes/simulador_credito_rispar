import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/components/widget_textformfield.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:provider/provider.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  late TextEditingController nameController;
  late SimulationController simulationController;

  @override
  void initState() {
    nameController = TextEditingController();
    simulationController = context.read<SimulationController>();
  }

  @override
  void dispose() {
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetTextFormField(
      controller: nameController,
      hintText: "Nome completo",
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      onChanged: (value){
        simulationController.simulationRequest.fullname = value;
      },
      validator: (value) {
        if (value!.isEmpty) return "Nome inválido";

        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextCapitalization textCapitalization;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final String? initialValue;

  const WidgetTextFormField({
    required this.labelText,
    this.hintText,
    this.enabled = true,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.controller,
    this.style,
    this.textCapitalization = TextCapitalization.none,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefix: prefix,
        suffix: suffix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: style,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      onTap: onTap,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
    );
  }
}

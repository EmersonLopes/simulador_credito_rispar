import 'package:flutter/material.dart';

class WidgetDefaultButtom extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool isLoading;

  const WidgetDefaultButtom({this.text = "", this.press, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: isLoading ? null : press,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

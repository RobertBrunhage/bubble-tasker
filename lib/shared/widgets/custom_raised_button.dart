import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key key,
    @required this.onTap,
    @required this.text,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300,
      height: 78,
      child: RaisedButton(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onTap,
        color: Theme.of(context).buttonColor,
        child: Text(text, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}

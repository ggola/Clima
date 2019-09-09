import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ParameterBox extends StatelessWidget {
  ParameterBox(
      {@required this.name, @required this.value, @required this.color});
  final name;
  final String value;
  final color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              name,
              style: kParamNameTextStyle,
            ),
            Text(
              value,
              style: kParamValueTextStyle,
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

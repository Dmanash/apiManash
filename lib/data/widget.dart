import 'package:flutter/material.dart';

class ValueContainer extends StatelessWidget {
  final String mainText;
  final String dataText;

  const ValueContainer({
    Key key,
    this.mainText,
    this.dataText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //border: Border.all(
          //color: Colors.purple,
          ),
      //borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(mainText),
            ),
          ),
          Container(
            child: Text(dataText),
          ),
        ],
      ),
    );
  }
}

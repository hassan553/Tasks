import 'package:flutter/material.dart';
import '../../../../../constants/constants.dart';

class BuildButton extends StatelessWidget {
  final void Function()? function;
  final Color? color;
  final String? text;
  final Color? textColor;
  const BuildButton({
    Key? key,
    this.function,
    this.color,
    this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: getScreenSize(context: context).width,
        height: checkOrientation(context: context)
            ? getScreenSize(context: context).height * .06
            : getScreenSize(context: context).height * .09,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

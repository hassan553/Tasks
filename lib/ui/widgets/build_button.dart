import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/app_color.dart';
import '../../constants/constants.dart';

class BuildButton extends StatelessWidget {
  var function;
  var color;
  var text;
  var textColor;
  BuildButton({
    super.key,
    this.color,
    this.textColor,
    this.function,
    this.text,
  });

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

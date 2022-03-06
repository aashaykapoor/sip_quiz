import 'package:flutter/material.dart';

import '../colors.dart';

class NavigationButton extends StatelessWidget {
  final Function onForwardPress;
  final Function onBackPress;
  NavigationButton({@required this.onBackPress, @required this.onForwardPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: onBackPress,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.buttonColor,
              size: 60,
            )),
        Text(
          "NAVIGATE",
          style: TextStyle(color: AppColors.buttonColor),
        ),
        TextButton(
            onPressed: onForwardPress,
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.buttonColor,
              size: 60,
            ))
      ],
    );
  }
}

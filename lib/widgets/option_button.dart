import 'package:flutter/material.dart';

import '../colors.dart';

class OptionButton extends StatelessWidget {
  final int optionIndex;
  final String option;
  final bool isTapped;
  final Function onTap;
  OptionButton(
      {this.optionIndex, this.option, this.isTapped = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: isTapped
                  ? AppColors.selectedButtonColor
                  : Colors.deepPurple.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white38),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        (optionIndex + 1).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Berkshire",
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    option,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ))),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../costents/AppConstents.dart';

class ButtonWidgets extends StatelessWidget {
  final VoidCallback onTap;

  ButtonWidgets({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
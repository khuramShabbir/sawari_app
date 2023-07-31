import 'package:flutter/material.dart';

import '../Controllers/app_controller.dart';

class ForwardArrow extends StatelessWidget {
  const ForwardArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppTextColors.primaryColor,
      child: const Icon(
        Icons.arrow_forward_outlined,
        color: Colors.white,
      ),
    );
  }
}

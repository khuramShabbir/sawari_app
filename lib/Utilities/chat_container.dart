import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Contollers/AuthControllers/app_controller.dart';

class ChatContainer extends StatelessWidget {
  bool isCurrentUser;
  final String text;
  ChatContainer({Key? key, this.isCurrentUser = true, this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        width: Get.width * 0.75,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style:
              TextStyle(color: isCurrentUser ? Colors.white : Colors.black54),
        ),
        decoration: BoxDecoration(
            color: isCurrentUser
                ? AppTextColors.primaryColor
                : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
                topRight: const Radius.circular(15),
                topLeft: isCurrentUser
                    ? const Radius.circular(15)
                    : const Radius.circular(0),
                bottomLeft: const Radius.circular(15),
                bottomRight: isCurrentUser
                    ? const Radius.circular(0)
                    : const Radius.circular(15))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/app_controller.dart';

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
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(20),
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
                topRight: Radius.circular(15),
                topLeft:
                    isCurrentUser ? Radius.circular(15) : Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight:
                    isCurrentUser ? Radius.circular(0) : Radius.circular(15))),
      ),
    );
  }
}

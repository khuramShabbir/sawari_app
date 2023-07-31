import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

import '../Utilities/chat_container.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  InputBorder formFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(100));

  final TextEditingController chatCtrl = TextEditingController();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .08,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: chatCtrl,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  fillColor: AppTextColors.primaryColor,
                  filled: true,
                  disabledBorder: formFieldBorder,
                  focusedBorder: formFieldBorder,
                  border: InputBorder.none,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          chatList.add(ChatContainer(
                            isCurrentUser: true,
                            text: chatCtrl.text,
                          ));

                          chatCtrl.clear();
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  enabledBorder: formFieldBorder,
                  errorBorder: formFieldBorder,
                  focusedErrorBorder: formFieldBorder,
                  focusColor: Colors.white,
                  hintText: "Type a message",
                  hintStyle: AppTextStyle.blacktext14.copyWith(
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.1,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: AppTextColors.primaryColor),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Waqas Ahmad',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.36,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.96,
                        ),
                      ),
                      Text(
                        'Active Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.36,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.96,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Icon(
                    Icons.view_headline_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: chatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return chatList[index];
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> chatList = <Widget>[
    const SizedBox(height: 20),
    ChatContainer(
      text: "hi",
      isCurrentUser: true,
    ),
    ChatContainer(
      text: "hello",
      isCurrentUser: false,
    ),
    ChatContainer(
      text: "how are you ?",
      isCurrentUser: false,
    ),
    ChatContainer(
      text: "Fine good..",
      isCurrentUser: true,
    ),
  ];
}

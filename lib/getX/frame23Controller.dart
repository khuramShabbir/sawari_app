import 'package:get/get.dart';

class Frame23Controller extends GetxController {
  final count2 = 3000.obs;
  increment() => count2.value++;
  decrement() => count2.value--;
}

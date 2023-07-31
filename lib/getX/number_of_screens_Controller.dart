import 'package:get/get.dart';

class NumberOfScreensController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
  decrement() => count.value--;
}

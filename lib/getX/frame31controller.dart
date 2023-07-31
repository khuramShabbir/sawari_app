import 'package:get/get.dart';

class Frame31Controller extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
  decrement() => count.value--;
}

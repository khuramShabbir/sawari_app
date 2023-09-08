import 'package:get_storage/get_storage.dart';

final box = GetStorage();
read(key) {
  return box.read(key);
}

write(key, value) async {
  return await box.write(key, value);
}

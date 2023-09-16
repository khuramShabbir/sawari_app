import 'package:sawari_app/Utilities/keys.dart';
import 'package:sawari_app/providers/storage/storage.dart';

import '../ModelClasses/create_user.dart';

User? getUser() {
  var readString = read(Keys.isUserLoggedIn);
  if (readString != null) {
    return userFromJson(readString);
  }
  return null;
}

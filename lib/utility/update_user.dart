
import '../models/user_model.dart';
import 'data_storage.dart';
import 'get_user.dart';

void updateUser(User newUser) {
  User? user = getUser();

  if (user == null) {
    DataStorage.store('user', newUser.toJson());
    return;
  }

  user.toJson().forEach((key, value) {
    if (newUser.toJson().containsKey(key) && newUser.toJson()[key] != null) {
      user.toJson()[key] = newUser.toJson()[key];
    }
  });

  DataStorage.store('user', user.toJson());
}

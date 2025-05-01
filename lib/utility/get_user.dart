
import '../models/user_model.dart';
import 'data_storage.dart';

User? getUser() {
  User? user = DataStorage.retrieveModel<User>('user', User.fromJson);
  return user;
}

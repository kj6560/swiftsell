
import 'data_storage.dart';

getToken() {
  return DataStorage.retrieve('token');
}

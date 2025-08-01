import 'package:get/get.dart';
import '../../data/model/user_model.dart';

class UserController extends GetxController {
  final user_id = ''.obs;
  final password = ''.obs;
  final name = ''.obs;
  final age = 0.obs;
  final role = ''.obs;
  final region = ''.obs;
  final family_code = BigInt.zero.obs;

  UserModel get user => UserModel(
    user_id: user_id.value,
    password: password.value,
    name: name.value,
    age: age.value,
    role: role.value,
    region: region.value,
    family_code: family_code.value,
  );
}

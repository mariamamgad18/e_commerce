// userDto >> user
import 'package:ecommerce/api/model/response/user_dto.dart';

import '../../Domain/entities/response/user.dart';

extension UserMapper on UserDto {
  User ToUser() {
    return User(name: name, email: email, role: role);
  }
}

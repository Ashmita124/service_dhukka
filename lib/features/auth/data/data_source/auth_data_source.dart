import 'dart:io';

import 'package:service_dhukka/features/auth/domain/entity/auth_entity.dart';



abstract interface class IAuthDataSource {
  Future<String> loginCustomer(String email, String password);

  Future<void> registerCustomer(AuthEntity customer);

  Future<AuthEntity> getCurrentUser();

  Future<String> uploadProfilePicture(File file);
}
// 
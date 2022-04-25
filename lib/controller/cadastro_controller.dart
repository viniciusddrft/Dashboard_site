import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';

class ControllerRegister {
  final AuthRepository authRepository = AuthRepository();

  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  final formRegister = GlobalKey<FormState>();

  Future<bool> createUser(String email, String password) async =>
      await authRepository.createUser(email, password);

  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }
}

import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';

class ControllerLogin {
  final AuthRepository authRepository = AuthRepository();

  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  final formRegister = GlobalKey<FormState>();

  Future<bool> login() async => await authRepository.login(
      textEditingControllerEmail.text, textEditingControllerPassword.text);

  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }
}

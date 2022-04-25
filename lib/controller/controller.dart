import 'package:get/get.dart';

import '../repository/auth_repository.dart';
import 'cadastro_controller.dart';
import 'contato_controller.dart';
import 'login_controller.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();

  final AuthRepository authRepository = AuthRepository();
  final ControllerRegister controllerRegister = ControllerRegister();
  final ControllerLogin controllerLogin = ControllerLogin();
  final ContatoController contatoController = ContatoController();
}

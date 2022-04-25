import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetBuilder(
      init: Controller.to,
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard site'),
        ),
        body: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: Controller
                      .to.controllerRegister.textEditingControllerEmail,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: Controller
                      .to.controllerRegister.textEditingControllerPassword,
                  decoration: const InputDecoration(
                    labelText: 'senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () async {
                    bool isLoggedIn = await Controller.to.controllerRegister
                        .createUser(
                            Controller.to.controllerRegister
                                .textEditingControllerEmail.text,
                            Controller.to.controllerRegister
                                .textEditingControllerPassword.text);

                    if (isLoggedIn) {
                      Navigator.pushReplacementNamed(context, '/login');
                    } else {
                      throw Exception('erro ao criar conta');
                    }
                  },
                  child: SizedBox(
                    height: Get.height * 0.07,
                    child: const Center(
                      child: Text('Criar conta'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  controller:
                      Controller.to.controllerLogin.textEditingControllerEmail,
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
                      .to.controllerLogin.textEditingControllerPassword,
                  decoration: const InputDecoration(
                    labelText: 'senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () async {
                          if (await Controller.to.controllerLogin.login()) {
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            throw Exception('Error in login');
                          }
                        },
                        child: SizedBox(
                          height: Get.height * 0.07,
                          child: const Center(
                            child: Text('Entrar'),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/cadastro'),
                        child: SizedBox(
                          height: Get.height * 0.07,
                          child: const Center(
                            child: Text('Cadastrar-se'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

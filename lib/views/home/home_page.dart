import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../model/contato_model.dart';
import 'components/card_contacts_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetBuilder(
      init: Controller.to,
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard site'),
        ),
        body: FutureBuilder(
          future: Controller.to.contatoController.loadContacts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                stream: Controller.to.contatoController.contacts.snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      final ModelContato contatos = data.docs[index].data();
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.40),
                        child: CardContactsWidget(
                          datetime: contatos.datetime,
                          email: contatos.email,
                          find: contatos.find,
                          name: contatos.name,
                          phone: contatos.phone,
                          subject: contatos.subject,
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

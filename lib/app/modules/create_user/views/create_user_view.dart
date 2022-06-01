// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_user_controller.dart';

class CreateUserView extends GetView<CreateUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buat Admin'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              autocorrect: false,
              controller: controller.namaC,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              autocorrect: false,
              controller: controller.emailC,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              autocorrect: false,
              controller: controller.passwordC,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.createUser();
              },
              child: const Text('Buat Admin'),
            )
          ],
        ));
  }
}

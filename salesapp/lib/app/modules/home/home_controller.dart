import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<void> onLogout() async {
    Get.dialog(
      AlertDialog(
        title: Text("Información del Sistema"),
        content: Text('¿Desea salir del sistema?'),
        actions: [
          FlatButton(
            child: Text("Si"),
            onPressed: () async {
              SharedPreferences _storage =
                  await SharedPreferences.getInstance();
              await _storage.clear();
              Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

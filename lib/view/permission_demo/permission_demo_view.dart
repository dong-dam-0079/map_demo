import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_demo/view/permission_demo/permission_controller.dart';
import 'package:map_demo/widget/common_dialogs.dart';
import 'package:map_demo/widget/dimens.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({Key? key}) : super(key: key);

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  final _controller = Get.put(PermissionController());
  bool isFirstTimeLaunchApp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed:() async {
              await Permission.camera.request();
            },
            child: const Text('Request Permission'),
          ),
        ),
      ),
    );
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (Platform.isIOS && status.isPermanentlyDenied) {
      if (!mounted) return;
      _showDialogGPS(context);
    }

    if (status.isDenied) {
      if (Platform.isAndroid && isFirstTimeLaunchApp == true) {
        if (!mounted) return;
        _showDialogGPS(context);
        return;
      }
      isFirstTimeLaunchApp = true;

      await Permission.camera.request().then((value) async {
        if (value.isGranted) {
        } else if (value.isPermanentlyDenied || value.isDenied) {
          if (!mounted) return;
          _showDialogGPS(context);
        }
      });

    }
  }

  Future<dynamic> _showDialogGPS(BuildContext context) {
    return showCommonDialog(
      title: 'Title request Camera permission',
      message: 'Message camera permission',
      paddingFirstButton: const EdgeInsets.symmetric(vertical: DimensRes.sp12),
      paddingSecondButton: const EdgeInsets.symmetric(vertical: DimensRes.sp12),
      firstButtonText: 'Go to Setting',
      firstButtonCallback: () {
        openAppSettings();
        Navigator.pop(context);
      },
      secondButtonText: 'Cancel',
      secondButtonCallback: () {
        Navigator.pop(context);
      },
    );
  }
}

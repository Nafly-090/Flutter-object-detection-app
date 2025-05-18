import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_object_detection/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isworking = false;
  String result = "";
  late CameraImage imgCamera;
  late CameraController camaeracontroller;

  initCamara() {
    camaeracontroller = CameraController(cameras[0], ResolutionPreset.medium);
    camaeracontroller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        camaeracontroller.startImageStream(
          (imageFromStream) => {
            if (!isworking)
              {isworking = true, imgCamera = imageFromStream, result = ""},
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/img1.jpg")),
            ),
            child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 500,
                      width: 500,
                      child: Image.asset("Assets/img2.jpg"),
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

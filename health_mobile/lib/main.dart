import 'package:flutter/material.dart';
import 'cameral-controller/take_picture_screen.dart';
import 'claim_submission_review.dart';
import 'health-item-text-widget.dart';
import 'health-item-widget-type.dart';
import 'package:camera/camera.dart';
import 'dart:io';

import 'health-item-widget.dart';

const discoveryBlue = Color(0xFF003979);

Future<void> main() async {
  ThemeData createAppTheme() {
    return ThemeData.light().copyWith(
        appBarTheme:
            const AppBarTheme(backgroundColor: const Color(0xFF003979)),
        primaryColor: const Color(0xFF003979),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF003979)),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)));
  }

  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: createAppTheme(),
    home: MyHomePage(
      camera: firstCamera,
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  final CameraDescription camera;
  const MyHomePage({Key? key, required this.camera}) : super(key: key);

  get firstCamera => camera;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late String imagePath = '';

  TextStyle headerTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'sourceSans_bold',
        fontWeight: FontWeight.w900);
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    CameraDescription camera = widget.camera;
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  Icon createIcon(IconData iconData) {
    return Icon(
      iconData,
      color: discoveryBlue,
      size: 18,
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  ButtonStyle createButtonStyle() {
    return ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: discoveryBlue,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }

  Image createImage() {
    return Image.file(File(imagePath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health app'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints().copyWith(
            maxHeight: double.infinity,
          ),
          child: IntrinsicHeight(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'How would you like to upload your doctor\'s note?',
                  style: headerTextStyle(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                HealthItemWidget(Icons.image, 'Select image from gallery',
                    health_item_type.SCAN_IMAGE_FROM_GALLERY),
                const Divider(
                  height: 5.0,
                  thickness: 2,
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TakePictureScreen(
                          widget.camera,
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Container(
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: createIcon(Icons.camera_alt_rounded),
                        ),
                        HealthItemTextWidget('Scan image with camera'),
                      ],
                    ),
                  ),
                ),
                // HealthItemWidget(Icons.camera_alt_rounded, 'Scan image with camera', health_item_type.SCAN_IMAGE_WITH_CAMERA, takePicture),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Preview',
                    style: headerTextStyle(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: imagePath.isNotEmpty
                          ? createImage()
                          : Text(
                              'Take picture of your claim',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Divider(
                        height: 5.0,
                        thickness: 2.0,
                        color: Colors.grey,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReviewSummaryWidget()),
                          );
                        },
                        style: createButtonStyle(),
                        child: Text('Footer view'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: <Widget>[
      //       Divider(
      //         height: 5.0,
      //         thickness: 2.0,
      //         color: Colors.grey,
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => ReviewSummaryWidget()),
      //           );
      //         },
      //         style: createButtonStyle(),
      //         child: Text('Footer view'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

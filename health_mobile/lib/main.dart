import 'package:flutter/material.dart';
import 'claim_submission_review.dart';
import 'health-item-widget-type.dart';
import 'package:camera/camera.dart';

import 'health-item-widget.dart';



Future<void> main() async {

  ThemeData createAppTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: const Color(0xFF003979)),
        primaryColor: const Color(0xFF003979),
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF003979)),
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
    home:  MyHomePage(camera: firstCamera,),
  ));
}

//
// class MyHealthApp extends StatelessWidget {
//   MyHealthApp(CameraDescription firstCamera);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: createAppTheme(),
//       home:  MyHomePage(camera: firstCamera,),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {

  final CameraDescription camera;
  const MyHomePage({Key? key, required this.camera}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle headerTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'sourceSans_bold',
        fontWeight: FontWeight.w900
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health app'),
      ),
      body: SingleChildScrollView (
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox (
          constraints: const BoxConstraints().copyWith(
            //minHeight: constraints.maxHeight,
            maxHeight: double.infinity,
          ),
          child: IntrinsicHeight(
            child: Column (
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
                HealthItemWidget(Icons.image, 'Select image from gallery', health_item_type.SCAN_IMAGE_FROM_GALLERY),
                const Divider(
                  height: 5.0,
                  thickness: 2,
                  color: Colors.grey,
                ),
                HealthItemWidget(Icons.camera_alt_rounded, 'Scan image with camera', health_item_type.SCAN_IMAGE_WITH_CAMERA),
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
                Center(
                    child: Image.network('https://picsum.photos/250?image=9')),
                Expanded(
                    child: Align(
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
                                MaterialPageRoute(builder: (context) => ReviewSummaryWidget()),
                              );
                            },
                            style: createButtonStyle(),
                            child: Text('Footer view'),

                          ),

                        ],
                      ),
                    )

                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}



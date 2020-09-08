import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _fileimage;

  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _fileimage != null
                  ? Image.file(_fileimage)
                  : Text('No image selected'),
              RaisedButton(
                onPressed: () async {
                  _takePicture();
                },
                child: Text('hi'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _takePicture() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);

    // if (pickedImage == null) {
    //   return;
    // }

    File tmpFile = File(pickedImage.path);

    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;

    final String fileName =
        basename(pickedImage.path); // Filename without extension
    final String fileExtension = extension(pickedImage.path); // e.g.

    tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');
    setState(() => _fileimage = tmpFile);
  }
}

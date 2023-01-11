import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String textt = "Gallery";
  dynamic placeholder = AssetImage("images/blue_gallery.png");

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$textt',
              style: TextStyle(
                  fontSize:  20,
                  color: Colors.white),
            ),
            Image(image: placeholder),
            ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.cyan),
              padding:
              MaterialStateProperty.all(const EdgeInsets.all(15)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () async {
              final result = await FilePicker.platform.pickFiles(allowMultiple: false);
              if (result == null) return;
              final files = result.files;
              textt = result.files.first.path.toString();
              placeholder = FileImage(File(textt));
              setState((){});
              }, child: const Text('Select image from Gallery'),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}



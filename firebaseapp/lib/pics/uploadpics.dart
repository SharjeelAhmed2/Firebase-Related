import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({ Key key }) : super(key: key);

  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
   
    String imageUrl;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Uploading Images"),),
      body: Center(
        child:Column(children: [
          imageUrl != null ? Image.network(imageUrl, width: 400, height: 400,) : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity,)
        ],),
         
      ),
      floatingActionButton: FloatingActionButton(
        
        focusColor: Colors.pink,
        onPressed: (){
          uploadImage();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
     
     Future uploadImage() async {

      final _storage = FirebaseStorage.instance;

      PickedFile image;
      final _picker = ImagePicker();

      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if(image!=null)
      {
        // Upload image to the firebase
        var snapshot = await _storage.ref().child('filename').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() => imageUrl = downloadUrl);
      }
      else 
      {
        print("Bhund hogaya hai ustaad");
      }
     }

}
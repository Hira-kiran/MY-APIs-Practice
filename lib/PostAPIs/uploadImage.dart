// ignore_for_file: file_names
// // ignore_for_file: file_names, avoid_print

// import 'dart:ffi';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class UploadImages extends StatefulWidget {
//   const UploadImages({super.key});

//   @override
//   State<UploadImages> createState() => _UploadImagesState();
// }

// class _UploadImagesState extends State<UploadImages> {
//   File? image; // gallery sy jo b image pick krygy iska path store hoga is ma
//   final picker = ImagePicker(); // image picker package
//   bool showSpinner = false;
//   // for pick image
//   Future getImage() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       print("No image selected");
//     }
//   }
// // Function for upload image
// Future<Void> uploadImage() async{
//   setState(() {
//     showSpinner=true;
//   });
// var stream =new http
// }
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: false,
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Upload images to server")),
//         body: Column(
//           children: [
//            Container(
//             child: image==null ? const Center(child: Text("Pick Image"),):
//             Container(
//               height: 100,
//               width: 100,
//               child: Center(
//                 child: Image.file(File.)
//               ),
//             )
//            )
//           ],
//         )),
//     );
    
//   }
// }

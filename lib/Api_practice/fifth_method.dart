// import 'dart:convert';

// import 'package:flutter/material.dart';

// class FifthMethod extends StatefulWidget {
//   const FifthMethod({super.key});

//   @override
//   State<FifthMethod> createState() => _FifthMethodState();
// }

// class _FifthMethodState extends State<FifthMethod> {
//   // if JSON is complex and start from object{} then
//     Future<ModelName> getThingsApi() async{
//     final response=await http.get(Uri.parse("API Ka link likhty hn");
//     var data= jsonDecode(response.body.toString());
//     if(response.statusCode==200){
//       return ModelName.fromJson(data);
//     }else{
//        return ModelName.fromJson(data);
//     }
//   } 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Fifth Method"),
//       ),
//       body: FutureBuilder(
//         future: getThingsApi(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Text("Loading...");
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.data.length,
//               itemBuilder: (context, index) {
//               return  Text(snapshot.data.data[index].title.toString());
//             });
//           }
//         },
//       ),
//     );
//   }
// }

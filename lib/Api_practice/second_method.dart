import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_api_practice/Api_practice/third_method.dart';

class SecondMethod extends StatefulWidget {
  const SecondMethod({super.key});

  @override
  State<SecondMethod> createState() => _SecondMethodState();
}

class _SecondMethodState extends State<SecondMethod> {
  List<PhotosModel> photolist = [];
  Future<List<PhotosModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        // now we call our method
        PhotosModel photosModel = PhotosModel(
            title: i["title"],
            url: i["url"],
            thumbnailUrl: i["thumbnailUrl"],
            id: i["id"]);
        photolist.add(photosModel);
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Method"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdMethod()));
              },
              icon: const Icon(Icons.next_plan))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<PhotosModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text("Loading..."));
                  } else {
                    return ListView.builder(
                        itemCount: photolist.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text(snapshot.data![index].title.toString()),
                            trailing: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot
                                    .data![index].thumbnailUrl
                                    .toString())),
                            subtitle: Text(snapshot.data![index].id.toString()),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

// In this,Firstly we create Model
class PhotosModel {
  String title, url, thumbnailUrl;
  int id;

  PhotosModel(
      {required this.title,
      required this.url,
      required this.thumbnailUrl,
      required this.id});
}

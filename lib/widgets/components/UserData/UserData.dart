import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/classes/User.dart';
import 'package:fluttertest/services/fetchUser.dart';
import 'package:transparent_image/transparent_image.dart';

class UserData extends StatefulWidget {
  final int id;

  UserData(this.id);

  @override
  _UserDataState createState() => _UserDataState(this.id);
}

class _UserDataState extends State<UserData> {
  final int id;

  _UserDataState(this.id);

  @override
  Widget build(BuildContext context) {
    final Future<User> _user = fetchUser(this.id);
    return FutureBuilder(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User userData = snapshot.data;

          return Column(
            children: [
              Text("Album User"),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: "https://picsum.photos/250?image=${userData.id}",
                height: 250,
              ),
              Text("Name: ${userData.name}"),
              Text("Email: ${userData.email}"),
              Text("Username: ${userData.username}"),
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}

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
  bool _expanded = false;

  _UserDataState(this.id);

  @override
  Widget build(BuildContext context) {
    final Future<User> _user = fetchUser(this.id);
    return FutureBuilder(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User userData = snapshot.data;

          return ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _expanded = !_expanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) => ListTile(
                  title: Text('Album Owner'),
                ),
                isExpanded: _expanded,
                body: Column(
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "https://picsum.photos/250?image=${userData.id}",
                      height: 250,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Name: ${userData.name}"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Username: ${userData.username}"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Email: ${userData.email}"),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}

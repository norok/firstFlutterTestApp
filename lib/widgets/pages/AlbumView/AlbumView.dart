import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/services/fetchAlbum.dart';
import 'package:fluttertest/classes/Album.dart';
import 'package:fluttertest/widgets/components/UserData/UserData.dart';
import 'package:fluttertest/extensions/CustomStringExtensions.dart';

class AlbumViewArgs {
  final int id;

  AlbumViewArgs(this.id);
}

class AlbumView extends StatefulWidget {
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    final AlbumViewArgs _args = ModalRoute.of(context).settings.arguments;
    final Future<Album> _album = fetchAlbum(_args.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
        backgroundColor: Color(0xffEE2020),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: _album,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Album albumData = snapshot.data;

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Album ID: ${albumData.id}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Text(
                      albumData.title.capitalize(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: UserData(albumData.userId),
                  ),
                ],
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

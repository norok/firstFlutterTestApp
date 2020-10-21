import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/classes/Album.dart';
import 'package:fluttertest/services/fetchAlbum.dart';
import 'package:fluttertest/widgets/components/AlbumListTile/AlbumListTile.dart';
import 'package:fluttertest/widgets/pages/AlbumView/AlbumView.dart';

class AlbumsList extends StatefulWidget {
  @override
  _AlbumsListState createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  Future<List<Album>> _albums;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _albums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album List'),
        backgroundColor: Color(0xffFF6464),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: _albums,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return new AlbumListTile(
                    id: snapshot.data[i].id,
                    title: snapshot.data[i].title,
                    onChanged: _handleChange,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void _handleChange(int value) {
    Navigator.pushNamed(context, '/album', arguments: AlbumViewArgs(value));
  }
}

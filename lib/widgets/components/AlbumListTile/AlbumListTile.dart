import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumListTile extends StatelessWidget {
  final int id;
  final String title;
  final ValueChanged<int> onChanged;

  AlbumListTile({this.id, this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => _handleTap(),
          title: Text("${this.id} - ${this.title}",
              style: TextStyle(fontSize: 18.0)),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }

  void _handleTap() {
    this.onChanged(this.id);
  }
}

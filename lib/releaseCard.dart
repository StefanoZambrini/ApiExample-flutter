import 'package:api_challenge/models/Game.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ReleaseCard extends StatelessWidget {

  List<Game> posts;
  int index;

  ReleaseCard(this.posts, this.index);



  @override
  Widget build(BuildContext context) {
    var platformItem = (posts[index]);
    return Text(stringDate(platformItem.firstReleaseDate) ?? 'default value');
  }
}

String stringDate(int Timestamp) {
  DateTime myDate = DateTime.fromMillisecondsSinceEpoch(Timestamp * 1000);
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(myDate);
  return formatted; // something like 2013-04-20
}
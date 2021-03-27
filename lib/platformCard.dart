import 'package:api_challenge/models/Game.dart';
import 'package:flutter/material.dart';

class PlatformCard extends StatelessWidget {

  List<Game> posts;
  int index;

  PlatformCard(this.posts, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 50,
            width: 300, // constrain height// constrain height
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: posts[index].platforms.length ?? 0,
              itemBuilder: (BuildContext context, int indexPlatform) {
                var platformItem = (posts[index].platforms)[indexPlatform];
                return Text(platformItem.name ?? 'default value');
              },
            )),
      ],
    )
    ;
  }
}

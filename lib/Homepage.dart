import 'package:api_challenge/platformCard.dart';
import 'package:api_challenge/releaseCard.dart';
import 'package:flutter/material.dart';

import 'clientTest.dart';
import 'models/Game.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // page variables
  bool isLoading = false;
  List<Game> posts;

  // override initState to run the _fetchData() function on state change
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  // async function to call the API and show/hide loading screens
  Future _fetchData() async {
    // show Loading Screen
    setState(() => isLoading = true);
    // get Posts
    posts = (await getRecentlyReleased()) as List<Game>;
    // hide Loading Screen
    setState(() => isLoading = false);

    // create Post
    // print(await createPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Center(
            // check if loading screen needs to be shown
            child: isLoading
                // if it is, show the Circular Progress Indicator
                ? CircularProgressIndicator()
                // Otherwise, show the list of Posts
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
              shrinkWrap: true,
                          itemCount: posts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(posts[index].name ?? 'default value'),
                                        ReleaseCard(posts, index)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        PlatformCard(posts, index),
                                        Text(posts[index].rating.toStringAsFixed(2) ?? 'N/A')
                                      ],
                                    ),
                                  ]),
                            );
                          },
                        ),
                    ),
                  ],
                )));
  }

}

import 'package:api_challenge/api_manager.dart';
import 'package:api_challenge/models/model.dart';
import 'package:api_challenge/platformCard.dart';
import 'package:flutter/material.dart';

import 'clientTest.dart';
import 'models/genre.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // page variables
  bool isLoading = false;
  List<Welcome> posts;

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
    posts = (await getGames()) as List<Welcome>;
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
                                    Text(posts[index].name ?? 'default value'),
                                    PlatformCard(posts, index)
                                  ]),
                            );
                          },
                        ),
                    ),
                  ],
                )));
  }

}

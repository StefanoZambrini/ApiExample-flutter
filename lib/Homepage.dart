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
  String searchGames;
  TextEditingController _textController = TextEditingController();
  List<Game> newDataList = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    posts = (await getMostRated()) as List<Game>;
    setState(() => isLoading = false);
    newDataList = List.from(posts);
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Search Here...',
                        ),
                        onChanged: onItemChanged,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
              shrinkWrap: true,
                          itemCount: newDataList?.length ?? 0,
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
                                        Text(newDataList[index].name ?? 'default value'),
                                        ReleaseCard(newDataList, index)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        PlatformCard(newDataList, index),
                                        Text(newDataList[index].rating.toStringAsFixed(2) ?? 'N/A')
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

  onItemChanged(String value) {
    setState(() {
      newDataList = posts
          .where((x) => x.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    }
}

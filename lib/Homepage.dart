import 'package:api_challenge/api_manager.dart';
import 'package:api_challenge/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  // page variables
  bool isLoading = false;
  List<Post> posts;

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
    posts = await getPosts();
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
                : ListView.builder(
              // this is going to be the list length
              itemCount: posts?.length ?? 0,
              // this is a function to build each item on the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0
                    ),
                    title: Text(posts[index].name, style: TextStyle(fontSize: 20),),
                    subtitle: Text(posts[index].country),
                    trailing: Text(DateFormat('yyyy-MM-dd – kk:mm').format(posts[index].date)),
                );
              },
            )
        )
    );
  }
}
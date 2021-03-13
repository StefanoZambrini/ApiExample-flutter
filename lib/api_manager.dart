import 'package:api_challenge/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers

// This method gets 100 posts from JSON Placeholder (https://jsonplaceholder.typicode.com/posts)
// The return type of the function needs to be Future<return Type>, in this case it is Future<List<Post>> because it returns a list of Posts
// The future is for async processes and dynamic accepts all types
// If you know what data type is returned, you can use that
// The function also needs to be async

Future<List<Post>> getPosts() async {

  Map<String, String> requestHeaders = {
 //   'Content-type': 'application/json',
 //   'Accept': 'application/json',
    'Authorization': 'Bearer lkuzg6ygh6silvk4ksfkyeeysmncib',
    'Client-ID': 'e6ib30yst9prtoz6oed4o5pqfbfaso'
  };

  String url = "https://api.igdb.com/v4/games?fields=age_ratings,aggregated_rating,aggregated_rating_count,alternative_names,artworks,bundles,category,checksum,collection,cover,created_at,dlcs,expanded_games,expansions,external_games,first_release_date,follows,forks,franchise,franchises,game_engines,game_modes,genres,hypes,involved_companies,keywords,multiplayer_modes,name,parent_game,platforms,player_perspectives,ports,rating,rating_count,release_dates,remakes,remasters,screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,themes,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos,websites";

  // return type is http.Response
  // for examples with headers, check api_post
  http.Response response = await http.get(
      url,
      headers: requestHeaders
  );

  // check response status code
  if (response.statusCode == 200) {
    debugPrint(response.body);
    // the response body
    String responseBody = response.body;

    // use dart:convert to decode JSON
    dynamic decodedJson = json.decode(responseBody);

    // use this when the response contains an array
    List resList = (decodedJson as List)
    // map each element of the array/list to a new Post object as defined in class_post.dart
        .map((item) => new Post.fromJson(item))
    // convert the json to a list
        .toList();
    // the returned data will be a list of Posts
    return resList;
  } else {
    print("ERROR in getting post: status code: " + response.statusCode.toString());
    return null;
  }
}
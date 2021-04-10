import 'dart:convert';

import 'package:igdb_client/igdb_client.dart';

import 'models/Game.dart';

Future<List<Game>> getGames() async {

  // You should only run this once, then save it somewhere. It will eventually
  // expire after ~60 days, at which point you will need to getOauthToken again
  //
  // The reason for this is that there is a limit of roughly 25 app tokens
  // active at any time. See https://api-docs.igdb.com/#web-and-mobile-applications

  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());

  var myParameters = IGDBRequestParameters(
      fields: ['name', 'release_dates.*', 'platforms.*', 'genres.*', 'aggregated_rating', 'aggregated_rating_count', 'rating', 'screenshots.*', 'summary', 'total_rating', 'total_rating_count', 'url', 'videos.*', 'websites.*', 'checksum'],
    limit: 10
  );
  var gamesResponse = await client.games(myParameters);

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Game.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
}

Future<List<Game>> getNextReleases() async {
  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());

  int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  int secsSinceEpoch = msecSinceEpoch~/1000;
  String timeNow = secsSinceEpoch.toString();
  print(timeNow);

  var myParameters = IGDBRequestParameters(
      fields: ['name', 'first_release_date', 'platforms.*'],
      limit: 30,
      filters: 'first_release_date > $timeNow',
      order: 'first_release_date asc'
  );

  var gamesResponse = await client.games(myParameters);

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Game.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
}

Future<List<Game>> getMostRated() async {
  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());


  var myParameters = IGDBRequestParameters(
    fields: ['name', 'first_release_date', 'platforms.name', 'rating', 'rating_count'],
    limit: 50,
    filters: ('rating > 0 & rating < 100 & rating_count > 80'),
    order: 'rating desc'
  );

  var gamesResponse = await client.games(myParameters);

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Game.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
}

Future<List<Game>> getTrendingNow() async {
  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());

  int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  int secsSinceEpoch = msecSinceEpoch~/1000;
  String timeNow = secsSinceEpoch.toString();
  print(timeNow);

  int thisYear = 1609455600000~/1000;
  String timeYear = thisYear.toString();

  var myParameters = IGDBRequestParameters(
      fields: ['name', 'first_release_date', 'platforms.*', 'rating', 'release_dates.y'],
      limit: 30,
      filters: 'rating > 70 & first_release_date > $timeYear',
      order: 'rating desc'
  );

  var gamesResponse = await client.games(myParameters);

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Game.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
}

Future<List<Game>> getRecentlyReleased() async {
  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());


  DateTime currentDate = DateTime.now();
  DateTime previousDate = DateTime(currentDate.year, currentDate.month, currentDate.day - 15);
  int msecsPreviousDate = previousDate.millisecondsSinceEpoch;
  int secsPreviousDate = msecsPreviousDate~/1000;
  String timePast = secsPreviousDate.toString();


  int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  int secsSinceEpoch = msecSinceEpoch~/1000;
  String timeNow = secsSinceEpoch.toString();

  int thisYear = 1609455600000~/1000;
  String timeYear = thisYear.toString();

  var myParameters = IGDBRequestParameters(
      fields: ['name', 'first_release_date', 'platforms.*', 'rating', 'release_dates.y'],
      limit: 30,
      filters: 'first_release_date > $timePast &  first_release_date < $timeNow',
      order: 'first_release_date desc'
  );

  var gamesResponse = await client.games(myParameters);

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Game.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
}



printResponse(IGDBResponse resp) {
   print(IGDBHelpers.getPrettyStringFromMap(resp.toMap()));
}

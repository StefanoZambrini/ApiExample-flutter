import 'dart:convert';

import 'package:igdb_client/igdb_client.dart';

import 'models/genre.dart';

Future<List<Welcome>> getGames() async {

  // You should only run this once, then save it somewhere. It will eventually
  // expire after ~60 days, at which point you will need to getOauthToken again
  //
  // The reason for this is that there is a limit of roughly 25 app tokens
  // active at any time. See https://api-docs.igdb.com/#web-and-mobile-applications

  var client = new IGDBClient("https://a11f26af-eceb-45d5-8aca-416c7df64277.mock.pstmn.io", "e6ib30yst9prtoz6oed4o5pqfbfaso", "lkuzg6ygh6silvk4ksfkyeeysmncib", logger: IGDBConsoleLogger());

  // Find games with 'infamous' in their name and return
  // the results' name and expand their release_dates and platforms.
  var gamesResponse = await client.games(new IGDBRequestParameters(
      search: 'Olija',
      fields: ['name', 'release_dates.*, platforms.*']
  ));

  if (gamesResponse.isSuccess()) {
    List<dynamic> myData = gamesResponse.data;
    List resList = myData.map((item) => new Welcome.fromJson(item)).toList();
    return resList;
  }
  else {
    print("ERROR in getting post: status code: " + gamesResponse.status.toString());
    return null;
  }
  printResponse(gamesResponse);
/*
  // Find games that are not yet released but are releasing soon in the
  // North American, Worlwide, or Unspecified regions, then sort by
  // release date.
  int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  int secsSinceEpoch = msecSinceEpoch~/1000;
  String timeNow = secsSinceEpoch.toString();
  var releaseResponse = await client.releaseDates(new IGDBRequestParameters(
      filters: 'date > $timeNow & (region = ${IGDBRegions.NORTH_AMERICA.id} | region = ${IGDBRegions.NONE.id} | region = ${IGDBRegions.WORLDWIDE.id})',
      order: 'date asc'
  ));
  printResponse(releaseResponse);

  var gameIdResponse = await client.games(new IGDBRequestParameters(
    ids: [43378],
  ));
//  printResponse(gameIdResponse);
 */
}


printResponse(IGDBResponse resp) {
   print(IGDBHelpers.getPrettyStringFromMap(resp.toMap()));
}

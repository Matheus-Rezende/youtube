import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';

// ignore: constant_identifier_names
const KEY_YOUTUBE_API = "AIzaSyCs1s1ukKyqpugO4XD484aF5DdolZwIi9U";
// ignore: constant_identifier_names
const ID_CHANNEL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
// ignore: constant_identifier_names
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>?>search(String nameSearch) async {
    Uri url = Uri.parse(URL_BASE + "search"
                                  "?part=snippet"
                                  "&type=video"
                                  "&maxResults=20"
                                  "&order=date"
                                  "&key=$KEY_YOUTUBE_API"
                                  "&q=$nameSearch"
    );
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
      return videos;

    }else{
      return null;
    }
  }
}
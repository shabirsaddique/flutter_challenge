import 'dart:convert';

import 'package:flutter_challenge/AppModule/Home/model/adventure.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FeedController extends GetxController {
  var adventures = <Datum>[].obs;
  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var url = 'https://api.hyll.com/api/adventures/';
  var page = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    initialiseSharedPreference();
    super.onInit();
  }

  initialiseSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? sharedPreferences;
  List<String> viewedPost = [];

  getAdventureData({var doLoading = true}) async {
    if (doLoading) {
      isLoading.value = true;
      adventures.clear();
    }
    try {
      var limit = 10;
      var offset = (page - 1) * limit;
      var response =
          await http.get(Uri.parse('$url?limit=$limit&offset=$offset'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body.toString());
        Adventure adventure = Adventure.fromJson(jsonData);
        adventures.addAll(adventure.data!);
        viewedPost = sharedPreferences!.getStringList('viewedPost') ?? [];

        if (doLoading) {
          for (int i = 0; i < viewedPost.length; i++) {
            for (int j = 0; j < adventures.length; j++) {
              if (viewedPost[i].toString() == adventures[j].id.toString()) {
                adventures.remove(adventures[j]);
              }
            }
          }

          if (adventures.length < 2) {
            page++;
            await getAdventureData();
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    } finally {
      if (doLoading) {
        isLoading.value = false;
      }
    }
  }

  void loadMore() {
    if (isLoadingMore.value) return;
    isLoadingMore.value = true;
    page++;
    getAdventureData(doLoading: false).whenComplete(() {
      isLoadingMore.value = false;
    });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/AppModule/Home/controller/feed_controller.dart';
import 'package:get/get.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  FeedController feedController = Get.put(FeedController());
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    feedController.getAdventureData();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Challenge"),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            feedController.page = 1;
            await feedController.getAdventureData();
          },
          child: feedController.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            //s shrinkWrap: true,
                            itemCount:
                                feedController.adventures.value!.length + 1,
                            itemBuilder: (context, index) {
                              if (index ==
                                  feedController.adventures.value!.length) {
                                return Obx(
                                    () => feedController.isLoadingMore.isTrue
                                        ? Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : Container());
                              }
                              var adventure =
                                  feedController.adventures.value![index];
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              adventure
                                                  .startingLocation!.imageUrl
                                                  .toString()),
                                        ),
                                        SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${adventure.startingLocation!.name}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.6,
                                              child: Text(
                                                '${adventure.title}',
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  CachedNetworkImage(
                                    imageUrl:
                                        adventure.contents!.first.contentUrl ??
                                            '',
                                    height: 300,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.favorite_border),
                                                SizedBox(width: 8),
                                                Text('123 Likes'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.comment),
                                                SizedBox(width: 8),
                                                Text('45 Comments'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '${adventure.primaryDescription}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: Get.width,
                                          // height: Get.height * 0.1,
                                          child: Text(
                                            maxLines: 3,
                                            '${adventure.description}',
                                            style: TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      feedController.loadMore();
    }

    final position = _scrollController.position;
    final pixels = position.pixels;
    final itemCount = feedController.adventures.value!.length;
    final viewportHeight = Get.height * 0.8;

    int firstVisibleIndex = (pixels / viewportHeight).floor();
    int lastVisibleIndex =
        ((pixels + viewportHeight) / viewportHeight).ceil() - 1;

    if (lastVisibleIndex >= itemCount) {
      lastVisibleIndex = itemCount - 1;
    }

    if (firstVisibleIndex < 0) {
      firstVisibleIndex = 0;
    }

    if (!feedController.viewedPost.contains(
        feedController.adventures.value[firstVisibleIndex].id.toString())) {
      feedController.viewedPost.add(
          feedController.adventures.value[firstVisibleIndex].id.toString());

      feedController.sharedPreferences!
          .setStringList('viewedPost', feedController.viewedPost);
    }
  }
}

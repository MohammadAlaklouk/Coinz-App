import '../../constant/helper.dart';
import '../../data/model/news_model.dart';
import '../../data/network/remote/methods.dart';

import 'package:get/get.dart';

import '../../data/network/api_key.dart';
import '../../data/network/remote/api.dart';

class NewsController extends GetxController {
  void onInit() {
    if (newsModel == null) {
      newsPageNum = 1;
      getNews(pageCount: newsPageCount, pageNumber: newsPageNum);
    }
    super.onInit();
  }
   NewsController._();
  static late final NewsController _instance = NewsController._();
  static NewsController get instance => _instance;
  factory NewsController() {
    return _instance;
  }

  bool end = false;
  List<News>? newsItem = [];

  void getNews({
    required int pageCount,
    required int pageNumber,
  }) {
    ApiRequest(
      path: NEWS,
      method: getMethod,
      queryParameters: {
        'i_page_count': pageCount,
        'i_page_number': pageNumber,
      },
    ).request(
      onSuccess: (data, response) {
        newsPageNum++;
        newsModel = NewsModel.fromJson(response);
        if (newsModel!.news!.length >= newsPageCount) {
          newsItem!.addAll(List.generate(
            newsPageCount,
            (index) => newsModel!.news![index],
          ));
          update();
        } else {
          end = true;
          update();
        }

        update();
      },
    );
  }

  int get count => newsItem!.length;

  Future<bool> loadMore() async {
    print("onLoadMore");
    getNews(pageCount: newsPageCount, pageNumber: newsPageNum);

    await Future.delayed(const Duration(seconds: 0, milliseconds: 700));

    return true;
  }

  Future<void> refreshing() async {
    newsPageNum = 1;
    print("refresh");
    newsItem!.clear();

    getNews(pageCount: newsPageCount, pageNumber: newsPageNum);

    await Future.delayed(const Duration(seconds: 0, milliseconds: 700));
  }

  String newsImage(int index) {
    return newsItem![index].sImage!;
  }

String newsbody(int index) {
    return newsItem![index].sDescription!;
  }

  String newstitle(int index) {
    return newsItem![index].sTitle!;
  }

  String newsDate(int index) {
    int newIndex = newsItem![index].dtCreatedDate!.indexOf(' ');
    return newsItem![index].dtCreatedDate!.substring(0, newIndex);
  }
}

NewsModel? newsModel;

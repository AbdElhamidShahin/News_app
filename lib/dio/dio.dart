import 'package:dio/dio.dart';
import 'package:newsapp/widget/articale_model.dart';

class NewsService {
  final dio = Dio();

  NewsService(Dio dio);

  Future<List<ArticaleModel>> getGenralNews({required String category}) async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=9ff105a7477142d79b9aa26ff0091dde&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticaleModel> articlesList = [];
      for (var artical in articles) {
        ArticaleModel articaleModel = ArticaleModel(
            image: artical['urlToImage'],
            title: artical['title'],
            subtitle: artical['publishedAt']);
        articlesList.add(articaleModel);
      }
      print(articlesList);
      return articlesList;
    });
  }
}

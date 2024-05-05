import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/News/ImageUpper.dart';
import 'package:newsapp/dio/dio.dart';
import '../widget/ListViewNews.dart';
import '../widget/articale_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticaleModel> articales = [];
  bool isLoding = true;
  @override
  void initState() {
    super.initState();
    getGenralNews();
  }

  Future<void> getGenralNews() async {
    articales = await NewsService(Dio()).getGenralNews(category: "general");
    setState(() {});
    isLoding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsCloud',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImageUpperItem(),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
          isLoding
              ? const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()))
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return BuildArticleItem(
                        articaleModel: articales[index],
                      );
                    },
                    childCount: articales.length,
                  ),
                ),
        ],
      ),
    );
  }
}

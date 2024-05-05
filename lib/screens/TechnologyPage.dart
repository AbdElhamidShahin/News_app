import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/dio/dio.dart';

import '../widget/ListViewNews.dart';
import '../widget/articale_model.dart';

class TechnologyPage extends StatefulWidget {
  @override
  State<TechnologyPage> createState() => _HomeState();
}

class _HomeState extends State<TechnologyPage> {
  List<ArticaleModel> articales = [];
  bool isLoding = true;
  @override
  void initState() {
    super.initState();
    getGenralNews();
  }

  Future<void> getGenralNews() async {
    articales = await NewsService(Dio()).getGenralNews(category: "technology");
    setState(() {});
    isLoding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News technology',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
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

import 'dart:async';

import 'package:kourouna/blocs/blocs.dart';
import 'package:kourouna/models/ncovid_data.dart';
import 'package:kourouna/models/serializers.dart';
import 'package:kourouna/pages/widgets/card/news_card.dart';
import 'package:kourouna/pages/widgets/margin.dart';
import 'package:kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:shimmer/shimmer.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  Completer<void> _refreshCompleter;

  @override
  void didChangeDependencies() {
    BlocProvider.of<NewsBloc>(context).add(FetchNews());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return SingleChildScrollView(child: BlocBuilder<NewsBloc, NewsState>(
        builder: (BuildContext context, NewsState state) {
      if (state is NewsLoaded) {
        return Container(
          height: hp(100),
          width: wp(100),
          child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              itemBuilder: (context, index) {
                final newsItem = serializers.deserializeWith(
                    CountryNewsItem.serializer,
                    state.news.first[
                        (state.news.first.keys.length - 1 - index).toString()]);
                print(newsItem);
                return NewsCard(
                  newsItem: newsItem,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: hp(1));
              },
              itemCount: state.news.first.keys.length),
        );
      }
      if (state is NewsLoading) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YMargin(hp(29)),
            Center(
                child: SpinKitSquareCircle(
              color: AppColors.green,
              size: 50.0,
            )),
          ],
        );
      }
      if (state is CaseError) {
        return Text(
          'Something went wrong!',
          style: TextStyle(color: Colors.red),
        );
      }
      return Center(
          child: RefreshIndicator(
        child: Text('Pull to refresh'),
        onRefresh: () {
          BlocProvider.of<CaseBloc>(context).add(FetchCase());
          return _refreshCompleter.future;
        },
      ));
    }));
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:films_app/core/colors.dart';
import 'package:films_app/core/theme.dart';
import 'package:films_app/pages/widgets/film_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model.dart';
import '../widgets/appBar.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        extendBodyBehindAppBar: true,
        appBar: Appbar(title: "Top Rated"),
        body: Stack(
          children: [
            Consumer<ViewModel>(
              builder: (context, state, child) {
                return FilmCards(data: state.data3,);
              },
            ),
            AppTheme.appBarBackgroundTheme(context)
          ],
        ));
  }
}

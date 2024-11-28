import 'package:films_app/core/colors.dart';
import 'package:films_app/core/theme.dart';
import 'package:films_app/pages/widgets/appBar.dart';
import 'package:films_app/pages/widgets/film_cards.dart';
import 'package:films_app/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({super.key});

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        extendBodyBehindAppBar: true,
        appBar: Appbar(title: "Now playing"),
        body: Stack(
          children: [
            Consumer<ViewModel>(
              builder: (context, state, child) {
                return FilmCards(data: state.data1);
              },
            ),
            AppTheme.appBarBackgroundTheme(context)
          ],
        ));
  }
}

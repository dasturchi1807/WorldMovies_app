import 'package:films_app/core/colors.dart';
import 'package:films_app/pages/widgets/film_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme.dart';
import '../../view_model/view_model.dart';
import '../widgets/appBar.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        extendBodyBehindAppBar: true,
        appBar: Appbar(title: "Popular"),
        body: Stack(
          children: [
            Consumer<ViewModel>(
              builder: (context, state, child) {
                return FilmCards(data: state.data2,);
              },
            ),
            AppTheme.appBarBackgroundTheme(context)
          ],
        ));
  }
}

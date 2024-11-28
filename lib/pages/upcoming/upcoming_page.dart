import 'package:films_app/core/colors.dart';
import 'package:films_app/core/theme.dart';
import 'package:films_app/pages/widgets/film_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model.dart';
import '../widgets/appBar.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        extendBodyBehindAppBar: true,
        appBar: Appbar(title: "Upcoming"),
        body: Stack(
          children: [
            Consumer<ViewModel>(
              builder: (context, state, child) {
                return FilmCards(data: state.data4,);
              },
            ),
            AppTheme.appBarBackgroundTheme(context)
          ],
        ));
  }
}

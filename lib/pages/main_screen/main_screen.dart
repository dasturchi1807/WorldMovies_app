import 'dart:ui';

import 'package:films_app/core/colors.dart';
import 'package:films_app/core/icons.dart';
import 'package:films_app/pages/widgets/shaderMask.dart';
import 'package:films_app/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(builder: (context, state, child) {
      return Scaffold(
        body: Stack(
          children: [
            state.currentPage(),
            Align(
              alignment: Alignment.bottomCenter,
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                 child: BackdropFilter(
                   filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                   child: Theme(
                     data: ThemeData(
                       splashColor: Colors.transparent,
                       highlightColor: Colors.transparent
                     ),
                     child: BottomNavigationBar(
                       backgroundColor: Colors.transparent,
                       type: BottomNavigationBarType.fixed,
                       currentIndex: state.pageIndex,
                       onTap: (value) {
                         state.getPageIndex(value);
                         state.getRequest();
                         state.getData();
                       },
                       items: [
                         BottomNavigationBarItem(
                           icon: state.pageIndex == 0 ? Shadermask(child: Image.asset(AppIcons.now_playing, width: 25, height: 25,)) : Image.asset(AppIcons.now_playing, width: 25, height: 25, color: AppColors.white,),
                           label: "Now Playing",
                           tooltip: "Now Playing",
                         ),
                         BottomNavigationBarItem(
                           icon: state.pageIndex == 1 ? Shadermask(child: Image.asset(AppIcons.popular, width: 25, height: 25,)) : Image.asset(AppIcons.popular, width: 25, height: 25, color: AppColors.white,),
                           label: "Popular",
                           tooltip: "Popular",
                         ),
                         BottomNavigationBarItem(
                           icon: state.pageIndex == 2 ? Shadermask(child: Image.asset(AppIcons.top_rated, width: 25, height: 25,)) : Image.asset(AppIcons.top_rated, width: 25, height: 25, color: AppColors.white,),
                           label: "Top Rated",
                           tooltip: "Top Rated",
                         ),
                         BottomNavigationBarItem(
                           icon: state.pageIndex == 3 ? Shadermask(child: Image.asset(AppIcons.upcoming, width: 25, height: 25,)) : Image.asset(AppIcons.upcoming, width: 25, height: 25, color: AppColors.white,),
                           label: "Upcoming",
                           tooltip: "Upcoming",
                         )
                       ],

                       selectedItemColor: AppColors.blue,
                       unselectedItemColor: AppColors.white,
                       unselectedFontSize: 12,
                       selectedFontSize: 12,
                       enableFeedback: false,
                     ),
                   ),
                 ),
               ),
            )
          ],
        ),
        );
    },);

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpro_slideranimationbloc/SlideBar.dart';

import 'bloc/navigation_bloc.dart';
import 'pages/HomePage.dart';

class SideBarLayout extends StatefulWidget {
  const SideBarLayout({Key key}) : super(key: key);

  @override
  _SideBarLayoutState createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: BlocProvider<NavigationBloc>(
          create: (context) => new NavigationBloc(HomePage()),
          child: new Stack(
            children:<Widget> [
              BlocBuilder<NavigationBloc,Widget>(
                  builder: (context,Widget widget){
                    return widget;
                  }),
              SlideBar(),
            ],
          ),
        )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fpro_slideranimationbloc/bloc/navigation_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'menuItem.dart';

class SlideBar extends StatefulWidget {
  @override
  _SlideBarState createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar>
    with SingleTickerProviderStateMixin {
  bool isSlideBarOpen = false;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInQuint,
        left: isSlideBarOpen ? 65 : screenWidth - 35,
        child: Row(
          children: [
            Container(
              width: screenWidth - 100,
              height: screenheight,
              color: Color(0xff262aaa),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  new ListTile(
                    title: new Text(
                      "MyApp",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Container(
                      child: new Text(
                        'narges Shajari',
                        style:
                            TextStyle(color: Color(0xff1bb5fd), fontSize: 15),
                      ),
                      margin: EdgeInsets.only(top: 10),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new Divider(
                    height: 65,
                    color: Colors.white.withOpacity(0.7),
                    indent: 32,
                  ),
                  MenuItem(
                    icon: Icons.home,
                    title: "home",
                    onTap: () {
                      context.read<NavigationBloc>().add(NavigationEvents.HomPageClickEvent);
                    //  context.bloc<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.shopping_basket,
                    title: "my order",
                    onTap: () {
                      context
                          .read<NavigationBloc>()
                          .add(NavigationEvents.MyOrderPageClickEvent);
                      //  context.bloc<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.list_outlined,
                    title: "wishlist",
                    onTap: () {
                      print('click wishlist');
                      context
                          .read<NavigationBloc>()
                          .add(NavigationEvents.WishListPageClickEvent);
                      //  context.<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),
                  new BlocBuilder<CounterBloc ,int>(builder: (context,int myCounter){
                    return    MenuItem(
                      icon: Icons.list_outlined,
                      title: "CounterPage $myCounter",
                      onTap: () {
                        print('click CounterPage');
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvents.CounterPageClickEvent);
                        //  context.<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                        setState(() {
                          isSlideBarOpen=!isSlideBarOpen;
                        });
                      },
                    );
                  })

                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSlideBarOpen = !isSlideBarOpen;
                });
              },
              child: Align(
                  alignment: Alignment(0, -0.8),
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      height: 110,
                      width: 35,
                      alignment: Alignment.center,
                      child: AnimatedIcon(
                        color: Colors.lightBlueAccent,
                        icon: isSlideBarOpen
                            ? AnimatedIcons.menu_close
                            : AnimatedIcons.close_menu,
                        progress: _animationController.view,
                      ),
                      color: Color(0xff262aaa),
                    ),
                  )),
            )
          ],
        ));
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path =
        Path(); /////https://medium.com/flutter-community/flutter-custom-clipper-28c6d380fdd6
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, 8, width - 10, 16);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 16);
    path.quadraticBezierTo(width, height - 8, width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

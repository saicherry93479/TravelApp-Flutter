import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/Screens/Liked.dart';
import 'package:travelapp/Screens/Notify.dart';
import 'package:travelapp/Screens/Profile.dart';
import '../utilsMain.dart';
import 'Home.dart';

List Screens = [HomeScreen(), Liked(), Notify(), ProfileScreen()];

class HomeBoardScreen extends StatefulWidget {
  const HomeBoardScreen({Key? key}) : super(key: key);

  @override
  State<HomeBoardScreen> createState() => _HomeBoardScreenState();
}

class _HomeBoardScreenState extends State<HomeBoardScreen> {
  int currentPage = 0;
  void currentUpdate(page) {
    print("current page is $page ");
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    var margin = getScreenHeight(context, 15);
    return Scaffold(
      bottomNavigationBar: Container(
        // height: MediaQuery.of(context).size.height * 0.073,
        padding: EdgeInsets.all(
          getScreenWidth(context, 10),
        ),
        margin: EdgeInsets.only(bottom: margin, left: margin, right: margin),
        decoration: BoxDecoration(
          color: Color(0XFF252525),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: BottomItems.map(
                  (e) => BottomBarItem(e, context, currentPage, currentUpdate))
              .toList(),
        ),
      ),
      body: Screens[currentPage],
    );
  }
}

Widget BottomBarItem(e, BuildContext context, currentPage, currentUpdate) {
  return IconButton(
    onPressed: () {
      currentUpdate(e.index);
    },
    icon: Container(
      // padding: EdgeInsets.all(getScreenWidth(context, 2)),
      child: Column(
        children: [
          SvgPicture.asset(currentPage == e.index ? e.imageTwo : e.image),
          Container(
            margin: EdgeInsets.only(top: getScreenHeight(context, 5)),
            height: 3,
            width: 7,
            decoration: BoxDecoration(
                color:
                    e.index == currentPage ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(4))),
          )
        ],
      ),
    ),
  );
}

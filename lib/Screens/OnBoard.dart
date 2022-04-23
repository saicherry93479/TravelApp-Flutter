import 'package:flutter/material.dart';
import 'package:travelapp/Screens/Home.dart';
import 'package:travelapp/Screens/HomeBoard.dart';
import 'package:travelapp/utilsMain.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("height is ${MediaQuery.of(context).size.width}");
    return Scaffold(
      body: Stack(children: [
        Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/OnBoard.png'),
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          // color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getScreenHeight(context, 10),
                              horizontal: getScreenWidth(context, 15)),
                          child: Row(children: [
                            Image(
                              image:
                                  AssetImage('assets/images/OnBoardIcon.png'),
                            ),
                            SizedBox(
                              width: getScreenWidth(context, 20),
                            ),
                            Text(
                              "TravelGo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ]),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context, 45),
                    vertical: getScreenHeight(context, 50)),
                child: Column(
                  children: [
                    Text(
                      "Let’s explore\nthe world together",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getScreenHeight(context, 10),
                    ),
                    Text(
                      'We are your best travel agency',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: getScreenHeight(context, 30),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeBoardScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getScreenHeight(context, 20)),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              getScreenWidth(context, 20),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started Now',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: getScreenWidth(context, 20),
                            ),
                            SvgPicture.asset('assets/images/RightArrow.svg')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

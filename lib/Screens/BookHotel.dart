import 'package:flutter/material.dart';
import 'package:travelapp/Screens/Home.dart';

import '../utilsMain.dart';
import 'FlightBook.dart';
import 'ItemWidget.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFFAFAFA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    image: AssetImage('assets/images/HotelMain.png'),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black26,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Center(
                        child: Text(
                      'Booking\nYour Hotel',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
                  ),
                  NavBarMethod(context, () {
                    Navigator.pop(context);
                  }),
                ],
              ),
              Transform.translate(
                  offset: Offset(0, -30),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context, 35),
                    ),
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Color(0XFFFAFAFA),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                              offset: Offset(0, -30),
                              child: HoverBox(context, () {}, 0, false,
                                  'Where Are You Going ?')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateItem(context, 'Check in', '20/08/22'),
                              DateItem(context, 'Check out', '27/08/22')
                            ],
                          ),
                          SizedBox(
                            height: getScreenHeight(context, 30),
                          ),
                          FightMethod(context, 'assets/images/Friends.svg',
                              '3 Rooms,2 Adults,2 Children', ''),
                          SizedBox(
                            height: getScreenHeight(context, 30),
                          ),
                          SeachButton(context, 'SEARCH HOTEL'),
                          SizedBox(
                            height: getScreenHeight(context, 30),
                          ),
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          SingleChildScrollView(
                            padding:
                                EdgeInsets.all(getScreenWidth(context, 10)),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: recommendedHotels
                                  .map((e) => MainItem(context, e))
                                  .toList(),
                            ),
                          )
                        ]),
                  ))
            ],
          ),
        ));
  }
}

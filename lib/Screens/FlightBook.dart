import 'package:flutter/material.dart';
import 'package:travelapp/Screens/Home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/main.dart';
import '../utilsMain.dart';
import 'ItemWidget.dart';

class FlightBookScreen extends StatefulWidget {
  const FlightBookScreen({Key? key}) : super(key: key);

  @override
  State<FlightBookScreen> createState() => _FlightBookScreenState();
}

class _FlightBookScreenState extends State<FlightBookScreen> {
  bool click = false;

  void clickFunction() {
    setState(() {
      click = !click;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              image: AssetImage('assets/images/FlightPic.png'),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                  child: Text(
                'Booking\nYour Flight',
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
          child: Flexible(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(0, -30),
                    child: HoverBox(
                        context, clickFunction, click, true, 'Round Trip'),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          FlightItem(context, 'assets/images/PlaneOne.svg',
                              'London,United Kingdom', true),
                          Row(
                            children: List.generate(
                                750 ~/ 10,
                                (index) => Expanded(
                                      child: Container(
                                        color: index % 2 == 0
                                            ? Colors.white
                                            : Color.fromARGB(
                                                255, 193, 193, 193),
                                        height: 2,
                                      ),
                                    )),
                          ),
                          FlightItem(context, 'assets/images/PlaneOne.svg',
                              'Cairo, Egypt', false)
                        ],
                      ),
                      Positioned(
                        top: getScreenHeight(context, 58),
                        left: getScreenWidth(context, 250),
                        child: ItemCon('assets/images/StarSolid.svg'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getScreenHeight(context, 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateItem(context, 'Deapart', '20/08/22'),
                      DateItem(context, 'Return', '27/08/22')
                    ],
                  ),
                  SizedBox(
                    height: getScreenHeight(context, 15),
                  ),
                  FightMethod(context, 'assets/images/PeopleSit.svg',
                      'Passanger', '2 Adult ,3 Children'),
                  SizedBox(
                    height: getScreenHeight(context, 10),
                  ),
                  FightMethod(context, 'assets/images/StarSolid.svg', 'Class',
                      'Business'),
                  SizedBox(
                    height: getScreenHeight(context, 20),
                  ),
                  SeachButton(context, "SEARCH FLIGHTS")
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Container FlightItem(BuildContext context, svg, name, top) {
    return Container(
      padding: EdgeInsets.all(getScreenWidth(context, 30)),
      decoration: BoxDecoration(
          borderRadius: top
              ? BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            boxShadow(Colors.grey.withOpacity(0.3), 1.4, 4.0, 0.0, 0.0)
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(svg),
          SizedBox(
            width: getScreenWidth(context, 30),
          ),
          Text(
            name,
            style: TextStyle(color: Color(0XFF707070), fontSize: 16),
          )
        ],
      ),
    );
  }
}

Container DateItem(BuildContext context, header, subHeader) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: getScreenWidth(context, 10),
        horizontal: getScreenWidth(context, 20)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
        boxShadow: [
          boxShadow(Colors.grey.withOpacity(0.24), 1.4, 4.0, 0.0, 0.0)
        ]),
    child: Row(
      children: [
        ItemCon('assets/images/calendar.svg'),
        SizedBox(
          width: getScreenWidth(context, 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: TextStyle(color: Color(0XFF707070)),
            ),
            SizedBox(
              height: getScreenHeight(context, 2),
            ),
            Text(subHeader)
          ],
        )
      ],
    ),
  );
}

Container ItemCon(svg) {
  return Container(
    height: 40,
    width: 40,
    // padding: EdgeInsets.all(getScreenWidth(context, 8)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          boxShadow(Colors.grey.withOpacity(0.2), 1.4, 4.0, 0.0, 0.0),
        ]),
    child: Center(child: SvgPicture.asset(svg)),
  );
}

Container FightMethod(BuildContext context, svg, head, subhead) {
  return Container(
    padding: EdgeInsets.all(getScreenWidth(context, 10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          boxShadow(Colors.grey.withOpacity(0.24), 1.4, 4.0, 0.0, 0.0)
        ]),
    child: Row(children: [
      ItemCon(svg),
      SizedBox(
        width: getScreenWidth(context, 20),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head,
            style: TextStyle(
                color: Color.fromARGB(255, 127, 127, 127),
                fontSize: 14,
                fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: getScreenHeight(context, 2),
          ),
          subhead == ""
              ? SizedBox()
              : Text(
                  subhead,
                  style: TextStyle(
                      color: Color(0XFF252525),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
        ],
      ),
      Spacer(),
      SvgPicture.asset(
        'assets/images/Down.svg',
        height: 8,
        width: 8,
        color: Colors.black38,
      )
    ]),
  );
}

GestureDetector SeachButton(BuildContext context, tex) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: getScreenHeight(context, 10)),
      padding: EdgeInsets.all(getScreenWidth(context, 20)),
      decoration: BoxDecoration(
          color: Color(0XFF252525),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Text(
        tex,
        style: TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 2),
      )),
    ),
  );
}

Container HoverBox(BuildContext context, clickFunction, click, ok, tex) {
  return Container(
    padding: EdgeInsets.all(getScreenWidth(context, 20)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          boxShadow(Colors.grey.withOpacity(0.3), 1.4, 4.0, 0.0, 0.0)
        ]),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        tex,
        style: TextStyle(fontSize: 16, color: Color(0XFF707070)),
      ),
      ok
          ? GestureDetector(
              onTap: clickFunction,
              child: Container(
                height: 28,
                width: 28,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/check-solid.svg',
                    height: 20,
                    width: 20,
                    color: click ? Colors.white : mainColor,
                  ),
                ),
                decoration: BoxDecoration(
                    color: click ? mainColor : Colors.transparent,
                    border: Border.all(width: 1, color: mainColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )),
              ))
          : SvgPicture.asset(
              'assets/images/Map.svg',
              height: 20,
              width: 20,
              color: mainColor,
            ),
    ]),
  );
}

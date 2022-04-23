import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:travelapp/Screens/ItemWidget.dart';
import 'package:travelapp/Screens/OnBoard.dart';
import 'package:travelapp/utilsMain.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'FlightBook.dart';

List data = [Trending, Featured, TopVisited];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  int currentPage = 0;
  void flightFucntion() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (Context) => FlightBookScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // print(data[current][0].name);
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context, 25)),
        child: Container(
          padding: EdgeInsets.only(top: getScreenHeight(context, 20)),
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '👋Hello,Peter Parker',
                    style: TextStyle(fontSize: 16),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Profile.jpg'),
                  )
                ],
              ),
              Text(
                "Discover Your\nDream Destinations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SearchRow(context),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ItemsList.map((e) => RowItem(
                        context,
                        e.Image,
                        e.Name,
                      )).toList()),
              Column(
                children: [
                  SizedBox(
                    height: getScreenHeight(context, 10),
                  ),
                  BookItemRow(context),
                  SizedBox(
                    height: getScreenHeight(context, 10),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.all(getScreenWidth(context, 10)),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data[current]
                          .map<Widget>((e) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ItemScreen(item: e)),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: getScreenWidth(context, 20),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  padding: EdgeInsets.all(
                                      getScreenWidth(context, 14)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      boxShadow(Colors.grey.withOpacity(0.1),
                                          1.0, 5.0, 0.0, 0.0),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            child: Image(
                                              image: AssetImage(e.image),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white),
                                              child: Text('⭐ ${e.rating}'),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        e.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height: getScreenHeight(context, 10)),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Map.svg'),
                                          SizedBox(
                                            width: getScreenWidth(context, 10),
                                          ),
                                          Text(
                                            e.place,
                                            style: TextStyle(
                                                color: Color(0XFF707070)),
                                          ),
                                          Spacer(),
                                          Text('${e.price}/night')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(
                  getScreenWidth(context, 14),
                ),
                margin: EdgeInsets.only(bottom: getScreenHeight(context, 15)),
                decoration: BoxDecoration(
                  color: Color(0XFF252525),
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: BottomItems.map((e) => GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(e.image),
                              Container(
                                margin: EdgeInsets.only(
                                    top: getScreenHeight(context, 6)),
                                height: 4,
                                width: 7,
                                decoration: BoxDecoration(
                                    color: e.index == currentPage
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              )
                            ],
                          ),
                        ),
                      )).toList(),
                ),
              ),
              // SizedBox(
              //   height: getScreenHeight(context, 1),
              // )
            ],
          ),
        ),
      )),
    );
  }

  Row BookItemRow(BuildContext context) {
    return Row(
      children: BookList.map((e) => GestureDetector(
            onTap: () {
              setState(() {
                current = e.current;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: getScreenHeight(context, 40)),
              child: Column(children: [
                Text(
                  e.Name,
                  style: TextStyle(
                      color:
                          current == e.current ? Colors.black : Colors.black26,
                      fontSize: 16,
                      fontWeight: current == e.current
                          ? FontWeight.bold
                          : FontWeight.w400),
                ),
                SizedBox(
                  height: getScreenHeight(context, 7),
                ),
                Container(
                  height: getScreenHeight(context, 5),
                  width: getScreenWidth(context, 12),
                  decoration: BoxDecoration(
                      color: current == e.current ? mainColor : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                )
              ]),
            ),
          )).toList(),
    );
  }

  Column RowItem(BuildContext context, image, name) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (name == 'Flight') {
              flightFucntion();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.width / 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                boxShadow: [
                  boxShadow(Colors.grey.withOpacity(0.1), 1.0, 5.0, 0.0, 0.0)
                ]),
            child: Center(child: SvgPicture.asset(image)),
          ),
        ),
        SizedBox(
          height: getScreenHeight(context, 10),
        ),
        Text(name)
      ],
    );
  }
}

Row SearchRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: getScreenWidth(context, 290),
        padding: EdgeInsets.symmetric(
          vertical: getScreenHeight(context, 15),
          horizontal: getScreenWidth(context, 18),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              boxShadow(Colors.grey.withOpacity(0.1), 1.0, 5.0, 0.0, 0.0)
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(
                getScreenWidth(context, 10),
              ),
            )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Search For ..'),
          SizedBox(
            width: getScreenWidth(context, 20),
          ),
          SvgPicture.asset('assets/images/Search.svg')
        ]),
      ),
      Container(
          padding: EdgeInsets.symmetric(
            vertical: getScreenHeight(context, 15),
            horizontal: getScreenWidth(context, 18),
          ),
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SvgPicture.asset('assets/images/Filter.svg')),
    ],
  );
}

BoxShadow boxShadow(color, spreadRadius, blurRadius, x, y) {
  return BoxShadow(
    color: color,
    spreadRadius: spreadRadius,
    blurRadius: blurRadius,
    offset: Offset(x, y), // changes position of shadow
  );
}

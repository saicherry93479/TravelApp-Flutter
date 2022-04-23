import 'package:flutter/material.dart';
import 'package:travelapp/Screens/FlightBook.dart';
import 'package:travelapp/utilsMain.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Home.dart';

List svgs = ['assets/images/calendar.svg', 'assets/images/star.svg'];
List topIcons = ['assets/images/LeftArrow.svg', 'assets/images/Ellipses.svg'];

class ItemScreen extends StatefulWidget {
  ScrollItem item;
  ItemScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool liked = false;
  void backFunction() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                image: AssetImage(widget.item.image),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black26,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              NavBarMethod(context, backFunction),
              Positioned(
                  bottom: 50,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(getScreenWidth(context, 10)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.all(
                        Radius.circular(48),
                      ),
                    ),
                    child: Text(
                      'Top Choice',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ))
            ],
          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.48,
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context, 35),
                  vertical: getScreenHeight(context, 20)),
              decoration: BoxDecoration(
                  color: Color(0XFFFAFAFA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingOne(svgs[0], widget.item.rating, context),
                        SizedBox(
                          width: getScreenWidth(context, 20),
                        ),
                        RatingOne(svgs[1], widget.item.days, context),
                        SizedBox(
                          width: getScreenWidth(context, 60),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              liked = !liked;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(getScreenWidth(context, 8)),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: [
                                  boxShadow(Colors.grey.withOpacity(0.3), 1.4,
                                      4.0, 0.0, 0.0),
                                ]),
                            child: Center(
                                child: SvgPicture.asset(
                              liked
                                  ? 'assets/images/heart-solid.svg'
                                  : 'assets/images/heart-regular.svg',
                              height: 20,
                              width: 20,
                              color: Colors.red,
                            )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: getScreenHeight(context, 5),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Map.svg'),
                            SizedBox(
                              width: getScreenWidth(context, 10),
                            ),
                            Text(
                              widget.item.place,
                              style: TextStyle(color: Color(0XFF707070)),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.item.desc,
                      style: TextStyle(color: Color(0XFF707070), fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.item.Gallery
                          .map((e) => Transform.scale(
                              scale: 1.1, child: Image(image: AssetImage(e))))
                          .toList(),
                    )
                  ]),
            ),
          ),
          Divider(
            height: 2,
            color: Color.fromARGB(255, 217, 233, 247),
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context, 30),
                vertical: getScreenHeight(context, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(color: Color(0XFFB1B1B1), fontSize: 16),
                    ),
                    Text(
                      widget.item.price,
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(getScreenWidth(context, 20)),
                    decoration: BoxDecoration(
                        color: Color(0XFF252525),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        )),
                    child: Text(
                      'Book Now',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Row RatingOne(svg, name, context) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(getScreenWidth(context, 8)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              boxShadow(Colors.grey.withOpacity(0.3), 1.4, 4.0, 0.0, 0.0),
            ]),
        child: Center(child: SvgPicture.asset(svg)),
      ),
      SizedBox(
        width: getScreenWidth(context, 10),
      ),
      Text('$name Days')
    ],
  );
}

Widget IconBut(BuildContext context, svg, function) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: IconButton(
        onPressed: function,
        icon: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.45),
          child: SvgPicture.asset(svg),
        )),
  );
}

Positioned NavBarMethod(BuildContext context, backFunction) {
  return Positioned(
    top: 20,
    child: Container(
      // color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBut(context, topIcons[0], backFunction),
          IconBut(context, topIcons[1], () {})
        ],
      ),
    ),
  );
}

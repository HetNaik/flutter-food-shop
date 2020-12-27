import 'package:flutter/material.dart';
import 'package:food_emoji/burgerpage.dart';
import 'package:food_emoji/foodtabs.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu, color: Colors.black),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: Offset(0, 3))
                      ],
                      color: Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/tuxedo.png'),
                          fit: BoxFit.contain))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'SEARCH FOR',
            style:
                GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'RECIPES',
            style:
                GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27),
          ),
        ),
        SizedBox(height: 25),
        Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(fontSize: 14),
                    border: InputBorder.none,
                    fillColor: Colors.green.withOpacity(0.5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            )),
        SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Recommended',
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w500, fontSize: 18))),
        SizedBox(height: 15),
        Container(
            height: 200,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              buildListItem('Burger', 'assets/burger.png', '21',
                  Colors.orange[800], Colors.orange[200]),
              buildListItem('French Fries', 'assets/fries.png', '15',
                  Colors.red[800], Colors.red[200]),
              buildListItem('Doughnut', 'assets/doughnut.png', '10',
                  Colors.brown[800], Colors.brown[200]),
            ])),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.3),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12, fontWeight: FontWeight.w500),
              tabs: [
                Tab(child: Text('Featured')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVOURITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            )),
        Container(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ))
      ],
    ));
  }

  buildListItem(String fName, String imgPath, String price, Color textColor,
      Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BurgerPage(
                    heroTag: fName,
                    fName: fName,
                    pricePerItem: price,
                    imgPath: imgPath)));
          },
          child: Container(
            height: 175,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: bgColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: fName,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(imgPath, height: 50, width: 50),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    fName,
                    style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
                  ),
                  Text(
                    '\$' + price,
                    style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
                  )
                ]),
          ),
        ));
  }
}

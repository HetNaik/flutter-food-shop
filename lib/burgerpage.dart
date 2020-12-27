import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {
  final imgPath, fName, pricePerItem, heroTag;
  BurgerPage({this.imgPath, this.fName, this.heroTag, this.pricePerItem});

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu),
              Stack(
                children: [
                  Container(height: 45, width: 45, color: Colors.transparent),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xFFFE706A).withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: Offset(0, 4))
                      ], color: Color(0xFFF37D6A), shape: BoxShape.circle),
                      child: Center(
                          child:
                              Icon(Icons.shopping_cart, color: Colors.black))),
                  Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Text('1',
                                style: GoogleFonts.notoSans(
                                    fontSize: 7,
                                    textStyle: TextStyle(color: Colors.red))),
                          )))
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(widget.fName.toString().toUpperCase(),
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27))),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(width: 15),
            Column(children: <Widget>[
              Stack(children: <Widget>[
                Container(
                    height: 45,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: Offset(5, 11))
                        ])),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Icon(Icons.favorite_border,
                          color: Color(0xFFFE7D6A), size: 25)),
                ),
              ]),
              SizedBox(
                height: 35,
              ),
              Stack(children: <Widget>[
                Container(
                    height: 45,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: Offset(5, 11))
                        ])),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Icon(Icons.restore,
                          color: Color(0xFFFE7D6A), size: 25)),
                ),
              ]),
            ])
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: 125,
              color: Colors.white,
              child: Center(
                  child: Text(
                '\$' + (int.parse(widget.pricePerItem) * quantity).toString(),
                style: GoogleFonts.notoSans(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5E6166)),
              )),
            ),
            Container(
                height: 60,
                width: 225,
                decoration: BoxDecoration(
                    color: Color(0xFFFE7D6A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              adJustQuantity('MINUS');
                            },
                            iconSize: 17,
                            icon: Icon(
                              Icons.remove,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                          Text(quantity.toString(),
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFFFE7D6A))),
                          IconButton(
                            onPressed: () {
                              adJustQuantity('PLUS');
                            },
                            iconSize: 17,
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('Add to Cart',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white))
                  ],
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'FEATURED',
            style:
                GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              _buildListItem('1'),
              _buildListItem('2'),
            ]))
      ]),
    );
  }

  _buildListItem(String columnNumber) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(children: <Widget>[
        if (columnNumber == '1')
          _buildColumnItem(
              'assets/cheese.png', 'Sweet Cheese', '11', Color(0xFFFBD6F5)),
        if (columnNumber == '1')
          SizedBox(
            height: 15,
          ),
        if (columnNumber == '1')
          _buildColumnItem(
              'assets/popcorn.png', 'Sweet Popcorn', '15', Color(0xFFFBD6F5)),
        if (columnNumber == '2')
          _buildColumnItem('assets/taco.png', 'Tacos', '17', Color(0xFFFBD6F5)),
        if (columnNumber == '2')
          SizedBox(
            height: 15,
          ),
        if (columnNumber == '2')
          _buildColumnItem(
              'assets/sandwich.png', 'Sweet Sandwich', '15', Color(0xFFFBD6F5)),
      ]),
    );
  }

  _buildColumnItem(String imgPath, String fName, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 210,
          child: Row(
            children: [
              Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), color: bgColor),
                  child: Center(
                    child: Image.asset(imgPath, width: 50, height: 50),
                  )),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fName,
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w400,fontSize: 14),
                  ),
                  Text('\$' + price,
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w400,fontSize: 16,textStyle: TextStyle(color:Color(0xFFFE7D6A))))
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  adJustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          if (quantity >= 0 && quantity < 9) {
            quantity += 1;
          }
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity > 0 && quantity < 10) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}

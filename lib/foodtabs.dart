import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        _buildListItem('Delicious hot dog', 5.0, '6', 'assets/hotdog.png','18'),
        _buildListItem('Cheese Pizza', 5.0, '8', 'assets/pizza.png','20'),
      
        
      ]),
    );
  }

  _buildListItem(String fName, rating, String price, String imgPath,String cprice) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 210,
                child: Row(children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0XFFFFE3DF)),
                    child: Center(
                        child: Image.asset(imgPath, height: 50, width: 50)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          fName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SmoothStarRating(
                          allowHalfRating: true,
                          onRated: (v) {},
                          starCount: rating.toInt(),
                          rating: rating,
                          color: Color(0xFFFFD143),
                          borderColor: Color(0xFFFFD143),
                          size: 15,
                          spacing: 0,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$' + price,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  textStyle:
                                      TextStyle(color: Color(0xFFF68D7F))),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '\$' + cprice,
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  textStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.4))),
                            )
                          ],
                        )
                      ])
                ])),
            FloatingActionButton(
              heroTag: fName,
              mini: true,
              onPressed: () {},
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color(0xFFFE7D6A),
            )
          ],
        ));
  }
}

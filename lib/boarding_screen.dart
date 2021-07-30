import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onboarding_ui/data/data.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide("assets/sunshine.jpg",
          "Get tailored destination for your\nnext trip", "Get started"),
      Slide(
          "assets/beach1.jpg",
          "Get first hand information about\nfavourites countries with Country",
          "Get Started"),
     //Slide("assets/carload.jpg", "Get Stated", "Traveling")
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 800,
             // margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: Image.asset(slide.imagePath, fit: BoxFit.fill
               ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 590, 0, 0),
              child: Text(slide.title,
              textAlign: TextAlign.start,
              style: (TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: Colors.white))
              ),
            ),
            Container(
             padding: EdgeInsets.only(left: 30, right: 30, top: 700, bottom: 0),
              //height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(3),
                shadowColor: Colors.orangeAccent,
                color: Colors.orangeAccent,
                elevation: 1.0,
                child: Center(
                  heightFactor: 2,
                  child: Text(
                    slide.desc,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "Montserrat"),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: EdgeInsets.only(right: 40, bottom: 30),
        //   child: Text(
        //     slide.title,
        //     textAlign: TextAlign.start,
        //     style: (TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
        //   ),
        // ),
      ],
    );
  }

  void _handlingOnPageChange(int page) {
    setState(() => _currentPage = page);
  }

  Widget _buildPageIndicator() {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 9,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color.fromRGBO(225, 169, 0, 1)
              : Color.fromRGBO(206, 200, 233, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChange,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 250,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3, vertical: 45),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

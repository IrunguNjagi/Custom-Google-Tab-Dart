import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:like_button/like_button.dart';

class JansTab extends StatefulWidget {
  const JansTab({super.key});

  @override
  _JansTabState createState() => _JansTabState();
}

class _JansTabState extends State<JansTab> {

  double rowContainerHeight = 50;
  double rowContainerWidth = 50;
  int numberOfLikes = 120;

  void _changeSize(){
    setState(() {
      rowContainerHeight = 100;
      rowContainerWidth = 100;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.orangeAccent,
              ),
              child: const Center(
                child: Text(
                  "Welcome User",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Roboto'
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _changeSize,
                  child: Container(
                    height: rowContainerHeight,
                    width: rowContainerWidth,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: LikeButton(
                      size: 25,
                      animationDuration: Duration(milliseconds: 1000),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.black,
                        dotSecondaryColor: Colors.yellow,
                      ),
                      likeBuilder: (bool isLiked){
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.green : Colors.blue,
                        );
                      },
                      likeCount: numberOfLikes,
                      countPostion: CountPostion.bottom,
                      onTap: (bool isLiked) async {
                        setState(() {
                          if (isLiked){
                            numberOfLikes --;
                            }
                          else{
                            numberOfLikes++;
                          }
                        });
                        return !isLiked;
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _changeSize,
                  child: Container(
                    height: rowContainerHeight,
                    width: rowContainerWidth,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _changeSize,
                  child: Container(
                    height: rowContainerHeight,
                    width: rowContainerWidth,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _changeSize,
                  child: Container(
                    height: rowContainerHeight,
                    width: rowContainerWidth,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: const EdgeInsets.all(18.0),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.monetization_on,
                  text: "Balance",
                ),
                GButton(
                  icon: Icons.ac_unit,
                  text: "Settings",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

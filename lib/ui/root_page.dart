import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/model/plants.dart';
import 'package:plant/ui/screens/signin_page.dart';
import 'package:plant/ui/scan_page.dart';
import 'package:plant/ui/screens/cart_page.dart';
import 'package:plant/ui/screens/favorite_page.dart';
import 'package:plant/ui/screens/home_page.dart';
import 'package:plant/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant>favorites=[];
  List<Plant>myCart=[];

  int _bottomNavIndex=0;

  //list of the pages
  List<Widget>_widgetOptions(){
   return [
      const HomePage(),
      FavoritePage(favoritedplant: favorites),
      CartPage(addToCartPlant: myCart,),
     const ProfilePage(),
    ];
  }

  //list of the pages icons
  List<IconData>iconList=[
 Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //list of the pages title
  List<String>titleList=[
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex],style: TextStyle(
              color: Constants.blackColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),),
            Icon(Icons.notifications,color: Constants.blackColor,size: 30,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Navigator.push(context, PageTransition(child:const ScanPage(),type:PageTransitionType.bottomToTop));

      },
      child: Image.asset('assets/code-scan-two.png',height: 30.0,),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor:Constants.primaryColor,
        activeColor:Constants.primaryColor,
        inactiveColor:Colors.black.withOpacity(0.5),
        icons:iconList,
        activeIndex:_bottomNavIndex,
        gapLocation:GapLocation.center,
        notchSmoothness:NotchSmoothness.softEdge,
onTap:(index){
          setState(() {
            _bottomNavIndex=index;
            final List<Plant>favoritedPlants=Plant.getFavoritedPlants();
            final List<Plant>addToCartPlants=Plant.addedToCartPlants();

            favorites=favoritedPlants;
            myCart=addToCartPlants.toSet().toList();
          });
}
      ),
    );
  }
}

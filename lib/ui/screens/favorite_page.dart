import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/model/plants.dart';
import 'package:plant/ui/screens/widgets/plant_widgets.dart';
class FavoritePage extends StatefulWidget {
  final List<Plant>favoritedplant;
  const FavoritePage({super.key, required this.favoritedplant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold (
      body: widget.favoritedplant.isEmpty?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/favorited.png'),
                ),
                const SizedBox(
                  height: 10,
                  
                ),
                Text('Your Favorited Plants',style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),),
              ],
            ),
          )

          :Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 30),
        height: size.height*.5,
        child: ListView.builder(
            itemCount: widget.favoritedplant.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context,int index){
              return PlantWidget(index: index, plantList: widget.favoritedplant);

        }),
      ),
    );
  }
}

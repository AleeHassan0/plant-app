import 'package:flutter/cupertino.dart';
import 'package:plant/constants.dart';
import 'package:plant/ui/screens/detail_page.dart';
import 'package:flutter/material.dart';
import '../../../model/plants.dart';
import 'package:page_transition/page_transition.dart';


class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.index, required this.plantList,

  }) ;


  final int index;
  final List<Plant>plantList;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;


    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(child: DetailPage(
          plantId: plantList[index].plantId,
        ), type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
            color:
            Constants.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(10)
        ),
        height: 80.0,
        padding: EdgeInsets.only(left: 10,top: 10),
        margin: const EdgeInsets.only(bottom: 10,top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.secondaryColor,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,

                  child: SizedBox(
                    height: 80,
                    child: Image.asset(plantList[index].imageURL),
                  ),),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(plantList[index].category),
                        Text(plantList[index].plantName,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.blackColor
                        ),)
                      ],
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(r'$'+plantList[index].price.toString(),style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColor

              ),),
            )
          ],
        ),

      ),
    );
  }
}
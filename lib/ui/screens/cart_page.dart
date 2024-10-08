import 'package:flutter/material.dart';
import 'package:plant/model/plants.dart';
import 'package:plant/ui/screens/widgets/plant_widgets.dart';

import '../../constants.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCartPlant;
  const CartPage({super.key, required this.addToCartPlant});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addToCartPlant.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addToCartPlant.length,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                              index: index, plantList: widget.addToCartPlant);
                        }),
                  ),
                  Column(
                    children: [
const Divider(thickness: 1.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Totals',style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text(r'$51',style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Constants.primaryColor,
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}

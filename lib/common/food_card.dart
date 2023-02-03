import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FoodCard extends StatelessWidget {
  final String mealName;
  final Widget foodDetails;
  final double totalCaloriesAmount;
  final VoidCallback onPress;
const FoodCard({ Key? key, required this.mealName,  required this.totalCaloriesAmount,  required this.onPress, required this.foodDetails }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
                  decoration: BoxDecoration(
                    color: kTeal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              mealName,
                              style: TextStyle(
                                  color: kLite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              totalCaloriesAmount.toString(),
                              style: TextStyle(
                                  color: kLite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(color: kLite),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [ foodDetails]
                              
                            
                          ),
                        ),
                        const Divider(color: kLite),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Add Food',
                              style: TextStyle(
                                  color: kLite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            ElevatedButton(
                              onPressed: onPress,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kCircleProgressColor),
                              child: const Icon(Icons.add),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
  }
}
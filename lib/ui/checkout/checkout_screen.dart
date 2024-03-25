import 'package:flutter/material.dart';
import 'package:e_learning/model/course_model.dart';
import '../../utils/styles.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CourseModel> courseList;
  CheckoutScreen({required this.courseList});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late double totalOriginalPrice;
  late double totalDiscount;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    // Calculate the total prices
    calculateTotalPrices();
  }

  void calculateTotalPrices() {
    double originalPrice = 0;
    double discount = 0;

    // Calculate original price and discount for each course
    for (CourseModel course in widget.courseList) {
      originalPrice += course.oldPrice;
      discount += (course.oldPrice - course.price);
    }

    setState(() {
      totalOriginalPrice = originalPrice;
      totalDiscount = discount;
      totalPrice = originalPrice - discount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akshay',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              'Academy',
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(
              width: 35,
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Order Details
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 5,),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: widget.courseList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(widget.courseList[index].thumbnail),fit: BoxFit.cover)
                                  ),
                                ), // Image on the left
                                title: Text(widget.courseList[index].title,style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                )),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        '₹'+widget.courseList[index].price.toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.inversePrimary,
                                        )
                                    ),
                                    Text('₹'+widget.courseList[index].oldPrice.toString(),style: TextStyle(
                                        color: primaryColor,
                                        decoration: TextDecoration.lineThrough
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Divider(
                                height: 2,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          // Summary
          Container(
            padding: EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Total original price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Original Price: '),
                    Text('\₹${totalOriginalPrice.toStringAsFixed(2)}'), // Replace with actual total original price
                  ],
                ),
                SizedBox(height: 10),
                // Total discount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Discount: '),
                    Text('\₹${totalDiscount.toStringAsFixed(2)}'), // Replace with actual total discount
                  ],
                ),
                SizedBox(height: 10),
                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\₹${totalPrice.toStringAsFixed(2)}', // Replace with actual total
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.background,
            child: GestureDetector(
              onTap: () {
                // Implement your checkout functionality here
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 5,color: Theme.of(context).colorScheme.inversePrimary)
                ),
                child: Center(
                  child: Text(
                    'Confirm Checkout',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

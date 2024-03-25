import 'package:flutter/material.dart';

Widget checkoutContainer({
  required String thumbnail,
  required String title,
  required String price,
  required BuildContext context,
  required Function() onDelete,
}) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              thumbnail,
              height: 120,
              width: 100, // Adjust width according to your preference
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\₹$price',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: onDelete,
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Remove',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

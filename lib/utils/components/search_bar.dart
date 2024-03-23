import 'package:flutter/material.dart';
class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Theme.of(context).colorScheme.secondary)
        ),
      padding: const EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25,right: 25,bottom: 25,top: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          controller: _controller,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color:Theme.of(context).colorScheme.primary,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          ),
        ),
      )
      );
  }
}

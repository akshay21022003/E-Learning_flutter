import 'package:e_learning/utils/components/greeting.dart';
import 'package:e_learning/utils/components/search_bar.dart';
import 'package:e_learning/utils/components/sliver_app_bar.dart';
import 'package:e_learning/utils/components/tab_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  void destroy(){
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Greeting(),
                MySearchBar()
              ],
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("all")),
            Center(child: Text("software")),
            Center(child: Text("design")),
            Center(child: Text("business")),
            Center(child: Text("marketing")),
            Center(child: Text("photography"))
          ],
        ),
      ),
    );
  }
}

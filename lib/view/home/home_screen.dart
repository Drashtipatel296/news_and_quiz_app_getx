import 'package:flutter/material.dart';
import 'package:news_app_with_getx/view/home/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu,color: Colors.white,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert,color: Colors.white,),
            ),
          ],
          title: Text('News App',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              indicatorColor: Colors.orange.shade700,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('All news',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
                Text('Business',style: TextStyle(color: Colors.white,fontSize: 18),),
                Text('Political',style: TextStyle(color: Colors.white,fontSize: 18),),
                Text('Tech',style: TextStyle(color: Colors.white,fontSize: 18),),
                Text('Science',style: TextStyle(color: Colors.white,fontSize: 18),),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            FlutterLogo(),
            FlutterLogo(),
          ],
        ),
      ),
    );
  }
}

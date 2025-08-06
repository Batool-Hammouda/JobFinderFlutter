import 'package:flutter/material.dart';
import 'package:job_finder/review.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 2, 
            bottom: const TabBar(
              indicatorColor: Color(0xFF475BD8),
              indicatorWeight: 2,
              labelColor: Color(0xFF475BD8),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Review"),
                Tab(text: "Not Suitable"),
                Tab(text: "Interview"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ReviewTab(),
            Center(child: Icon(Icons.not_interested)),
            Center(child: Icon(Icons.video_call)),
          ],
        ),
      ),
    );
  }
}

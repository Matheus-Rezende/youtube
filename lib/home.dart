import 'package:flutter/material.dart';
import 'package:youtube/pages/home_page.dart';
import 'package:youtube/pages/library_page.dart';
import 'package:youtube/pages/shorts_page.dart';
import 'package:youtube/pages/subs_page.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pageIndex = 0;
  
  final pages = [
    const HomePage(),
    const ShortsPage(),
    const SubscriptionsPage(),
    const LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          scale: 8,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              debugPrint("Ação streaming");
            }, 
            icon: const Icon(Icons.connected_tv_outlined),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação videoCam");
            }, 
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação pesquisa");
            }, 
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação conta");
            }, 
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: pages[_pageIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.7)
        ),
        child: NavigationBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          animationDuration: const Duration(seconds: 1),
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _pageIndex,
          onDestinationSelected: (int newIndex){
            setState(() {
              _pageIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home, 
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                  Icons.play_arrow_rounded
                ),
              icon: Icon(
                  Icons.play_arrow_outlined,
                ),
              label: 'Shorts',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.subscriptions,
              ),
              icon: Icon(
                Icons.subscriptions_outlined,
              ),
              label: 'Inscrições',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.video_library_rounded,
              ),
              icon: Icon(
                Icons.video_library_outlined, 
              ),
              label: 'Biblioteca',
            )
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
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
  String _result = "";

  late List pages = [
    HomePage(_result),
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
            icon: const Icon(
              Icons.connected_tv_outlined,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação videoCam");
            }, 
            icon: const Icon(
              Icons.notifications_none_rounded,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () async {
             String res = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              ) as String;
              setState(() {
                _result = res;
              });
              debugPrint("Resultado: foi digitado $res");
            }, 
            icon: const Icon(
              Icons.search,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: (){
              debugPrint("Ação conta");
            }, 
            icon: const Icon(
              Icons.account_circle,
              size: 20,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
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
                size: 19,
              ),
              icon: Icon(
                Icons.home_outlined,
                size: 19,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                  Icons.play_circle_filled_rounded,
                  size: 19,
                ),
              icon: Icon(
                  Icons.play_circle_outline_rounded,
                  size: 19,
                ),
              label: 'Shorts',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.subscriptions,
                size: 19,
              ),
              icon: Icon(
                Icons.subscriptions_outlined,
                size: 19,
              ),
              label: 'Inscrições',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.video_library_rounded,
                size: 19,
              ),
              icon: Icon(
                Icons.video_library_outlined, 
                size: 19,
              ),
              label: 'Biblioteca',
            )
          ],
        ),
      )
    );
  }
}
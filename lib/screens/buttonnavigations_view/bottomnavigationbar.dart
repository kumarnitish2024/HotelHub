import 'package:flutter/material.dart';
import '../booking/book_page.dart';
import '../helpnow/help_page.dart';
import '../home/home_page.dart';
import '../offers_page/offers_page.dart';
import '../search/search_page.dart';


class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int currentPageIndex = 0;
  late PageController pageController;

  @override
  // void initState() {
  //   pageController = PageController();
  //   super.initState();
  // }
  //
  // void dispath() {
  //   pageController.dispose();
  //   super.dispose();
  // }
  //
  // void setCurrentPageIndex(int index) {
  //   pageController.jumpToPage(index);
  // }
  //
  // void onPageChanged() {
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: NavigationBar(
          backgroundColor: Colors.white,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations:  [
            const NavigationDestination(icon: Icon(Icons.home, color: Colors.orange), label: "Home"),
            const NavigationDestination(icon: Icon(Icons.book_online_outlined, color: Colors.orangeAccent), label: "BOOKING"),
            const NavigationDestination(icon: Icon(Icons.offline_pin_outlined, color: Colors.orangeAccent,), label: "Offers"),
            const NavigationDestination(icon: Icon(Icons.search, color: Colors.orangeAccent), label: "Search"),
            NavigationDestination(icon: InkWell(
                onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NeedHelp(),));
                    },
                    child: const Icon(Icons.live_help_outlined, color: Colors.orange)), label: "Help Now")
          ],
        ),
      ),
      body: <Widget>[
        const HomePage(),
        const BookPage(),
        const OffersPage(),
        const SearchPage(),
        //const NeedHelp(),
      ][currentPageIndex],
    );
  }
}



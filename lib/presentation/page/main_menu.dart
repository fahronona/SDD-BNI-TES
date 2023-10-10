import 'package:flutter/material.dart';
import 'package:flutter_bni_sdd/presentation/page/beranda_page.dart';
import 'package:flutter_bni_sdd/presentation/page/history_page.dart';
import 'package:flutter_bni_sdd/presentation/style/color_style.dart';
import 'package:flutter_bni_sdd/presentation/style/font_style.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentIndex = 0;
  //late StreamSubscription<bool> keyboardSubscription;
  bool buttonVisibility = false;
  List page = [BerandaPage(), Container(), History()];

  void button() {
    if (mounted) {
      // var keyboardVisibilityController = KeyboardVisibilityController();
      // keyboardSubscription =
      //     keyboardVisibilityController.onChange.listen((bool visible) {
      //   setState(() {
      //     buttonVisibility = visible;
      //   });

      //   print(buttonVisibility);
      // });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    button();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buttonVisibility == false
          ? FloatingActionButton(
              backgroundColor: StyleColors.primaryColors40,
              highlightElevation: 0,
              child: Center(
                child: Icon(
                  Icons.qr_code_2_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              elevation: 0,
              onPressed: () {},
            )
          : Container(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 50,
          onTap: (value) {
            setState(() {
              if (value != 1) {
                currentIndex = value;
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 24,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: StyleColors.primaryColors40,
          selectedLabelStyle: FontsStyle.fontBold600
              .copyWith(color: StyleColors.primaryColors40, fontSize: 13),
          unselectedLabelStyle:
              FontsStyle.fontBold600.copyWith(color: Colors.grey),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: StyleColors.primaryColors40,
              ),
              label: "Beranda",
            ),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Scan QR"),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.sticky_note_2_rounded,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.sticky_note_2_rounded,
                  color: StyleColors.primaryColors40,
                ),
                label: "Riwayat"),
          ]),
    );
  }
}

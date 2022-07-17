import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/ui/feedback/feedback_page.dart';
import 'package:hakaton/app/ui/home/home_page.dart';
import 'package:hakaton/app/ui/services/services_page.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/lazy_indexed_stack.dart';

class MainPage extends StatefulWidget {
  final int index;
  static const _selectedColor = ResColors.primary;
  static const _unselectedColor = ResColors.bgGray80;
  static const _textSize = 12.0;

  const MainPage({required this.index});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _tabs = [
    const BottomNavigationBarItem(
      icon: Icon(UiIcon.home_MedLock, color: MainPage._unselectedColor),
      activeIcon: Icon(UiIcon.home_MedLock, color: MainPage._selectedColor),
      label: 'Главная',
    ),
    const BottomNavigationBarItem(
      icon: Icon(UiIcon.hand_shaking, color: MainPage._unselectedColor),
      activeIcon: Icon(UiIcon.hand_shaking, color: MainPage._selectedColor),
      label: 'Услуги',
    ),
    const BottomNavigationBarItem(
      icon: Icon(UiIcon.support, color: MainPage._unselectedColor),
      activeIcon: Icon(UiIcon.support, color: MainPage._selectedColor),
      label: 'Поддержка',
    ),
  ];
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [HomePage(), ServicesPage(), FeedbackPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF182F50),
                Color(0xFF0F1E34),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: LazyLoadIndexedStack(
            index: widget.index,
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 58,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF21387E),
                Color(0xFF1C2F6C),
                Color(0xFF1C2E5A),
              ],
              tileMode: TileMode.clamp,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          BottomNavigationBar(
            items: _tabs,
            showUnselectedLabels: true,
            backgroundColor: Colors.transparent,
            unselectedItemColor: MainPage._unselectedColor,
            selectedItemColor: MainPage._selectedColor,
            currentIndex: widget.index,
            selectedFontSize: MainPage._textSize,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              CustomNavigator.goNamed(
                RouteInfo.mainPage.name,
                params: RouteInfo.mainPage
                    .getParams(extraParams: {'index': index.toString()}),
              );
            },
          ),
        ],
      ),
    );
  }
}

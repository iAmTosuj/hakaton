import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/ui/home/home_page.dart';
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
      icon: Icon(UiIcon.ruble, color: MainPage._unselectedColor),
      activeIcon: Icon(UiIcon.ruble, color: MainPage._selectedColor),
      label: 'Услуги',
    ),
    const BottomNavigationBarItem(
      icon: Icon(UiIcon.heart, color: MainPage._unselectedColor),
      activeIcon: Icon(UiIcon.heart, color: MainPage._selectedColor),
      label: 'Обращения',
    ),
  ];
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(),
      Center(child: Text('Услуги')),
      Center(child: Text('Обращения'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: widget.index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        showUnselectedLabels: true,
        backgroundColor: ResColors.bgGray0,
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
    );
  }
}

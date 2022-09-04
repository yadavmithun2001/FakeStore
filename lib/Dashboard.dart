import 'dart:async';
import 'dart:convert';

import 'package:bottom_bar/bottom_bar.dart';
import 'package:fake_store/Helper/Color.dart';
import 'package:fake_store/Helper/Session.dart';
import 'package:fake_store/Provider/HomeProvider.dart';
import 'package:fake_store/cart.dart';
import 'package:fake_store/categories.dart';
import 'package:fake_store/product_list.dart';
import 'package:fake_store/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selBottom = 0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  bool _isNetworkAvail = true;
  late AnimationController navigationContainerAnimationController =
  AnimationController(
    vsync: this, // the SingleTickerProviderStateMixin
    duration: const Duration(milliseconds: 500),
  );


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selBottom != 0) {
          _pageController.animateToPage(0,
              duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor:  Colors.grey.shade100,
        appBar: _getAppBar(),
        body: PageView(
          controller: _pageController,
          children: const [
            ProductList(),
            CartPage(),
            ProfilePage()
          ],
          onPageChanged: (index) {
            setState(() {
              _selBottom = index;
            });
          },
        ),
        bottomNavigationBar: _getBottomBar(),
      ),
    );
  }

  AppBar _getAppBar() {
    String? title;
    if (_selBottom == 1) {
      title = 'Cart';
    } else if (_selBottom == 2) {
      title = 'Profile';
    }

    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: _selBottom == 0
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Image.asset("assets/vuesax-linear-textalign-right@2x.png",height: 30,color: colors.primary,),
              )),
          Expanded(child: SizedBox()),
          Text('FakeStore',style: TextStyle(color: colors.primary,fontSize: 19,fontWeight: FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily)),
          Expanded(child: SizedBox())
        ],
      ) : Text(
        title!,
        style: TextStyle(
            color: colors.primary, fontWeight: FontWeight.normal,fontFamily: GoogleFonts.nunito().fontFamily),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(
              "assets/search.svg",
              height: 17,
              color: colors.primary,
            ),
            onPressed: () {

            }),

      ],
      backgroundColor: Colors.grey.shade100,
    );
  }

  Widget _getBottomBar() {
    return FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
              CurvedAnimation(
                  parent: navigationContainerAnimationController,
                  curve: Curves.easeInOut)),
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
                .animate(CurvedAnimation(
                parent: navigationContainerAnimationController,
                curve: Curves.easeInOut)),
            child: Container(
              height: kBottomNavigationBarHeight,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: BottomBar(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                selectedIndex: _selBottom,
                onTap: (int index) {
                  _pageController.jumpToPage(index);
                  setState(() => _selBottom = index);

                },
                items: <BottomBarItem>[
                  BottomBarItem(
                    icon: _selBottom == 0
                        ? SvgPicture.asset(
                      "assets/sel_home.svg",
                      color: colors.primary,
                    ) : SvgPicture.asset(
                      "assets/desel_home.svg",
                      color: colors.primary,
                    ),
                    title: Text('Home',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily),),
                    activeColor: colors.primary,
                  ),
                  BottomBarItem(
                    icon: _selBottom == 1
                        ? SvgPicture.asset(
                      "assets/cart01.svg",
                      color: colors.primary,
                    ) : SvgPicture.asset(
                      "assets/cart.svg",
                      color: colors.primary,
                    ),
                    title: Text('Cart',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily),),
                    activeColor: colors.primary,
                  ),
                  BottomBarItem(
                    icon: _selBottom == 2
                        ? SvgPicture.asset(
                      "assets/profile01.svg",
                      color: colors.primary,
                    ) : SvgPicture.asset(
                      "assets/profile.svg",
                      color: colors.primary,
                    ),
                    title: Text('Profile',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily),),
                    activeColor: colors.primary,
                  ),
                ],
              ),
            ),
          ));
  }
}

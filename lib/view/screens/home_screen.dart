import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/nav_bar/nav_bar_cubit.dart';
import 'package:aspen/controller/nav_bar/nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff186FF2).withOpacity(0.4),
                    blurRadius: 22,
                    offset: const Offset(5, 10),
                    spreadRadius: 0)
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32),),
              child: BottomNavigationBar(
                unselectedFontSize: 20,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: NavBarCubit.get(context).currentIndex,
                onTap: (index) =>
                    NavBarCubit.get(context).changeNavBarIndex(index),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.homeStroke),
                    activeIcon: SvgPicture.asset(AppImages.homeFill),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.ticketStroke),
                    activeIcon: SvgPicture.asset(AppImages.ticketFill),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.heartStroke),
                    activeIcon: SvgPicture.asset(AppImages.heartFill),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.profileStroke),
                    activeIcon: SvgPicture.asset(AppImages.profileFill),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return SafeArea(
            child: NavBarCubit.get(context)
                .screens[NavBarCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}

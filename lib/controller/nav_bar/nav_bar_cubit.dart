import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/screens/fav_screen.dart';
import '../../view/screens/home_screen_content.dart';
import 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit(): super(NavBarInitState());

  static NavBarCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreenContent(),
    Center(
      child: Text('Tickets'),
    ),
    FavScreen(),
    Center(
      child: Text('Profile'),
    )
  ];

  void changeNavBarIndex (int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

}
import 'package:get/state_manager.dart';

class MyRequestController extends GetxController {
  Rx<int> selectedTab = 0.obs;
  Rx<int> historySelectedTab = 0.obs;
  List<String> list = [
    'Nearest to Farthest',
    'Farthest to nearest',
    'Manual',
    'Automatic or both',
    'Home Service',
    'Shop Service',
    'Home and Shop service  both'
  ];
  RxList<bool> isCheckedFriends = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  List<String> isCheckedListOfFriendsID = [];
}

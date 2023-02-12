import '../../state/state_controller.dart';

class HomeController extends StateController {
  static HomeController? _instance;

  static HomeController get instance => _instance ?? (_instance = HomeController._());

  HomeController._();

  int _count = 0;

  int get count => _count;

  void increase() {
    _count++;
    refresh();
  }

  void reduce() {
    _count--;
    refresh();
  }
}

import 'package:mobx/mobx.dart';

//part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

class _$HomeController {
}

abstract class _HomeBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

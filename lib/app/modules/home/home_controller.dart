import 'package:mobx/mobx.dart';
import 'package:email_validator/email_validator.dart';
part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;



abstract class _HomeBase with Store {
  @observable
  bool login = false;

  @action
  void setLogin(value){
    login =  EmailValidator.validate(value);
  }
}

import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'messages_controller.g.dart';

class MessagesController = _MessagesBase with _$MessagesController;

abstract class _MessagesBase with Store {
  @observable
  List data;

  @action
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body);
    return "Success!";
  }
}

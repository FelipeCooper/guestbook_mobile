import 'package:guestbook_mobile/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:guestbook_mobile/app/app_widget.dart';
import 'package:guestbook_mobile/app/modules/home/home_module.dart';
import 'package:guestbook_mobile/app/modules/messages/messages_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/messages', module: MessagesModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

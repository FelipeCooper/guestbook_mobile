import 'package:guestbook_mobile/app/modules/messages/messages_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guestbook_mobile/app/modules/messages/messages_page.dart';

class MessagesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MessagesController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MessagesPage()),
      ];

  static Inject get to => Inject<MessagesModule>.of();
}

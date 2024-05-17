import 'package:flutter/material.dart';
import 'package:inharited/models/user_modal.dart';

class StateController extends StatefulWidget {
  final Widget child;
  final User user;

  const StateController({
    super.key,
    required this.child,
    required this.user,
  });

  static StateControllerState of(BuildContext context) {
    final inheritedContainer =
        context.dependOnInheritedWidgetOfExactType<InheritedContainer>();
    if (inheritedContainer == null) {
      throw FlutterError(
          'StateController.of() called with a context that does not contain an InheritedContainer.');
    }
    return inheritedContainer.data;
  }

  @override
  State<StateController> createState() => StateControllerState();
}

class StateControllerState extends State<StateController> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  void updateEventInfo({String? name, String? email, String? password}) {
    setState(() {
      user = User(
        name: name ?? user.name,
        email: email ?? user.email,
        password: password ?? user.password,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedContainer extends InheritedWidget {
  final StateControllerState data;

  const InheritedContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return true;
  }
}

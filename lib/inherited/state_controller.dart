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

  // the of method is used to access the StateControllerState class

  // here the context.dependOnInheritedWidgetOfExactType<InheritedContainer>() to find the nearest InheritedContainer in the widget tree and returns its data (which is the StateControllerState).

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

  //The initState method initializes the user with the value passed from the StateController widget.

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  // It uses the setState method to notify the framework that the state has changed, triggering a rebuild of the widget tree.

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

// This class is crucial for propagating changes in state down the widget tree, allowing descendant widgets to access and react to state changes.

class InheritedContainer extends InheritedWidget {
  final StateControllerState data;

  const InheritedContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override

  //This method determines whether the widgets that depend on this InheritedWidget should be rebuilt when the InheritedWidget changes.
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return true;
  }
}

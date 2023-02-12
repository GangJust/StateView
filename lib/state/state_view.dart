import 'package:flutter/material.dart';
import 'package:test_state_view/state/state_controller.dart';
import 'package:test_state_view/state/state_manager.dart';
import 'state_interfaces.dart';

typedef StateViewBuilder<C extends StateController> = Widget Function(BuildContext context, C controller);

class StateView<C extends StateController> extends StatefulWidget {
  const StateView({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  final C controller;
  final StateViewBuilder<C> builder;

  @override
  State<StateView> createState() => _StateViewState<C>();
}

class _StateViewState<C extends StateController> extends State<StateView<C>> implements IStateView {
  @override
  void initState() {
    super.initState();
    StateManager.putState(widget.controller, this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.controller,
    );
  }

  @override
  void dispose() {
    super.dispose();
    StateManager.removeState(widget.controller, this);
  }

  @override
  void refresh() => setState(() {});
}

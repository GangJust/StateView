import 'state_interfaces.dart';
import 'state_manager.dart';

abstract class StateController implements IStateController {
  @override
  void refresh() {
    if (StateManager.getStates(this).isEmpty) throw Exception("`$runtimeType`未被使用, 无法更新视图!");

    StateManager.getStates(this).forEach((state) {
      state.refresh();
    });
  }
}

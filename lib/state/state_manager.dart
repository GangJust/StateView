import 'state_interfaces.dart';

class StateManager {
  const StateManager._();

  static final Map<IStateController, List<IStateView>> _states = {};

  static void putState(IStateController controller, IStateView state) {
    //如果该Controller未被记录
    if (!_states.containsKey(controller)) {
      _states[controller] = [state];
      return;
    }

    //如果该State不存在
    if (!_states[controller]!.contains(state)) {
      _states[controller]!.add(state);
    }
  }

  static void removeState(IStateController controller, IStateView state) {
    //如果该Controller未被记录
    if (!_states.containsKey(controller)) return;

    //如果该State不存在
    if (_states[controller] == null || !_states[controller]!.contains(state)) return;

    _states[controller]!.remove(state);
  }

  static void releaseState(IStateController controller) {
    //如果该Controller未被记录
    if (!_states.containsKey(controller)) return;

    _states[controller]?.clear();
    _states.remove(controller);
  }

  static void clear() {
    _states.clear();
  }

  static List<IStateView> getStates(IStateController controller) {
    return _states[controller] ?? [];
  }
}

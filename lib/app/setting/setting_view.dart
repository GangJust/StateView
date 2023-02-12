import 'package:flutter/material.dart';

import '../../state/state_view.dart';
import '../home/home_controller.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Center(
        child: StateView(
          controller: HomeController.instance,
          builder: (context, controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "count ${controller.count} !",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                TextButton(
                  onPressed: () => HomeController.instance.increase(),
                  child: const Text("增加"),
                ),
                TextButton(
                  onPressed: () => HomeController.instance.reduce(),
                  child: const Text("减少"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

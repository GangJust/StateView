import 'package:flutter/material.dart';

import '../../state/state_view.dart';
import '../setting/setting_view.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingView())),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: StateView(
          controller: HomeController.instance,
          builder: (context, controller) {
            return Text(
              "count ${controller.count} !",
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => HomeController.instance.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

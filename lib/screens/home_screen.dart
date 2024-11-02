import 'package:dynamic_island_pet/services/device_info.dart';
import 'package:dynamic_island_pet/widgets/dynamic_island.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  bool _hasDynamicIsland = false;
  bool _isInForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkForDynamicIsland();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _isInForeground = state == AppLifecycleState.resumed;
    });
  }

  Future<void> _checkForDynamicIsland() async {
    final hasDynamicIsland = await DeviceInfo.hasDynamicIsland();
    setState(() {
      _hasDynamicIsland = hasDynamicIsland;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (_hasDynamicIsland && _isInForeground)
            DynamicIsland(
              animationDuration: const Duration(milliseconds: 2000),
              startOffset: -1.0,
              endOffset: 1.0,
              reverse: false,
              child: Image.asset(
                'assets/dash.png',
                height: 15,
                width: 15,
              ),
            ),
        ],
      ),
    );
  }
}

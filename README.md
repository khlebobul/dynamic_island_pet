# Dynamic Island Pet Flutter app

<div align="center">

  [![Codacy Badge](https://app.codacy.com/project/badge/Grade/0084a6637dab4330be86c666f10c2606)](https://app.codacy.com/gh/khlebobul/dynamic_island_pet/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

  <p>Example of interaction with Dynamic Island in a Flutter application</p>

</div>

https://github.com/user-attachments/assets/0fb54a02-eb9d-4d79-ae22-0b6495d8e6df

I really like it when developers and designers add little details to an app. It shows that they really care about their user. In this article, I will discuss how to make your app a little cuter for the user with Dynamic Island and a little pet.

> It has long been an axiom of mine that the little things are infinitely the most important.  
> — *Sir Arthur Conan Doyle, The Memoirs of Sherlock Holmes*

About this project: [How to work with Dynamic Island in the Flutter application](https://medium.com/@khlebobul/how-to-work-with-dynamic-island-in-the-flutter-application-89851b0d9887)

## To see the work in action, download Knight's Graph ♞: 
- [App Store](https://apps.apple.com/us/app/knights-graph/id6737812039)
- [Google Play](https://play.google.com/store/apps/details?id=com.khlebobul.knights_graph)
- [Website](https://knightsgraph.vercel.app)

## Usage

```dart
Scaffold(
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
```

### Define the model
```dart
final dynamicIslandModels = [
          'iPhone15,2', // iPhone 14 Pro
          'iPhone15,3', // iPhone 14 Pro Max
          'iPhone15,4', // iPhone 15
          'iPhone15,5', // iPhone 15 Plus
          'iPhone16,1', // iPhone 15 Pro
          'iPhone16,2', // iPhone 15 Pro Max
          'iPhone17,1', // iPhone 16 Pro
          'iPhone17,2', // iPhone 16 Pro Max
          'iPhone17,3', // iPhone 16
          'iPhone17,4', // iPhone 16 Plus
        ];
```

### It is better to use a separate padding for each model
```dart
final deviceModel = await DeviceInfo.getDeviceModel();
    return switch (deviceModel) {
      // iPhone 14 ❌
      // iPhone 14 Plus ❌
      'iPhone15,2' => 13.0, // iPhone 14 Pro ✅
      'iPhone15,3' => 13.0, // iPhone 14 Pro Max ✅
      'iPhone15,4' => 13.0, // iPhone 15 ✅
      'iPhone15,5' => 13.0, // iPhone 15 Plus ✅
      'iPhone16,1' => 13.0, // iPhone 15 Pro ✅
      'iPhone16,2' => 13.0, // iPhone 15 Pro Max ✅
      'iPhone17,1' => 16.5, // iPhone 16 Pro ✅
      'iPhone17,2' => 16.0, // iPhone 16 Pro Max ✅
      'iPhone17,3' => 13.0, // iPhone 16 ✅
      'iPhone17,4' => 13.0, // iPhone 16 Plus ✅
      _ => 13.0,
    };
```
### Display conditions
```dart
bool _hasDynamicIsland = false; // check if the device has a dynamic island
bool _isInForeground = true; // check if the app is in the foreground

void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // add the observer
    _checkForDynamicIsland(); // check if the device has a dynamic island
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // remove the observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
        // check if the app is in the foreground
      _isInForeground = state == AppLifecycleState.resumed;
    });
  }

  Future<void> _checkForDynamicIsland() async {
    final hasDynamicIsland = await DeviceInfo.hasDynamicIsland();
    setState(() {
      _hasDynamicIsland = hasDynamicIsland;
    });
  }
```

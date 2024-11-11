# Dynamic Island Pet Flutter app

<div align="center">

  [![Codacy Badge](https://app.codacy.com/project/badge/Grade/0084a6637dab4330be86c666f10c2606)](https://app.codacy.com/gh/khlebobul/dynamic_island_pet/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

  <p>Example of interaction with Dynamic Island in a Flutter application</p>

</div>


https://github.com/user-attachments/assets/3dde0b57-929b-419a-8848-4dc35f92d73d

I really like it when developers and designers add little details to an app. It shows that they really care about their user. In this article, I will discuss how to make your app a little cuter for the user with Dynamic Island and a little pet.

> It has long been an axiom of mine that the little things are infinitely the most important.  
> — *Sir Arthur Conan Doyle, The Memoirs of Sherlock Holmes*

About this project: [How to work with Dynamic Island in the Flutter application](https://medium.com/@khlebobul/how-to-work-with-dynamic-island-in-the-flutter-application-89851b0d9887)

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

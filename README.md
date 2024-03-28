# flutter_show_when_locked

A Flutter plugin that allows your flutter apps to appear over the lock screen, even with a keyguard. Useful for alarm or call apps. Only works on Android.

## Contents

- [Platform Support](#platform-support)
- [Installation](#installation)
- [Usage](#usage)

## Platform Support

| Platform | Supported |
| -------- | --------- |
| Android  | ✔️ Yes    |
| iOS      | ❌ No     |
| Web      | ❌ No     |
| Windows  | ❌ No     |
| Linux    | ❌ No     |
| MacOS    | ❌ No     |

## Installation

`flutter pub add flutter_boot_receiver`

## Usage

```dart
import 'package:flutter_show_when_locked/flutter_show_when_locked.dart';

await FlutterShowWhenLocked().show();
// Here your app will be appear over lock screen. You can show full screen notifications for alarms and clocks here.
await FlutterShowWhenLocked().hide();

```


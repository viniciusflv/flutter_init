# Setup

## First of all
* ### [Download JAVA 8](https://www.oracle.com/Java/technologies/Javase-jre8-downloads.html )
* ### [Download Android SDK CLI](https://developer.android.com/studio#command-tools)

## Create an App folder to move and extract them
```
mkdir ~/app
```

## Add to `.bashsrc` or `.zshrc`.
```sh
export APP=~/app
export JAVA_HOME=$APP/java/jdk-8u191-linux-x64/jdk1.8.0_191
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=$APP/android/sdk-tools-linux-4333796
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## Bootstrap Android
```sh
$ANDROID_HOME/cmdline-tools/tools/bin/sdkmanager "platform-tools" "platforms;android-28" "build-tools;28.0.3" "system-images;android-23;google_apis;x86" "system-images;android-27;google_apis_playstore;x86"
```

## Create an Emulator
```sh
$ANDROID_HOME/cmdline-tools/tools/bin/avdmanager create avd --force --name Nexus6P --abi google_apis/x86 --package 'system-images;android-23;google_apis;x86' --device "Nexus 6P"
```

## Install Flutter
```sh
sudo snap install flutter --classic
```

## Run Flutter Doctor
```sh
flutter doctor
```

## Visual Studio Code (`extensions`)
```sh
dart-code.dart-code
dart-code.flutter
```

# Flutter

## [Widgets](https://flutter.dev/docs/development/ui/widgets-intro)

* ### [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
  * A widget that does not require mutable state.

* ### [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
  * A widget that has mutable state.

## [Providers](https://pub.dev/packages/flutter_bloc)

* ### BlocObserver
  * onEvent
  * onChange
  * onTransition
  * onError

* ### MultiBlocProvider
* ### Cubit Provider / Bloc Provider

## Dependencies to handle android stuff
  * ### [flutter_launcher_name](https://pub.dev/packages/flutter_launcher_name)
  * ### [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
  * ### [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
# clean_architecture

## use flutter version: 3.22.2

## run and generate file (*.g.dart):
- flutter clean
- flutter pub get
- flutter pub run build_runner build --delete-conflicting-outputs

## for ios:
- remove file Podfile.lock in /ios directory
- cd ios && pod install
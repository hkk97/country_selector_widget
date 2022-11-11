# Country Selector Widget

Country Selector Widget written by Dart and Fluter supports three locales with the country's name, achieved lazy loading, and animation FadeIn. This package provides CountrySelectorWidget and showCountrySelectorBottomSheet to fulfill the needed usage.

<p align="center">
     <a href="https://github.com/flutter/flutter/tree/3.3.8" alt="Flutter">
        <img src="https://img.shields.io/badge/Flutter-v3.3.8 (stable)-4BC51D.svg?style=flat" /></a>
     <a alt="Dart">
        <img src="https://img.shields.io/badge/Dart-v2.18.4 (stable)-4BC51D.svg?style=flat" /></a>
     <a alt="DevTools">
        <img src="https://img.shields.io/badge/DevTools-v2.15.0 (stable)-4BC51D.svg?style=flat" /></a>
     <a alt="VS Code">
        <img src="https://img.shields.io/badge/VS Code-v1.68.1-4BC51D.svg?style=flat" /></a>
</p>

|             | Android | iOS  | Linux | macOS  | Web | Windows     |
|-------------|---------|------|-------|--------|-----|-------------|
| **Support** | Any | Any | Any   | Any | Any | Any         |

To see examples of the following animations on a device or simulator:

```bash
cd example/
flutter run
```

## Usage

To use this plugin, add `country_selector_widget` as a [dependency in your pubspec.yaml file].

### Examples

Here are the examples that show you how to use the CountrySelectorWidget and showCountrySelectorBottomSheet.

#### Usage of CountrySelectorWidget

- the default locale is SelectedLocale.en, you would change to SelectedLocale.zhCH or SelectedLocale.zhHK
- once the country is selected and clicked the continue btn it will trigger the valueChangedCallback called onSelectedCountry and return the Country

```dart
CountrySelectorWidget(
    onSelectedCountry: (Country country) async {
        // selected country callback 
    },
)
```

#### Usage of showCountrySelectorBottomSheet

- the different between CountrySelectorWidget and showCountrySelectorBottomSheet are showCountrySelectorBottomSheet is wrap with the showModalBottomSheet
- showCountrySelectorBottomSheet will also do the Navigator.pop(context) for you once the continue button are clicked

```dart
showCountrySelectorBottomSheet(
    context: context,
    onSelectedCountry: (Country country) async {
        // selected country callback 
    };
```

## Parameters

| Parameter | Description |
|---|---|
| `customAppBar` | Sets the Custom AppBar instead of using provided default AppBar  |
| `bottomAppBarHeight` | Sets the height for the bottom `Continue Section` widget |
| `continueBtnPadding` | The Padding between the bottom `Continue Section` and `Continue Button` widget |
| `selectedLocale` | Uses to determine the default label with locale, there are three `SelectedLocale`. They are `SelectedLocale.en`, `SelectedLocale.zhCH` and `SelectedLocale.zhHK` |
| `showSelectedWidget` | Uses to determine wether show the `CountryCardWidget` or not when the country is selected in the ListView |
| `aniDuration` | Duration of the FadeIn Animation of `CountryCardWidget` |
| `onSelectedCountry` | Callback of onSelectedCountry when the country is selected from ListView and ContinueButton is Clicked |
| `appBarText` | Uses to replace the default text of the AppBar |
| `searchText` | Uses to replace the hintText of `TextField` |
| `selectedCountryText` | Uses to replcae the title of the `SelectedCountryCardWidget` |
| `withoutMatchText` |  Uses to replace the hintText when there are does not country match with the search pattern |
| `continueBtnText` | Uses to replace the text of the `Continue Button` |
| `textFieldTextStyle` | Uses to determine the textStyle of the `TextField` |
| `appBarTextStyle` | Uses to determine the textStyle of the `AppBar` |
| `searchTextStyle` | Uses to determine the textStyle of the SearchText |
| `selectedCountryTextStyle` | Uses to determine the textStyle of the selectedCountry |
| `withoutMatchTextStyle` | Uses to determine the textStyle of the WitoutMatchText when there does not the match match with serach pattern |
| `continueBtnTextStyle` | Uses to determine the textStyle of Continue Button |
| `focusedBorderColor` | Uses to determine the borderColor of `TextField` when it is selected |
| `selectedCardColor` | Uses to determine the color of Card when the `CountryCardWidget` is selected |
| `continueBtnBgColor` | Uses to determine the background color of Contuinue Button |
| `continueBtnOverlayColor` | Uses to determine overlay color of Contuinue Button |
| `textFieldborderRadius` | Uses to determine borderRadius of `TextField` |
| `continueBtnRadius` | Uses to determine borderRadius of Continue Button |

## Dmonstraction of CountrySelectorWidget - Flutter Web

!["CountrySelectorWidget - SelectedLocale.zhCH"](https://github.com/hkk97/country_selector_widget/blob/master/example/demo_gifs/countrySelectorWidget_demo.gif?raw=true)

## Dmonstraction of showCountrySelectorBottomSheet - Flutter Web

!["showCountrySelectorBottomSheet - SelectedLocale.en"](https://github.com/hkk97/country_selector_widget/blob/master/example/demo_gifs/showCountrySelectorBottomSheet.gif?raw=true)

## Dmonstraction of CountrySelectorWidget - Android

!["Dmonstraction of showCountrySelectorBottomSheet - Android"](https://github.com/hkk97/country_selector_widget/blob/master/example/demo_gifs/android_demo.gif?raw=true)

## Dmonstraction of CountrySelectorWidget - IOS

!["Dmonstraction of showCountrySelectorBottomSheet - IOS"](https://github.com/hkk97/country_selector_widget/blob/master/example/demo_gifs/ios_demo.gif?raw=true)

## Dmonstraction of showCountrySelectorBottomSheet - MacOS

!["Dmonstraction of showCountrySelectorBottomSheet - MacOS"](https://github.com/hkk97/country_selector_widget/blob/master/example/demo_gifs/mac_os_demo.gif?raw=true)

## MIT License

```
Copyright (c) 2022 hkk97

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

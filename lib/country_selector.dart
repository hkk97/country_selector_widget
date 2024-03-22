library country_selector_widget;

// const
export 'const/enum.dart';
export 'const/country.dart';

import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:country_selector_widget/country_selector.dart';
import 'package:country_selector_widget/data/coutnry_list.dart';
import 'package:country_selector_widget/util/text_util.dart';

// func to show countryselectorbottom sheet
Future<void> showCountrySelectorBottomSheet({
  required BuildContext context,
  required Function onBuilded,
  required Function onClosed,
  // Used to determine whether show the dialCode of country or not
  bool withDialCode = false,
  // The refCountryCode used to indicate the default selected country
  String? refCountryCode,
  // the height of the bottomsheet
  double? bottomSheetHeight,
  // the radius of the top left and top right corner
  Radius topCornerRadius = const Radius.circular(15.0),
  // Sets the Custom AppBar instead of using provided default AppBar
  PreferredSizeWidget? customAppBar,
  // Sets the height for the bottom `Continue Section` widget
  double bottomAppBarHeight = 75,
  // The Padding between the bottom `Continue Section` and `Continue Button` widget
  EdgeInsetsGeometry continueBtnPadding =
      const EdgeInsets.symmetric(vertical: 13.5),
  // Uses to determine the default label with locale, there are three `SelectedLocale`. They are `SelectedLocale.en`, `SelectedLocale.zhCH` and `SelectedLocale.zhHK`
  SelectedLocale selectedLocale = SelectedLocale.en,
  // Uses to determine wether show the `CountryCardWidget` or not when the country is selected in the ListView
  bool showSelectedWidget = true,
  // Duration of the FadeIn Animation of `CountryCardWidget`
  Duration aniDuration = const Duration(seconds: 1),
  // Callback of onSelectedCountry when the country is selected from ListView and ContinueButton is Clicked
  required ValueChanged<Country> onSelectedCountry,
  // Uses to replace the default text of the AppBar
  String? appBarText,
  // Uses to replace the hintText of `TextField`
  String? searchText,
  // Uses to replcae the title of the `SelectedCountryCardWidget`
  String? selectedCountryText,
  // Uses to replace the hintText when there are does not country match with the search pattern
  String? withoutMatchText,
  // Uses to replace the text of the `Continue Button`
  String? continueBtnText,
  // Uses to determine the textStyle of the `TextField`
  TextStyle textFieldTextStyle = const TextStyle(color: Colors.black87),
  // Uses to determine the textStyle of the `AppBar`
  TextStyle? appBarTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  // Uses to determine the textStyle of the SearchText
  TextStyle? searchTextStyle,
  // Uses to determine the textStyle of the selectedCountry
  TextStyle? selectedCountryTextStyle =
      const TextStyle(fontWeight: FontWeight.bold),
  // Uses to determine the textStyle of the WitoutMatchText when there does not the match match with serach pattern
  TextStyle? withoutMatchTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  // Uses to determine the textStyle of Continue Button
  TextStyle? continueBtnTextStyle = const TextStyle(
    color: Colors.black,
    letterSpacing: 1.185,
  ),
  // Uses to determine the borderColor of `TextField` when it is selected
  Color focusedBorderColor = Colors.black12,
  // Uses to determine the color of Card when the `CountryCardWidget` is selected
  Color selectedCardColor = Colors.amber,
  // Uses to determine the background color of Contuinue Button
  Color continueBtnBgColor = Colors.amber,
  // Uses to determine overlay color of Contuinue Button
  Color continueBtnOverlayColor = Colors.white,
  // Uses to determine borderRadius of `TextField`
  BorderRadius textFieldborderRadius =
      const BorderRadius.all(Radius.circular(18.5)),
  // Uses to determine borderRadius of Continue Button
  BorderRadius continueBtnRadius = const BorderRadius.all(
    Radius.circular(
      22.5,
    ),
  ),
}) async {
  // #
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: topCornerRadius,
        topRight: topCornerRadius,
      ),
      child: SizedBox(
        height: bottomSheetHeight ?? MediaQuery.of(context).size.height * 0.8,
        child: CountrySelectorWidget(
          onBuilded: onBuilded,
          customAppBar: customAppBar,
          withDialCode: withDialCode,
          refCountryCode: refCountryCode,
          bottomAppBarHeight: bottomAppBarHeight,
          continueBtnPadding: continueBtnPadding,
          selectedLocale: selectedLocale,
          showSelectedWidget: showSelectedWidget,
          aniDuration: aniDuration,
          onSelectedCountry: (country) {
            Navigator.pop(context);
            onSelectedCountry(country);
            onClosed();
          },
          appBarText: appBarText,
          searchText: searchText,
          selectedCountryText: selectedCountryText,
          withoutMatchText: withoutMatchText,
          continueBtnText: continueBtnText,
          textFieldTextStyle: textFieldTextStyle,
          appBarTextStyle: appBarTextStyle,
          searchTextStyle: searchTextStyle,
          selectedCountryTextStyle: selectedCountryTextStyle,
          withoutMatchTextStyle: withoutMatchTextStyle,
          continueBtnTextStyle: continueBtnTextStyle,
          focusedBorderColor: focusedBorderColor,
          selectedCardColor: selectedCardColor,
          continueBtnBgColor: continueBtnBgColor,
          continueBtnOverlayColor: continueBtnOverlayColor,
          textFieldborderRadius: textFieldborderRadius,
          continueBtnRadius: continueBtnRadius,
        ),
      ),
    ),
  );
}

class CountrySelectorWidget extends StatefulWidget {
  final Function onBuilded;

  // Used to determine whether show the dialCode of country or not
  final bool withDialCode;
  // The refCountryCode used to indicate the default selected country
  final String? refCountryCode;
// Sets the Custom AppBar instead of using provided default AppBar
  final PreferredSizeWidget? customAppBar;
  // Sets the height for the bottom `Continue Section` widget
  final double bottomAppBarHeight;
  // The Padding between the bottom `Continue Section` and `Continue Button` widget
  final EdgeInsetsGeometry continueBtnPadding;

  // Uses to determine the default label with locale, there are three `SelectedLocale`. They are `SelectedLocale.en`, `SelectedLocale.zhCH` and `SelectedLocale.zhHK`
  final SelectedLocale selectedLocale;
  // Uses to determine wether show the `CountryCardWidget` or not when the country is selected in the ListView
  final bool showSelectedWidget;
  // Duration of the FadeIn Animation of `CountryCardWidget`
  final Duration aniDuration;
  // Callback of onSelectedCountry when the country is selected from ListView and ContinueButton is Clicked
  final ValueChanged<Country> onSelectedCountry;

  // Uses to replace the default text of the AppBar
  final String? appBarText;
  // Uses to replace the hintText of `TextField`
  final String? searchText;
  // Uses to replcae the title of the `SelectedCountryCardWidget`
  final String? selectedCountryText;
  // Uses to replace the hintText when there are does not country match with the search pattern
  final String? withoutMatchText;
  // Uses to replace the text of the `Continue Button`
  final String? continueBtnText;

  // Uses to determine the textStyle of the `TextField`
  final TextStyle textFieldTextStyle;
  // Uses to determine the textStyle of the `AppBar`
  final TextStyle? appBarTextStyle;
  // Uses to determine the textStyle of the SearchText
  final TextStyle? searchTextStyle;
  // Uses to determine the textStyle of the selectedCountry
  final TextStyle? selectedCountryTextStyle;
  // Uses to determine the textStyle of the WitoutMatchText when there does not the match match with serach pattern
  final TextStyle? withoutMatchTextStyle;
  // Uses to determine the textStyle of Continue Button
  final TextStyle? continueBtnTextStyle;

  // Uses to determine the borderColor of `TextField` when it is selected
  final Color focusedBorderColor;
  // Uses to determine the color of Card when the `CountryCardWidget` is selected
  final Color selectedCardColor;
  // Uses to determine the background color of Contuinue Button
  final Color continueBtnBgColor;
  // Uses to determine overlay color of Contuinue Button
  final Color continueBtnOverlayColor;

  // Uses to determine borderRadius of `TextField`
  final BorderRadius textFieldborderRadius;
  // Uses to determine borderRadius of Continue Button
  final BorderRadius continueBtnRadius;

  const CountrySelectorWidget({
    super.key,
    required this.onBuilded,
    this.withDialCode = false,
    this.refCountryCode,
    this.customAppBar,
    this.bottomAppBarHeight = 75,
    this.continueBtnPadding = const EdgeInsets.symmetric(vertical: 13.5),
    this.selectedLocale = SelectedLocale.en,
    this.showSelectedWidget = true,
    this.aniDuration = const Duration(seconds: 1),
    required this.onSelectedCountry,
    this.appBarText,
    this.searchText,
    this.selectedCountryText,
    this.withoutMatchText,
    this.continueBtnText,
    this.textFieldTextStyle = const TextStyle(color: Colors.black87),
    this.appBarTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.searchTextStyle,
    this.selectedCountryTextStyle =
        const TextStyle(fontWeight: FontWeight.bold),
    this.withoutMatchTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    this.continueBtnTextStyle = const TextStyle(
      color: Colors.black,
      letterSpacing: 1.185,
    ),
    this.focusedBorderColor = Colors.black12,
    this.selectedCardColor = Colors.amber,
    this.continueBtnBgColor = Colors.amber,
    this.continueBtnOverlayColor = Colors.white,
    this.textFieldborderRadius = const BorderRadius.all(Radius.circular(18.5)),
    this.continueBtnRadius = const BorderRadius.all(
      Radius.circular(
        22.5,
      ),
    ),
  });

  @override
  CountrySelectorWidgetState createState() => CountrySelectorWidgetState();
}

class CountrySelectorWidgetState extends State<CountrySelectorWidget>
    with AfterLayoutMixin {
  late ScrollController _scrollController;
  late List<Country> _countries;
  late ValueNotifier<List<Country>?> _countriesNotifi;
  late ValueNotifier<Country?> _selectedCountryNotifi;
  late TextUtil _textUtil;
  late FocusNode _focusNode;
  late ValueNotifier<bool> _focusNotifi;

  @override
  void initState() {
    super.initState();
    _textUtil = TextUtil(selectedLocale: widget.selectedLocale);
    _scrollController = ScrollController();
    _selectedCountryNotifi = ValueNotifier(null);
    _countries = [];
    _countriesNotifi = ValueNotifier(null);
    for (int i = 0; i < countriesMap.length; i++) {
      final country = Country.fromJson(countriesMap[i]);
      _countries.add(country);
    }
    if (widget.refCountryCode != null) {
      List<Country> refCountry = _countries
          .where(
              (country) => country.code == widget.refCountryCode!.toUpperCase())
          .toList();
      if (refCountry.length == 1) {
        _selectedCountryNotifi.value = refCountry.first;
      } else {
        throw ("refCountry does not valid in CountryCode");
      }
    }
    _countriesNotifi.value = _countries;
    _focusNode = FocusNode();
    _focusNotifi = ValueNotifier(false);
    _focusNode.addListener(() {
      _focusNotifi.value = _focusNode.hasFocus;
    });
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_selectedCountryNotifi.value != null) {
          final index = _countries.indexOf(_selectedCountryNotifi.value!);
          _scrollController.jumpTo(64.5 * index);
        }
      },
    );
  }

  @override
  void dispose() {
    _selectedCountryNotifi.dispose();
    _countriesNotifi.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _focusNotifi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _focusNode.unfocus(),
        child: Scaffold(
          appBar: widget.customAppBar ??
              AppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  widget.appBarText ?? _textUtil.titleStr() ?? '',
                  style: widget.appBarTextStyle,
                ),
              ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 12.5,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      focusNode: _focusNode,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      style: widget.textFieldTextStyle,
                      cursorRadius: const Radius.circular(3.5),
                      maxLines: 1,
                      onChanged: (value) async {
                        if (value.isNotEmpty) {
                          final validCountries = _countries
                              .where((country) =>
                                  country.isContains(value.toUpperCase()))
                              .toList();
                          _countriesNotifi.value =
                              validCountries.isEmpty ? null : validCountries;
                        } else {
                          _countriesNotifi.value = _countries;
                        }
                      },
                      decoration: InputDecoration(
                        isDense: false,
                        filled: true,
                        hintText:
                            widget.searchText ?? _textUtil.searchStr() ?? "",
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintStyle: widget.searchTextStyle ??
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.85),
                            ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: widget.textFieldborderRadius,
                          borderSide: BorderSide(
                            color: widget.focusedBorderColor,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.5)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding: const EdgeInsets.only(top: 13.5),
                      ),
                    ),
                  ),
                ),
                widget.showSelectedWidget
                    ? ValueListenableBuilder(
                        valueListenable: _selectedCountryNotifi,
                        builder: (context, country, child) {
                          return country == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 25.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: Text(
                                          widget.selectedCountryText ??
                                              _textUtil.selectedCountryStr() ??
                                              "",
                                          style:
                                              widget.selectedCountryTextStyle,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: Container(
                                          height: 1.30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      CountryCardWidget(
                                        withDialCode: widget.withDialCode,
                                        aniDuration: widget.aniDuration,
                                        selectedColor: widget.selectedCardColor,
                                        selectedLocale: widget.selectedLocale,
                                        country: country,
                                        isSelected: true,
                                        onClickSelected: () {
                                          _focusNode.unfocus();
                                          _selectedCountryNotifi.value = null;
                                        },
                                      ),
                                    ],
                                  ),
                                );
                        },
                      )
                    : const SizedBox(),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _countriesNotifi,
                    builder: (context, countries, child) {
                      if (countries == null) {
                        return Center(
                          child: SizedBox(
                            child: Text(
                              widget.withoutMatchText ??
                                  _textUtil.withoutMatchStr() ??
                                  '',
                              style: widget.withoutMatchTextStyle,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Scrollbar(
                            thumbVisibility: true,
                            controller: _scrollController,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: ValueListenableBuilder<Country?>(
                                  valueListenable: _selectedCountryNotifi,
                                  builder: (
                                    context,
                                    country,
                                    child,
                                  ) {
                                    return ListView.custom(
                                      shrinkWrap: true,
                                      controller: _scrollController,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(
                                        parent: BouncingScrollPhysics(),
                                      ),
                                      cacheExtent: 15.0,
                                      childrenDelegate:
                                          SliverChildBuilderDelegate(
                                        (context, index) {
                                          return CountryCardWidget(
                                            aniDuration: widget.aniDuration,
                                            selectedColor:
                                                widget.selectedCardColor,
                                            selectedLocale:
                                                widget.selectedLocale,
                                            country: countries[index],
                                            isSelected: country == null
                                                ? false
                                                : country.code ==
                                                    countries[index].code,
                                            onClickSelected: () {
                                              _focusNode.unfocus();
                                              if (_selectedCountryNotifi
                                                      .value ==
                                                  countries[index]) {
                                                _selectedCountryNotifi.value =
                                                    null;
                                              } else {
                                                _selectedCountryNotifi.value =
                                                    countries[index];
                                              }
                                            },
                                            withDialCode: widget.withDialCode,
                                          );
                                        },
                                        childCount: countries.length,
                                        findChildIndexCallback: (key) {
                                          final valueKey =
                                              key as ValueKey<String>;
                                          final val = countries.indexWhere(
                                              (element) =>
                                                  element.code ==
                                                  valueKey.value);
                                          return countries.length - 1 - val;
                                        },
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: widget.bottomAppBarHeight,
                  child: Padding(
                    padding: widget.continueBtnPadding,
                    child: ValueListenableBuilder<Country?>(
                      valueListenable: _selectedCountryNotifi,
                      builder: (context, isSelected, child) {
                        return Opacity(
                          opacity: isSelected != null ? 1.0 : 0.65,
                          child: IgnorePointer(
                            ignoring: isSelected != null ? false : true,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                  widget.continueBtnOverlayColor,
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  widget.continueBtnBgColor,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: widget.continueBtnRadius,
                                  ),
                                ),
                              ),
                              onPressed: () => widget.onSelectedCountry(
                                _selectedCountryNotifi.value!,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: isSelected != null ? 13.5 : 10.0,
                                  horizontal: isSelected != null ? 30 : 20.0,
                                ),
                                child: Text(
                                  widget.continueBtnText ??
                                      _textUtil.continueStr() ??
                                      '',
                                  style: widget.continueBtnTextStyle,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    widget.onBuilded();
  }
}

// the widget used to visualize the country object
class CountryCardWidget extends StatefulWidget {
  final bool withDialCode;
  final bool isSelected; // determine whether this widget is selected or not
  final Country country; // country info
  final Color selectedColor; // hightlighted color when widget is selected
  final Duration aniDuration; // animation duration
  final Function onClickSelected; // onClickSelect callback
  final SelectedLocale
      selectedLocale; // reference locale to determine show the name of country in zhCH, zhHK, or en

  const CountryCardWidget({
    super.key,
    this.isSelected = false,
    required this.withDialCode,
    required this.country,
    required this.selectedColor,
    required this.aniDuration,
    required this.onClickSelected,
    required this.selectedLocale,
  });
  @override
  CountryCardWidgetState createState() => CountryCardWidgetState();
}

class CountryCardWidgetState extends State<CountryCardWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: widget.aniDuration, vsync: this);
    _animation = Tween<double>(begin: 0.1, end: 1.0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getCountryName() {
    switch (widget.selectedLocale) {
      case SelectedLocale.zhCH:
        return widget.country.zhCH;
      case SelectedLocale.zhHK:
        return widget.country.zhHK;
      case SelectedLocale.en:
      default:
        return widget.country.en;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value >= 0.85 ? 1 : 1 * _animation.value,
          child: child!,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.25),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => widget.onClickSelected(),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8.5,
                ),
              ),
              side: BorderSide(
                color: widget.isSelected
                    ? widget.selectedColor
                    : const Color.fromARGB(255, 247, 244, 244),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 15.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset(
                                "${widget.country.flagUri}",
                                package: "country_selector_widget",
                                fit: BoxFit.fill,
                              ).image,
                            ),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        Text(
                          widget.country.code,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.15,
                          ),
                        ),
                        Text(
                          getCountryName(),
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: widget.withDialCode ? null : 22.5,
                    height: widget.withDialCode ? null : 22.5,
                    decoration: widget.withDialCode
                        ? null
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: widget.isSelected
                                  ? widget.selectedColor
                                  : Colors.grey.shade300,
                              width: widget.isSelected ? 2 : 1.5,
                            ),
                          ),
                    child: widget.withDialCode
                        ? Text(
                            widget.country.dialCode,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.15,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

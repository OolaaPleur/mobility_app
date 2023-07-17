import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Messages, used to control flow of the app.
enum InfoMessage {
  /// Default message, used as initial value in MapState, and used as
  /// fallback value to reset MapState variable.
  defaultMessage,

  /// No need to download GTFS file.
  noNeedToDownload,

  /// Need to download GTFS file.
  needToDownload,

  /// File was successfully downloaded and processed.
  fileDownloadedAndProcessed,
  /// Geolocation permission denied by user.
  geolocationPermissionDenied,
  // Settings
  /// User data downloaded successfully.
  userDataDownloadedSuccessfully,
  /// User data uploaded successfully.
  userDataUploadedSuccessfully
}

/// Tuul areas, used in constructing requests to Tuul API.
final cityTuulAreas = {
  City.tallinn.name: 'wZKbxSa2rnHxavZ4h3oe',
  City.parnu.name: 'Oz8rab1clYlwcFl3KjgY',
  // City.riga.name: 'zB9WT5UNei7zGK03FbCg',
};

/// City coordinates, used in constructing requests.
final cityCoordinates = {
  City.tallinn.name: (latitude: 59.434360, longitude: 24.747061),
  City.tartu.name: (latitude: 58.37801, longitude: 26.72901),
  City.haapsalu.name: (latitude: 58.94306, longitude: 23.54139),
  City.johvi.name: (latitude: 59.35917, longitude: 27.42111),
  City.kohtlaJarve.name: (latitude: 59.39861, longitude: 27.27306),
  City.kuressaare.name: (latitude: 58.25222, longitude: 22.48694),
  City.narva.name: (latitude: 59.37722, longitude: 28.19028),
  City.rakvere.name: (latitude: 59.34667, longitude: 26.35583),
  City.viljandi.name: (latitude: 58.36389, longitude: 25.59333),
  City.voru.name: (latitude: 57.84083, longitude: 27.03028),
  City.parnu.name: (latitude: 58.38588, longitude: 24.496577),
};

/// Describes city, for which info (like Bolt scooters) will be fetched.
enum City {
  /// Tallinn, changes in settings.
  tallinn,

  /// Tartu, changes in settings.
  tartu,

  /// Haapsalu, changes in settings.
  haapsalu,

  /// Jõhvi, changes in settings.
  johvi,

  /// Kohtla-Järve, changes in settings.
  kohtlaJarve,

  /// Kuressaare, changes in settings.
  kuressaare,

  /// Narva, changes in settings.
  narva,

  /// Rakvere, changes in settings.
  rakvere,

  /// Viljandi, changes in settings.
  viljandi,

  /// Võru, changes in settings.
  voru,

  /// Pärnu, changes in settings.
  parnu,
}
/// Map, contains cities as keys and localized names as values.
final Map<City, String Function(AppLocalizations)> cityToLocalKey = {
  City.tallinn: (localizations) => localizations.tallinn,
  City.tartu: (localizations) => localizations.tartu,
  City.haapsalu: (localizations) => localizations.haapsalu,
  City.johvi: (localizations) => localizations.johvi,
  City.kohtlaJarve: (localizations) => localizations.kohtlaJarve,
  City.kuressaare: (localizations) => localizations.kuressaare,
  City.narva: (localizations) => localizations.narva,
  City.rakvere: (localizations) => localizations.rakvere,
  City.viljandi: (localizations) => localizations.viljandi,
  City.voru: (localizations) => localizations.voru,
  City.parnu: (localizations) => localizations.parnu,
};

/// Class, contains function which generate localized dropdowns for intro screen.
class RecordTypeGenerator {
  /// Function, generates localized dropdowns.
  List<LocalizedCityName> generate(BuildContext context) {
    final result = <LocalizedCityName>[];

    cityToLocalKey.forEach((city, localKey) {
      result.add(
        LocalizedCityName(
          key: city.name,
          value: localKey(AppLocalizations.of(context)!),
        ),
      );
    });

    return result;
  }
}

/// Object for localized city, key is City enum String, value is localized
/// city name String.
class LocalizedCityName extends Equatable {

  /// Constructor for [LocalizedCityName].
  const LocalizedCityName({required this.key, required this.value});
  /// Key is City enum String.
  final String key;
  /// Value is localized city name String.
  final String value;

  @override
  List<Object> get props => [key, value];
}

/// Class, stores sizes for widgets.
class AppStyleConstants {
  /// Modal bottom sheet height for rental scooters.
  static double microMobilityModalBottomSheetHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.16;
  }
  /// Modal bottom sheet height for rental bikes.
  static double bikeModalBottomSheetHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.12;
  }

  /// Color for scaffold across different screens.
  static const Color scaffoldColor = Color(0xFFD8F3E3);

  /// Color for app bar across different screens.
  static const Color appBarColor = Color(0xFFeffaf3);
}
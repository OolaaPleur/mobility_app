/// Class for exception, that could be in app.
/// IMPORTANT: NAMING CONVENTION: class name should be part of l10n string
/// key, e.g. 'snackbarCantFetchBoltScootersData' exception is
/// [CantFetchBoltScootersData].
class AppException implements Exception {
  /// Constructor for [AppException].
  const AppException();
}
/// Define a constant for default [AppException] object.
const noException = AppException();

/// Exception that is thrown when GTFS file does not need to be downloaded.
class NoNeedToDownload implements AppException {
  /// Constructor for [NoNeedToDownload].
  const NoNeedToDownload();
}
/// Exception that is thrown when Bolt scooters data can not be downloaded.
class CantFetchBoltScootersData implements AppException {
  /// Constructor for [CantFetchBoltScootersData].
  const CantFetchBoltScootersData();
}
/// Exception that is thrown when Tartu smart bikes data can not be downloaded.
class CantFetchTartuSmartBikeData implements AppException {
  /// Constructor for [CantFetchTartuSmartBikeData].
  const CantFetchTartuSmartBikeData();
}
/// Exception that is thrown when no internet connection is available.
class NoInternetConnection implements AppException {
  /// Constructor for [NoInternetConnection].
  const NoInternetConnection();
}
/// Exception that is thrown when device is not supported (right now
/// 09.07.2023) related to Bolt fetching data.
class DeviceIsNotSupported implements AppException {
  /// Constructor for [DeviceIsNotSupported].
  const DeviceIsNotSupported();
}

/// Rarest exception, keep close look if ever happens. Could happen if no
/// city was picked.
class CityIsNotPicked implements AppException {
  /// Constructor for [CityIsNotPicked].
  const CityIsNotPicked();
}
/// Exception that is thrown when no GTFS file is present, user should press
/// refresh icon.
class NoGtfsTextFileIsPresent implements AppException {
  /// Constructor for [NoGtfsTextFileIsPresent].
  const NoGtfsTextFileIsPresent();
}

/// Exception that is thrown when some unspecified error occurred.
class SomeErrorOccurred implements AppException {
  /// Constructor for [SomeErrorOccurred].
  const SomeErrorOccurred();
}

/// Exception that is thrown when gtfs.zip is not existing at specified
/// location.
class GtfsZipIsNotPresent implements AppException {
  /// Constructor for [GtfsZipIsNotPresent].
  const GtfsZipIsNotPresent();
}

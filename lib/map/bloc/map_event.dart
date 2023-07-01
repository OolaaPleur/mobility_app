part of 'map_bloc.dart';

/// [MapEvent] created to extend new [MapEvent]'s.
abstract class MapEvent extends Equatable {
  /// Constructor for [MapEvent].
  const MapEvent();

  @override
  List<Object?> get props => [];
}

/// Event which occurs when 1) app starts, 2) pressed refresh icon in actions
/// in appbar. When event occurs, data about transport is fetching from server,
/// and markers are places on map. Important note: function does not place on
/// map public transport stops, only downloads gtfs.zip, unzips it and
/// delete zip.
class MapMarkersPlacingOnMap extends MapEvent {
  /// Constructor for [MapMarkersPlacingOnMap] event.
  const MapMarkersPlacingOnMap();
}

/// Event occurs when one of FAB filter button is pressed. When event
/// occurs, mapFilter argument changes to the opposite and it adds to
/// state.filters map.
class MapMarkerFilterButtonPressed extends MapEvent {
  /// Constructor for [MapMarkerFilterButtonPressed] event.
  const MapMarkerFilterButtonPressed(this.mapFilter);
  /// Property, which needs to be changed.
  final MapFilters mapFilter;

  @override
  List<Object> get props => [mapFilter];
}

/// Event which occurs once in app (until it will be started again).
/// On FAB with bus icon pressed it parses all required .txt files and
/// adds its info to the state.
class MapShowBusStops extends MapEvent {
  /// Constructor for [MapShowBusStops] event.
  const MapShowBusStops();
}

/// Event which occurs when user close modal bottom sheet.
class MapCloseStopTimesModalBottomSheet extends MapEvent {
  /// Constructor for [MapCloseStopTimesModalBottomSheet] event.
  const MapCloseStopTimesModalBottomSheet();
}

/// Event which occurs when user change settings related to bus info,
/// does timetable opens for today or shows all trips for this stop.
class MapChangeTimetableMode extends MapEvent {
  /// Constructor for [MapChangeTimetableMode] event.
  const MapChangeTimetableMode(this.globalShowTripsForToday);
  /// Property, changes state.globalShowTripsForToday
  final GlobalShowTripsForToday globalShowTripsForToday;

  @override
  List<Object> get props => [globalShowTripsForToday];
}

/// Event which occurs when suggestion is pressed. Finds trips which goes
/// in user inputted destination.
class MapSearchByTheQuery extends MapEvent {
  /// Constructor for [MapSearchByTheQuery] event.
  const MapSearchByTheQuery(this.query);
  /// User query, saved in state.query.
  final String query;

  @override
  List<Object> get props => [query];
}

/// Event which occurs when user press bus stop marker. It calculates
/// current objects (trips, stoptimes etc) for user picked stop.
class MapShowTripsForCurrentStop extends MapEvent {
  /// Constructor for [MapShowTripsForCurrentStop] event.
  const MapShowTripsForCurrentStop(this.currentStop);
  /// Bus stop, picked by User.
  final Stop currentStop;

  @override
  List<Object> get props => [currentStop];
}

/// Event which occurs when user press filter button. It filters trips based
/// on which mode user picked in modal bottom sheet or global settings.
class MapPressFilterButton extends MapEvent {
  /// Constructor for [MapPressFilterButton] event.
  const MapPressFilterButton();
}

/// Event which occurs when user click marker. It makes marker slightly larger.
class MapEnlargeIcon extends MapEvent {
  /// Constructor for [MapEnlargeIcon] event.
  const MapEnlargeIcon(this.keyFromOpenedMarker);
  /// Opened marker key, we need to know which marker make larger.
  final String keyFromOpenedMarker;
  @override
  List<Object> get props => [keyFromOpenedMarker];
}

class MapPressTheTripButton extends MapEvent {
  const MapPressTheTripButton(this.pressedTrip);

  final int pressedTrip;
  @override
  List<Object> get props => [pressedTrip];
}

// BLOC ONLY EVENTS
/// Event only used inside BLoC. Filter state.markers according to
/// state.filters.
class MapMarkerFiltering extends MapEvent {
  /// Constructor for [MapMarkerFiltering] event.
  const MapMarkerFiltering();
}

/// Event only used inside BLoC. It loads trips for today.
class MapLoadTripsForToday extends MapEvent {
  /// Constructor for [MapLoadTripsForToday] event.
  const MapLoadTripsForToday();
}
/// Event only used inside BLoC. Adds values to maps, so they could be
/// displayed later on timetable for the user.
class MapAddValuesForRepaintingTimeTable extends MapEvent {
  /// Constructor for [MapAddValuesForRepaintingTimeTable] event.
  const MapAddValuesForRepaintingTimeTable();
}

import '../../data/models/estonia_public_transport.dart';
import '../../data/repositories/vehicle_repository.dart';
/// Use case, function is to parse stops into list.
class GetStops {
  /// Constructor for [GetStops].
  GetStops({required this.repository});
  /// Vehicle repository.
  final VehicleRepository repository;
  /// Call function for [GetStops] function.
  Future<List<Stop>> call() => repository.getStops();
}
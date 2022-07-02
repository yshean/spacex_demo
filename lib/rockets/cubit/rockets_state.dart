part of 'rockets_cubit.dart';

enum RocketsStatus { initial, loading, success, failure }

class RocketsState extends Equatable {
  const RocketsState({
    this.status = RocketsStatus.initial,
    this.rockets,
    this.errorMessage,
  });

  final RocketsStatus status;
  final List<Rocket>? rockets;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, rockets, errorMessage];
}

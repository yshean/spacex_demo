part of 'crew_cubit.dart';

enum CrewStatus { initial, loading, success, failure }

// Note: You could use @freezed here, but I often don't find the need to run
// this thorugh another build runner generation process
// it's ok to repeat the definition at overriding the props
// and it's usually not needed to be serialisable
class CrewState extends Equatable {
  const CrewState({
    this.status = CrewStatus.initial,
    this.crewMembers,
    this.errorMessage,
  });

  final CrewStatus status;
  final List<CrewMember>? crewMembers;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, crewMembers, errorMessage];
}

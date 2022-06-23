import 'package:bloc_test/bloc_test.dart';
import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';

class MockCrewMemberRepository extends Mock implements CrewMemberRepository {}

class MockCrewCubit extends MockCubit<CrewState> implements CrewCubit {}

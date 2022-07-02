import 'package:bloc_test/bloc_test.dart';
import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';
import 'package:spacex_demo/crew_member_details/cubit/crew_member_details_cubit.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class MockCrewMemberRepository extends Mock implements CrewMemberRepository {}

class MockRocketRepository extends Mock implements RocketRepository {}

class MockCrewCubit extends MockCubit<CrewState> implements CrewCubit {}

class MockRocketCubit extends MockCubit<RocketsState> implements RocketsCubit {}

class MockCrewMemberDetailsCubit extends MockCubit<CrewMemberDetailsState>
    implements CrewMemberDetailsCubit {}

class MockRocketDetailsCubit extends MockCubit<RocketDetailsState>
    implements RocketDetailsCubit {}

class MockUrlLauncherPlatorm extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:spacex_demo/app/app.dart';
import 'package:spacex_demo/bootstrap.dart';

void main() {
  bootstrap(
    ({
      required CrewMemberRepository crewMemberRepository,
    }) =>
        App(
      crewMemberRepository: crewMemberRepository,
    ),
  );
}

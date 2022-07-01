import 'package:spacex_api/spacex_api.dart';

final crewMembers = List.generate(
  3,
  (i) => CrewMember(
    id: '$i',
    name: 'Alejandro Ferrero $i',
    status: 'active',
    agency: 'Very Good Aliens',
    image:
        'https://media-exp1.licdn.com/dms/image/C4D03AQHVNIVOMkwQaA/profile-displayphoto-shrink_200_200/0/1631637257882?e=1637193600&v=beta&t=jFm-Ckb0KS0Z5hJDbo3ZBSEZSYLHfllUf4N-IV2NDTc',
    wikipedia: 'https://www.wikipedia.org/',
    launches: ['Launch $i'],
  ),
);

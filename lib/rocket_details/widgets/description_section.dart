import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final description = context
        .select((RocketDetailsCubit cubit) => cubit.state.rocket.description);

    return Text(description);
  }
}

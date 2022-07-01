import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/l10n/l10n.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';
import 'package:spacex_demo/rocket_details/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsPageContent extends StatelessWidget {
  const RocketDetailsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final rocket =
        context.select((RocketDetailsCubit cubit) => cubit.state.rocket);

    return Stack(
      children: [
        ListView(
          children: [
            if (rocket.flickrImages.isNotEmpty)
              const ImageHeader(
                key: Key('rocketDetailsPage_imageHeader'),
              ),
            const TitleHeader(
              key: Key('rocketDetailsPage_titleHeader'),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: DescriptionSection(),
            ),
            if (rocket.wikipedia != null)
              const SizedBox(
                height: 80,
              ),
          ],
        ),
        if (rocket.wikipedia != null)
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: SizedBox(
              height: 64,
              child: ElevatedButton(
                key: const Key(
                  'rocketDetailsPage_openWikipedia_elevatedButton',
                ),
                onPressed: () async {
                  final url = rocket.wikipedia!;

                  if (!await launchUrl(Uri.parse(url))) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Text(l10n.openWikipediaButtonText),
              ),
            ),
          ),
      ],
    );
  }
}

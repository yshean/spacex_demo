import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(you): Get the rocket image url from RocketDetailsCubit
    // tips: get the rocket.flickrImages.first from the Rocket object
    const imageUrl =
        'https://thumbs.dreamstime.com/z/russian-carrier-rocket-launch-clouds-d-illustration-152752714.jpg';

    return const SizedBox(
      height: 240,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

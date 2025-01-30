import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundimage,
      required this.subtitle,
      required this.title});

  final String image, backgroundimage;
  final String subtitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundimage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('تخط'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

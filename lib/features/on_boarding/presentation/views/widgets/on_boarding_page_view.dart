import 'package:flutter/material.dart';
import 'package:fruite_hup/core/utils/app_images.dart';
import 'package:fruite_hup/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.assetsImagesPageViewItem1Image,
          backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
          subtitile:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في '),
              Text('Fruit'),
              Text('HUB'),
            ],
          ),
        ),
        PageViewItem(
          image: Assets.assetsImagesPageViewItem2Image,
          backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
          subtitile:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text('ابحث وتسوق'),
        ),
      ],
    );
  }
}

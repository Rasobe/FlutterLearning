import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            children: slides
                .map((slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
                .toList()));
  }
}

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Proident adipisicing deserunt veniam laborum laborum veniam Lorem aute. Ad est ipsum fugiat eiusmod laboris do Lorem ad eu incididunt minim. Nisi elit magna anim aliqua commodo elit tempor deserunt. Officia mollit proident reprehenderit incididunt nulla culpa ullamco ea veniam nostrud ad laborum.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Recoge la comida',
      caption:
          'Est cupidatat Lorem in sit magna occaecat eu in Lorem eu irure amet culpa. Laboris deserunt nostrud officia aute voluptate tempor pariatur id deserunt Lorem sunt tempor veniam. Dolore deserunt aute do minim reprehenderit duis magna veniam minim commodo eiusmod quis sunt et. Commodo veniam ad nisi elit sint amet anim et labore pariatur irure culpa. Aliquip ipsum reprehenderit proident do laborum.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta tu comida',
      caption:
          'Dolore enim voluptate ea anim qui culpa eu ut est ut aliquip cillum esse. Quis culpa in exercitation dolore incididunt cillum Lorem deserunt ex excepteur magna labore. Dolore laborum ipsum laborum consectetur cillum nulla quis anim et occaecat adipisicing magna. Ipsum tempor magna consectetur culpa ea esse et commodo. Proident sunt sint incididunt nisi anim sit.',
      imageUrl: 'assets/images/3.png'),
];

class _Slide extends StatelessWidget {
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

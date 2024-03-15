import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool reachedFinal = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;

      pageController.addListener(() {
        if (!reachedFinal && page >= (slides.length - 1.5)) {
          setState(() {
            reachedFinal = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              children: slides
                  .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl))
                  .toList(),
            ),
            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Salir'),
              ),
            ),
            reachedFinal
                ? Positioned(
                    right: 20,
                    bottom: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar'),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl),
          const SizedBox(
            height: 20,
          ),
          Text(title, style: titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}

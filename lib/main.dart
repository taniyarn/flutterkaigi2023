import 'package:flutter/cupertino.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/view/presentation_slides.dart';

void main() {
  runApp(const ProviderScope(child: MyFlutterShow()));
}

class MyFlutterShow extends ConsumerWidget {
  const MyFlutterShow({this.slides, super.key});

  /// Used for widget tests, safe to ignore.
  @visibleForTesting
  final List<PresentationSlide>? slides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      home: PresentationSlides(slides: slides),
      debugShowCheckedModeBanner: false,
    );
  }
}

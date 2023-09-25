import 'package:flutter/cupertino.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../styles/fs_colors.dart';
import '../../styles/fs_style_constants.dart';
import '../../styles/fs_text_styles.dart';
import '../provider/presentation_controller_provider.dart';
import 'slide_show.dart';

class Menu extends HookConsumerWidget {
  const Menu({this.slides, super.key});

  /// Used for widget tests, safe to ignore.
  @visibleForTesting
  final List<PresentationSlide>? slides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    void toggleMenu() =>
        ref.watch(presentationController.notifier).toggleMenu();

    return Align(
      alignment: Alignment.bottomCenter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: CupertinoColors.black.withOpacity(0.5),
        ),
        child: SizedBox(
          width: size.width,
          height: FSStyleConstants.getMenuHeight(size),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'メニュー',
                            style: FSTextStyles.footerText(),
                          ),
                          verticalMargin8,
                          CupertinoButton.filled(
                            onPressed: toggleMenu,
                            child: const Text(
                              '閉じる',
                              style: TextStyle(
                                color: FSColors.regularTextColor,
                              ),
                            ),
                          ),
                          verticalMargin8,
                        ],
                      ),
                      horizontalMargin12,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: horizontalPadding8,
                              child: Text(
                                'スライド',
                                style: FSTextStyles.footerText(),
                              ),
                            ),
                            SlideShow(
                              slides: slides,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

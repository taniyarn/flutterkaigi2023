import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:fluttershow_keynote/fluttershow_keynote.dart';
import 'package:fluttershow_keynote/slides/title_slide/keynote_title_slide.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../presentation/widgets/ticeker_builder.dart';
import '../../../styles/fs_gradients.dart';
import '../../../styles/fs_text_styles.dart';

class TitleSlide extends ConsumerWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FSGradients.background,
      ),
      child: Stack(
        children: [
          const TitleBackgroundShader(),
          KeynoteTitleSlide(
            titleText: 'タイトル',
            subTitleText: 'サブタイトル',
            titleGradient: FSGradients.titlePrimary,
            titleStyle: KeynoteTextstyles.title(),
            subtitleStyle: KeynoteTextstyles.subtitle(),
            footerStyle: FSTextStyles.footerText(),
          ),

          /// Try me first and then `variantTwo()`!
          ///
          // KeynoteTitleSlideVariants.variantOne(
          //   titleText: t.flutterShow,
          //   subTitleText: t.presentationsInFlutter,
          //   footerText: t.author,
          // ),
        ],
      ),
    );
  }
}

class TitleBackgroundShader extends StatelessWidget {
  const TitleBackgroundShader({super.key});

  @override
  Widget build(BuildContext context) {
    return TickerBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'assets/shaders/background.frag',
          (context, shader, child) => CustomPaint(
            size: MediaQuery.sizeOf(context),
            painter: _TitleShaderPainter(shader, time),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class _TitleShaderPainter extends CustomPainter {
  const _TitleShaderPainter(this.shader, this.time);

  final FragmentShader shader;
  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _TitleShaderPainter oldDelegate) {
    return oldDelegate.shader != shader || oldDelegate.time != time;
  }
}

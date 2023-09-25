import 'package:flutter/material.dart';

import '../config/presentation_slides.dart';
import '../provider/presentation_controller_provider.dart';

@immutable
class Presentation {
  const Presentation({
    required this.animationIndex,
    required this.page,
    required this.menuOpen,
    required this.pageController,
  });

  /// Represents the current step of the animation in the presentation.
  /// It determines how many times a slide can be clicked before switching
  /// to the next slide in the enum.
  ///
  /// The `animationIndex` property, in combination with the `animationSteps`
  /// property of [presentationController], indicates which item will be
  /// animated/shown next during the presentation.
  ///
  /// It keeps track of the progress of the animation, indicating the current
  /// step in the sequence.
  ///
  /// An example usage can be seen in the [DownsidesSlide] slide.
  /// The enum member [PagesOfPresentation.downsides] has 6 `animationSteps`.
  /// Clicking on the slide increments the `animationIndex` by one.
  ///
  /// Example:
  /// - Downsides title appears: `animationIndex` is 0.
  /// - Really bad subtitle appears: `animationIndex` is 1.
  /// - Annoying bullet point appears: `animationIndex` is 2.
  /// - Boring bullet point appears: `animationIndex` is 3.
  /// - Lazy bullet point appears: `animationIndex` is 4.
  /// - It's not Flutter bullet point appears: `animationIndex` is 5.
  /// - When `animationIndex` reaches 6, it switches to the next slide.
  final int animationIndex;

  /// Tracks the current slide in the presentation.
  final int page;

  /// Indicates whether the menu is open or closed.
  final bool menuOpen;

  /// Manages the page navigation in the presentation slides.
  final PageController pageController;

  Presentation copyWith({
    int? animationIndex,
    int? page,
    bool? menuOpen,
  }) {
    return Presentation(
      animationIndex: animationIndex ?? this.animationIndex,
      page: page ?? this.page,
      menuOpen: menuOpen ?? this.menuOpen,
      pageController: pageController,
    );
  }
}

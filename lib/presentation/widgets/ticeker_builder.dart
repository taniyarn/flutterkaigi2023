import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerBuilder extends StatefulWidget {
  const TickerBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, double time) builder;

  @override
  State<TickerBuilder> createState() => _TickerBuilderState();
}

class _TickerBuilderState extends State<TickerBuilder>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      _time += 0.015;
      setState(() {});
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder.call(context, _time);
}

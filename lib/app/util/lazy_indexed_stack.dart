import 'package:flutter/material.dart';

class LazyLoadIndexedStack extends StatefulWidget {
  late final Widget unloadWidget;
  final AlignmentGeometry alignment;
  final StackFit sizing;
  final TextDirection? textDirection;
  final int index;
  final List<Widget> children;

  /// Элемент необходим для главной страницы. Позволяет делать линивую подгрузку для табов, чтобы при входе не отправлялись забросы со всех табов разом.
  LazyLoadIndexedStack({
    Key? key,
    Widget? unloadWidget,
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    this.textDirection,
    required this.index,
    required this.children,
  }) : super(key: key) {
    this.unloadWidget = unloadWidget ?? Container();
  }

  @override
  _LazyLoadIndexedStackState createState() => _LazyLoadIndexedStackState();
}

class _LazyLoadIndexedStackState extends State<LazyLoadIndexedStack> {
  late final List<bool> _alreadyLoaded;

  @override
  void initState() {
    super.initState();

    _alreadyLoaded = List.filled(widget.children.length, false);
    _alreadyLoaded[widget.index] = true;
  }

  @override
  void didUpdateWidget(final LazyLoadIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);

    _alreadyLoaded[widget.index] = true;
  }

  @override
  Widget build(final BuildContext context) {
    return IndexedStack(
      index: widget.index,
      children: _loadedChildren(),
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
    );
  }

  List<Widget> _loadedChildren() {
    return widget.children.asMap().entries.map((entry) {
      final index = entry.key;
      final childWidget = entry.value;

      return _alreadyLoaded[index] ? childWidget : widget.unloadWidget;
    }).toList();
  }
}

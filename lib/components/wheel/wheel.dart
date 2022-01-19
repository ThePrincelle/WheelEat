import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/wheel_item.dart';
import 'wheel_icon.dart';
import 'arrow.dart';

class Wheel extends StatefulWidget {
  final double angle;
  final double current;
  final List<WheelItem> items;
  final double maxRadius;

  const Wheel({
    Key? key,
    required this.angle,
    required this.current,
    required this.items,
    this.maxRadius = 400.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WheelState();
  }
}

class _WheelState extends State<Wheel> {
  Size get size => Size(
      min(MediaQuery.of(context).size.width * 0.8, widget.maxRadius),
      min(MediaQuery.of(context).size.width * 0.8, widget.maxRadius));

  double _rotote(int index) => (index / widget.items.length) * 2 * pi;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //shadow
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)],
          ),
        ),
        Transform.rotate(
          angle: -(widget.current + widget.angle) * 2 * pi,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (var item in widget.items) ...[_buildCard(item)],
              for (var item in widget.items) ...[_buildIcon(item)],
            ],
          ),
        ),
        SizedBox(
          height: size.height,
          width: size.width,
          child: const ArrowView(),
        ),
      ],
    );
  }

  _buildCard(WheelItem item) {
    var _rotate = _rotote(widget.items.indexOf(item));
    var _angle = 2 * pi / widget.items.length;
    return Transform.rotate(
      angle: _rotate,
      child: ClipPath(
        clipper: _WheelPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [item.color, item.color.withOpacity(0)],
            ),
          ),
        ),
      ),
    );
  }

  _buildIcon(WheelItem item) {
    var _rotate = _rotote(widget.items.indexOf(item));
    return Transform.rotate(
      angle: _rotate,
      child: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints.expand(height: size.height / 3, width: 44.0),
          child: Center(
            child: WheelIcon(item),
          ),
        ),
      ),
    );
  }
}

class _WheelPath extends CustomClipper<Path> {
  final double angle;

  _WheelPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(_WheelPath oldClipper) {
    return angle != oldClipper.angle;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import 'data/wheel_item.dart';

import 'components/wheel.dart';
import 'components/wheel_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  final List<WheelItem> _items = [
    WheelItem(icon: Icons.restaurant_rounded, color: Colors.accents[0]),
    WheelItem(icon: Icons.fastfood_rounded, color: Colors.accents[2]),
    WheelItem(icon: Icons.local_pizza_rounded, color: Colors.accents[4]),
    WheelItem(icon: Icons.coffee_rounded, color: Colors.accents[6]),
    WheelItem(icon: Icons.breakfast_dining_rounded, color: Colors.accents[8]),
    WheelItem(icon: Icons.dinner_dining_rounded, color: Colors.accents[10]),
    WheelItem(icon: Icons.lunch_dining_rounded, color: Colors.accents[12]),
    WheelItem(icon: Icons.brunch_dining_rounded, color: Colors.accents[14]),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = const Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.blue.withOpacity(0.2)],
          ),
        ),
        child: AnimatedBuilder(
          animation: _ani,
          builder: (context, child) {
            final _value = _ani.value;
            final _angle = _value * this._angle;
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Wheel(items: _items, current: _current, angle: _angle),
                _buildGo(),
                _buildResult(_value),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: const Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    WheelItem item = _items[_index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: WheelIcon(item, size: 52.0, padding: 24.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Toogle extends StatefulWidget {
  final bool isChecket;

  const Toogle(
    this.isChecket, {
    Key? key,
  }) : super(key: key);

  @override
  State<Toogle> createState() => _ToogleState();
}


class _ToogleState extends State<Toogle> {

  bool _toogleValue = false;

  /*@override 
  void initState() {
    setState(() { _toogleValue = widget.isChecket; });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: 100,
        width:  10,
        duration: const Duration(microseconds: 1000), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _toogleValue ? Colors.greenAccent[100]: Colors.greenAccent[100]?.withOpacity(0.5),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 1000),
              top: 3,
              left: _toogleValue? 60.0 : 0.0,
              right: _toogleValue? 0.0 : 60.0,
              child: InkWell(
                onTap: toogleButton,
                child: AnimatedSwitcher(
                  duration:  const Duration(milliseconds: 1000),
                  transitionBuilder: (Widget child, Animation<double> animation){
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: _toogleValue ? Icon(Icons.check_circle, color: Colors.green, size: 35.0, key: UniqueKey())
                  : Icon(Icons.remove_circle_outline_outlined, color: Colors.red, size: 35.0, key: UniqueKey(),
                  )
                ),
              ),
            ),
          ],
        ),
      );
    }

  toogleButton(){
    setState((){
      _toogleValue = !_toogleValue;
    });
  }
}

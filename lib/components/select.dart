import 'package:flutter/material.dart';

import '../constants.dart';

class Select extends StatefulWidget {
  final List<String> listValue;
  final String curentValue;
  final Widget? child;
  //final Function setter;

  const Select(
    this.listValue,
    this.curentValue,
    this.child,
    //this.setter,
  { Key? key,
  }) : super(key: key);

   @override
  State<Select> createState() => _SelectState();
}


class _SelectState extends State<Select> {
  //String _selectValue;


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: widget.listValue.map((String value){
        //La fonction crée un objet qui aura la même valeur et le même texte, à partir du tableau d'objet
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {
        //widget.setter(_);
      },
      value: widget.curentValue,
    );
  }

  
}

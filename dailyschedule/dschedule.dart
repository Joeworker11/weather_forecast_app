import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';


main() {

}

class MyApp extends StatelessWidget{

}

class ActionSlider {
  ActionSlider.standard(
      dynamic rolling = (true),
      width =300.0,
      child: const Text('Rolling slider',
        style: TextStyle(color:Colors.white)),
      backgroundColor:Colors.black,
      reverseSlideAnimationCurve:Curves.easelnOut,
  )
      )
}
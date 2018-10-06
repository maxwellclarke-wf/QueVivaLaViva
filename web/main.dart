import 'dart:html';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react/over_react.dart';
import 'package:QueVivaLaViva/que_viva.dart';

void main() {
  setClientConfiguration();
  react_dom.render(CookBook()(), querySelector('#react_mount'));
}

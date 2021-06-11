import 'package:milk/product_schema.dart';

class MilkCenter
{
  String name;
  String dealername;
  List<Milk> milktypes;
  double dist;
  MilkCenter({this.dist,this.dealername,this.milktypes,this.name});
}
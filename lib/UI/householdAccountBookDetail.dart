import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../widget/drawerMenu.dart';

class HouseholdAccountBookDetail extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => HouseholdAccountBookDetail(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("test");
  }
}

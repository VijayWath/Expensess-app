import 'package:flutter/material.dart';
import 'dart:ui';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrans) {
        return Column(
          children: <Widget>[
            Container(
              height: constrans.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${spendingAmount.toStringAsFixed(0)}',
                ),
              ),
            ),
            SizedBox(
              height: constrans.maxHeight * 0.05,
            ),
            Container(
              height: constrans.maxHeight * 0.6,
              width: 15,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constrans.maxHeight * 0.05,
            ),
            Container(
                child: FittedBox(
                  child: Text(label),
                ),
                height: constrans.maxHeight * 0.15),
          ],
        );
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';

import '../data/add_data.dart';
import '../data/utility.dart';

class Chart extends StatelessWidget {
  final List<Add_data> data;

  Chart({required this.data});

  @override
  Widget build(BuildContext context) {
    // Calculate total income and expenses
    int totalIncome =
        total_chart(data.where((item) => item.IN == 'income').toList());

    int totalExpenses =
        total_chart(data.where((item) => item.IN == 'Expanse').toList());

    // Calculate percentages

    double expensesPercentage = (totalExpenses.abs() / (totalIncome)) * 100;
    double incomePercentage = 100 - expensesPercentage;

    // Data for the pie chart
    Map<String, double> dataMap = {
      'Income': incomePercentage < 0 ? 0 : incomePercentage,
      'Expenses': expensesPercentage < 0 || expensesPercentage > 100
          ? 0
          : expensesPercentage,
    };

    // Colors for the pie chart sections
    List<Color> colorList = [Colors.green, Colors.red];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: PieChart(
            dataMap: dataMap,
            colorList: colorList,
            animationDuration: Duration(milliseconds: 800),
            chartRadius: MediaQuery.of(context).size.width / 2.7,
            chartLegendSpacing: 32,
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 2,
            ),
          ),
        ),
        SizedBox(height: 16),
        // Display the legend with percentages
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend(
                Colors.green,
                "Income (${incomePercentage.toStringAsFixed(2)}%)",
                incomePercentage,
                'Income'),
            const SizedBox(width: 16),
            _buildLegend(
                Colors.red,
                "Expenses (${expensesPercentage.toStringAsFixed(2)}%)",
                expensesPercentage,
                "Expenses"),
          ],
        ),
      ],
    );
  }

  Widget _buildLegend(Color color, String label, double per, String category) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        SizedBox(width: 8),
        Text(per.isInfinite ? "$category " : label),
      ],
    );
  }
}

import 'package:moneymanagement/data/1.dart';

List<money> geter() {
  money food = money();
  food.name = 'food';
  food.fee = '650';
  food.time = 'today';
food.image = 'food.jpg';
  food.buy = false;
  money fuel = money();
  fuel.buy = true;
  fuel.fee = '15';
fuel.image = 'fuel.png';
  fuel.name = 'fuel';
  fuel.time = 'today';
  money transfer = money();
  transfer.buy = true;
  transfer.fee = '100';
  transfer.image = 'money.png';
transfer.name = 'transfer for sam';
  transfer.time = 'jan 30 ,2023';

  return [
    food,
    fuel,
    transfer,
    food,
    fuel,
    transfer,  
  ];
}

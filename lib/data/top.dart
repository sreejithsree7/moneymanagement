import 'package:moneymanagement/data/1.dart';

List<money> geter_top() {
  money food = money();
  food.time = 'jan 30 ,2023';
  food.image = 'food.jpg';
  food.buy = true;
  food.fee = '-\$ 100';
  food.name = 'food';
  money Transfer = money();
  Transfer.image = 'money.png';
  Transfer.time = 'today';
  Transfer.buy = true;
  Transfer.fee = '-\$ 60';
  Transfer.name = 'Transfer';

  return [food, Transfer];
}
 
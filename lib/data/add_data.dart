import 'package:hive/hive.dart';
part 'add_data.g.dart';
@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String categaries;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime dataTime;
  Add_data(this.IN, this.amount, this.dataTime, this.explain, this.categaries);
}

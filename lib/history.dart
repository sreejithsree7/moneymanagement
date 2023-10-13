import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagement/search.dart';

import 'data/add_data.dart';
import 'edit.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var history;
  final box = Hive.box<Add_data>('data');
  final List<String> day = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String getMonthInWords(int month) {
    // Ensure the month is within a valid range (1-12)
    if (month < 1 || month > 12) {
      return 'Invalid month';
    }
    return months[month - 1]; // Adjust for 0-based indexing in lists
  }

  final List<String> filter = [
    'All',
    'Income',
    'Expense',
    'Today',
    'Yesterday',
    'This Month',
  ];

  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort_rounded),
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
                print(selectedFilter);
              });
            },
            itemBuilder: (context) => filter.map((item) {
              return PopupMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const Search();
                  },
                ));
              },
              icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              history = box.values.toList()[index];
              print(box.values.toList()[index].IN);
              return getList(history, index);
            },
            childCount: box.length,
          ))
        ],
      )),
    );
  }

  Widget getList(Add_data history, int index) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    if (selectedFilter == 'All') {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item deleted'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: get(index, history),
      );
    } else if (selectedFilter == 'Income' && history.IN == 'income') {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });
        },
        child: get(index, history),
      );
    } else if (selectedFilter == 'Expense' && history.IN == 'Expanse') {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });
        },
        child: get(index, history),
      );
    } else if (selectedFilter == 'Today' &&
        history.dataTime.year == now.year &&
        history.dataTime.month == now.month &&
        history.dataTime.day == now.day) {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });
        },
        child: get(index, history),
      );
    } else if (selectedFilter == 'Yesterday' &&
        history.dataTime.year == yesterday.year &&
        history.dataTime.month == yesterday.month &&
        history.dataTime.day == yesterday.day) {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });
        },
        child: get(index, history),
      );
    } else if (selectedFilter == 'This Month' &&
        history.dataTime.isAfter(startOfMonth)) {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            box.deleteAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item deleted'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: get(index, history),
      );
    } else {
      return Container();
    }
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      title: Text(
        history.categaries,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${day[history.dataTime.weekday - 1]} ${history.dataTime.year}-${history.dataTime.day}-${getMonthInWords(history.dataTime.month)}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            history.explain,
            style:
                const TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '₹ ${history.amount}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: history.IN == 'income' ? Colors.green : Colors.red,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedTransation = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditTransactionScreen(transaction: history),
                ),
              );
              if (updatedTransation != null) {
                // Update the transaction in the list
                setState(() {
                  box.put(history.key, updatedTransation);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

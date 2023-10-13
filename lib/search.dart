// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagement/data/add_data.dart';
import 'package:moneymanagement/edit.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<Add_data> transactionList = Hive.box<Add_data>('data').values.toList();
  late List<Add_data> transactionDisplay = List<Add_data>.from(transactionList);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [],
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'search',
                suffixIcon: Icon(
                  Icons.search,
                ),
                // labelStyle: TextStyle(
                //   color: Color(0xff368983),
                // ),
              ),
              onChanged: (value) {
                searchStudent(value);
              },
            ),
            Expanded(
                child: transactionDisplay.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        itemCount: transactionDisplay.length,
                        itemBuilder: (context, index) {
                          history = box.values.toList()[index];

                          return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                // Delete the item when dismissed
                                setState(() {
                                  transactionDisplay.removeAt(index);
                                  box.deleteAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Item deleted'),
                                    duration: Duration(
                                        seconds:
                                            2), // You can adjust the duration
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ListTile(
                                  title: Text(
                                    transactionDisplay[index].categaries,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${day[history.dataTime.weekday - 1]} ${history.dataTime.year}-${history.dataTime.day}-${getMonthInWords(history.dataTime.month)}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        history.explain,
                                        style: TextStyle(
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '₹ ${transactionDisplay[index].amount}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                          color: history.IN == 'income'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () async {
                                          final updatedTransation =
                                              await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditTransactionScreen(
                                                      transaction:
                                                          transactionDisplay[
                                                              index]),
                                            ),
                                          );
                                          if (updatedTransation != null) {
                                            // Update the transaction in the list
                                            setState(() {
                                              box.put(history.key,
                                                  updatedTransation);
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) => Divider(
                          thickness: 5,
                          color: Colors.grey[50],
                        ),
                      )
                    : Center(child: Text('No result found'))),
          ],
        ),
      ),
    );
  }

  searchStudent(String value) {
    setState(() {
      transactionDisplay = transactionList
          .where((element) =>
              element.categaries.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}

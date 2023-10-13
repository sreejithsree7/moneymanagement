// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagement/data/add_data.dart';

class EditTransactionScreen extends StatefulWidget {
  final Add_data transaction;

  const EditTransactionScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  _EditTransactionScreenState createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController explainController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController Howconroller = TextEditingController();
  TextEditingController date_timecontroller = TextEditingController();
  late Box<Add_data> box;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (newDate != null && newDate != selectedDate) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    nameController.text = widget.transaction.categaries;
    explainController.text = widget.transaction.explain;
    amountController.text = widget.transaction.amount;
    Howconroller.text = widget.transaction.IN;
    //date_timecontroller = widget.transaction.dataTime;

    Hive.openBox<Add_data>('data').then((value) {
      box = value;
    });
  }

  void updateTransaction() async {
    try {
      final updatedName = nameController.text;
      final updatedExplain = explainController.text;
      final updatedAmount = amountController.text;
      //final updatedHow = selectedItemi;

      widget.transaction.categaries = updatedName;
      widget.transaction.explain = updatedExplain;
      widget.transaction.amount = updatedAmount;
      widget.transaction.IN = selectedItemi!;
      widget.transaction.dataTime = selectedDate;

      box.put(widget.transaction.key, widget.transaction);

      Navigator.pop(context, widget.transaction);
    } catch (e) {
      print('Error updating transaction: $e');
    }
  }

  String? selectedItemi;
  final List<String> _itemi = [
    'income',
    'Expanse',
  ];
  DateTime selectedDate = DateTime.now();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background(context),
            Positioned(
              top: 120,
              child: main_container(),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 2))
          ]),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          const SizedBox(
            height: 30,
          ),
          explain(),
          const SizedBox(
            height: 30,
          ),
          ammount(),
          const SizedBox(
            height: 30,
          ),
          How(),
          const SizedBox(height: 30),

          updateDateButton(), // Use the updated method here
          const SizedBox(
            height: 30,
          ),
          save(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        updateTransaction();
        //Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: const Text(
          'Save',
          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  GestureDetector updateDateButton() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5)),
        ),
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Text(
                '${selectedDate.toLocal()}'
                    .split(' ')[0], // Display the selected date
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: const Color(0xffc5c5c5),
            )),
        child: DropdownButton<String>(
          value: selectedItemi,
          onChanged: (value) {
            setState(() {
              selectedItemi = value;
            });
          },
          items: _itemi
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemi
              .map((e) => Row(
                    children: [const SizedBox(width: 5), Text(e)],
                  ))
              .toList(),
          hint: const Text(
            'income OR expense',
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding ammount() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: amountController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            labelText: 'Amount',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5)))),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
        controller: explainController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            labelText: 'Description',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5)))),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            labelText: 'Category',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffc5c5c5)))),
      ),
    );
  }

  Column background(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

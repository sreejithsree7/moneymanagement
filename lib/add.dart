//ignore_for_file: sort_child_properties_last, camel_case_types, override_on_non_overriding_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagement/data/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemi;

  final TextEditingController expalin_c = TextEditingController();
  final TextEditingController othercategory = TextEditingController();

  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    'food',
    'Transfer',
    'Salary',
    'Education',
  ];
  final List<String> _itemi = [
    'income',
    'Expanse',
  ];

  @override
  void initstate() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_containe(),
            )
          ],
        )));
  }

  Container main_containe() {
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
          const SizedBox(height: 50),
          name(),
          const SizedBox(height: 30),
          explain(),
          const SizedBox(height: 30),
          amount(),
          const SizedBox(height: 30),
          How(),
          const SizedBox(height: 30),
          date_time(),
          const Spacer(),
          save(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        if (selectedItemi == null ||
            selectedItem == null ||
            expalin_c.text.isEmpty ||
            amount_c.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please fill in all required fields.'),
              backgroundColor: Colors.red[400],
            ),
          );
        } else {
          var add = Add_data(
            selectedItemi!,
            amount_c.text,
            date,
            expalin_c.text,
            selectedItem!,
          );
          box.add(add);
          Navigator.of(context).pop();
        }
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

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5))),
      width: 300,
      child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2022),
                lastDate: DateTime(2100));

            if (newDate == null) return;
            setState(() {
              date = newDate;
            });
          },
          child: Text(
            'Date : ${date.year}/${date.day}/${date.month}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          )),
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
        child: DropdownButtonFormField<String>(
          value: selectedItemi,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Income or Expense';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectedItemi = value!;
            });
          },
          items: _itemi
              .map((e) => DropdownMenuItem(
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
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemi
              .map((e) => Row(
                    children: [const SizedBox(width: 5), Text(e)],
                  ))
              .toList(),
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.red),
            hintText: 'Income or Expense',
            hintStyle: const TextStyle(color: Colors.grey),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Amount';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_c,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: 307,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffc5c5c5),
                  )),
              child: Row(
                children: [
                  SizedBox(
                    child: DropdownButton<String>(
                      value: selectedItem,
                      items: _item
                          .map((e) => DropdownMenuItem(
                                child: Container(
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
                                value: e,
                              ))
                          .toList(),
                      selectedItemBuilder: (BuildContext context) => _item
                          .map((e) => Row(
                                children: [const SizedBox(width: 5), Text(e)],
                              ))
                          .toList(),
                      hint: const Text(
                        'Categories',
                        style: TextStyle(color: Colors.grey),
                      ),
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value!;
                        });
                      },
                    ),
                    width: 243,
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                height: 200,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: TextField(
                                          controller: othercategory,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 15),
                                              labelText: 'other category',
                                              labelStyle: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey.shade500),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color:
                                                          Color(0xffc5c5c5))),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color:
                                                          Color(0xffc5c5c5)))),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: const Text('Add category'),
                                        onPressed: () {
                                          _item.add(othercategory.text);
                                          log(othercategory.text);
                                          log('$_item');
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Tooltip(
                        message: 'Add other categories',
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    width: 30,
                  )
                ],
              )),
          //////////////////////////////////////////////
        ],
      ),
    );
  }

  Column background_container(BuildContext context) {
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
              )),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                    const SizedBox(
                      width: 120,
                    ),
                    const Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
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

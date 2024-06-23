import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<String> myCategoriesIcons = [
    'travel',
    'food',
    'shopping',
    'tech',
    'pet',
    'entertainment',
    'home'
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Add Expense',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      CupertinoIcons.money_dollar,
                      color: Colors.white,
                      size: 25,
                    ),
                    labelText: 'Input Money',
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                readOnly: true,
                onTap: () {},
                controller: categoryController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.list_bullet,
                    color: Colors.white,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              bool isExpended = false;
                              String iconSelected = '';
                              Color categoryColor = Colors.white;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Create Category',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Name',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            onTap: () {
                                              setState(() {
                                                isExpended = !isExpended;
                                              });
                                            },
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              suffixIcon: const Icon(
                                                CupertinoIcons.chevron_down,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                              fillColor: Colors.white,
                                              hintText: 'Icon',
                                              border: OutlineInputBorder(
                                                  borderRadius: isExpended
                                                      ? const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              12),
                                                        )
                                                      : BorderRadius.circular(
                                                          12),
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                          isExpended
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 200,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              mainAxisSpacing:
                                                                  5,
                                                              crossAxisSpacing:
                                                                  5),
                                                      itemCount:
                                                          myCategoriesIcons
                                                              .length,
                                                      itemBuilder:
                                                          (context, int i) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              iconSelected =
                                                                  myCategoriesIcons[
                                                                      i];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                width: 3,
                                                                color: iconSelected ==
                                                                        myCategoriesIcons[
                                                                            i]
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/${myCategoriesIcons[i]}.png'),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx2) {
                                                    // // setState(() {
                                                    // categoryColor = Colors
                                                    //     .blue; // default color
                                                    // // });
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ColorPicker(
                                                            pickerColor:
                                                                categoryColor,
                                                            onColorChanged:
                                                                (value) {
                                                              setState(() {
                                                                categoryColor =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    ctx2);
                                                              },
                                                              child: Text(
                                                                'Save',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                foregroundColor:
                                                                    Colors
                                                                        .white,
                                                                backgroundColor:
                                                                    Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: categoryColor,
                                              hintText: 'Color',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: kToolbarHeight,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .tertiary,
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ],
                                                ),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  // create category object and pop
                                                  Navigator.pop(context);
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      icon: const Icon(
                        CupertinoIcons.plus,
                        size: 16,
                        color: Colors.white,
                      )),
                  labelText: 'Category',
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectedDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.time,
                    color: Colors.black,
                    size: 25,
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add Expense',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

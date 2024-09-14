import 'package:flutter/material.dart';
import 'package:news_app/Services/Search_cleaner.dart';
import 'package:intl/intl.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String? searchQuery;
  bool searchedOnce = false;

  DateTime? fromDate;
  DateTime? toDate;
  String? orderBy = "newest";
  Future<void> _selectDate(BuildContext context, isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != (isFromDate ? fromDate : toDate)) {
      if (isFromDate) {
        fromDate = picked;
      } else {
        toDate = picked;
      }
    }
  }

  void _resetFilters() {
    fromDate = null;
    toDate = null;
    orderBy = "newest";
  }

  void _applyFilters() {
    Navigator.pop(context);
    setState(() {
      searchedOnce = true;
      searchQuery = processString(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),
            const SliverToBoxAdapter(
              child: Center(
                  child: Text(
                "Search",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sf"),
              )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(92, 216, 217, 219),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) {
                    searchedOnce = true;

                    setState(() {
                      searchQuery = processString(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                    ),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setStatee) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                          title: const Text('From Date'),
                                          subtitle: Text(
                                            fromDate != null
                                                ? DateFormat.yMd()
                                                    .format(fromDate!)
                                                : 'Select a date',
                                          ),
                                          trailing:
                                              const Icon(Icons.calendar_today),
                                          onTap: () async {
                                            await _selectDate(context, true);
                                            setStatee(() {});
                                          }),
                                      ListTile(
                                          title: const Text('To Date'),
                                          subtitle: Text(
                                            toDate != null
                                                ? DateFormat.yMd()
                                                    .format(toDate!)
                                                : 'Select a date',
                                          ),
                                          trailing:
                                              const Icon(Icons.calendar_today),
                                          onTap: () async {
                                            await _selectDate(context, false);
                                            setStatee(() {});
                                          }),
                                      ListTile(
                                        title: const Text('Order By'),
                                        trailing: DropdownButton<String>(
                                          value: orderBy,
                                          items: <String>[
                                            'newest',
                                            'oldest',
                                            'relevance'
                                          ].map(
                                            (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (String? newValue) {
                                            setStatee(
                                              () {
                                                orderBy = newValue;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white),
                                            onPressed: () {
                                              setStatee(_resetFilters);
                                            },
                                            child: const Text('Reset'),
                                          ),
                                          ElevatedButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white),
                                            onPressed: _applyFilters,
                                            child: const Text('Done'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.filter_alt_outlined),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            searchedOnce
                ? NewsTileListViewBuilder(
                    key: ValueKey(
                      '${searchQuery ?? ''}_${fromDate?.toIso8601String() ?? ''}_${toDate?.toIso8601String() ?? ''}_${orderBy ?? ''}',
                    ),
                    q: searchQuery,
                    fromDate: fromDate,
                    toDate: toDate,
                    orderBy: orderBy,
                  )
                : SliverToBoxAdapter(child: Container()),
          ],
        ),
      ),
    );
  }
}

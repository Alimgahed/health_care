import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_care/widget.dart';

class ContractingPartiesPage extends StatefulWidget {
  @override
  _ContractingPartiesPageState createState() => _ContractingPartiesPageState();
}

class _ContractingPartiesPageState extends State<ContractingPartiesPage> {
  final List<Map<String, String>> contractingParties = List.generate(
    10,
    (index) => {
      'name': 'جهة التعاقد ${index + 1}',
      'date': index == 0
          ? _generateFutureDate() // Ensure at least one green container
          : _generateRandomDate(),
    },
  );

  static String _generateRandomDate() {
    final random = Random();
    final now = DateTime.now();
    final year = now.year;
    final month = now.month + random.nextInt(12 - now.month + 1);
    final day = random.nextInt(28) + 1;
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  static String _generateFutureDate() {
    final now = DateTime.now();
    final futureDate =
        DateTime(now.year, now.month + 4, now.day); // Beyond 3 months
    return '${futureDate.year}-${futureDate.month.toString().padLeft(2, '0')}-${futureDate.day.toString().padLeft(2, '0')}';
  }

  List<Map<String, String>> filteredParties = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredParties = contractingParties; // Initially show all parties
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.trim();
      filteredParties = contractingParties.where((party) {
        return party['name']!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    });
  }

  Color _getCardColor(String date) {
    final today = DateTime.now();
    final parsedDate = DateTime.parse(date);

    final monthsDifference =
        (parsedDate.year - today.year) * 12 + (parsedDate.month - today.month);

    if (parsedDate.isBefore(today)) {
      return Colors.red[200]!;
    } else if (monthsDifference <= 3) {
      return Colors.yellow[200]!;
    } else {
      return Colors.green[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: updateSearchQuery,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.separated(
        itemCount: filteredParties.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final party = filteredParties[index];
          return _buildContractingPartyCard(
            name: party['name']!,
            date: party['date']!,
            color: _getCardColor(party['date']!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width relative to screen size
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Ensure the dialog takes only the required height
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        labelText: "اسم جهة التعاقد",
                        prefixIcon: Icons.business,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "تاريخ انتهاء التعاقد ",
                        prefixIcon: Icons.calendar_month,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'اضافة',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildContractingPartyCard({
    required String name,
    required String date,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'تاريخ انتهاء التعاقد : $date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            Icon(
              Icons.business,
              size: 40,
              color: Colors.blue[800],
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.8, // Adjust width relative to screen size
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure the dialog takes only the required height
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextField(
                              labelText: "اسم جهة التعاقد",
                              prefixIcon: Icons.business,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              labelText: "تاريخ انتهاء التعاقد ",
                              prefixIcon: Icons.calendar_month,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'تعديل',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.edit,
              ),
              color: Colors.blue[800],
            )
          ],
        ),
      ),
    );
  }
}

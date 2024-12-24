import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_care/widget.dart';

class ProfessionalDesignPage extends StatefulWidget {
  @override
  _ProfessionalDesignPageState createState() => _ProfessionalDesignPageState();
}

class _ProfessionalDesignPageState extends State<ProfessionalDesignPage> {
  final List<Map<String, String>> data = List.generate(
    10,
    (index) => {
      'id': 'ID${Random().nextInt(9999).toString().padLeft(4, '0')}',
      'name': 'المستخدم ${index + 1}',
      'points': (Random().nextInt(1000) + 1).toString(),
      'phone': '050${Random().nextInt(9999999).toString().padLeft(7, '0')}',
    },
  );

  List<Map<String, String>> filteredData = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredData = data; // Initially, show all data
  }

  void _filterData(String query) {
    setState(() {
      searchQuery = query;
      filteredData = data.where((user) {
        final id = user['id']!.toLowerCase();
        final name = user['name']!.toLowerCase();
        final lowerCaseQuery = query.toLowerCase();
        return id.contains(lowerCaseQuery) || name.contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        labelText: "اسم العميل",
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "الرقم القومي",
                        prefixIcon: Icons.credit_card_rounded,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: "عدد النقاط",
                        prefixIcon: Icons.stars,
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
      appBar: AppBar(
        title: Text('الأفراد'),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: _filterData,
              decoration: InputDecoration(
                hintText: 'ابحث باستخدام الرقم القومي أو الاسم',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(10),
              itemCount: filteredData.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final user = filteredData[index];
                return _buildUserCard(
                  id: user['id']!,
                  name: user['name']!,
                  points: user['points']!,
                  phone: user['phone']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard({
    required String id,
    required String name,
    required String points,
    required String phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
        border: Border.all(
          color: Colors.blue[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust width relative to screen size
                            child: Column(
                              mainAxisSize: MainAxisSize
                                  .min, // Ensure the dialog takes only the required height
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  labelText: "اسم العميل",
                                  prefixIcon: Icons.person,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  labelText: "الرقم القومي",
                                  prefixIcon: Icons.credit_card_rounded,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  labelText: "عدد النقاط",
                                  prefixIcon: Icons.stars,
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
                  icon: Icon(Icons.edit)),
              Spacer(),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.person,
                color: Colors.blue[800],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 5),
              Text(
                '$id',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'الرقم القومي',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.yellow[700], size: 20),
              SizedBox(width: 5),
              Text(
                'النقاط: $points',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.phone, color: Colors.green[700], size: 20),
              SizedBox(width: 5),
              Text(
                'الهاتف: $phone',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

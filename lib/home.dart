import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/Contracting%20parties..dart';
import 'package:health_care/clients.dart';
import 'package:health_care/register.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildContainer(
                title: 'جهات التعاقد',
                icon: Icons.business,
                color: Colors.blue[200]!,
                onTap: () {
                  Get.to(() => ContractingPartiesPage());
                },
              ),
              const SizedBox(height: 16),
              _buildContainer(
                title: 'الأفراد',
                icon: Icons.people,
                color: Colors.green[200]!,
                onTap: () {
                  Get.to(() => ProfessionalDesignPage());
                },
              ),
              const SizedBox(height: 16),
              _buildContainer(
                title: 'تسجيل زيارة',
                icon: Icons.event,
                color: Colors.orange[200]!,
                onTap: () {
                  Get.to(() => register());
                },
              ),
              const SizedBox(height: 16),
              _buildContainer(
                title: 'المستخدمين',
                icon: Icons.person,
                color: Colors.purple[200]!,
                onTap: () {
                  // Handle navigation or action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100, // Decreased height
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Icon(icon, size: 40, color: Colors.white), // Smaller icon
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16, // Reduced font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

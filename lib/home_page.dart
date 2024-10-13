import 'package:flutter/material.dart';
import 'module1_page.dart';
import 'module2_page.dart';
import 'module3_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.home, color: Colors.blue[300], size: 30),
                  const SizedBox(width: 8),
                  Text(
                    'BelajarYuk',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Modul Pembelajaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ModuleCard(
                title: 'Modul 1',
                subtitle: 'Kubus',
                color: Colors.lightBlue[200]!,
                onTap: () => _navigateToModulePage(context, 1, 'Kubus'),
              ),
              const SizedBox(height: 16),
              ModuleCard(
                title: 'Modul 2',
                subtitle: 'Balok',
                color: Colors.blue,
                onTap: () => _navigateToModulePage(context, 2, 'Balok'),
              ),
              const SizedBox(height: 16),
              ModuleCard(
                title: 'Modul 3',
                subtitle: 'Kerucut',
                color: Colors.blue,
                onTap: () => _navigateToModulePage(context, 3, 'Kerucut'),
              ),
              const Spacer(),
              const BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToModulePage(BuildContext context, int moduleNumber, String subtitle) {
    Widget page;
    switch (moduleNumber) {
      case 1:
        page = Module1Page(title: 'Modul 1', subtitle: subtitle);
        break;
      case 2:
        page = Module2Page(title: 'Modul 2', subtitle: subtitle);
        break;
      case 3:
        page = Module3Page(title: 'Modul 3', subtitle: subtitle);
        break;
      default:
        page = Module1Page(title: 'Modul 1', subtitle: subtitle);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const ModuleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomNavItem(
          icon: Icons.home,
          label: 'Home',
          isActive: true,
          onTap: () {
            // Already on home page
          },
        ),
        BottomNavItem(
          icon: Icons.library_books_rounded,
          label: 'Quiz',
          isActive: false,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Quiz page not implemented')),
            );
          },
        ),
      ],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

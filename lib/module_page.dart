import 'package:flutter/material.dart';

class ModulePage extends StatelessWidget {
  final String title;
  final String subtitle;

  const ModulePage({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title - $subtitle'),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title - $subtitle',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris. Ut tempor elit vitae dapibus varius. Vivamus nec dignissim mi. Fusce malesuada nisl eu mi vehicula, at egestas est vehicula. Sed id est ac orci elementum cursus. Morbi fringilla nec nisl in vestibulum. Nullam tincidunt, orci eu scelerisque cursus, nisl odio consequat elit, id ultricies nisl odio in nulla. Aliquam erat volutpat. Aenean ultrices augue non purus ultricies, nec suscipit urna imperdiet. Suspendisse velit in ante auctor efficitur. Etiam vel dui a leo aliquet facilisis in ac metus. Fusce at amet felis sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus in sodales sapien. Pellentesque venenatis augue felis, a fermentum lectus congue non.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Quiz functionality not implemented')),
                  );
                },
                child: const Text('Quiz'),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomNavItem(
          icon: Icons.home,
          label: 'Home',
          isActive: false,
          onTap: () {
            Navigator.of(context).pop();
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
    Key? key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

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
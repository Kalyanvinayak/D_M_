import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final int currentIndex;
  final String profileImageUrl;

  static const IconData accountCircleOutlined =
  IconData(0xee35, fontFamily: 'MaterialIcons');

  const CommonScaffold({
    Key? key,
    required this.body,
    this.title = '',
    this.currentIndex = 0,
    this.profileImageUrl = 'https://via.placeholder.com/150',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0D47A1); // Dark Blue

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      accountCircleOutlined,
                      size: 32,
                      color: Colors.black,
                    );
                  },
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Navigate to profile
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context), // Add the drawer here
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/refugee_camp');
              break;
            case 2:
              Navigator.pushNamed(context, '/sos');
              break;
            case 3:
              Navigator.pushNamed(context, '/user_guide');
              break;
            case 4:
              Navigator.pushNamed(context, '/call');
              break;
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Refugee Camp',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8), // Makes the icon bigger
              decoration: BoxDecoration(
                color: Color(0xFFB01629),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.sos, color: Colors.white, size: 40), // Larger size
            ),
            label: 'SOS',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'User Guide',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
        ],
      ),
    );
  }

  // Build the drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[300],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[900]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                      profileImageUrl,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          accountCircleOutlined,
                          size: 35,
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome!",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/profile'); // Navigate to profile
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.white),
            title: const Text(
              "Community",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/community'); // Navigate to community
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.white),
            title: const Text(
              "Help",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // TODO: Implement help action
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // TODO: Implement settings action
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white),
            title: const Text(
              "E-Sahyog",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
            Navigator.pushNamed(context, '/ai_chatbot'); // Navigate to chatbot page
           },
          ),
          const Divider(color: Colors.white30),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signed Out')),
              );
            },
          ),
        ],
      ),
    );
  }
}
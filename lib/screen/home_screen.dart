import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'video_screen.dart';
import 'member_screen.dart';
import 'discography_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _selectedIndex == 0
          ? Schedule()
          : _selectedIndex == 1
          ? const VideoScreen()
          : _selectedIndex == 2
          ? const MemberScreen()
          : const DiscographyScreen(),
    );
  }

  SingleChildScrollView Schedule() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'lib/assets/H2h.jpeg',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ).withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 140, 
                child: const Text(
                  "Hearts2Hearts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Section Title
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFB3E5FC),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Upcoming Schedule",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Events
          const EventCard(
            title: "MC A-NA Show! Music Core",
            date: "November 1, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "FOCUS Show! Music Core",
            date: "November 1, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "Offline Fansign Event Music Korea",
            date: "November 1, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "FOCUS Inkigayo",
            date: "November 2, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "VCE KMStation",
            date: "November 4, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "Fansign StarRiver",
            date: "November 5, 2025",
            location: "China",
          ),
          const EventCard(
            title: "Fansign StarRiver",
            date: "November 6, 2025",
            location: "China",
          ),
          const EventCard(
            title: "FOCUS Music Bank",
            date: "November 7, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "Fansign Event SMTOWN",
            date: "November 7, 2025",
            location: "Seoul, South Korea",
          ),
          const EventCard(
            title: "MC A-NA Show! Music Core",
            date: "November 8, 2025",
            location: "Seoul, South Korea",
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'HeartSync',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Image.asset('lib/assets/h2h_logo.png'),
      ),
    );
  }
}

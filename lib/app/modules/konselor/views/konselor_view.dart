import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const KonselorView());
}

class KonselorView extends StatelessWidget {
  const KonselorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konselor App',
      theme: ThemeData(
        primaryColor: const Color(0xFF01574A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF01574A),
          primary: const Color(0xFF01574A),
        ),
        scaffoldBackgroundColor: const Color(0xFFECF7F1),
        fontFamily: 'SF Pro Display',
      ),
      home: const KonselorHomePage(),
    );
  }
}

class KonselorHomePage extends StatelessWidget {
  const KonselorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  const Text(
                    'Konselor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none, color: Colors.black),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            
            // Featured Doctors (horizontal scrolling)
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildFeaturedDoctor(
                    name: 'Lukman Hakim', 
                    rating: 4.8, 
                    date: '5 Oct', 
                    time: '10:30pm'
                  ),
                  const SizedBox(width: 16),
                  _buildFeaturedDoctor(
                    name: 'Kanya Neisya', 
                    rating: 4.8, 
                    date: '6 Oct', 
                    time: '10:30am'
                  ),
                ],
              ),
            ),
            
            // Find Doctors Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Find Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Doctor List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildDoctorCard(
                    name: 'Jennifer Miller',
                    rating: 4.8,
                    time: '10:30am - 5:30pm',
                    isFavorite: false,
                  ),
                  const SizedBox(height: 16),
                  _buildDoctorCard(
                    name: 'Robert Johnson',
                    rating: 4.8,
                    time: '10:30am - 5:30pm',
                    isFavorite: true,
                  ),
                  const SizedBox(height: 16),
                  _buildDoctorCard(
                    name: 'Laura White',
                    rating: 4.8,
                    time: '10:30am - 5:30pm',
                    isFavorite: false,
                  ),
                  const SizedBox(height: 16),
                  _buildDoctorCard(
                    name: 'Brian Clark',
                    specialty: 'Psychiatrist | ABC hospital',
                    rating: 4.8,
                    time: '10:30am - 5:30pm',
                    isFavorite: false,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedDoctor({
    required String name,
    required double rating,
    required String date,
    required String time,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF01574A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                'https://via.placeholder.com/40',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '$rating',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard({
    required String name,
    String? specialty,
    required double rating,
    required String time,
    required bool isFavorite,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/48',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (specialty != null)
                        Text(
                          specialty,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey[300],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  '$rating',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF01574A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
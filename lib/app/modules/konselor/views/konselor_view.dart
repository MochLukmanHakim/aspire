import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aspireget/app/modules/notifikasi/views/notifikasi_view.dart';
import '../../histori_artikel/views/histori_artikel_view.dart';
import '../../logout/views/logout_view.dart';

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
        primaryColor: const Color(0xFF2A6352),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A6352),
          primary: const Color(0xFF2A6352),
          secondary: const Color(0xFF64B6AC),
          tertiary: const Color(0xFFD9FFF8),
          background: const Color(0xFFF9FAFB),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black12,
        ),
      ),
      home: const KonselorHomePage(),
    );
  }
}

class KonselorHomePage extends StatelessWidget {
  const KonselorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Modern App Bar
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
  child: Row(
    children: [
      const SizedBox(width: 8),
      Text(
        'Konselor',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
      const Spacer(),
      PopupMenuButton<String>(
  onSelected: (String value) {
    // Handle menu selection
    switch (value) {
      case 'favorit':
        // Aksi untuk favorit
        Get.to(() => HistoriArtikelView());
        // Tambahkan logika favorit di sini
        break;
      case 'notifikasi':
    Get.to(() => NotifikasiView());
        break;
      case 'logout':
        // Aksi untuk logout
       showLogoutDialog(context);
        // Tambahkan logika logout di sini
        break;
    }
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
      value: 'favorit',
      child: Row(
        children: [
          Icon(
            Icons.bookmark_border,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Favorit'),
        ],
      ),
    ),
    const PopupMenuItem<String>(
      value: 'notifikasi',
      child: Row(
        children: [
          Icon(
            Icons.notifications_outlined,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Notifikasi'),
        ],
      ),
    ),
    const PopupMenuItem<String>(
      value: 'logout',
      child: Row(
        children: [
          Icon(
            Icons.logout,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Logout'),
        ],
      ),
    ),
  ],
  child: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Icon(
      Icons.more_vert,
      color: Color(0xFF2A6352),
      size: 18,
    ),
  ),
)
    ],
  ),
),

            // Modern Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search counselor',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
            
            
            // Featured Counselors Section Title
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Konselor Terjadwal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Row(
                      children: [
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Featured Counselors
            SizedBox(
  height: 130,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    children: [
     _buildUpcomingAppointmentCard(
  name: 'Bpk. Rahmat S.Pd',
  rating: 4.8,
  date: 'Saat ini',
  time: '',
  profileImage: 'assets/images/konselor1.png',
  theme: theme,
  status: 'ongoing', // Status diterima
),
const SizedBox(width: 16),
_buildUpcomingAppointmentCard(
  name: 'Ibu. Sujiati S.Pd',
  rating: 4.9,
  date: '6 Oct',
  time: '10:30 AM',
  profileImage: 'assets/images/konselor2.png',
  theme: theme,
  status: 'pending', // Status menunggu
),
    ],
  ),
),
            
            
            // Popular Counselors Section Title
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar Konselor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Row(
                      children: [
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Popular Counselors List
             Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildDoctorCard(
                    name: 'Bpk. Rahmat ',
                    rating: 4.8,
                    terjadwal: '5 orang',
                    availableTime: '09.00 - 15.30',
                    profileImage: 'assets/images/konselor1.png',
                    theme: theme,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                 _buildDoctorCard(
                    name: 'Bu. Sujiati',
                    rating: 4.9,
                    terjadwal: '7 orang',
                    availableTime: '08.00 - 16.00',
                    profileImage: 'assets/images/konselor2.png', 
                    theme: theme,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildDoctorCard(
                    name: 'Bpk. Ahmad Supriyadi',
                    rating: 4.7,
                    terjadwal: '4 orang',
                    availableTime: '11.00 - 15.00',
                    profileImage: 'assets/images/konselor3.png', 
                    theme: theme,
                    context: context,
                  ),
                  _buildDoctorCard(
                    name: 'Ibu. Sari Indah',
                    rating: 4.7,
                    terjadwal: '4 orang',
                    availableTime: '11.00 - 15.00',
                    profileImage: 'assets/images/konselor4.png', 
                    theme: theme,
                    context: context,
                  ),
                  _buildDoctorCard(
                    name: 'Bpk. Budi Santosor',
                    rating: 4.7,
                    terjadwal: '4 orang',
                    availableTime: '11.00 - 15.00',
                    profileImage: 'assets/images/konselor5.png',
                    theme: theme,
                    context: context,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
    
  }

  // Build time range widget
  Widget _buildTimeRange(String timeRange, ThemeData theme) {
    return Text(
      timeRange,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.primary,
      ),
    );
  }

 Widget _buildUpcomingAppointmentCard({
  required String name,
  required double rating,
  required String date,
  required String time,
  required String profileImage,
  required ThemeData theme,
  String status = 'upcoming', 
}) {
  // Fungsi untuk mendapatkan warna garis status

  // Fungsi untuk mendapatkan text status
  String getStatusText() {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return 'Diterima';
      case 'pending':
        return 'Menunggu';
      default:
        return '';
    }
  }

  // Fungsi untuk format tanggal berdasarkan status
  String getFormattedDate() {
    if (status.toLowerCase() == 'ongoing') {
      return 'Saat ini';
    }
    return date;
  }

  // Fungsi untuk format waktu berdasarkan status
  String getFormattedTime() {
    if (status.toLowerCase() == 'ongoing') {
      return 'Konsultasi aktif';
    }
    return time;
  }

  return Container(
    width: 220,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.primary.withOpacity(0.8),
        ],
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: theme.colorScheme.primary.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    if (getStatusText().isNotEmpty)
                      Text(
                        getStatusText(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    getFormattedDate(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              if (getFormattedTime().isNotEmpty)
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      getFormattedTime(),
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
  required double rating,
  required String terjadwal,
  required String availableTime,
  required String profileImage,
  required ThemeData theme,
  required BuildContext context,
  bool isBookmarked = false,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: theme.colorScheme.tertiary,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isBookmarked 
                              ? theme.colorScheme.primary.withOpacity(0.1) 
                              : Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: isBookmarked ? theme.colorScheme.primary : Colors.grey[400],
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(
                          icon: Icons.work_outline_rounded,
                          label: terjadwal,
                          iconColor: theme.colorScheme.primary,
                          theme: theme,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Available Time Range
                    Row(
                      children: [
                        Text(
                          'Waktu Tersedia:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildTimeRange(availableTime, theme),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Pilih waktu konsultasi',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => _selectConsultationDateTime(context, name),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Pilih Waktu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Fungsi untuk memilih tanggal dan jam konsultasi
void _selectConsultationDateTime(BuildContext context, String doctorName) {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Pilih Waktu Konsultasi',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Text(
              'Dr. $doctorName',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            
            // Date Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Pilih Tanggal',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(7, (index) {
                        final date = DateTime.now().add(Duration(days: index));
                        final isSelected = selectedDate.day == date.day && 
                                         selectedDate.month == date.month;
                        
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                              selectedTime = null; // Reset time when date changes
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected 
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected 
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey[300]!,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  _getDayName(date.weekday),
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey[600],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Time Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Pilih Jam',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            
            // Time slots
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: _getAvailableTimeSlots().length,
                  itemBuilder: (context, index) {
                    final timeSlot = _getAvailableTimeSlots()[index];
                    final isAvailable = timeSlot['available'] as bool;
                    final time = timeSlot['time'] as String;
                    final isSelected = selectedTime == time;
                    
                    return GestureDetector(
                      onTap: isAvailable ? () {
                        setState(() {
                          selectedTime = time;
                        });
                      } : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected 
                            ? Theme.of(context).colorScheme.primary
                            : isAvailable 
                              ? Colors.white 
                              : Colors.grey[200],
                          border: Border.all(
                            color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : isAvailable 
                                ? Theme.of(context).colorScheme.primary 
                                : Colors.grey[300]!,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            time,
                            style: TextStyle(
                              color: isSelected 
                                ? Colors.white
                                : isAvailable 
                                  ? Theme.of(context).colorScheme.primary 
                                  : Colors.grey[500],
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Confirm Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedTime != null ? () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Konsultasi dijadwalkan: ${_formatDate(selectedDate)} jam $selectedTime dengan Dr. $doctorName'
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    selectedTime != null 
                      ? 'Konfirmasi Jadwal'
                      : 'Pilih jam terlebih dahulu',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Helper functions
String _getDayName(int weekday) {
  const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  return days[weekday - 1];
}

String _formatDate(DateTime date) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}

// Fungsi untuk mendapatkan slot waktu yang tersedia
List<Map<String, dynamic>> _getAvailableTimeSlots() {
  return [
    {'time': '08:00', 'available': true},
    {'time': '08:30', 'available': true},
    {'time': '09:00', 'available': false},
    {'time': '09:30', 'available': true},
    {'time': '10:00', 'available': true},
    {'time': '10:30', 'available': false},
    {'time': '11:00', 'available': true},
    {'time': '11:30', 'available': true},
    {'time': '13:00', 'available': true},
    {'time': '13:30', 'available': false},
    {'time': '14:00', 'available': true},
    {'time': '14:30', 'available': true},
    {'time': '15:00', 'available': true},
    {'time': '15:30', 'available': false},
    
  ];
}


  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color iconColor,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
            color: iconColor,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
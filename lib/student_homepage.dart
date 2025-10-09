import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yuk_ujian/editprofile_guru.dart';
import 'package:yuk_ujian/editprofile_siswa.dart';
import 'package:yuk_ujian/list_ujian.dart';
import 'package:yuk_ujian/login_screen.dart';
import 'package:yuk_ujian/welcome_screen.dart';

import 'util/job_card.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override 
  State<StudentHomePage> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  int _currentIndex = 0;
  
  final List<Map<String, String>> daftarCard = [
    {
      'judul': 'Ujian Matematika',
      'gambar': 'assets/english.png',
      'subtitle': 'Dikerjakan: 30 Mei 2025',
    },
    {
      'judul': 'Ujian IPA',
      'gambar': 'assets/math.png',
      'subtitle': 'Dikerjakan: 17 Mei 2025',
    },
    {
      'judul': 'Ujian Matematika',
      'gambar': 'assets/english.png',
      'subtitle': 'Dikerjakan: 28 Mei 2025',
    },
    {
      'judul': 'Ujian IPA',
      'gambar': 'assets/math.png',
      'subtitle': 'Dikerjakan: 20 Mei 2025',
    },
  ];

  List<Map<String, dynamic>> classes = [
    {
      'id': '1',
      'title': 'IPS Kelas 9A',
      'namaGuru': 'Bu Mia',
      'color': Colors.blue,
      'students': [
        {'name': 'Ahmad Rizki', 'score': 85},
        {'name': 'Siti Nurhaliza', 'score': 92},
        {'name': 'Budi Santoso', 'score': 78},
        {'name': 'Dewi Sartika', 'score': 89},
        {'name': 'Eko Prasetyo', 'score': 76},
      ],
      'averageScore': 84.0,
    },
    {
      'id': '2',
      'title': 'Matematika Tingkat Kelas 9A',
      'namaGuru': 'Bu Madelyn',
      'color': Colors.green,
      'students': [
        {'name': 'Andi Wijaya', 'score': 88},
        {'name': 'Citra Dewi', 'score': 91},
        {'name': 'Doni Pratama', 'score': 82},
        {'name': 'Fitri Handayani', 'score': 87},
      ],
      'averageScore': 87.0,
    },
    {
      'id': '3',
      'title': 'Bahasa Inggris Kelas 9A',
      'namaGuru': 'Bu Kiara',
      'color': Colors.purple,
      'students': [
        {'name': 'Galih Perdana', 'score': 79},
        {'name': 'Hani Saskia', 'score': 94},
        {'name': 'Irfan Hakim', 'score': 86},
      ],
      'averageScore': 86.3,
    },
    {
      'id': '4',
      'title': 'IPA Kelas 9A',
      'namaGuru': 'Bu Yayuk',
      'color': Colors.orange,
      'students': [
        {'name': 'Joko Susilo', 'score': 83},
        {'name': 'Kartika Sari', 'score': 90},
        {'name': 'Lukman Hakim', 'score': 77},
        {'name': 'Maya Sinta', 'score': 85},
      ],
      'averageScore': 83.8,
    },
  ];

  

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage(); 
      case 1:
        return _buildBookPage(); 
      case 2:
        return _buildStatsPage(); 
      case 3:
        return _buildProfilePage(); 
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Color(0xFF191265),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Auxilia',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '28 Mei, 2025',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF36307C),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF36307C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          
                  _buildCardIlustrasi(),
                  const SizedBox(height: 24),
                  Container(
              decoration: BoxDecoration(
                color: Color(0xFFEDF1F6),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'Pilih Kelas Anda',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  _buildQuickActions(),
                  const SizedBox(height: 24),

                Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ujian Yang Baru Dikerjakan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                _currentIndex = 1;
                              });
                              },
                              icon: Icon(Icons.more_horiz,
                              color: Colors.grey[600],
                              ),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: daftarCard.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,  
                            crossAxisSpacing: 16,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            final item = daftarCard[index];
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                color: Color(0xFFF8FAFC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  side: BorderSide(
                                    color: Color(0xFF191265),
                                    width: 2,
                                  )
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey[200],
                                          ),
                                          padding: EdgeInsets.all(2),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              item['gambar']!,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        item['judul']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ), 
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        item['subtitle'] ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
         Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: _buildClassButton(
              label: 'Kelas 7',
              grade: 7,
              color: Color(0xFF96ADD6),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => UjianTersediaPage()),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildClassButton(
              label: 'Kelas 8',
              grade: 8,
              color: Color(0xFF364C84),
              onTap: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildClassButton(
              label: 'Kelas 9',
              grade: 9,
              color: Color(0xFF96ADD6),
              onTap: () {},
            ),
          ),
                  ],
      ),
    );
  }
  Widget _buildClassButton({
    required String label,
    required int grade,
    required Color color,
    required VoidCallback onTap,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withOpacity(isHovered ? 0.9 : 0.8),
                    color.withOpacity(isHovered ? 0.7 : 0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(isHovered ? 0.4 : 0.2),
                    blurRadius: isHovered ? 12 : 8,
                    offset: Offset(0, isHovered ? 6 : 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: 
                  BorderRadius.circular(12),
                  onTap: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardIlustrasi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Ilustrasi
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFEDF1F6),
                borderRadius: 
                BorderRadius.circular(12),
              ),
              height: 130,
              width: 130,
              child: Image.asset(
                'assets/snowman.png',
              ),
            ),
            const SizedBox(width: 16),
            // Card content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sudah Siap Hari Ini?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Selamat datang, siswa hebat. Lakukan yang terbaik!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Halaman Perpustakaan Soal
Widget _buildBookPage() {
  return SafeArea(
    child: Container(
      color: Color(0xFFEDF1F6),
      child: Column(
        children: [
          // Header
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => StudentHomePage()),
                          );
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        'History Soal',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
          SizedBox(height: 5),
          
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  // Card Soal 1
                  _buildQuizCard(
                    title: 'Ujian Tengah Semester 1 Matematika',
                    description: 'Untuk Kelas 9',
                    questionCount: 30,
                    category: 'Matematika',
                    isActive: true,
                  ),
                  
                  // Card Soal 2
                  _buildQuizCard(
                    title: 'Ulangan Harian Matematika : Bab 1',
                    description: 'Untuk Kelas 9',
                    questionCount: 20,
                    category: 'Matematika',
                    isActive: true,
                  ),
                  
                  // Card Soal 4
                  _buildQuizCard(
                    title: 'Ujian Akhir Semester 2 Matematika',
                    description: 'Untuk Kelas 8',
                    questionCount: 20,
                    category: 'Matematika',
                    isActive: true,
                  ),
                  
                  // Card Soal 5
                  _buildQuizCard(
                    title: 'Ulangan Harian Matematika : Bab 3',
                    description: 'Untuk Kelas 8',
                    questionCount: 20,
                    category: 'Matematika',
                    isActive: true,
                  ),

                  // Card Soal 4
                  _buildQuizCard(
                    title: 'Ujian Tengah Semester 2 Matematika',
                    description: 'Untuk Kelas 8',
                    questionCount: 20,
                    category: 'Matematika',
                    isActive: true,
                  ),
                  
                  // Card Soal 5
                  _buildQuizCard(
                    title: 'Ulangan Harian Matematika : Bab 6',
                    description: 'Untuk Kelas 8',
                    questionCount: 20,
                    category: 'Matematika',
                    isActive: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget untuk membuat card soal
Widget _buildQuizCard({
  required String title,
  required String description,
  required int questionCount,
  required String category,
  required bool isActive,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Color(0xFFF8FAFC),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: [
        // Header card dengan status
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isActive ? Color(0xFF191265): Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDF6FB),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFDF6FB),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isActive ? 'Selesai' : 'Belum Di Upload',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Body card dengan detail
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              // Info soal
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.quiz_outlined, size: 20, color: Colors.black),
                    SizedBox(width: 5),
                    Text('$questionCount soal', style: TextStyle(color: Colors.black)),
                    SizedBox(width: 15),
                    Icon(Icons.category_outlined, size: 20, color: Colors.black),
                    SizedBox(width: 5),
                    Text(category, style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Action buttons
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  // Action untuk lihat detail
                },
                icon: Icon(Icons.visibility_outlined, size: 16),
                label: Text('Lihat'),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF081F5C),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


// Halaman Kelas Saya
 Widget _buildStatsPage() {
    return SafeArea(
      child: Container(
        color: Color(0xFFEDF1F6),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFEDF1F6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Kelas Saya',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Content Area
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: classes.length,
                        itemBuilder: (context, index) {
                          return _buildClassCard(classes[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(Map<String, dynamic> classData) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            _showClassDetail(classData);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                // Icon/Logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: classData['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    classData['icon'],
                    color: classData['color'],
                    size: 30,
                  ),
                ),
                
                SizedBox(width: 16),
                
                // Class Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classData['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${classData['namaGuru']}',
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
                
                // Arrow Icon
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddClassDialog() {
    TextEditingController classNameController = TextEditingController();
    TextEditingController namaGuruController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Kelas Baru'),
          content: TextField(
            controller: classNameController,
            decoration: InputDecoration(
              hintText: 'Masukkan nama kelas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (classNameController.text.isNotEmpty) {
                  setState(() {
                    classes.add({
                      'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      'title': classNameController.text,
                      'namaGuru': namaGuruController.text,
                      'icon': Icons.school.codePoint,
                      'color': Colors.teal,
                      'students': <Map<String, dynamic>>[],
                      'averageScore': 0.0,
                    });
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kelas berhasil ditambahkan!')),
                  );
                }
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _showClassDetail(Map<String, dynamic> classData) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Modal
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: classData['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      classData['icon'],
                      color: classData['color'],
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classData['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${classData['namaGuru']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Akurasi Nilai
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Rata-rata Nilai Kelas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${classData['averageScore'].toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 20),
              
              // Daftar Siswa
              Text(
                'Daftar Siswa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: 12),
              
              Expanded(
                child: classData['students'].isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada siswa di kelas ini',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: classData['students'].length,
                        itemBuilder: (context, index) {
                          var student = classData['students'][index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: classData['color'].withOpacity(0.1),
                                  child: Text(
                                    student['name'][0].toUpperCase(),
                                    style: TextStyle(
                                      color: classData['color'],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    student['name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${student['score']}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Halaman Profile
Widget _buildProfilePage() {
  return SafeArea(
    child: Container(
      color: Color(0xFFEDF1F6),
      child: Column(
        children: [
          //Header
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => StudentHomePage()),
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    color: Color(0xFFEDF1F6),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('windah.png'),
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Auxilia Maybank',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'auxilia.maybank@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          title: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text('Ubah informasi profil Anda'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileStudentPage(),
                              ),
                            );
                          },
                        ),
                        
                        Divider(height: 1),
                        
                        // Settings
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.settings,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            'Settings',
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Pengaturan aplikasi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          onTap: null,
                        ),
                        
                        Divider(height: 1),
                        
                        // Notifications
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            'Notifications',
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Atur notifikasi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          onTap: null,
                        ),
                        
                        Divider(height: 1),
                        
                        // Privacy
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.privacy_tip,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            'Privacy',
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Pengaturan privasi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          onTap: null,
                        ),
                        
                        Divider(height: 1),
                        
                        // Logout
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('Keluar dari akun'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
                          onTap: () {
                            // Dialog konfirmasi logout
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi Logout'),
                                  content: Text('Apakah Anda yakin ingin keluar?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Tutup dialog dulu
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Logout berhasil')),
                                        );
                                      },
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(color: Colors.red),
                                      ), 
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ), 
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF191265),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFEDF1F6),
        color: Color(0xFF191265),
        animationDuration: Duration(milliseconds: 400),
        height: 60,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 24),
          Icon(Icons.book, color: Colors.white, size: 24),
          Icon(Icons.co_present, color: Colors.white, size: 24),
          Icon(Icons.person, color: Colors.white, size: 24),
        ],
      ),
      body: _getCurrentPage(),
    );
  }
}
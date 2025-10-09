import 'package:flutter/material.dart';
import 'package:yuk_ujian/student_homepage.dart';
import 'package:yuk_ujian/ujian_page.dart';

class UjianTersediaPage extends StatefulWidget {
  const UjianTersediaPage({Key? key}) : super(key: key);

  @override
  State<UjianTersediaPage> createState() => _UjianTersediaPageState();
}

class _UjianTersediaPageState extends State<UjianTersediaPage> {
  final List<Map<String, String>> daftarUjian = [
    {
      'judul': 'Ujian Matematika Kelas 7',
      'gambar': 'assets/math.png',
      'subtitle': 'Waktu: 90 menit | 25 Soal',
      'deskripsi': 'Ujian tengah semester matematika untuk kelas 9',
      'durasi': '90',
      'jumlahSoal': '25',
    },
    {
      'judul': 'Ujian IPA Biologi',
      'gambar': 'assets/science.png',
      'subtitle': 'Waktu: 60 menit | 20 Soal',
      'deskripsi': 'Ulangan harian materi sistem pencernaan',
      'durasi': '60',
      'jumlahSoal': '20',
    },
    {
      'judul': 'Ujian Bahasa Indonesia',
      'gambar': 'assets/indonesia.png',
      'subtitle': 'Waktu: 75 menit | 30 Soal',
      'deskripsi': 'Ujian pemahaman teks dan tata bahasa',
      'durasi': '75',
      'jumlahSoal': '30',
    },
    {
      'judul': 'Ujian Sejarah',
      'gambar': 'assets/history.png',
      'subtitle': 'Waktu: 45 menit | 15 Soal',
      'deskripsi': 'Materi kemerdekaan Indonesia',
      'durasi': '45',
      'jumlahSoal': '15',
    },
    {
      'judul': 'Ujian Fisika',
      'gambar': 'assets/physics.png',
      'subtitle': 'Waktu: 100 menit | 35 Soal',
      'deskripsi': 'Materi gerak dan gaya',
      'durasi': '100',
      'jumlahSoal': '35',
    },
    {
      'judul': 'Ujian Kimia',
      'gambar': 'assets/chemistry.png',
      'subtitle': 'Waktu: 80 menit | 28 Soal',
      'deskripsi': 'Materi ikatan kimia dan senyawa',
      'durasi': '80',
      'jumlahSoal': '28',
    },
  ];

  void _showExamRulesModal(Map<String, String> ujian) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
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
                      color: Color(0xFF191265).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.quiz,
                      color: Color(0xFF191265),
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ujian['judul']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ujian['deskripsi']!,
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
              
              // Info Ujian
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFEDF1F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.access_time, color: Color(0xFF191265), size: 24),
                        SizedBox(height: 4),
                        Text(
                          '${ujian['durasi']} Menit',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF191265),
                          ),
                        ),
                        Text(
                          'Durasi',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey[300],
                    ),
                    Column(
                      children: [
                        Icon(Icons.quiz_outlined, color: Color(0xFF191265), size: 24),
                        SizedBox(height: 4),
                        Text(
                          '${ujian['jumlahSoal']} Soal',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF191265),
                          ),
                        ),
                        Text(
                          'Jumlah',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 20),
              
              // Peraturan
              Text(
                'Peraturan Ujian',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: 12),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRuleItem(
                        icon: Icons.timer,
                        title: 'Batas Waktu',
                        description: 'Ujian memiliki batas waktu ${ujian['durasi']} menit. Pastikan menyelesaikan semua soal sebelum waktu habis.',
                      ),
                      
                      _buildRuleItem(
                        icon: Icons.phone_android,
                        title: 'Perangkat',
                        description: 'Gunakan perangkat yang stabil dan pastikan koneksi internet lancar selama ujian berlangsung.',
                      ),
                      
                      _buildRuleItem(
                        icon: Icons.visibility_off,
                        title: 'Tidak Boleh Menyontek',
                        description: 'Dilarang keras membuka aplikasi lain, browsing internet, atau bertanya kepada orang lain selama ujian.',
                      ),
                      
                      _buildRuleItem(
                        icon: Icons.save,
                        title: 'Simpan Jawaban',
                        description: 'Jawaban akan tersimpan otomatis. Pastikan menekan tombol "Selesai" ketika sudah mengerjakan semua soal.',
                      ),
                      
                      _buildRuleItem(
                        icon: Icons.warning,
                        title: 'Konsekuensi',
                        description: 'Pelanggaran terhadap peraturan dapat mengakibatkan pembatalan hasil ujian.',
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Checkbox persetujuan
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Color(0xFF191265),
                  ),
                  Expanded(
                    child: Text(
                      'Saya telah membaca dan menyetujui semua peraturan ujian di atas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),
              
              // Button Mulai Ujian
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => QuizApp()),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF191265),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Mulai Ujian',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRuleItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF191265).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Color(0xFF191265),
              size: 16,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _startExam(Map<String, String> ujian) {
    // Di sini nanti bisa navigate ke halaman ujian sebenarnya
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Memulai ujian: ${ujian['judul']}'),
        backgroundColor: Color(0xFF191265),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF1F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFEDF1F6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => StudentHomePage()),
                        );
          },
        ),
        title: Text(
          'Ujian Tersedia',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: daftarUjian.length,
                  itemBuilder: (context, index) {
                    final ujian = daftarUjian[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Card(
                        color: Color(0xFFF8FAFC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                            color: Color(0xFF191265),
                            width: 2,
                          ),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                               
                              ),
                              
                              SizedBox(width: 16),
                              
                              // Konten teks di tengah
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ujian['judul']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      ujian['deskripsi']!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.grey[600],
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${ujian['durasi']} menit',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Icon(
                                          Icons.quiz_outlined,
                                          size: 16,
                                          color: Colors.grey[600],
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${ujian['jumlahSoal']} soal',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              SizedBox(width: 12),
                              
                              // Tombol Kerjakan di sebelah kanan
                              ElevatedButton(
                                onPressed: () {
                                  _showExamRulesModal(ujian);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF191265),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Kerjakan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
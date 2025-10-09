import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuk_ujian/list_ujian.dart';
import 'package:yuk_ujian/student_homepage.dart';
import 'package:yuk_ujian/teacher_homepage.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Sekolah',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedClass;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  
  

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEDF1F6), // Blue background
        ),
        child: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFF8FAFC),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo Image Asset
                            Container(
                              width: 120,
                              height: 120,
                              child: SvgPicture.asset('assets/yukujian_kotak2.svg'),
                            ),
                            SizedBox(height: 20),
                            
                            // Judul
                            Text(
                              'Ujian Semester 2 IPA',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                            SizedBox(height: 10),
                            
                            Text(
                              'Kelas 9',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 40),
                            // Form input nama
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Masukkan Nama',
                                labelStyle: TextStyle(color: Color(0xFF191265)),
                                prefixIcon: Icon(Icons.person, color: Color(0xFF191265)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Color(0xFF191265), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Color(0xFF191265), width: 2),
                                ),
                                filled: true,
                                fillColor: Color(0xFFEDF1F6),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            DropdownButtonFormField<String>(
      value: _selectedClass,
      decoration: InputDecoration(
        labelText: 'Pilih Kelas',
        labelStyle: TextStyle(color: Color(0xFF191265)),
        prefixIcon: Icon(Icons.school, color: Color(0xFF191265)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF191265), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF191265), width: 2),
        ),
        filled: true,
        fillColor: Color(0xFFEDF1F6),
      ),
      style: TextStyle(fontSize: 18, color: Color(0xFF191265)),
      items: ['9A', '9B', '9C', '9D'].map((String kelas) {
        return DropdownMenuItem<String>(
          value: kelas,
          child: Text(kelas),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedClass = newValue;
        });
      },
    ),
    SizedBox(height: 30),
                            // Tombol mulai
                            Container(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_nameController.text.trim().isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizPage(
                                          studentName: _nameController.text.trim(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Mohon masukkan nama terlebih dahulu!'),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF191265),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  'Mulai',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String studentName;

  QuizPage({required this.studentName});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  int currentQuestionIndex = 0;
  int score = 0;
  List<int> selectedAnswers = [];
  
  late AnimationController _progressController;
  late AnimationController _questionController;
  late Animation<double> _progressAnimation;
  late Animation<Offset> _slideAnimation;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'Perhatikan gambar sistem reproduksi manusia! Bagian yang berfungsi sebagai tempat pematangan sel telur adalah?',
      'options': ['Ovarium', 'Tuba falopi', 'Uterus', 'Vagina'],
      'correct': 0,
    },
    {
      'question': 'Pada rangkaian listrik sederhana, jika hambatan (R) diperbesar sedangkan tegangan (V) tetap, maka arus listrik (I) akan?',
      'options': ['Bertambah besar', 'Berkurang', 'Tetap sama', 'Menjadi nol'],
      'correct': 1,
    },
    {
      'question': 'Unsur yang memiliki nomor atom 17 terletak pada golongan dan periode?',
      'options': ['Golongan VIIA, periode 3', 'Golongan VIA, periode 3', 'Golongan VIIA, periode 2', 'Golongan VIIIA, periode 3'],
      'correct': 0,
    },
    {
      'question': 'Proses fotosintesis menghasilkan oksigen yang berasal dari?',
      'options': ['Karbon dioksida (CO₂)', 'Air (H₂O)', 'Glukosa (C₆H₁₂O₆)', 'Klorofil'],
      'correct': 1,
    },
    {
      'question': 'Perhatikan reaksi kimia berikut: 2H₂ + O₂ → 2H₂O. Dalam reaksi tersebut, yang berperan sebagai reaktan adalah?',
      'options': ['H₂O saja', 'O₂ saja', 'H₂ dan O₂', 'H₂ saja'],
      'correct': 2,
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, -1);
    
    _progressController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    
    _questionController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    
    _progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _questionController,
      curve: Curves.easeInOut,
    ));
    
    _questionController.forward();
    _updateProgress();
  }

  void _updateProgress() {
    _progressController.animateTo((currentQuestionIndex + 1) / questions.length);
  }

  @override
  void dispose() {
    _progressController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
      _questionController.reset();
      _questionController.forward();
      _updateProgress();
    } else {
      _calculateScore();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            studentName: widget.studentName,
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  void _calculateScore() {
    score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['correct']) {
        score++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF191265),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.studentName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${currentQuestionIndex + 1}/${questions.length}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    
                    // Progress Bar Animasi
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: _progressAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF191265),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              
              // Pertanyaan
              Expanded(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF1F6),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pertanyaan ${currentQuestionIndex + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        
                        Text(
                          questions[currentQuestionIndex]['question'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 30),
                        
                        // Pilihan jawaban
                        Expanded(
                          child: ListView.builder(
                            itemCount: questions[currentQuestionIndex]['options'].length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedAnswers[currentQuestionIndex] == index;
                              
                              return Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Material(
                                  borderRadius: BorderRadius.circular(15),
                                  color: isSelected 
                                      ? Color(0xFF191265).withOpacity(0.1)
                                      : Colors.grey[100],
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      setState(() {
                                        selectedAnswers[currentQuestionIndex] = index;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: isSelected 
                                              ? Color(0xFF191265)
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected 
                                                  ? Color(0xFF191265)
                                                  : Colors.grey[300],
                                            ),
                                            child: Center(
                                              child: Text(
                                                String.fromCharCode(65 + index),
                                                style: TextStyle(
                                                  color: isSelected 
                                                      ? Colors.white 
                                                      : Colors.grey[600],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Expanded(
                                            child: Text(
                                              questions[currentQuestionIndex]['options'][index],
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: isSelected 
                                                    ? Color(0xFF191265)
                                                    : Colors.black87,
                                                fontWeight: isSelected 
                                                    ? FontWeight.w600 
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // Tombol Next
                        Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: selectedAnswers[currentQuestionIndex] != -1 
                                ? _nextQuestion 
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedAnswers[currentQuestionIndex] != -1
                                  ? Color(0xFF191265)
                                  : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              currentQuestionIndex == questions.length - 1 
                                  ? 'Selesai' 
                                  : 'Lanjut',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
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
}

class ResultPage extends StatefulWidget {
  final String studentName;
  final int score;
  final int totalQuestions;

  ResultPage({
    required this.studentName,
    required this.score,
    required this.totalQuestions,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with TickerProviderStateMixin {
  late AnimationController _scoreController;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    
    _scoreController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _scoreAnimation = Tween<double>(
      begin: 0,
      end: widget.score.toDouble(),
    ).animate(CurvedAnimation(
      parent: _scoreController,
      curve: Curves.elasticOut,
    ));
    
    _scoreController.forward();
  }

  @override
  void dispose() {
    _scoreController.dispose();
    super.dispose();
  }

  String _getGrade() {
    double percentage = (widget.score / widget.totalQuestions) * 100;
    if (percentage >= 90) return 'A+';
    if (percentage >= 80) return 'A';
    if (percentage >= 70) return 'B';
    if (percentage >= 60) return 'C';
    return 'D';
  }

  String _getMessage() {
    double percentage = (widget.score / widget.totalQuestions) * 100;
    if (percentage >= 90) return 'Luar Biasa!';
    if (percentage >= 80) return 'Bagus Sekali!';
    if (percentage >= 70) return 'Cukup Baik!';
    if (percentage >= 60) return 'Perlu Belajar Lagi';
    return 'Semangat Belajar!';
  }

  Color _getGradeColor() {
    double percentage = (widget.score / widget.totalQuestions) * 100;
    if (percentage >= 90) return Color(0xFF191265);
    if (percentage >= 80) return Color(0xFF191265);
    if (percentage >= 70) return Color(0xFF191265);
    return Color(0xFF191265);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEDF1F6),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      
                      Text(
                        'Ujian Selesai',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF191265),
                        ),
                      ),
                      SizedBox(height: 40),
                      
                      // Score dengan animasi
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: _getGradeColor().withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _getGradeColor(),
                            width: 3,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Skor Kamu',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 10),
                            
                            AnimatedBuilder(
                              animation: _scoreAnimation,
                              builder: (context, child) {
                                return Text(
                                  '${_scoreAnimation.value.round()}/${widget.totalQuestions}',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: _getGradeColor(),
                                  ),
                                );
                              },
                            ),
                            
                            Text(
                              '${((widget.score / widget.totalQuestions) * 100).round()}%',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: _getGradeColor(),
                              ),
                            ),
                            SizedBox(height: 15),
                            
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: _getGradeColor(),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Grade ${_getGrade()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      
                      // Pesan
                      Text(
                        _getMessage(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF191265),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      
                      // Tombol selesai
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 55,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => StudentHomePage()),
                        );
                                },
                                label: Text(
                                  'Selesai',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF191265),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
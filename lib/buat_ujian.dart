import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuk_ujian/teacher_homepage.dart';

class BuatUjianPage extends StatefulWidget {
  const BuatUjianPage({Key? key}) : super(key: key);

  @override 
  State<BuatUjianPage> createState() => _BuatUjianPage();
}

class _BuatUjianPage extends State<BuatUjianPage> {
  @override
  final TextEditingController _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _nextToCreateQuestions() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateQuestionPage(
            examTitle: _titleController.text,
          ),
        ),
      );
    }
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
              MaterialPageRoute(builder: (context) => TeacherHomePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 130),
                
                // Logo App
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SvgPicture.asset(
                    'assets/yukujian_kotak.svg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    ),
                  ),

                
                SizedBox(height: 40),
                
                // Title Text
                Text(
                  'Mulai Membuat Ujian',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 5),
                
                Text(
                  'Berikan judul yang menarik untuk ujian Anda',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 40),
                
                // Input Field untuk Judul Ujian
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      hintText: 'Contoh: Ujian Matematika Kelas 7',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.edit_note,
                        color: Color(0xFF191265),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF191265)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 30),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextToCreateQuestions,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF191265),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Mulai sekarang',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Model untuk Question
class Question {
  final String id;
  final String type; // 'multiple_choice' atau 'essay'
  final String question;
  final List<String>? options; // Untuk pilihan ganda
  final String correctAnswer;

  Question({
    required this.id,
    required this.type,
    required this.question,
    this.options,
    required this.correctAnswer,
  });
}

// Halaman untuk membuat soal ujian
class CreateQuestionPage extends StatefulWidget {
  final String examTitle;
  
  CreateQuestionPage({required this.examTitle});

  @override
  _CreateQuestionPageState createState() => _CreateQuestionPageState();
}

class _CreateQuestionPageState extends State<CreateQuestionPage> {
  List<Question> questions = [];
  bool showQuestionTypeDialog = false;
  bool showQuestionForm = false;
  String selectedQuestionType = '';

  // Form controllers
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _optionAController = TextEditingController();
  final TextEditingController _optionBController = TextEditingController();
  final TextEditingController _optionCController = TextEditingController();
  final TextEditingController _optionDController = TextEditingController();
  final TextEditingController _essayAnswerController = TextEditingController();
  String _selectedCorrectAnswer = 'A';

  @override
  void dispose() {
    _questionController.dispose();
    _optionAController.dispose();
    _optionBController.dispose();
    _optionCController.dispose();
    _optionDController.dispose();
    _essayAnswerController.dispose();
    super.dispose();
  }

  void _showQuestionTypeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Pilih Tipe Soal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF191265),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQuestionTypeOption(
                'Pilihan Ganda',
                Icons.radio_button_checked,
                'multiple_choice',
              ),
              SizedBox(height: 16),
              _buildQuestionTypeOption(
                'Essay',
                Icons.edit_note,
                'essay',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuestionTypeOption(String title, IconData icon, String type) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedQuestionType = type;
          showQuestionForm = true;
        });
        Navigator.of(context).pop();
        _clearForm();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF191265)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF191265)),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearForm() {
    _questionController.clear();
    _optionAController.clear();
    _optionBController.clear();
    _optionCController.clear();
    _optionDController.clear();
    _essayAnswerController.clear();
    _selectedCorrectAnswer = 'A';
  }

  void _saveQuestion() {
    if (_questionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pertanyaan tidak boleh kosong')),
      );
      return;
    }

    if (selectedQuestionType == 'multiple_choice') {
      if (_optionAController.text.isEmpty ||
          _optionBController.text.isEmpty ||
          _optionCController.text.isEmpty ||
          _optionDController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Semua pilihan harus diisi')),
        );
        return;
      }
    } else if (selectedQuestionType == 'essay') {
      if (_essayAnswerController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Jawaban essay tidak boleh kosong')),
        );
        return;
      }
    }

    Question newQuestion = Question(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: selectedQuestionType,
      question: _questionController.text,
      options: selectedQuestionType == 'multiple_choice'
          ? [
              _optionAController.text,
              _optionBController.text,
              _optionCController.text,
              _optionDController.text,
            ]
          : null,
      correctAnswer: selectedQuestionType == 'multiple_choice'
          ? _selectedCorrectAnswer
          : _essayAnswerController.text,
    );

    setState(() {
      questions.add(newQuestion);
      showQuestionForm = false;
      selectedQuestionType = '';
    });

    _clearForm();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pertanyaan berhasil disimpan'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _deleteQuestion(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Pertanyaan'),
          content: Text('Apakah Anda yakin ingin menghapus pertanyaan ini?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Hapus', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  questions.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF6FB),
      appBar: AppBar(
        backgroundColor: Color(0xFF191265),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buat Soal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.examTitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: showQuestionForm ? _buildQuestionForm() : _buildQuestionList(),
    );
  }

  Widget _buildQuestionList() {
    return Column(
      children: [
        // Header dengan judul quiz
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF191265),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.examTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '${questions.length} Soal Dibuat',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        
        // List soal yang sudah dibuat
        Expanded(
          child: questions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/exam.svg',
                        width: 250,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Belum ada soal',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mulai buat soal pertama Anda',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return _buildQuestionCard(question, index);
                  },
                ),
        ),
        
        // Button tambah pertanyaan
        Container(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showQuestionTypeDialog,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Tambah Pertanyaan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF191265),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(Question question, int index) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: question.type == 'multiple_choice' 
                        ? Colors.blue[100] 
                        : Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    question.type == 'multiple_choice' ? 'Pilihan Ganda' : 'Essay',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: question.type == 'multiple_choice' 
                          ? Colors.blue[700] 
                          : Colors.green[700],
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Soal ${index + 1}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteQuestion(index),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            
            SizedBox(height: 12),
            
            // Pertanyaan
            Text(
              question.question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            
            SizedBox(height: 12),
            
            // Pilihan atau jawaban
            if (question.type == 'multiple_choice') ...[
              ...question.options!.asMap().entries.map((entry) {
                int optionIndex = entry.key;
                String option = entry.value;
                String optionLetter = String.fromCharCode(65 + optionIndex); // A, B, C, D
                bool isCorrect = question.correctAnswer == optionLetter;
                
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isCorrect ? Colors.green : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            optionLetter,
                            style: TextStyle(
                              color: isCorrect ? Colors.white : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: isCorrect ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (isCorrect)
                        Icon(Icons.check_circle, color: Colors.green, size: 16),
                    ],
                  ),
                );
              }).toList(),
            ] else ...[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jawaban:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      question.correctAnswer,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header form
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  selectedQuestionType == 'multiple_choice' 
                      ? Icons.radio_button_checked 
                      : Icons.edit_note,
                  color: Color(0xFF191265),
                ),
                SizedBox(width: 12),
                Text(
                  selectedQuestionType == 'multiple_choice' 
                      ? 'Soal Pilihan Ganda' 
                      : 'Soal Essay',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191265),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20),
          
          // Form pertanyaan
          _buildTextField(
            controller: _questionController,
            label: 'Pertanyaan',
            hint: 'Masukkan pertanyaan Anda...',
            maxLines: 3,
          ),
          
          SizedBox(height: 20),
          
          // Form berdasarkan tipe soal
          if (selectedQuestionType == 'multiple_choice') ...[
            Text(
              'Pilihan Jawaban',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191265),
              ),
            ),
            SizedBox(height: 12),
            
            _buildOptionField('A', _optionAController),
            _buildOptionField('B', _optionBController),
            _buildOptionField('C', _optionCController),
            _buildOptionField('D', _optionDController),
            
            SizedBox(height: 20),
            
            Text(
              'Jawaban Benar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191265),
              ),
            ),
            SizedBox(height: 12),
            
            Row(
              children: ['A', 'B', 'C', 'D'].map((option) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCorrectAnswer = option;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: option != 'D' ? 8 : 0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedCorrectAnswer == option 
                            ? Color(0xFF191265) 
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedCorrectAnswer == option 
                              ? Color(0xFF191265) 
                              : Colors.grey[300]!,
                        ),
                      ),
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedCorrectAnswer == option 
                              ? Colors.white 
                              : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ] else ...[
            _buildTextField(
              controller: _essayAnswerController,
              label: 'Jawaban yang Diharapkan',
              hint: 'Masukkan jawaban yang diharapkan...',
              maxLines: 4,
            ),
          ],
          
          SizedBox(height: 30),
          
          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      showQuestionForm = false;
                      selectedQuestionType = '';
                    });
                    _clearForm();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Color(0xFF1F3556)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      color: Color(0xFF191265),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _saveQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF191265),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Simpan Pertanyaan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF191265),
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionField(String option, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF191265),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                option,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Pilihan $option',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
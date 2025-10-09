import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:yuk_ujian/teacher_homepage.dart';
import './welcome_screen.dart';
import './student_homepage.dart';

class MultiStepSignUp extends StatefulWidget {
  @override
  _MultiStepSignUpState createState() => _MultiStepSignUpState();
}

class _MultiStepSignUpState extends State<MultiStepSignUp> {
  int currentStep = 0;
  String? selectedGender;
  String? selectedAccountType;
  bool _obscureText = true;
  bool _rememberMe = false;
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/registrasi.png')
                ),
                SizedBox(height: 20),
                Text(
                  'Registrasi Berhasil!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Akun Anda telah berhasil dibuat.\nSilakan pilih jenis akun Anda.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF191265)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop(); 
      setState(() {
        currentStep++; 
      });
    });
  }

  void nextStep() {
    if (currentStep == 2 && selectedAccountType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an account type first.')),
      );
      return;
    } 
    
    if (currentStep < 1) {
      setState(() {
        currentStep++;
      });
    } else if (currentStep == 1) {
      _showSuccessDialog();
    }
  }

  Widget _buildStepContent() {
    switch (currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 20),
            _buildTextField(label: 'Nama Panjang'),
            SizedBox(height: 20),
            TextField(
              controller: _dobController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
                suffixIcon: Icon(Icons.calendar_today, size: 20),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              inputFormatters: [PhoneInputFormatter()],
              decoration: _inputDecoration('Nomor Handphone'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: _inputDecoration('Jenis Kelamin'),
              items: ['Laki-laki', 'Perempuan']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: _inputDecoration('Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _rememberMe = newValue ?? false;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print("Forgot Password tapped");
                  },
                  child: Text(
                    "",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
        
      case 2:
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Text(
              'Pilih Jenis Akun Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Silakan tentukan apakah Anda mendaftar sebagai Guru atau Siswa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            
            // STUDENT BUTTON
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentHomePage()),
                );
                setState(() {
                  selectedAccountType = 'student';
                });
              },
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedAccountType == 'student' 
                        ? Color(0xFF96ADD6) 
                        : Colors.grey.shade300,
                    width: selectedAccountType == 'student' ? 2 : 1,
                  ),
                  color: selectedAccountType == 'student' 
                      ? Color(0xFFF0F7FF) 
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF96ADD6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/student.svg',
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Siswa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: selectedAccountType == 'student' 
                                ? Color(0xFF96ADD6) 
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    if (selectedAccountType == 'student')
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.check_circle,
                          color: Color(0xFF96ADD6),
                          size: 24,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // TEACHER BUTTON
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAccountType = 'teacher';
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherHomePage()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedAccountType == 'teacher' 
                        ? Color(0xFF95B1EE) 
                        : Colors.grey.shade300,
                    width: selectedAccountType == 'teacher' ? 2 : 1,
                  ),
                  color: selectedAccountType == 'teacher' 
                      ? Color(0xFFF5F6FF) 
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF95B1EE),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/teacher.svg',
                          width: 40,
                          height: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Guru',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: selectedAccountType == 'teacher' 
                                ? Color(0xFF95B1EE) 
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    if (selectedAccountType == 'teacher')
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.check_circle,
                          color: Color(0xFF95B1EE),
                          size: 24,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
default:
  return Container();
}
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Buat Akun Anda',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Selamat datang di YukUjian! Mari kita buat akun untuk Anda. Silakan isi data pribadi Anda terlebih dahulu',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return TextField(
      decoration: _inputDecoration(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    double stepValue = (currentStep + 1) / 3;

    return Scaffold(
      backgroundColor: Color(0xFFEDF1F6), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BACK BUTTON + PROGRESS BAR DALAM ROW
              Row(
                children: [
                  Visibility(
                    visible: currentStep >= 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        if (currentStep > 0) {
                          setState(() {
                            currentStep--;
                          });
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomeScreen()),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 220,
                    child: LinearProgressIndicator(
                      value: stepValue,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF191265)),
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // STEP CONTENT
              Expanded(child: _buildStepContent()),
              SizedBox(height: 30),

              // BUTTON - Hanya tampil di step 0 & 1
              if (currentStep < 2)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF191265),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      currentStep < 1 ? 'Continue' : 'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
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
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String namaKelas;
  final String judulKelas;
  final String logoImagePath;
  final String jumlahSiswa;
  final int? cardIndex;

  JobCard({
    required this.namaKelas,
    required this.judulKelas,
    required this.logoImagePath,
    required this.jumlahSiswa,
    this.cardIndex,
  });

  final List<List<Color>> cardColors = [
    [Color(0xFF95B1EE), Color.fromARGB(255, 163, 187, 241)], 
    [Color(0xFF96ADD6), Color.fromARGB(255, 158, 179, 213)],
    [Color(0xFF95B1EE), Color.fromARGB(255, 163, 187, 241)], 
    [Color(0xFF96ADD6), Color.fromARGB(255, 158, 179, 213)], 
    [Color(0xFF95B1EE), Color.fromARGB(255, 163, 187, 241)], 
  ];

  @override  
  Widget build(BuildContext context) {
    List<Color> selectedColors = cardColors[cardIndex != null ? cardIndex! % cardColors.length : 0];
    
    return Container(
      width: 250,
      height: 20,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 8,
        shadowColor: selectedColors[0].withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: selectedColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          logoImagePath,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaKelas,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      judulKelas,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          jumlahSiswa,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
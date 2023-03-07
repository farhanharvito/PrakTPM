import 'package:flutter/material.dart';

import 'package:tugaskelompok_tpm/data_kelompok.dart';

class DataKelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
      ),
      body: Center(
        child: Text(
          "Anggota Kelompok:\n\n"
              "1. Abdillah Mustamin - 123200017\n"
              "2. Muhammad Farhan Harvito - 123200029\n"
              "3. Yuni Safitri - 123200088",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

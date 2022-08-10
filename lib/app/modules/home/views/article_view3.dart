import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Column(
              children: [
                Text('Alamat Harhan Laundry',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Perumahan Griya TTaman Suci B5 No.11, Suci, Kecamatan Mundu, Cirebon 45173'),
                SizedBox(
                  height: 5,
                ),
                Text('Jadwal Buka :'),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Senin'), Text('09.00-18.00 WIB')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Selasa'), Text('09.00-18.00 WIB')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Rabu'), Text('09.00-18.00 WIB')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Kamis'), Text('09.00-18.00 WIB')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Jumat'), Text('09.00-18.00 WIB')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sabtu'),
                    SizedBox(
                      width: 70,
                    ),
                    Text('Tutup')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Minggu'),
                    SizedBox(
                      width: 60,
                    ),
                    Text('Tutup')
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

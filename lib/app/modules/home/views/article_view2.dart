import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(
        'https://wa.me/6289669478771?text=Halo Admin Harhan Laundry, Saya mau bertanya nih .. "');
    return Column(
      children: [
        Container(),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Column(
              children: [
                Text('Costumer Service',
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
                    'Jika Kamu mendapatkan sebuah kendala ataupun ingin bertanya seputar harhan Laundry maka hubungi nomor WhatAapp Admin  '),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.whatsapp, size: 50),
                    GestureDetector(
                      child: const Text(
                        'Hubungi Admin',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () async {
                        try {
                          await launchUrl(_url,
                              mode: LaunchMode.externalApplication);
                        } catch (err) {
                          debugPrint('Something bad happened');
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

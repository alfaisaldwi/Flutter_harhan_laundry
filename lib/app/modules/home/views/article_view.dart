import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  children: const [
                    Text('Bagaimana cara memesan Laundry?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1. Pelanggan masuk ke Menu Laundry, kemudian Pelanggan Memilih layanan yang diinginkan ',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        '2. Pelanggan akan langsung masuk ke halaman Cart/Keranjang, dihalaman ini pelanggan memilih berapa jumlah layanan yang diinginkan'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        '3. Kemudian Pelanggan akan langsung masuk ke halaman Status Laundry, dihalaman ini pelanggan dapat melihat status Laundry'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        '4. Setelah itu Pegawai akan mengambil Barang yang akan dilaudry ke alamat Pelanggan'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        '5. Setelah itu Pelanggan dapat memantau status Laundry, dan jika proses laundry akan selesai maka Pegawai akan Mengantarkan Barang yang sudah dilaundry ke Alamat Pelanggan'),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

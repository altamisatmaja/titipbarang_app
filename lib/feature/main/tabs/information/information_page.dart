import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/my_scaffold.dart';

import 'information_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InformationPage extends GetView<InformationController> {
  static const String route = '/information';

  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) => MyScaffold(
        title: 'txt_information'.tr,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTransactionCard('Transaksi', 1),
                    const SizedBox(
                      width: 16.0,
                    ),
                    _buildTransactionCard('Aktivitas', 3),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primary,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.report_off_rounded),
                          Text('Masukkan kode promo')
                        ],
                      ),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primary,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.report_off_rounded),
                          Text('Masukkan kode promo')
                        ],
                      ),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text('Promo untuk kamu!'),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 125,
                          child: AppAssets.images.dummyAdsImage.image(
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Potongan Rp 25.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Gunakan kode MAHASISWA untuk layanan transit',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget _buildTransactionCard(String title, int total) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$total'),
              Icon(Icons.chevron_right_outlined),
            ],
          ),
          SizedBox(height: 5),
          Text(title),
          SizedBox(height: 5),
          LinearProgressIndicator(
            value: total / total,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
          ),
        ],
      ),
    ),
  );
}

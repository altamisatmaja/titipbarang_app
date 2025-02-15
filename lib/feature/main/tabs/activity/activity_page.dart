import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/my_scaffold.dart';
import 'activity_controller.dart';

class ActivityPage extends GetView<ActivityController> {
  static const String route = '/activity';

  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) => MyScaffold(
        title: 'txt_activity'.tr,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildActivityGroup(
              date: "Hari ini, 05 Januari 2025",
              activities: [
                _buildActivityItem(
                  title: "Barang dikembalikan",
                  reference: "OKBX/ACT/202516022025/1412",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildActivityGroup(
              date: "Jumat, 02 Januari 2025",
              activities: [
                _buildActivityItem(
                  title: "Update kondisi barang minggu - 2",
                  reference: "OKBX/ACT/202516022025/1412",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildActivityGroup(
              date: "Kamis, 02 Januari 2025",
              activities: [
                _buildActivityItem(
                  title: "Barang ketika packing",
                  reference: "OKBX/ACT/202516022025/1412",
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildActivityGroup({
    required String date,
    required List<Widget> activities,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...activities,
      ],
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String reference,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reference,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Cek'),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index < 4 ? 8 : 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      AppAssets.images.onboardingImg.path,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
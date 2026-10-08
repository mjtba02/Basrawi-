import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        title: const Text('جاري التوصيل - الكابتن في الطريق', style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // خريطة تتبع الرحلة المباشرة
          Container(
            color: Colors.grey.shade200,
            child: const Center(
              child: Text(
                'عرض مسار الكابتن المباشر على الخريطة',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),

          // بطاقة معلومات الكابتن السفلية
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // حالة الطلب
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('الكابتن يقترب منك...', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        Text('3 دقائق', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 20),

                    // معلومات الكابتن وسييارته
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF1E3A8A),
                          child: Icon(Icons.person, size: 35, color: Colors.white),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('أحمد علي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text('تويوتا يارس - أزرق | لوحة: 1984', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(' 4.9 (تقييم الكابتن)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // أزرار الاتصال والمحادثة
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              print('الاتصال بالكابتن');
                            },
                            icon: const Icon(Icons.phone, color: Colors.white),
                            label: const Text('اتصال', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E3A8A),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              print('فتح محادثة مع الكابتن');
                            },
                            icon: const Icon(Icons.chat, color: Colors.white),
                            label: const Text('محادثة', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

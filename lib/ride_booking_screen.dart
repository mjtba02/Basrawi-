import 'package:flutter/material.dart';

class RideBookingScreen extends StatefulWidget {
  const RideBookingScreen({Key? key}) : super(key: key);

  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  // متغير لتحديد نوع السيارة المختار (اقتصادي، مريح، عائلي)
  String selectedCarType = 'economic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        title: const Text('حجز تكسي بصراوي', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // خلفية خريطة وهمية (مكان عرض خرائط جوجل مستقبلاً)
          Container(
            color: Colors.grey.shade200,
            child: const Center(
              child: Text(
                'خريطة البصرة - تحديد الموقع والوجهة',
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // شريط سفلي لتحديد التفاصيل والسيارات
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'اختر نوع السيارة:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
                  ),
                  const SizedBox(height: 12),

                  // خيارات السيارات (اقتصادي، مريح، عائلي)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCarOptionCard(
                        title: 'اقتصادي',
                        price: '4,500 د.ع',
                        type: 'economic',
                        icon: Icons.local_taxi,
                      ),
                      _buildCarOptionCard(
                        title: 'مريح',
                        price: '6,500 د.ع',
                        type: 'comfort',
                        icon: Icons.directions_car,
                      ),
                      _buildCarOptionCard(
                        title: 'عائلي',
                        price: '9,000 د.ع',
                        type: 'family',
                        icon: Icons.airport_shuttle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // معلومات المسافة والوقت التقديري
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المسافة المقدرة: 8 كم', style: TextStyle(color: Colors.grey)),
                        Text('الوقت: 15 دقيقة', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // زر تأكيد الحجز
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        print('تم تأكيد حجز التكسي بنجاح!');
                      },
                      child: const Text(
                        'تأكيد الحجز الآن',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ودجت لتصميم بطاقة السيارة
  Widget _buildCarOptionCard({required String title, required String price, required String type, required IconData icon}) {
    bool isSelected = selectedCarType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCarType = type;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E3A8A).withOpacity(0.05) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF1E3A8A) : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: isSelected ? const Color(0xFF1E3A8A) : Colors.grey),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? const Color(0xFF1E3A8A) : Colors.black)),
            const SizedBox(height: 4),
            Text(price, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

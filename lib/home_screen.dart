import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A), // أزرق داكن
        title: const Text(
          'بصراوي - Basrawi Delivery',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'اختر الخدمة المطلوبة:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ==========================================
            // 1. بطاقة خدمة تكسي بصراوي
            // ==========================================
            _buildServiceCard(
              context,
              title: 'تكسي بصراوي',
              subtitle: 'احجز رحلة آمنة ومريحة داخل المدينة',
              icon: Icons.local_taxi,
              cardColor: const Color(0xFFFBBF24), // أصفر
              iconColor: const Color(0xFF1E3A8A),
              onTap: () {
                // هنا يمكنك إضافة الانتقال لشاشة حجز التاكسي لاحقاً
                print('تم اختيار: تكسي بصراوي');
              },
            ),
            const SizedBox(height: 16),

            // ==========================================
            // 2. بطاقة خدمة توصيل المطاعم
            // ==========================================
            _buildServiceCard(
              context,
              title: 'توصيل مطاعم',
              subtitle: 'أشهى الأكلات والوجبات من أفضل مطاعم البصرة',
              icon: Icons.restaurant_menu,
              cardColor: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                print('تم اختيار: توصيل المطاعم');
              },
            ),
            const SizedBox(height: 16),

            // ==========================================
            // 3. بطاقة خدمة الطرود والدرون
            // ==========================================
            _buildServiceCard(
              context,
              title: 'خدمات الطرود والدرون',
              subtitle: 'أرسل واستلم طرودك بسرعة عبر الدراجة أو الدرون',
              icon: Icons.airplanemode_active,
              cardColor: Colors.white,
              iconColor: Colors.blue,
              onTap: () {
                print('تم اختيار: خدمات الطرود والدرون');
              },
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لتصميم البطاقات بشكل موحد ومرتب
  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color cardColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 36, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

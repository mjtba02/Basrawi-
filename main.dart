import 'package:flutter/material.dart';

// =========================================================
// الجزء 1: نقطة الدخول الرئيسية (The Main Entry Point)
// هذا هو الكود الذي يبدأ منه التطبيق بالكامل.
// =========================================================
void main() {
  // تشغيل تطبيق "بصراوي"
  runApp(const BasrawiApp());
}

// =========================================================
// الجزء 2: التطبيق الأساسي (Root Application Widget)
// هنا يتم تعريف إعدادات التطبيق العامة، الألوان، والخطوط.
// =========================================================
class BasrawiApp extends StatelessWidget {
  const BasrawiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بصراوي - Basrawi Delivery',
      debugShowCheckedModeBanner: false, // إزالة شريط "Debug"
      
      // تعريف ألوان الهوية البصرية (الأزرق والأصفر)
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A), // الأزرق الداكن للشعار
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          secondary: const Color(0xFFFBBF24), // الأصفر الذهبي
        ),
        // تعيين الخط الافتراضي (يمكنك تغييره لاحقاً)
        fontFamily: 'Cairo', 
      ),
      
      // تحديد الشاشة الأولى التي تظهر عند فتح التطبيق
      home: const AccountSelectionScreen(),
    );
  }
}

// =========================================================
// الجزء 3: شاشة البداية - اختيار نوع الحساب (Account Selection Screen)
// هذه الشاشة تظهر للمستخدم أول مرة ليختار بين "زبون" أو "كابتن".
// (تم وضعها هنا مؤقتاً ليكون الملف مستقلاً بذاته).
// =========================================================
class AccountSelectionScreen extends StatefulWidget {
  const AccountSelectionScreen({Key? key}) : super(key: key);

  @override
  _AccountSelectionScreenState createState() => _AccountSelectionScreenState();
}

class _AccountSelectionScreenState extends State<AccountSelectionScreen> {
  // متغير لتخزين الاختيار (زبون أو كابتن)
  String selectedType = 'customer'; // القيمة الافتراضية زبون

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              
              // شعار التطبيق (سنضع نصاً مؤقتاً الآن)
              const Text(
                'بصراوي',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Basrawi Delivery',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 60),
              
              // النص التوجيهي
              const Text(
                'اختر نوع حسابك للمتابعة',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),

              // ======================================
              // زر اختيار "أنا زبون"
              // ======================================
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = 'customer';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedType == 'customer' ? const Color(0xFF1E3A8A).withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selectedType == 'customer' ? const Color(0xFF1E3A8A) : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 80,
                          color: selectedType == 'customer' ? const Color(0xFF1E3A8A) : Colors.grey,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'أنا زبون',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'اطلب تكسي، طعام، أو طرود',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // ======================================
              // زر اختيار "أنا كابتن"
              // ======================================
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = 'captain';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedType == 'captain' ? const Color(0xFFFBBF24).withOpacity(0.2) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selectedType == 'captain' ? const Color(0xFFFBBF24) : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.drive_eta,
                          size: 80,
                          color: selectedType == 'captain' ? const Color(0xFF1E3A8A) : Colors.grey,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'أنا كابتن',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'سجل مركبتك وابدأ العمل',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // ======================================
              // زر المتابعة (التالي)
              // ======================================
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // عند الضغط، ننتقل إلى شاشة تسجيل الدخول الخاصة بالنوع المختار
                    // سنقوم بتفعيل هذا الجزء لاحقاً عند إنشاء شاشات التسجيل المنفصلة
                    print('تم اختيار: $selectedType');
                    
                    // مثال للانتقال (مؤقت):
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    'التالي',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

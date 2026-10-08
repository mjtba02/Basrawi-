import 'package:flutter/material.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  // الفئة المحددة للتصنيف
  String selectedCategory = 'الكل';
  final List<String> categories = ['الكل', 'شعبي', 'بيتزا', 'سريع', 'مشويات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        title: const Text('قائمة المطاعم - البصرة', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // شريط البحث العلوي
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن مطعم أو وجبة مفضلة...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF1E3A8A)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // شريط التصنيفات الأفقية
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                bool isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: const Color(0xFF1E3A8A),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey.shade200,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // قائمة المطاعم
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildRestaurantCard(
                  name: 'مطعم الفاو',
                  category: 'مأكولات عراقية وعالمية • شارع الجزائر',
                  rating: '4.8',
                  time: '30-45 دقيقة',
                  delivery: 'توصيل مجاني',
                  imagePlaceholder: Icons.restaurant,
                ),
                const SizedBox(height: 14),
                _buildRestaurantCard(
                  name: 'بيتزا شيلو',
                  category: 'بيتزا وفطائر • المعقل',
                  rating: '4.9',
                  time: '20-30 دقيقة',
                  delivery: '1,000 د.ع',
                  imagePlaceholder: Icons.local_pizza,
                ),
                const SizedBox(height: 14),
                _buildRestaurantCard(
                  name: 'برجر هب',
                  category: 'وجبات سريعة • برجيلية',
                  rating: '4.7',
                  time: '25-35 دقيقة',
                  delivery: 'توصيل مجاني',
                  imagePlaceholder: Icons.fastfood,
                ),
              ],
            ),
          ),
        ],
      ),

      // سلة التسوق العائمة في الأسفل
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: () {
            print('فتح سلة التسوق');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('3 أصناف في السلة', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('المجموع: 18,000 د.ع', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ودجت تصميم بطاقة المطعم
  Widget _buildRestaurantCard({
    required String name,
    required String category,
    required String rating,
    required String time,
    required String delivery,
    required IconData imagePlaceholder,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          print('تم اختيار مطعم: $name');
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(imagePlaceholder, size: 40, color: const Color(0xFF1E3A8A)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(category, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(' $rating ', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        const Text(' • ', style: TextStyle(color: Colors.grey)),
                        Icon(Icons.access_time, color: Colors.grey.shade600, size: 14),
                        Text(' $time', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
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
}

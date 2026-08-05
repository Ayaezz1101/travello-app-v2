import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  bool _isLoadingMore = false; // مؤشر تحميل الصفحات الإضافية
  int _page = 0;               // الصفحة الحالية
  final int _pageSize = 10;    // عدد العناصر في كل صفحة
  bool _hasMore = true;        // هل يوجد بيانات إضافية في السيرفر؟

  // المتغيرات المساعدة لحفظ حالة الفلترة الحالية لإعادة التصفير عند التغيير
  String? _currentSearchText;
  String? _currentCategoryName;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  final supabase = Supabase.instance.client;

  /// الدالة الأساسية لجلب المنتجات (تدعم التصفير وجلب أول صفحة)
  Future<void> fetchProducts({String? searchText, String? categoryName}) async {
    _isLoading = true;
    _page = 0;
    _hasMore = true;
    _products.clear(); // تفريغ القائمة القديمة لبدء بحث أو فلترة جديدة
    _currentSearchText = searchText;
    _currentCategoryName = categoryName;
    notifyListeners();

    await _loadData();
  }

  /// دالة جلب الصفحة التالية (Lazy Loading) يتم استدعاؤها من الـ UI
  Future<void> fetchNextPage() async {
    if (_isLoadingMore || !_hasMore) return; // منع الطلبات المتكررة أو العشوائية

    _isLoadingMore = true;
    notifyListeners();

    _page++;
    await _loadData();
  }

  /// اللوجيك الداخلي المشترك للـ Pagination مع Supabase
  Future<void> _loadData() async {
    try {
      // 1. نبدأ ببناء الاستعلام الأساسي بمرونة
      var query = supabase.from('products').select('*, product_colors(*)');

      // 2. تطبيق الفلاتر الحالية إن وجدت (تبقى كما هي)
      if (_currentSearchText != null && _currentSearchText!.isNotEmpty) {
        query = query.ilike('name', '%$_currentSearchText%');
      }

      if (_currentCategoryName != null && _currentCategoryName != 'Smart Watch') {
        query = query.eq('brand', _currentCategoryName!);
      }

      // 3. حساب النطاق المخصص للصفحة الحالية
      final int from = _page * _pageSize;
      final int to = from + _pageSize - 1;
      
      // 🛠️ الحل الهندي هنا: نقوم بتنفيذ دالة الـ range مباشرةً أثناء تفعيل الـ await
      // هذا يمنع تعارض الأنواع (Type Mismatch) لأننا لا نخزن الـ Builder بل نأخذ النتيجة فوراً
      final List<dynamic> data = await query.range(from, to);

      final List<Product> fetchedProducts = data.map((json) => Product.fromMap(json)).toList();

      // إذا كان عدد العناصر القادمة أقل من الـ pageSize، فهذا يعني أننا وصلنا للنهاية
      if (fetchedProducts.length < _pageSize) {
        _hasMore = false;
      }

      // دمج العناصر الجديدة مع القائمة الحالية تتابعياً
      _products.addAll(fetchedProducts);
      
    } catch (e) {
      debugPrint("❌ Error fetching products: $e");
    } finally {
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}
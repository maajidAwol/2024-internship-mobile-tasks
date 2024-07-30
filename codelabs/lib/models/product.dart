enum Category {
  all,
  accessories,
  clothing,
  home

}

class Product{

  Product({required this.name,required this.id,required this.price});




  final int id;
  final String name;
  final int price;
  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';
}
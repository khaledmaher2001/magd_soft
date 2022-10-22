import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [name];

  static List<Category> categories = [
    const Category(name: "All", image: "assets/images/all.png"),
    const Category(name: "Acer", image: "assets/images/acer.png"),
    const Category(name: "Razer", image: "assets/images/Razer-Logo 2.png"),
    const Category(name: "Apple", image: "assets/images/ios 2.png"),
  ];
}

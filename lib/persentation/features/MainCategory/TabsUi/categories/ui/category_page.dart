import 'package:black_whales/persentation/features/MainCategory/TabsUi/categories/widget/Catergory_cell.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  List<String> images = [
    "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?ixlib=rb-1.2.1&w=1000&q=80",
    "https://imgk.timesnownews.com/story/1538984973-Flipkart-Amazon-smartphone_deals.jpg?tr=w-1200,h-900",
    "https://i.pinimg.com/236x/fe/79/f0/fe79f02afbcc8d4da969d2057e065135.jpg",
    "https://i.pinimg.com/originals/2a/13/48/2a134894d7d46b1446a4200dc9ebe918.jpg",
    "https://i.pinimg.com/originals/7a/92/fc/7a92fcf30d6782ea438d4e1eb9697a40.jpg",
    "https://i.pinimg.com/474x/d1/ea/76/d1ea7692e171b2b42939192998442223.jpg"
  ];
  List<String> lables = [
    "COSMETICS",
    "MOBILS",
    "CARS",
    "GARDENS",
    "FOOD",
    "REAL ESTATE"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Wrap(
                children: List.generate(6, (index) {
              return CategoryCell(
                image: images[index],
                lable: lables[index],
              );
            })),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../Model/car_model.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback onTap;

  const CarCard({super.key, required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.network(car.image, height: 150, width: double.infinity, fit: BoxFit.cover),
            ListTile(
              title: Text(car.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(car.specs),
              trailing: Text("₹${car.pricePerDay}/day"),
            )
          ],
        ),
      ),
    );
  }
}

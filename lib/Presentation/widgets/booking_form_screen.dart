import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/booking_model.dart';
import '../../Model/car_model.dart';
import '../../provider/booking_provider.dart';
import 'booking_confirmation_screen.dart';

class BookingFormScreen extends ConsumerStatefulWidget {
  final CarModel car;

  const BookingFormScreen({super.key, required this.car});

  @override
  ConsumerState<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends ConsumerState<BookingFormScreen> {
  final nameCtrl = TextEditingController();
  final startCtrl = TextEditingController();
  final endCtrl = TextEditingController();
  final fromCtrl = TextEditingController();
  final toCtrl = TextEditingController();

  Future<void> pickDate(TextEditingController controller) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      controller.text = "${date.day}-${date.month}-${date.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Your Car"),
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.car.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "₹${widget.car.pricePerDay}/day",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            buildInput("Your Name", nameCtrl),
            const SizedBox(height: 12),

            buildDateInput("Start Date", startCtrl),
            const SizedBox(height: 12),

            buildDateInput("End Date", endCtrl),
            const SizedBox(height: 12),

            buildInput("From Location", fromCtrl),
            const SizedBox(height: 12),

            buildInput("To Location", toCtrl),
            const SizedBox(height: 20),

            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final booking = BookingModel(
                      name: nameCtrl.text,
                      carName: widget.car.name,
                      startDate: startCtrl.text,
                      endDate: endCtrl.text,
                      location: fromCtrl.text,
                      totalCost: widget.car.pricePerDay * 2,
                    );

                    ref.read(bookingProvider.notifier).setBooking(booking);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BookingConfirmationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Confirm Booking",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🟦 Reusable TextField Widget
  Widget buildInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // 🟩 Reusable Date Picker Field
  Widget buildDateInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => pickDate(controller),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_month),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

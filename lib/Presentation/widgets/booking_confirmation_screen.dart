      import 'package:flutter/material.dart';
      import 'package:flutter_riverpod/flutter_riverpod.dart';

      import '../../provider/booking_provider.dart';
      import '../dashboard/car_list.dart';

      class BookingConfirmationScreen extends ConsumerWidget {
        const BookingConfirmationScreen({super.key});

        @override
        Widget build(BuildContext context, WidgetRef ref) {
          final booking = ref.watch(bookingProvider);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (booking != null) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.blue.shade50],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue.shade100,
                            child: const Icon(
                              Icons.check_circle,
                              size: 60,
                              color: Colors.blue,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            "Booking Confirmed!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 12),

                          detailText("Car", booking.carName),
                          detailText("Name", booking.name),
                          detailText("Start Date", booking.startDate),
                          detailText("End Date", booking.endDate),
                          detailText("Pickup Location", booking.location),

                          const SizedBox(height: 18),

                          Text(
                            "Total Cost: ₹${booking.totalCost}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),

                          const SizedBox(height: 20),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const CarListScreen()),
                                    (route) => false,
                              );
                            },

                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.blue, Colors.lightBlueAccent],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          });

          return const Scaffold(body: SizedBox.shrink());
        }

        Widget detailText(String title, String value) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                Text(
                  "$title : ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        }
      }

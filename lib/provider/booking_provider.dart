import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/booking_model.dart';


class BookingNotifier extends StateNotifier<BookingModel?> {
  BookingNotifier() : super(null);

  void setBooking(BookingModel booking) {
    state = booking;
  }
}

final bookingProvider =
StateNotifierProvider<BookingNotifier, BookingModel?>(
      (ref) => BookingNotifier(),
);

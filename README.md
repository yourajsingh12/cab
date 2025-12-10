📌 Project Overview

This is a multi-screen Car Rental Booking mobile application built using Flutter and Riverpod state management. The app demonstrates a complete booking flow starting from viewing cars → selecting a car → filling booking details → showing booking confirmation. It is designed as an MVP-style app with mock data and clean UI.

🎯 Key Features ✔ 1. Login / Welcome Screen Simple mock login (no backend)

Used to demonstrate navigation and state handling ✔ 2. Car Listing Page

Displays a list of available cars Each car shows: Car name Image Price per day Car type Built using ListView.builder UI made responsive and attractive with cards ✔ 3. Car Details Page

When a user selects a car, they can view: Price Specifications Availability Description A “Book Now” button navigates to the booking form ✔ 4. Booking Form Page User fills: Name Start date End date Pickup location Drop location Date pickers are properly implemented Inputs validated before booking ✔ 5. Booking Confirmation Instead of a normal page, a modern attractive AlertDialog is shown Displays booking summary: Car Name Booking dates Pickup location

🧠 State Management (Riverpod)

Implemented bookingProvider using StateNotifierProvider

Stores booking details globally

Helps pass data across multiple screens without props

Riverpod ensures: ✔ Clean architecture ✔ Separation of UI & business logic ✔ Scalability

🏗 Architecture Folder Structure lib/ ├─ Model/ │ ├─ car_model.dart │ └─ booking_model.dart │ ├─ provider/ │ └─ booking_provider.dart │ ├─ screens/ ├─ auth/ ├─ car_list/ ├─ car_details/ ├─ booking/ └─ confirmation/

Architecture Pattern MVVM-style separation Models → Providers → Screens Riverpod for global state

Total cost

Designed with gradient background, rounded corners, success icon

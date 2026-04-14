# AgriConnect

AgriConnect is a Flutter app that connects farmers and buyers through simple listings, profile dashboards, and direct product chat.

## Features

- Farmer and buyer user roles with separate dashboard experiences
- Seller dashboard for farmers to manage listings and view orders
- Buyer browse experience with product cards, pricing, and location details
- One-on-one product chat screen for buyers to request quantities and negotiate directly with sellers
- Profile screens for both farmer and buyer accounts

## Project Structure

- `lib/main.dart` - App entry point
- `lib/app.dart` - Material app setup and entry screen
- `lib/screens/login_screen.dart` - Role selection and navigation to buyer or farmer dashboards
- `lib/screens/buyer_dashboard.dart` - Buyer dashboard, product listing, and profile navigation
- `lib/screens/farmer_dashboard.dart` - Farmer dashboard, listings, orders, and profile navigation
- `lib/screens/product_detail_screen.dart` - Product details with chat flow for buyer-seller conversations
- `lib/screens/profile_screen.dart` - Shared profile layout for user accounts
- `lib/models/listing.dart` - Listing model and sample listings data
- `lib/models/user_profile.dart` - User profile model and sample profile data

## Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio, Xcode, or a supported IDE configured for Flutter development

### Run the app

1. Open the project in your IDE.
2. Run `flutter pub get` to install dependencies.
3. Launch the app with `flutter run`.

## Notes

This app currently uses sample in-memory listing and profile data. It provides the framework for adding persistence, real authentication, and backend integration later.

## Contribution

Feel free to extend the app by adding:

- Persistent storage or backend integration
- Authentication and user registration
- Order management and payment workflows
- Real chat messaging and notifications

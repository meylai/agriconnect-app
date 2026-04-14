class UserProfile {
  final String name;
  final String role;
  final String location;
  final String phone;
  final String email;
  final String bio;
  final int listings;
  final int orders;

  const UserProfile({
    required this.name,
    required this.role,
    required this.location,
    required this.phone,
    required this.email,
    required this.bio,
    required this.listings,
    required this.orders,
  });
}

const UserProfile buyerProfile = UserProfile(
  name: 'Alice Chirwa',
  role: 'Buyer',
  location: 'Blantyre',
  phone: '+265 888 123 456',
  email: 'alice@example.com',
  bio: 'A regular buyer looking for quality maize and soybeans.',
  listings: 0,
  orders: 3,
);

const UserProfile farmerProfile = UserProfile(
  name: 'John Banda',
  role: 'Farmer',
  location: 'Lilongwe',
  phone: '+265 999 987 654',
  email: 'john@example.com',
  bio: 'Experienced farmer selling maize and soybeans directly to buyers.',
  listings: 4,
  orders: 8,
);

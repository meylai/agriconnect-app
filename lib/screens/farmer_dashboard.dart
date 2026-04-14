import 'package:flutter/material.dart';
import 'package:agriconnect_app/models/listing.dart';
import 'package:agriconnect_app/models/user_profile.dart';
import 'package:agriconnect_app/screens/add_listing_screen.dart';
import 'package:agriconnect_app/screens/market_prices_screen.dart';
import 'package:agriconnect_app/screens/product_detail_screen.dart';
import 'package:agriconnect_app/screens/profile_screen.dart';

class FarmerDashboard extends StatefulWidget {
  const FarmerDashboard({super.key});

  @override
  FarmerDashboardState createState() => FarmerDashboardState();
}

class FarmerDashboardState extends State<FarmerDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FarmerHomeScreen(),
    const MyListingsScreen(),
    const OrdersScreen(),
    const ProfileScreen(profile: farmerProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listings'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[400]!, Colors.green[600]!],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, John!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ready to sell your produce?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _buildActionCard(
                    context,
                    'Add Listing',
                    Icons.add_circle,
                    Colors.green,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddListingScreen()),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildActionCard(
                    context,
                    'Market Prices',
                    Icons.trending_up,
                    Colors.blue,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MarketPricesScreen()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildActivityCard(
                    'New order received',
                    '50 kg Maize - MWK 75,000',
                    Icons.shopping_cart,
                    Colors.green,
                  ),
                  _buildActivityCard(
                    'Listing viewed',
                    'Your soybean listing was viewed 12 times',
                    Icons.visibility,
                    Colors.blue,
                  ),
                  _buildActivityCard(
                    'Payment received',
                    'MWK 45,000 from ABC Processors',
                    Icons.payment,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String subtitle, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Text('2h ago', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myListings = sampleListings.where((listing) => listing.farmer == 'John Banda').toList();

    return Scaffold(
      appBar: AppBar(title: const Text('My Listings')),
      body: myListings.isEmpty
          ? const Center(child: Text('You do not have any listings yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: myListings.length,
              itemBuilder: (context, index) {
                final listing = myListings[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    title: Text(listing.crop, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${listing.quantityLabel} • ${listing.location}'),
                    trailing: Text(listing.priceLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(listing: listing),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddListingScreen()),
          );
        },
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: const Center(child: Text('Orders Screen')),
    );
  }
}

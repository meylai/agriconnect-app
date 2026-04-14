import 'package:flutter/material.dart';
import 'package:agriconnect_app/models/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${profile.role} Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green[100],
              child: Text(
                profile.name.split(' ').map((word) => word[0]).join(),
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              profile.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(profile.role, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            _buildInfoTile(Icons.location_on, profile.location),
            _buildInfoTile(Icons.phone, profile.phone),
            _buildInfoTile(Icons.email, profile.email),
            _buildInfoTile(Icons.info, profile.bio),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatCard('Listings', profile.listings.toString()),
                const SizedBox(width: 15),
                _buildStatCard('Orders', profile.orders.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[700]),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green[100]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:agriconnect_app/models/listing.dart';

class ProductDetailScreen extends StatefulWidget {
  final Listing listing;

  const ProductDetailScreen({super.key, required this.listing});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final quantityController = TextEditingController();
  final messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    const ChatMessage(sender: 'Seller', message: 'Hello! How much do you need?'),
  ];

  @override
  void dispose() {
    quantityController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(sender: 'You', message: text));
      messageController.clear();
    });
  }

  void _requestQuantity() {
    final quantityText = quantityController.text.trim();
    if (quantityText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the quantity you want to request.')),
      );
      return;
    }

    setState(() {
      _messages.add(ChatMessage(
        sender: 'You',
        message: 'I would like to purchase $quantityText kg of ${widget.listing.crop}.',
      ));
      _messages.add(const ChatMessage(
        sender: 'Seller',
        message: 'Thank you! I can reserve this quantity for you. Let’s agree on the final delivery details.',
      ));
    });
    quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Chat'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.listing.crop,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Seller: ${widget.listing.farmer}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text(widget.listing.quantityLabel, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text(widget.listing.priceLabel,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 10),
                Text(widget.listing.description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity (kg)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _requestQuantity,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  ),
                  child: const Text('Request'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final chat = _messages[index];
                final isBuyer = chat.sender == 'You';
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  alignment: isBuyer ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isBuyer ? Colors.green[700] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      chat.message,
                      style: TextStyle(
                        color: isBuyer ? Colors.white : Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Write a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String message;

  const ChatMessage({required this.sender, required this.message});
}

class Listing {
  final String id;
  final String crop;
  final String farmer;
  final String location;
  final int availableKg;
  final int pricePerKg;
  final String description;

  const Listing({
    required this.id,
    required this.crop,
    required this.farmer,
    required this.location,
    required this.availableKg,
    required this.pricePerKg,
    required this.description,
  });

  String get priceLabel => 'MWK $pricePerKg/kg';
  String get quantityLabel => '$availableKg kg available';
}

const List<Listing> sampleListings = [
  Listing(
    id: 'l1',
    crop: 'Premium Maize',
    farmer: 'John Banda',
    location: 'Lilongwe',
    availableKg: 500,
    pricePerKg: 1500,
    description: 'Well-dried premium maize, ready for immediate delivery.',
  ),
  Listing(
    id: 'l2',
    crop: 'Organic Soybeans',
    farmer: 'Mary Phiri',
    location: 'Blantyre',
    availableKg: 200,
    pricePerKg: 2200,
    description: 'Organic soybeans with high oil content, ideal for processors.',
  ),
  Listing(
    id: 'l3',
    crop: 'Fresh Maize',
    farmer: 'Peter Mwale',
    location: 'Mzuzu',
    availableKg: 800,
    pricePerKg: 1400,
    description: 'Fresh harvested maize, perfect for milling and local markets.',
  ),
];

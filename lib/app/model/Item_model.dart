class Item {
  final String name;
  final int price;
  final String image;

  Item({required this.name, required this.price, required this.image});

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "image": image,
      };
}

final items = [
  {
    "name": 'Travel Bag',
    "price": 50000,
    "image": 'assets/image/bag_treatment/travel_bag.png',
  },
  {
    "name": 'Mountain Bag',
    "price": 75000,
    "image": 'assets/image/bag_treatment/mountain.png',
  },
  {
    "name": 'Backpack Bag',
    "image": 'assets/image/bag_treatment/backpack.png',
    "price": 30000,
  },
  {
    "name": 'Kids Bag',
    "price": 15000,
    "image": 'assets/image/bag_treatment/kids.png',
  },
  {
    "name": 'Clutch',
    "price": 20000,
    "image": 'assets/image/bag_treatment/clutch.png',
  },
  {
    "name": 'Wallet Canvas',
    "price": 10000,
    "image": 'assets/image/bag_treatment/wallet_canvas.png',
  },
  {
    "name": 'Wallet Leather',
    "price": 15000,
    "image": 'assets/image/bag_treatment/wallet_leather.png',
  },
  {
    "name": 'Diaper Bag',
    "price": 45000,
    "image": 'assets/image/bag_treatment/deaper.png',
  },
  {
    "name": 'Cap',
    "price": 20000,
    "image": 'assets/image/bag_treatment/cap.png',
  },

  {
    "name": 'Man Sandals Regular',
    "price": 20000,
    "image": 'assets/image/sandal/mans_sandal.png',
  },

  {
    "name": 'Woman Sandals Regular',
    "price": 25,
    "image": 'assets/image/sandal/women.png',
  },

  {
    "name": 'Kids Sandal Regular',
    "price": 15,
    "image": 'assets/image/sandal/kids.png',
  }
];

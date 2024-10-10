import 'package:belanja_flutter/models/item.dart';
import 'package:belanja_flutter/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
          name: 'Gula',
          price: 5000,
          imgproduct: 'images/gula.jpg',
          stok: 5,
          rating: 4),
      Item(
          name: 'Garam',
          price: 2000,
          imgproduct: 'images/garam.jpg',
          stok: 5,
          rating: 4),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping list'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 8.0, // Jarak antar kolom
            mainAxisSpacing: 8.0, // Jarak antar baris
            childAspectRatio: 0.7, // Mengatur rasio aspek item grid
          ),
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ItemCard(item: item);
          },
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/item', extra: item);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item.imgproduct,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    item.imgproduct,
                    height: 170, // Sesuaikan tinggi gambar
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Rp ${item.price}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const Spacer(), // Spacer untuk memisahkan konten atas dan bawah
              Row(
                children: [
                  Text('Stok: ${item.stok}'),
                  const Spacer(),
                  Icon(Icons.star, color: Colors.yellow[700], size: 16),
                  Text('${item.rating}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

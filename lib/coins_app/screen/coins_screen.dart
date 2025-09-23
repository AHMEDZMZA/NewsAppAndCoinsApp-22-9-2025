import 'package:flutter/material.dart';
import '../../styles.dart';
import '../widget/coins_bloc_builder.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF123456),
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Coins App",
                style: Styles.style30.copyWith(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                "https://images.pexels.com/photos/6770524/pexels-photo-6770524.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          CoinsBlocBuilder(),
        ],
      ),
    );
  }
}

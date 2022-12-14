import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/resep_makanan_cubit.dart';

class DetailResepMakananScreen extends StatefulWidget {
  // Tambahkan parameter keyResepMakanan untuk menerima key dari ResepMakananScreen
  final String? keyResepMakanan;
  final String? titleResepMakanan;
  final String? thumbResepMakanan;
  const DetailResepMakananScreen({
    Key? key,
    this.keyResepMakanan,
    this.titleResepMakanan,
    this.thumbResepMakanan,
  }) : super(key: key);

  @override
  State<DetailResepMakananScreen> createState() =>
      _DetailResepMakananScreenState();
}

class _DetailResepMakananScreenState extends State<DetailResepMakananScreen> {
  // Tambahkan cubit->ResepMakananCubit di screen->DetailResepMakananScreen
  final ResepMakananCubit resepMakananCubit = ResepMakananCubit();

  // Tambahkan initState
  @override
  void initState() {
    // Panggil getDetailDataResepMakanan yang ada di ResepMakananCubit
    resepMakananCubit.getDetailDataResepMakanan(widget.keyResepMakanan!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleResepMakanan!),
      ),
      body: BlocBuilder<ResepMakananCubit, ResepMakananState>(
        bloc: resepMakananCubit,
        builder: (context, state) {
          if (state is ResepMakananInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            children: [
              Image.network(widget.thumbResepMakanan!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  resepMakananCubit.detailResepMakananModel.results!.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    resepMakananCubit
                        .detailResepMakananModel.results!.servings!,
                  ),
                  Text(
                    resepMakananCubit.detailResepMakananModel.results!.times!,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    resepMakananCubit.detailResepMakananModel.results!.desc!),
              ),
            ],
          );
        },
      ),
    );
  }
}

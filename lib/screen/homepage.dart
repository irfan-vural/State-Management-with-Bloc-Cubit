import 'package:bloc_usage/service/cats_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cats_cubit.dart';
import '../bloc/cats_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cat Demo'),
        backgroundColor: Colors.red.shade900,
      ),
      body: BlocProvider(
        create: (_) => CatsCubit(SampleCatsRepository()),
        child: BlocBuilder<CatsCubit, CatsState>(
          builder: (context, state) {
            if (state is CatsInitial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildfab(context),
                ],
              );
            } else if (state is CatsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CatsLoaded) {
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Image.network(state.response[index].url!),
                    subtitle: Text(
                        "Yummy Cat ${state.response[index].height.toString()}"),
                  ),
                  itemCount: state.response.length,
                ),
              );
            } else if (state is CatsError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }

  FloatingActionButton buildfab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CatsCubit>().getCats();
      },
      backgroundColor: Colors.red.shade900,
      child: const Icon(Icons.add_a_photo_outlined),
    );
  }
}

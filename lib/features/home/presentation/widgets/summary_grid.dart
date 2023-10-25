import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/summary_model.dart';
import '../bloc/summary_bloc.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loaded: (data) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 5,
                childAspectRatio: (1 / 1.3),
              ),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return SummaryGridItem(summaryModel: data[index]);
              },
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class SummaryGridItem extends StatelessWidget {
  SummaryModel summaryModel;
  SummaryGridItem({super.key, required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(summaryModel.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  summaryModel.total.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(summaryModel.icon)
              ],
            )
          ],
        ),
      ),
    );
  }
}

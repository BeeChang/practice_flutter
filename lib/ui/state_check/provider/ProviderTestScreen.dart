import 'package:flutter/material.dart';
import 'package:practice_flutter/di/service_locator.dart';
import 'package:practice_flutter/ui_component/DiscountProductView.dart';
import 'package:provider/provider.dart';

import 'ProviderViewModel.dart';

class ProviderTestScreen extends StatelessWidget {
  const ProviderTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => getIt<ProviderViewModel>()..loadInitialData(),
        child: const ProviderTestView(),
      ),
    );
  }
}

class ProviderTestView extends StatelessWidget {
  const ProviderTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return discountProductView(
          discountPercent: viewModel.state.discountPercent,
          items: viewModel.state.items,
          totalDiscountPrice: viewModel.state.totalDiscountPrice,
          isDiscountApplied: viewModel.state.isDiscountApplied,
          onDiscountToggle: viewModel.toggleDiscount,
        );
      },
    );
  }
}
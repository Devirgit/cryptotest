import 'package:cryptotest/common/theme.dart';
import 'package:cryptotest/domain/state/category/category_bloc.dart';
import 'package:cryptotest/domain/state/stock/stocks_bloc.dart';
import 'package:cryptotest/internal/dependencies/di.dart';
import 'package:cryptotest/presentation/pages/crypto_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoTest extends StatelessWidget {
  const CryptoTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Test',
      theme: blackTheme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CategoryBloc(categoryRepository: Di.get())
                ..add(const GetAllCategoryEvent())),
          BlocProvider(
            create: (context) => StocksBloc(stockRepository: Di.get()),
          )
        ],
        child: const CryptoPages(),
      ),
    );
  }
}

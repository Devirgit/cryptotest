import 'package:cryptotest/common/ui_colors.dart';
import 'package:cryptotest/common/ui_text.dart';
import 'package:cryptotest/domain/entitis/category_entity.dart';
import 'package:cryptotest/domain/state/category/category_bloc.dart';
import 'package:cryptotest/domain/state/stock/stocks_bloc.dart';
import 'package:cryptotest/presentation/forms/form.dart';
import 'package:cryptotest/presentation/forms/form_select_period.dart';
import 'package:cryptotest/presentation/pages/components/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoPages extends StatelessWidget {
  const CryptoPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(UItext.apptitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: UIColor.accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              buildWhen: (previous, current) => current != previous,
              builder: (context, state) {
                return Column(
                  children: [
                    state.categories.isEmpty
                        ? const _EmptyCategory()
                        : DropDownList<CategoryEntity>(
                            onSelected: (value) => context
                                .read<CategoryBloc>()
                                .add(SelectCategory(value)),
                            itemBuilder: (context) {
                              return List.generate(
                                state.categories.length,
                                (index) => PopupMenuItem(
                                  value: state.categories[index],
                                  child: Text(state.categories[index].name),
                                ),
                              );
                            },
                            child: Text(
                                state.categories[state.selectIndex].name,
                                style: const TextStyle(
                                    fontFamily: 'Segoe UI', fontSize: 35)),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: DropDownList<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text(
                                  "${state.categories[state.selectIndex].name} "
                                  "${UItext.allText}"),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                  "${state.categories[state.selectIndex].name} "
                                  "${UItext.buyText}"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text(
                                  "${state.categories[state.selectIndex].name} "
                                  "${UItext.sellText}"),
                            ),
                          ],
                          onSelected: (value) {
                            context.read<StocksBloc>().add(FiltredType(
                                state.categories[state.selectIndex].uid,
                                filterIndex: value));
                          },
                          fontSize: 16,
                          child: BlocBuilder<StocksBloc, StocksState>(
                            buildWhen: (previous, current) =>
                                current.filterIndex != previous.filterIndex,
                            builder: (context, stockState) {
                              String stockFilter = '';
                              switch (stockState.filterIndex) {
                                case 0:
                                  stockFilter = UItext.allText;

                                  break;
                                case 1:
                                  stockFilter = UItext.buyText;

                                  break;
                                default:
                                  stockFilter = UItext.sellText;
                              }

                              return Text(
                                  state.categories.isEmpty
                                      ? ' - '
                                      : "${state.categories[state.selectIndex].name} "
                                          "$stockFilter",
                                  style: const TextStyle(
                                      fontFamily: 'Segoe UI', fontSize: 16));
                            },
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: UIColor.borderColor, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Forms.show(
                                  context,
                                  FormSelectPeriod(
                                      startPeriod: context
                                          .read<StocksBloc>()
                                          .state
                                          .startPeriod,
                                      endPeriod: context
                                          .read<StocksBloc>()
                                          .state
                                          .endPeriod,
                                      onChanged: (date) {
                                        if (state.categories.isNotEmpty &&
                                            state.selectIndex > -1) {
                                          context.read<StocksBloc>().add(
                                              FiltredData(
                                                  state
                                                      .categories[
                                                          state.selectIndex]
                                                      .uid,
                                                  endPeriod: date.end,
                                                  startPeriod: date.sart));
                                        }
                                      }),
                                );
                              },
                              icon: const Icon(Icons.calendar_today)),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
              child: BlocListener<CategoryBloc, CategoryState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state.categories.isNotEmpty && state.selectIndex > -1) {
                context
                    .read<StocksBloc>()
                    .add(StocksLoad(state.categories[state.selectIndex].uid));
              }
            },
            child: Builder(builder: (context) {
              final index = context.read<CategoryBloc>().state.selectIndex;
              CategoryEntity? category;
              if (index != -1) {
                category = context.read<CategoryBloc>().state.categories[index];
              }

              return StockList(
                  categoryUID: category == null ? -1 : category.uid);
            }),
          )),
        ],
      ),
    );
  }
}

class _EmptyCategory extends StatelessWidget {
  const _EmptyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: UIColor.borderColor),
            borderRadius: BorderRadius.circular(10)),
        child: const ListTile(
          title: Text(UItext.emptyCategory,
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 35)),
        ));
  }
}

class DropDownList<T> extends StatefulWidget {
  const DropDownList(
      {this.fontSize = 35,
      Key? key,
      required this.child,
      required this.itemBuilder,
      this.onSelected})
      : super(key: key);

  final double fontSize;
  final PopupMenuItemSelected<T>? onSelected;
  final PopupMenuItemBuilder<T> itemBuilder;
  final Widget child;

  @override
  State<DropDownList<T>> createState() => _DropDownListState<T>();
}

class _DropDownListState<T> extends State<DropDownList<T>> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      position: PopupMenuPosition.under,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      onSelected: widget.onSelected,
      itemBuilder: widget.itemBuilder,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: UIColor.borderColor),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
              title: widget.child,
              trailing: const Icon(
                Icons.expand_more,
              ))),
    );
  }
}

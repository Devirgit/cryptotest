import 'package:cryptotest/common/ui_colors.dart';
import 'package:cryptotest/common/ui_text.dart';
import 'package:cryptotest/core/types/types.dart';
import 'package:cryptotest/domain/entitis/stock_entity.dart';
import 'package:cryptotest/domain/state/stock/stocks_bloc.dart';
import 'package:cryptotest/presentation/misc/display_transformation.dart';
import 'package:cryptotest/presentation/widgets/infinite_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key, required this.categoryUID}) : super(key: key);

  final int categoryUID;

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  late final ValueNotifier<ChangeListState<StockEntity>> _changeState;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _changeState = ValueNotifier(
        const ChangeListState(items: [], status: LoadDataStatus.empty));
  }

  @override
  void dispose() {
    _controller.dispose();
    _changeState.dispose();
    super.dispose();
  }

  OperationType _filter(int index) {
    return index == 1 ? OperationType.buy : OperationType.sell;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StocksBloc, StocksState>(
      listenWhen: (previous, current) {
        if (previous.filterIndex != current.filterIndex) {
          if (_controller.hasClients) {
            _controller.jumpTo(0);
          }
        }
        return previous != current;
      },
      listener: (context, state) {
        List<StockEntity>? list;
        if (state.filterIndex != 0) {
          list = state.stocks
              .where((item) => item.operationType == _filter(state.filterIndex))
              .toList();
        }
        _changeState.value = ChangeListState(
            items: list ?? state.stocks,
            status: state.status,
            error: state.errorMessage);
      },
      child: Builder(
        builder: (context) {
          final bloc = context.read<StocksBloc>();
          return InfiniteList<StockEntity>(
            controller: _controller,
            onRefresh: () => bloc.add(StocksLoad(widget.categoryUID)),
            separate: const SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index, items) => _StockItem(items[index]),
            changeState: _changeState,
            separatorBuilder: (context, index, item) {
              if (index == 0) {
                return _SeparatorItem(
                    ViewFormat.formatingDateWeek(item[0].date));
              }

              if (item[index].date.compareTo(item[index - 1].date) < 0) {
                return _SeparatorItem(
                    ViewFormat.formatingDateWeek(item[index].date));
              }

              return const SizedBox(
                width: 1,
              );
            },
          );
        },
      ),
    );
  }
}

class _StockItem extends StatelessWidget {
  const _StockItem(this.stock, {Key? key}) : super(key: key);

  final StockEntity stock;

  String _itemName() {
    return stock.operationType == OperationType.sell
        ? '${UItext.sellText} ${stock.symbol}'
        : '${UItext.buyText} ${stock.symbol}';
  }

  String _itemPrice() {
    return stock.operationType == OperationType.sell
        ? '- \$${ViewFormat.formatCostDisplay(stock.price, patern: 0.01)} USD'
        : '${ViewFormat.formatCostDisplay(stock.price, patern: 0.01)} USD';
  }

  String _itemCount() {
    return stock.operationType == OperationType.sell
        ? '- ${ViewFormat.formatCostDisplay(stock.count, patern: 0.01)} ${stock.symbol}'
        : '${ViewFormat.formatCostDisplay(stock.count, patern: 0.01)} ${stock.symbol}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: stock.operationType == OperationType.sell
                ? const Icon(
                    Icons.do_not_disturb_on_outlined,
                    color: UIColor.sellColor,
                    size: 30,
                  )
                : const Icon(
                    Icons.add_circle_outline,
                    color: UIColor.buyColor,
                    size: 30,
                  ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_itemName(),
                    style: const TextStyle(
                        color: UIColor.fontColor,
                        fontSize: 16,
                        fontFamily: 'Segoe UI')),
                const SizedBox(
                  height: 12,
                ),
                Text(ViewFormat.formatingDate(stock.date),
                    style: const TextStyle(
                        color: UIColor.fontColor,
                        fontSize: 10,
                        fontFamily: 'Segoe UI'))
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _itemCount(),
                  style: const TextStyle(
                      color: UIColor.fontColor,
                      fontSize: 15,
                      fontFamily: 'Segoe UI'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(_itemPrice(),
                    style: const TextStyle(
                        color: UIColor.fontColor,
                        fontSize: 15,
                        fontFamily: 'Segoe UI'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SeparatorItem extends StatelessWidget {
  const _SeparatorItem(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: UIColor.separateColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                color: UIColor.fontColor, fontFamily: 'Segoe UI'),
          ),
        ));
  }
}

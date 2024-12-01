import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spend/features/common/color_constant.dart';
import 'package:spend/features/home/transaction/data/bloc/transaction_cubit.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';
import 'package:spend/features/home/transaction/presentation/page/transaction_details.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late TransactionCubit transactionCubit;

  @override
  void initState() {
    transactionCubit = TransactionCubit();
    transactionCubit.getLatestBlock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              "assets/images/chevron-left.svg",
              height: 5,
              width: 5,
            ),
          ),
        ),
        leadingWidth: 38,
        centerTitle: true,
        title: const Text("BTC Transactions",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Inter")),
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
          bloc: transactionCubit,
          listener: (context, state) {
            if (state is FetchedHash) {
              transactionCubit.getTxnByHash(
                  hash: state.appBaseResponse.message!);
            }
            if (state is FetchedSuccessfully) {

            }
          },
          builder: (context, s) {
            if (s is FetchedSuccessfully) {
              List<TxnList> txn = s.transactionResponse.txnList!;

              return ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: s.transactionResponse.txnList!.length,
                itemBuilder: (context, i) {
                  // Convert to DateTime object
                  DateTime dateTime =
                      DateTime.fromMillisecondsSinceEpoch(txn[i].time! * 1000);
                  return ListTile(
                    title: SizedBox(
                      width: 160,
                      child: Text(
                        txn[i].hash.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Inter"),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "${DateFormat('yyyy-MM-dd').format(dateTime)}.${DateFormat.jm().format(dateTime)}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: lightBlueGrey,
                            fontFamily: "Inter"),
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      "assets/images/chevron-right.svg",
                      height: 20,
                      width: 20,
                    ),
                    dense: true,
                    minLeadingWidth: 2,
                    minVerticalPadding: 10,
                    horizontalTitleGap: 10,
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>  TransactionDetails(txn:txn[i]))),
                  );
                },
                separatorBuilder: (context, i) {
                  return Divider(height: 10, color: lightGrey);
                },
              );
            }
            if (s is Loading) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white24,
                        valueColor: AlwaysStoppedAnimation<Color>(green),
                        strokeWidth: 5,
                        strokeCap: StrokeCap.round),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text("Fetching your {BTC} transactions",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Inter")),
                  )
                ]
              );
            }
            if (s is TxnError) {
              return Center(
                child: Text(s.error),
              );
            }

            return Container();
          }),
    );
  }
}

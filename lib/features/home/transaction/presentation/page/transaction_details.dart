import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:spend/features/home/transaction/data/bloc/transaction_cubit.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';

class TransactionDetails extends StatelessWidget {
  final TxnList? txn;
  const TransactionDetails({this.txn, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Transactions Details ",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Inter")),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hash", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: "Inter"),),
              Flexible(
                child: SizedBox(
                  width: 220,
                  child: Text(
                    txn!.hash.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "Inter"),
                    softWrap: true,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          Divider(height: 30, color: Colors.grey.shade300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Time",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: "Inter"),),
              Text(
                DateFormat('yyyy-MM-dd').format(
                    DateTime.fromMillisecondsSinceEpoch(txn!.time! * 1000)),
                style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "Inter"),
              )
            ],
          ),
          Divider(height: 30, color: Colors.grey.shade300),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Size",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: "Inter"),),
              Text(
                txn!.size.toString(),
                style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "Inter"),
              )
            ],
          ),
          Divider(height: 30, color: Colors.grey.shade300),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Text("Block index",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                   color: Colors.black54,
                   fontFamily: "Inter"),),
              Text(
                txn!.blockIndex.toString(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "Inter"),
              )
            ],
          ),
          Divider(height: 30, color: Colors.grey.shade300),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Received time",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: "Inter"),),
              Text(
                DateFormat('yyyy-MM-dd').format(
                    DateTime.fromMillisecondsSinceEpoch(txn!.time! * 1000)),
                style:const  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "Inter"),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/link.svg",
                    height: 20,
                    width: 20,
                  ),
               SizedBox(width: 20),
               const   Text(
                    "View on blockchain explorer",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/images/chevron-right.svg",
                height: 20,
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

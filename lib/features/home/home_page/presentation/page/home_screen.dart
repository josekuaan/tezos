import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend/features/common/color_constant.dart';
import 'package:spend/features/home/transaction/presentation/page/transaction_screen.dart';
import 'package:spend/network/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(
              "assets/images/scan.svg",
              height: 20,
              width: 20,

            ),
          ),
          leadingWidth: 38,
          centerTitle: true,
          title:const  Text("Explore", style: TextStyle(
              fontWeight: FontWeight.w600,

              fontSize: 16,
              fontFamily: "Inter")),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/search.svg",
                    height: 20,
                    width: 20,

                  ),
                  SizedBox(width: 20,),
                  SvgPicture.asset(
                    "assets/images/note.svg",
                    height: 20,
                    width: 20,

                  ),

                ],
              ),
            )
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
              const  Row(
                  children: [
                    Text("My balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkGrey,
                            fontSize: 14,
                            fontFamily: "Inter")),
                    SizedBox(width: 5),
                    Icon(Icons.visibility,size: 20,color: Colors.black54,)
                  ],
                ),
            const  SizedBox(height: 10,),
            RichText(text:const  TextSpan(
              children:[
                TextSpan(text: "₦",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "Inter")),
                TextSpan(text: "5,000",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.black,
                    fontFamily: "Inter")),
                TextSpan(text: ".00",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Inter")),
              ],),),
          const   Divider(height: 30,color: lightGrey),

           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My assets",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Inter")),
                  Text("See all",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: green,
                          fontSize: 16,
                          fontFamily: "Inter"))
                ],
            ),
            SizedBox(height: 10),
             ListTile(
              leading: SvgPicture.asset(
                "assets/images/bitcoin.svg",
                height: 40,
                width: 40,

              ),
              title: const Text("Bitcoin",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "Inter")),
              trailing:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 const Text("₦24,000,00",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Inter")),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/images/arrow-up-right.svg",
                          height: 20,
                          width: 20,

                        ),

                        const  Text("1.76%",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: green,
                            fontSize: 14,
                            fontFamily: "Inter")),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: const Text("BTC",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: lightBlueGrey,
                  fontFamily: "Inter")),
               dense: true,
               minLeadingWidth: 2,
               minVerticalPadding: 5,
               horizontalTitleGap: 10,
               contentPadding:EdgeInsets.zero,
             onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const TransactionScreen())),
            ),
            ListTile(
              leading:  SvgPicture.asset(
                "assets/images/eth.svg",
                height: 40,
                width: 40,

              ),
              title: const Text("Ethereum",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "Inter")),
              trailing:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const   Text("₦24,000,00",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Inter")),

                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/images/arrow-down-right.svg",
                          height: 20,
                          width: 20,

                        ),

                        const  Text("1.76%",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "Inter")),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: const Text("ETH",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: lightBlueGrey,
                      fontFamily: "Inter")),
              dense: true,
              minLeadingWidth: 2,
              minVerticalPadding: 5,
                horizontalTitleGap: 10,
                contentPadding:EdgeInsets.zero
            ),

            ListTile(
              leading: SvgPicture.asset(
                "assets/images/solana.svg",
                height: 40,
                width: 40,

              ),
              title: const  Text("Solana",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "Inter")),
              trailing:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                const   Text("₦24,000,00",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Inter")),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/images/arrow-up-right.svg",
                          height: 20,
                          width: 20,

                        ),

                        const  Text("1.76%",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: green,
                            fontSize: 14,
                            fontFamily: "Inter")),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle:const  Text("SOL",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: lightBlueGrey,
                      fontFamily: "Inter")),
                dense: true,
                minLeadingWidth: 2,
                minVerticalPadding: 5,
                horizontalTitleGap: 10,
                contentPadding:EdgeInsets.zero
            ),
            Divider(height: 20,color: lightGrey),
          const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Top Movers",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,

                        fontSize: 16,
                        fontFamily: "Inter")),
                Text("See all",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: green,
                    fontSize: 16,
                    fontFamily: "Inter"))
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 160,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width:0.5,color: lightBlueGrey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/eth.svg",
                          height: 40,
                          width: 40,

                        ),
                       const  SizedBox(height: 5),
                        const  Text("Ethereum",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: "Inter")),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/images/arrow-down-right.svg",
                                height: 20,
                                width: 20,

                              ),

                              const  Text("1.76%",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontFamily: "Inter")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5,color: lightBlueGrey),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/bitcoin.svg",
                          height: 40,
                          width: 40,

                        ),
                        SizedBox(height: 5),
                        const Text("Bitcoin",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: "Inter")),
                        const  SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/images/arrow-up-right.svg",
                                height: 20,
                                width: 20,

                              ),

                              const  Text("1.76%",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: green,
                                  fontSize: 14,
                                  fontFamily: "Inter")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const  SizedBox(width: 10),
                  Container(
                    width: 160,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5,color: lightBlueGrey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/solana.svg",
                          height: 40,
                          width: 40,

                        ),
                        SizedBox(height: 5),
                        const  Text("Solana",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: "Inter")),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/images/arrow-up-right.svg",
                                height: 20,
                                width: 20,

                              ),

                              const  Text("1.76%",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: green,
                                  fontSize: 14,
                                  fontFamily: "Inter")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Divider(height: 40,color: lightGrey),
            const  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Trending news",
                   style: TextStyle(
                   fontWeight: FontWeight.w500),
               ),
               Text("view more",style: TextStyle(
                   fontWeight: FontWeight.w500,
                   color: green,
                   fontSize: 16,
                   fontFamily: "Inter")),
             ],
           ),

            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/elon2.png',
                width: double.infinity,
                fit: BoxFit.fill,
                ),
               const  Text("Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Inter"))
              ],
            ),
            Divider(height: 20,color: lightGrey),
            ListTile(
              title: const Text("Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Inter")),

            subtitle: const Text("CoinDesk • 2h",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    fontSize: 14,
                    fontFamily: "Inter")) ,
              leading:  Image.asset('assets/images/elon.png',
                height: 100,
               ),
                dense: true,
                minLeadingWidth: 2,
                minVerticalPadding: 5,
                horizontalTitleGap: 10,
                contentPadding:EdgeInsets.zero
            ),
            Divider(height: 20,color: lightGrey),
            ListTile(
                title: const Text("Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Inter")),

                subtitle: const Text("CoinDesk • 2h",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 14,
                        fontFamily: "Inter")) ,
                leading:  Image.asset('assets/images/elon.png',
                  height: 100,
                ),
                dense: true,
                minLeadingWidth: 2,
                minVerticalPadding: 5,
                horizontalTitleGap: 10,
                contentPadding:EdgeInsets.zero
            ),
            SizedBox(height: 20)
          ],
        ),
      )
    );
  }
}

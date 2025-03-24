import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class DeliveryAddressTile extends StatelessWidget {
  const DeliveryAddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Util().blackColor,
              ),
              Text(
                "Delivery Address",
                style: TextStyle(fontFamily: "Montserrat Bold", fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 110,
                decoration: BoxDecoration(
                  color: Util().whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address :",
                            style: TextStyle(fontFamily: "Montserrat Medium"),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit_note_sharp))
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          "216 St Paul's Rd, London N1 2LL, UKContact :  +44-784232",
                          style: TextStyle(
                              fontFamily: "Montserrat Regular", fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Util().whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 25, bottom: 25),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

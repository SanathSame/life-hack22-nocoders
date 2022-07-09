import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF454955),
        body: Stack(children: [
          Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/image_corgi.jpeg"),
                          fit: BoxFit.cover)),
                  height: 300),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //     Text("Image To Be Inserted",
                    // style: TextStyle(
                    //       color: Colors.green,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 40.0,
                    //       fontFamily: 'Serif'))
                    // ]),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Plastic Bottle",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Description",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 300,
                            height: 150,
                            child: Text(
                                "Plastics are used in our daily lives, but are all plastics recycled once in the recycling bin? Sadly, no, because the fact is that not all plastics are recyclable...\n\nThere are two types of plastics, mainly thermoset and and thermo plastics. Thermoset are plasters that can be heated and remoulded into new products",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text("How to Recycle",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 300,
                            height: 100,
                            child: Text(
                                "Before throwing the plastic into the recycling bin, make sure that the recycle icon is there...\n\nIf it is there, dispose the plastic in the recycling bin.",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 35,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF96D75), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 35,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color(0xFF73937E), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 195, left: 250),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF73937E)),
                          onPressed: () => {},
                          child: Row(
                            children: const [
                              Text(
                                "Recyclable",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              SizedBox(
                                  width: 10,
                                  height: 20,
                                  child: Icon(Icons.check))
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}

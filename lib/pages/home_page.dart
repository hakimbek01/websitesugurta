import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  List hududNames = [
    "Toshkent shahri","Boshqa Viloyatlar"
  ];
  List avtoName=["Yengil avtomobillar","Yuk avtomobillari","Avtobus va Mikro avtobuslar","Boshqa"];
  String hozirgiHudud = "Toshkent shahri";
  String hozirgiMashina = "Yengil avtomobillar";
  List<PopupMenuEntry> mashinalar = [];
  List<PopupMenuEntry> hududlar=[];

  int avtoIndex = 1;
  int areaIndex = 1;
  int driverCountIndex = 1;
  int timeInsurance = 1;

  String resuld = "0";

  void sortCalcData() {
    for (var i = 0;hududNames.length>i;i++) {
      hududlar.add(
          PopupMenuItem(
            onTap: () {
              areaIndex = i+1;
              setState(() {
                hozirgiHudud = hududNames[i];
              });
            },
            child: Text(hududNames[i]),
          )
      );
    }
    for (var i = 0;avtoName.length>i;i++) {
      mashinalar.add(
          PopupMenuItem(
            onTap: () {
              avtoIndex = i+1;
              setState(() {
                hozirgiMashina = avtoName[i];
              });
            },
            child: Text(avtoName[i]),
          )
      );
    }
  }

  @override
  void initState() {
    sortCalcData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentWitdh = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(currentWitdh.toString()),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          //first
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png")
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///appBar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Avto Sug'urta",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Font"))
                    ),
                  ),
                  ///slide text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 500,
                      child: Column(
                        children: const [
                          Text(
                            "Tez va qulay Avto Sug'urta.Faqat Bizda",
                            style: TextStyle(
                                fontFamily: "Font",
                                fontSize: 55,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Siz bizning xizmatdan foydalanar ekansiz. "
                              "Hech qachin afsuslanmaysiz. Bizda hammasi tezkor va eng muhimi HALOL.To'liq bilish uchun esa kezing",
                            style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100),
                          ),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //bottom
          currentWitdh<760?
          Container(
              margin: const EdgeInsets.all(20),
              height: 430,
              padding: const EdgeInsets.all(20),
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 12,
                      spreadRadius: 5,
                    ),
                  ]
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 3,
                              blurRadius: 8
                          )
                        ]
                    ),
                    width: MediaQuery.of(context).size.width-70,
                    child: Stack(
                      children: [
                        //portfel
                        Container(
                          margin: const EdgeInsets.only(right: 70),
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Image(
                              width: 50,
                              image: AssetImage("assets/images/portfel.png"),
                            ),
                          ),
                        ),
                        //pasport
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Image(
                            width: 50,
                            image: AssetImage("assets/images/passport.png"),
                          ),
                        ),
                        //litsenziya
                        Container(
                          margin: const EdgeInsets.only(top: 20,left: 30),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Image(
                              width: 50,
                              image: AssetImage("assets/images/litsenziya.png"),
                            ),
                          ),
                        ),
                        //prava
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: const Image(
                              width: 50,
                              image: AssetImage("assets/images/prava.png"),
                            ),
                          ),
                        ),
                        //number
                        Container(
                          margin: const EdgeInsets.only(top: 30,),
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Image(
                              width: 50,
                              image: AssetImage("assets/images/number.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Kerakli hujjatlar",style: TextStyle(fontSize: 25,fontFamily: "Font",fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Text("1) TEX PASPORT",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("2) PASPORT",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("3) HAYDOVCHILIK GUVOHNOMASI",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("4) MUROJATCHINING TELEFON RAQAMI",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ):
          Container(
              margin: const EdgeInsets.all(20),
              height: 330,
              padding: const EdgeInsets.all(20),
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 12,
                      spreadRadius: 5,
                    ),
                  ]
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 3,
                              blurRadius: 8
                          )
                        ]
                    ),
                    width: MediaQuery.of(context).size.width/2.5,
                    child: Stack(
                      children: [
                        //portfel
                        Container(
                          margin: const EdgeInsets.only(right: 70),
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Image(
                              width: 110,
                              image: AssetImage("assets/images/portfel.png"),
                            ),
                          ),
                        ),
                        //pasport
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Image(
                            width: 100,
                            image: AssetImage("assets/images/passport.png"),
                          ),
                        ),
                        //litsenziya
                        Container(
                          margin: const EdgeInsets.only(top: 20,left: 30),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Image(
                              width: 100,
                              image: AssetImage("assets/images/litsenziya.png"),
                            ),
                          ),
                        ),
                        //prava
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: const Image(
                              width: 100,
                              image: AssetImage("assets/images/prava.png"),
                            ),
                          ),
                        ),
                        //number
                        Container(
                          margin: const EdgeInsets.only(top: 30,),
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Image(
                              width: 100,
                              image: AssetImage("assets/images/number.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Kerakli hujjatlar",style: TextStyle(fontSize: 25,fontFamily: "Font",fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Text("1) TEX PASPORT",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("2) PASPORT",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("3) HAYDOVCHILIK GUVOHNOMASI",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("4) MUROJATCHINING TELEFON RAQAMI",style: TextStyle(fontFamily: "Font2",fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
          const SizedBox(height: 30,),
          //calculator
          currentWitdh<760?
          Container(
            height: 750,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 12,
                    spreadRadius: 5,
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Sug'urta Polis Kalkulyatori",textAlign: TextAlign.center,style: TextStyle(fontSize: 27,fontFamily: "Font2",fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                //mashina turi
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Transport turi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    PopupMenuButton(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ]
                        ),
                        child: Center(child: Text(hozirgiMashina,style: const TextStyle(fontSize: 17,),)),
                      ),
                      itemBuilder: (context) => mashinalar,
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                //hudud
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Ro'yhatga olingan hudud",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    PopupMenuButton(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ]
                        ),
                        child: Center(child: Text(hozirgiHudud,style: const TextStyle(fontSize: 17,),)),
                      ),
                      itemBuilder: (context) => hududlar,
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                //haydovchi soni
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Haydovchilar soni",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  driverCountIndex = 1;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: driverCountIndex==1?CupertinoColors.activeBlue:Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 2
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("Cheklanmagan",style: TextStyle(color: driverCountIndex==1?Colors.white:Colors.black,fontSize: 17),),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  driverCountIndex = 2;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: driverCountIndex==2?CupertinoColors.activeBlue:Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 2
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("5 nafargacha",style: TextStyle(color: driverCountIndex==2?Colors.white:Colors.black,fontSize: 17),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                //sug'urta muddati
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sug'urta muddati",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  timeInsurance = 1;
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: timeInsurance==1?CupertinoColors.activeGreen:Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 2
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("Bir yil",style: TextStyle(color: timeInsurance==1?Colors.white:Colors.black,fontSize: 17),),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  timeInsurance = 2;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: timeInsurance==2?CupertinoColors.activeGreen:Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 2
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("Olti oy",style: TextStyle(color: timeInsurance==2?Colors.white:Colors.black,fontSize: 17),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 180,
                      color: Colors.cyan,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: (){
                        calc();
                      },
                      child: const Text("Hisoblash",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                    ),
                    const SizedBox(height: 15,),
                    Text(resuld,style: TextStyle(fontSize: 35,fontFamily: "Font"),)
                  ],
                )
              ],
            ),
          ):
          Stack(
            children: [
              Center(
                child: Container(
                  width: 750,
                  height: 560,
                  padding: const EdgeInsets.all(20),
                  // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 12,
                          spreadRadius: 5,
                        ),
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Sug'urta Polis Kalkulyatori",textAlign: TextAlign.center,style: TextStyle(fontSize: 27,fontFamily: "Font2",fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      //mashina turi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Transport turi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(width: 30,),
                          PopupMenuButton(
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ]
                              ),
                              child: Center(child: Text(hozirgiMashina,style: const TextStyle(fontSize: 17,),)),
                            ),
                            itemBuilder: (context) => mashinalar,
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      //hudud
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ro'yhatga olingan hudud",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(width: 30,),
                          PopupMenuButton(
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ]
                              ),
                              child: Center(child: Text(hozirgiHudud,style: const TextStyle(fontSize: 17,),)),
                            ),
                            itemBuilder: (context) => hududlar,
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      //haydovchi soni
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Haydovchilar soni",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          driverCountIndex = 1;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: driverCountIndex==1?CupertinoColors.activeBlue:Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 5,
                                                  spreadRadius: 2
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Text("Cheklanmagan",style: TextStyle(color: driverCountIndex==1?Colors.white:Colors.black,fontSize: 17),),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          driverCountIndex = 2;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: driverCountIndex==2?CupertinoColors.activeBlue:Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 5,
                                                  spreadRadius: 2
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Text("5 nafargacha",style: TextStyle(color: driverCountIndex==2?Colors.white:Colors.black,fontSize: 17),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                      //sug'urta muddati
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Sug'urta muddati",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            const SizedBox(width: 30,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          timeInsurance = 1;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: timeInsurance==1?CupertinoColors.activeGreen:Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 5,
                                                  spreadRadius: 2
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Text("Bir yil",style: TextStyle(color: timeInsurance==1?Colors.white:Colors.black,fontSize: 17),),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30,),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          timeInsurance = 2;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: timeInsurance==2?CupertinoColors.activeGreen:Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 5,
                                                  spreadRadius: 2
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Text("Olti oy",style: TextStyle(color: timeInsurance==2?Colors.white:Colors.black,fontSize: 17),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            height: 50,
                            minWidth: 180,
                            color: Colors.cyan,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: (){
                              calc();
                            },
                            child: const Text("Hisoblash",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          ),
                          const SizedBox(height: 15,),
                          Text(resuld,style: TextStyle(fontSize: 35,fontFamily: "Font"),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Murojat uchun",style: TextStyle(color: Colors.orangeAccent,fontSize: 15,fontFamily: "Font",fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Text("+998 916474950",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Telegram Guruhimiz",style: TextStyle(color: Colors.orangeAccent,fontSize: 15,fontFamily: "Font",fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: () async {
                            Uri url = Uri.parse("https://t.me/sugurta2023");
                            await launchUrl(url);
                          },
                          child: AvatarGlow(
                            endRadius: 40.0,
                            child: Material(     // Replace this child with your own
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                child: Image.asset(
                                  'assets/images/telegram.png',
                                  height: 50,
                                ),
                                radius: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Admin",style: TextStyle(color: Colors.orangeAccent,fontSize: 15,fontFamily: "Font",fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        MaterialButton(
                          padding: EdgeInsets.only(bottom: 10),
                          onPressed: () async {
                            Uri url = Uri.parse("https://t.me/onlayn2023");
                            await launchUrl(url);
                          },
                          child: Text("@onlayn2023",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () async {
                      Uri url = Uri.parse("https://t.me/hakimbek_dev");
                      await launchUrl(url);
                    },
                    child: Text("Dasturchi bilan bog'lanish",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void calc() {
    String str = "";
    for (var a in [avtoIndex,areaIndex,driverCountIndex,timeInsurance]){
      str = "$str$a";
    }
    int son = int.parse(str);

    switch (son){
      case 1111:{
        setState(() {
          resuld = "168.000";
        });
      }
      break;
      case 1112:{
        setState(() {
          resuld = "117.600";
        });
      }
      break;
      case 1211:{
        setState(() {
          resuld = "120.000";
        });
      }
      break;
      case 1121:{
        setState(() {
          resuld = "56.000";
        });
      }
      break;
      case 1221:{
        setState(() {
          resuld = "40.000";
        });
      }
      break;
      case 1122:{
        setState(() {
          resuld = "392.000";
        });
      }
      break;
      case 1222:{
        setState(() {
          resuld = "28.000";
        });
      }
      break;
      case 1212:{
        setState(() {
          resuld = "84.000";
        });
      }
      break;
      case 2111:{
        setState(() {
          resuld = "201.600";
        });
      }
      break;
      case 2112:{
        setState(() {
          resuld = "141.120";
        });
      }
      break;
      case 2211:{
        setState(() {
          resuld = "144.000";
        });
      }
      break;
      case 2121:{
        setState(() {
          resuld = "67.200";
        });
      }
      break;
      case 2221:{
        setState(() {
          resuld = "48.000";
        });
      }
      break;
      case 2122:{
        setState(() {
          resuld = "47.040";
        });
      }
      break;
      case 2222:{
        setState(() {
          resuld = "33.600";
        });
      }
      break;
      case 2212:{
        setState(() {
          resuld = "100.800";
        });
      }
      break;
      case 3111:{
        setState(() {
          resuld = "201.600";
        });
      }
      break;
      case 3112:{
        setState(() {
          resuld = "141.120";
        });
      }
      break;
      case 3211:{
        setState(() {
          resuld = "144.000";
        });
      }
      break;
      case 3121:{
        setState(() {
          resuld = "67.200";
        });
      }
      break;
      case 3221:{
        setState(() {
          resuld = "48.000";
        });
      }
      break;
      case 3122:{
        setState(() {
          resuld = "47.040";
        });
      }
      break;
      case 3222:{
        setState(() {
          resuld = "33.600";
        });
      }
      break;
      case 3212:{
        setState(() {
          resuld = "100.800";
        });
      }
      break;
      case 4111:{
        setState(() {
          resuld = "168.000";
        });
      }
      break;
      case 4112:{
        setState(() {
          resuld = "117.600";
        });
      }
      break;
      case 4211:{
        setState(() {
          resuld = "120.000";
        });
      }
      break;
      case 4121:{
        setState(() {
          resuld = "56.000";
        });
      }
      break;
      case 4221:{
        setState(() {
          resuld = "40.000";
        });
      }
      break;
      case 4122:{
        setState(() {
          resuld = "39.200";
        });
      }
      break;
      case 4222:{
        setState(() {
          resuld = "28.000";
        });
      }
      break;
      case 4212:{
        setState(() {
          resuld = "84.000";
        });
      }
      break;
    }
  }
}

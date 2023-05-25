import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {

  List model = [
    Model(animatsiya: false,cheklanganmi: true,img: "assets/images/cheklanmagan1.png",isPoytaxt: true,mashina: "Yengil avtomobillar",narxi: "Sug'urta uchun 56000"),
    Model(animatsiya: false,cheklanganmi: false,img: "assets/images/cheklanmagan2.png",isPoytaxt: true,mashina: "Yengil avtomobillar",narxi: "Sug'urta uchun 16800"),
    Model(animatsiya: false,cheklanganmi: true,img: "assets/images/passport.png",isPoytaxt: true,mashina: "Yuk avtomobillari",narxi: "Sug'urta uchun 67200"),
    Model(animatsiya: false,cheklanganmi: false,img: "assets/images/litsenziya.png",isPoytaxt: true,mashina: "Yuk avtomobillari",narxi: "Sug'urta uchun 201600"),
    Model(animatsiya: false,cheklanganmi: true,img: "assets/images/cheklanmagan2.png",isPoytaxt: false,mashina: "Yengil avtomobillar",narxi: "Sug'urta uchun 40000"),
    Model(animatsiya: false,cheklanganmi: false,img: "assets/images/cheklanmagan1.png",isPoytaxt: false,mashina: "Yengil avtomobillar",narxi: "Sug'urta uchun 12000"),
    Model(animatsiya: false,cheklanganmi: true,img: "assets/images/prava.png",isPoytaxt: false,mashina: "Yuk avtomobillari",narxi: "Sug'urta uchun 48000"),
    Model(animatsiya: false,cheklanganmi: false,img: "assets/images/litsenziya.png",isPoytaxt: false,mashina: "Yuk avtomobillari",narxi: "Sug'urta uchun 14400"),
  ];

  bool cheklanganmi = false;
  bool sugurtaTime = false;
  List hududNames = [
    "Toshkent shahri","Boshqa Viloyatlar"
  ];
  List avtoName=["Yuk avtomobillari","Yengil avtomobillar","Avtobus va Mikro avtobuslar","Boshqa"];
  String hozirgiHudud = "Toshkent shahri";
  String hozirgiMashina = "Yengil avtomobillar";
  List<PopupMenuEntry> mashinalar = [];
  List<PopupMenuEntry> hududlar=[];


  void sortCalcData() {
    for (var i in hududNames) {
      hududlar.add(
          PopupMenuItem(
            onTap: () {
              setState(() {
                hozirgiHudud = i;
              });
            },
            child: Text(i),
          )
      );
    }
    for (var i in avtoName) {
      mashinalar.add(
          PopupMenuItem(
            onTap: () {
              setState(() {
                hozirgiMashina = i;
              });
            },
            child: Text(i),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //first
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/main.png")
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.3),
                          Colors.black.withOpacity(.4) ,
                        ]
                    )
                ),
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
            ),
            const SizedBox(height: 30,),
            //calculator
            Container(
              width: MediaQuery.of(context).size.width-20,
              height: 800,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                    cheklanganmi = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cheklanganmi?Colors.white:CupertinoColors.activeBlue,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5,
                                            spreadRadius: 2
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Text("5 nafargacha",style: TextStyle(color: cheklanganmi?Colors.black:Colors.white,fontSize: 17),),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cheklanganmi = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cheklanganmi?CupertinoColors.activeBlue:Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5,
                                            spreadRadius: 2
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Text("Cheklanmagan",style: TextStyle(color: cheklanganmi?Colors.white:Colors.black,fontSize: 17),),
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
                                    sugurtaTime = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: sugurtaTime?Colors.white:CupertinoColors.activeGreen,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5,
                                            spreadRadius: 2
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Text("Bir yil",style: TextStyle(color: sugurtaTime?Colors.black:Colors.white,fontSize: 17),),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sugurtaTime = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: sugurtaTime?CupertinoColors.activeGreen:Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5,
                                            spreadRadius: 2
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Text("Olti oy",style: TextStyle(color: sugurtaTime?Colors.white:Colors.black,fontSize: 17),),
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
                        onPressed: (){},
                        child: const Text("Hisoblash",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                      const SizedBox(height: 15,),
                      const Text("0012912910",style: TextStyle(fontSize: 35,fontFamily: "Font"),)
                    ],
                  )
                ],
              ),
            ),
            //items
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.width*model.length,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1
                ),
                scrollDirection: Axis.vertical,
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sugurtalar(model[index],index)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sugurtalar(Model model,index1) {
    model.index = index1;
    return AnimatedContainer(
      height: 320,
      width: 260,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 12,
              spreadRadius: 5,
            ),
          ]
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image(
                width: 260,
                height: 170,
                fit: BoxFit.cover,
                image: AssetImage(model.img!),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(model.mashina!,maxLines: 1,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,overflow: TextOverflow.ellipsis)),
              ),
              const SizedBox(height: 20,),
              Text(model.narxi!,maxLines: 2,style: const TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),)
            ],
          ),
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 1,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: model.cheklanganmi!?Colors.red:Colors.green,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(model.cheklanganmi!?"Cheklangan":"Cheklanmagan",style: const TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 40,
                          width: 1,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text(model.isPoytaxt!?"Toshkent":"Viloyatlar",style: const TextStyle(color: Colors.white),),
                          )
                      ),
                    ),
                  ],
                ),
              )
          ),
          const SizedBox(height: 7,)
        ],
      ),
    );
  }

}

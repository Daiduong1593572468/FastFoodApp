import 'package:fastfood/common_widget/category_cell.dart';
import 'package:fastfood/common_widget/food_item.dart';
import 'package:fastfood/common_widget/most_popular_cell.dart';
import 'package:fastfood/common_widget/popular_resutaurant_row.dart';
import 'package:fastfood/common_widget/recent_item_row.dart';
import 'package:fastfood/common_widget/view_all_title_row.dart';
import 'package:fastfood/fastfood/core/models/firebase/food_request.dart';
import 'package:fastfood/fastfood/core/models/food/food.dart';
import 'package:fastfood/fastfood/presentations/screens/menu/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key, AnimationController? animationController})
      : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  TextEditingController searchController = TextEditingController();
  bool isTextFieldVisible = false;
  String searchValue = '';
  void _openDialog() {
    showDialog(
      context: context,
      builder: (context) => ListeningDialog(
        onSpeechEnd: (spokenText) {
          searchController.text = spokenText;
          searchValue = spokenText;
        },
      ),
    );
  }

  List catArr = [
    {"image": "assets/img/cat_offer.png", "name": "Offers"},
    {"image": "assets/img/cat_sri.png", "name": "Sri Lankan"},
    {"image": "assets/img/cat_3.png", "name": "Italian"},
    {"image": "assets/img/cat_4.png", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/img/res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/m_res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List recentArr = [
    {
      "image": "assets/img/item_1.png",
      "name": "Mulberry Pizza by Josh",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_2.png",
      "name": "Barita",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Pizza Rush Hour",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Discovery'),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isTextFieldVisible = !isTextFieldVisible;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  isTextFieldVisible
                      ? Container(
                          width: 400,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchValue = value;
                              });
                            },
                            controller: searchController,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              fillColor: Color(0xFFB6B7B7),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Search Food or Restaurant',
                              prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.mic),
                                onPressed: _openDialog,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Hello, User!',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivering to",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Current Location",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: catArr.length,
                      itemBuilder: ((context, index) {
                        var cObj = catArr[index] as Map? ?? {};
                        return CategoryCell(
                          cObj: cObj,
                          onTap: () {},
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ViewAllTitleRow(
                      title: "Popular Restaurants",
                      onView: () {},
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: popArr.length,
                    itemBuilder: ((context, index) {
                      var pObj = popArr[index] as Map? ?? {};
                      return PopularRestaurantRow(
                        pObj: pObj,
                        onTap: () {},
                      );
                    }),
                  ),
                  StreamBuilder<List<Food>>(
                      stream: searchValue != null
                          ? FoodRequest.search(searchValue)
                          : Stream.value([]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          print('Error: ${snapshot.error}');
                          return Center(
                            child: Text('Error loading food list'),
                          );
                        } else
                          return Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: snapshot.data!.length,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsView(
                                                    food:
                                                        snapshot.data![index]),
                                          ),
                                        );
                                      },
                                      child: FoodItem(
                                        food: snapshot.data![index],
                                      ));
                                }),
                              ),
                            ],
                          );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ViewAllTitleRow(
                      title: "Most Popular",
                      onView: () {},
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: mostPopArr.length,
                      itemBuilder: ((context, index) {
                        var mObj = mostPopArr[index] as Map? ?? {};
                        return MostPopularCell(
                          mObj: mObj,
                          onTap: () {},
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ViewAllTitleRow(
                      title: "Recent Items",
                      onView: () {},
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: recentArr.length,
                    itemBuilder: ((context, index) {
                      var rObj = recentArr[index] as Map? ?? {};
                      return RecentItemRow(
                        rObj: rObj,
                        onTap: () {},
                      );
                    }),
                  )
                ],
              )),
        ));
  }
}

class ListeningDialog extends StatefulWidget {
  final Function(String) onSpeechEnd;

  ListeningDialog({required this.onSpeechEnd});
  @override
  _ListeningDialogState createState() => _ListeningDialogState();
}

class _ListeningDialogState extends State<ListeningDialog> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = '';

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    if (widget.onSpeechEnd != null) {
      widget.onSpeechEnd(_wordSpoken);
    }
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _wordSpoken = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Listening...'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _speechToText.isListening
                ? '$_wordSpoken'
                : _speechEnabled
                    ? 'Tap the microphone to start listening...'
                    : 'Speech not available',
          ),
          Expanded(
            child: Container(child: Text(_wordSpoken)),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          onPressed:
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: "Listen",
        ),
      ],
    );
  }
}

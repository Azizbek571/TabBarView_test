import 'package:flutter/material.dart';
import 'package:tabbar_test/data/countries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firstCountry = countries[0];
    final restCountries = countries.sublist(1);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "Countries and capitals",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.flag_circle_outlined),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              firstCountry["country"],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text('Capital:${firstCountry["capital"]}'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                    indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Color(0xff4838D1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 10),
                    tabs: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Tab(text: "Europe")),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Tab(text: "Asia"),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Tab(text: "North America")),
                    ]),
              ),
              SizedBox(
                  height: screenHeight * 0.54,
                  child: TabBarView(controller: tabController, children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: 300,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Center(child: Text("Europe"))),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: 300,
                          decoration: BoxDecoration(color: Colors.purple),
                          child: Center(child: Text("Asia"))),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: 300,
                          decoration: BoxDecoration(color: Colors.green),
                          child: Center(child: Text("North America"))),
                    ),
                  ])),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: restCountries.length,
                  itemBuilder: (context, index) {
                    final country = restCountries[index];
                    return ListTile(
                      leading: Icon(Icons.flag),
                      title: Text(country["country"]),
                      subtitle: Text('Capital: ${country["capital"]}'),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}

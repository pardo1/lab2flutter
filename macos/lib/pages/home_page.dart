import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blah2/controllers/app_controller.dart';
import 'package:blah2/widgets/address_widget.dart';
import 'package:blah2/widgets/category_button.dart';
import 'package:blah2/widgets/decorated_icon_button.dart';
import 'package:blah2/widgets/image_container.dart';
import 'package:blah2/widgets/wine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Address(
                    location: 'Donnerville Drive',
                    address: "4 Donnerville Hall, Donnerville Drive, Admaston...",
                  ),
                  DecoratedIconButton(
                    icon: Icons.notifications_outlined,
                    size: 50,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchBar(
                leading: const Icon(Icons.search),
                trailing: [
                  const VerticalDivider(
                    width: 10,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic_outlined)),
                ],
                hintText: 'Search',
              ),
              const SizedBox(height: 20),
              const Text(
                'Browse wines by',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appController.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CategoryButton(
                        name: appController.categoryList[index],
                        onTap: () {},
                        isSelected: index == 0,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appController.wineColorList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ImageContainer(
                        image: appController.wineColorList[index] == "White wines"
                            ? "assets/images/white-wine.png"
                            : "assets/images/red-wine.png",
                        title: appController.wineColorList[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wines Collection',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all'),
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appController.wineList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: WineCard(wine: appController.wineList[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

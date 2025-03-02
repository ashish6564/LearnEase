import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learn_ease/utils/app_images.dart';
import 'package:lottie/lottie.dart';

import '../../model/book_data_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_textstyles.dart';
import '../categories/categories.dart';
import '../favorite/favorite.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();

  BookDataModel bookDataModel = BookDataModel();

  bool isCategories = true;
  bool isFavorite = false;

  @override
  void initState() {
    loadBookJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Lottie.asset('assets/lotty/dashboard.json'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'search for topic',
                  hintStyle: TextStyle(
                      color: AppColors.lighterGrey,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.lighterGrey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.lighterGrey, width: 1))),
            ),
             Expanded(
                child: isCategories ? Categories( languageList: bookDataModel.language, subjects:bookDataModel.language?[0].subjects, book:bookDataModel.language?[0].subjects?[0].book, pdfLinks:bookDataModel.language?[0].subjects?[0].book?[0].pdfLinks,) : Favorite()),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.buttonBgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {

                  isCategories =true;
                  isFavorite =false;
                  setState(() {

                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: isCategories ? Colors.red : Colors.grey.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Categories',
                        style: CustomTextStyles.buttonText12,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  isFavorite =true;
                  isCategories =false;
                  setState(() {

                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: isFavorite ? Colors.greenAccent : Colors.grey.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Favorite',
                        style: CustomTextStyles.buttonText12,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  loadBookJson() async {
    EasyLoading.show(
      indicator: Image.asset(AppImages.loaderImage),
    );
    String data = await rootBundle.loadString('assets/json/book.json');
    await Future.delayed(Duration(seconds: 3));
    EasyLoading.dismiss();
    bookDataModel = BookDataModel.fromJson(jsonDecode(data));
    debugPrint('bookDataModel ${bookDataModel.language}');
    setState(() {});
  }


}

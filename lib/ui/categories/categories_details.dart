import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/book_data_model.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../subject_specific_pdf/categories_specific_pdf.dart';

class CategoriesDetails extends StatefulWidget {
 final appDatadetails;
  final List<Book>? book;
 final List<PdfLinks>? pdfLinks;
  const CategoriesDetails({super.key,required this.book,required this.appDatadetails,required this.pdfLinks});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.grey,
        title: Text(widget.appDatadetails),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2/3),
            itemCount: widget.book?.length ?? 0,
            itemBuilder: (context, index) {
              String image = "${Constants.baseUrl}${widget.book?[index].image ?? ""}";
              return GestureDetector(
                onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesSpecificPdf(pdfLinks: widget.book?[index].pdfLinks, categaorybookName: widget.book?[index].name,)));
                },
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),
                  //border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                           width: SizeConfig.screenWidth,
                          // height: SizeConfig.screenHeight,
                          // decoration: BoxDecoration(
                          //    // Right border
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(12), // Top-left corner radius
                          //     topRight: Radius.circular(12),
                          //   )
                          // ),
                          child:CachedNetworkImage(
                            fit: BoxFit.fill,
                            //imageUrl: widget.book?[index].image ?? "",
                            imageUrl: image,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ), ),
                      ),

                      Container(
                          alignment: Alignment.center,
                        height: 60,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        color: Colors.grey,
                        width: SizeConfig.screenWidth,
                          child: Text(widget.book?[index].name ?? "",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

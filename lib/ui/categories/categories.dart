import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/book_data_model.dart';
import 'categories_details.dart';

class Categories extends StatefulWidget {

 final List<Language>? languageList;
 final List<Subjects>? subjects;
 final List<Book>? book;
 final List<PdfLinks>? pdfLinks;

  const Categories({super.key,required this.languageList,required this.subjects,required this.book,required this.pdfLinks});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1),
        itemCount: widget.languageList?[0].subjects?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              print('INDEX:-  ${index}');
              print('INDEX12:- ${widget.languageList?[0]?.subjects?[index].book?[0].pdfLinks}');
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetails(book: widget.languageList?[0]?.subjects?[index].book, appDatadetails: widget.languageList?[0]?.subjects?[index].type ?? "", pdfLinks: widget.languageList?[0]?.subjects?[index].book?[0].pdfLinks,)));
            },
            child: Container(
               padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
               alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.category),
              Container(
                height: 30,
                  width: 30,
                  child:CachedNetworkImage(
                    imageUrl: widget.languageList?[0]?.subjects?[index].icon ?? "",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ), ),

                  SizedBox(height: 5,),
                  Text(widget.languageList?[0]?.subjects?[index].type ?? "",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,)
                ],
              ),
            ),
          );
        });
  }
}

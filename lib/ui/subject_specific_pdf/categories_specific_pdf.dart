import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/ui/subject_specific_pdf/pdf_viewer_screen.dart';
import 'package:learn_ease/utils/size_config.dart';
import 'package:lottie/lottie.dart';

import '../../model/book_data_model.dart';
import '../../utils/constants.dart';

class CategoriesSpecificPdf extends StatefulWidget {
  final List<PdfLinks>? pdfLinks;
  final categaorybookName;

  const CategoriesSpecificPdf(
      {super.key, required this.pdfLinks, required this.categaorybookName});

  @override
  State<CategoriesSpecificPdf> createState() => _CategoriesSpecificPdfState();
}

class _CategoriesSpecificPdfState extends State<CategoriesSpecificPdf> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      body: Column(
        children: [
          Container(
            //color: Colors.red,
            child: Center(
              child: Lottie.asset('assets/lotty/digital_metting.json',
                  // width: 250,
                  height: 200,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.categaorybookName),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      //color: Colors.blueAccent,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: widget.pdfLinks?.length,
                        itemBuilder: (context, index) {
                          print('pdf vieuw${Constants.baseUrl}${widget.pdfLinks?[index].link ?? ""}');
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: ()async{
                                final pdfUrl = await "${Constants.baseUrl}${widget.pdfLinks?[index].link ?? ""}";
                                print("Opening PDF: $pdfUrl");  // Print URL to debug
                                if(pdfUrl.isNotEmpty){
                                   _showPdf(pdfUrl);
                                }

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              //color: Colors.blue,
                                                width: 210,
                                                child: Text(widget.pdfLinks?[index].name ?? "",overflow: TextOverflow.ellipsis,maxLines: 3,)),
                                            Text('Unit-${index+1}'),
                                          ],
                                        ),
                                        Icon(Icons.download)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Method to show the PDF in a new screen
  void _showPdf(String pdfUrl) async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerScreen(filePath: pdfUrl),
      ),
    );
  }

}

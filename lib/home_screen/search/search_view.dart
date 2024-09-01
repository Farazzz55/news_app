
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/News/news_details.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';

class SearchView extends StatelessWidget {
  final News result;

  SearchView({required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.beigeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(NewsDetails.routeName , arguments: result);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: result.urlToImage??'',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(result.author??'no author',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          color: AppColors.LightGreyColor,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(result.title??'no title',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          color: AppColors.greyColor,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(result.publishedAt ??'null',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          color: AppColors.LightGreyColor,
                        ),
                        textAlign: TextAlign.right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

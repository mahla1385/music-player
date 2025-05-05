


import 'package:flutter/material.dart';
import 'package:music/animation/animated_text.dart';
import 'package:music/component/app_ui.dart';
import 'package:music/component/gap.dart';
import 'package:music/component/image_widget.dart';
import 'package:music/gen/assets.gen.dart';
import 'package:music/utils/theme_style.dart';
import 'package:music/utils/tools_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppUi(
      child: Column(
        children: [
          Container(width: double.maxFinite,
          child: Assets.images.logo.image(width: 54,height: 54,color: getTheme(context).primaryColorDark),
          ),
          Expanded(child: _content())
        ],
      ),
    );
  }


  Widget _content(){
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>_itemBuilder(index),
      ),
    );
  }
  
  
  Widget _itemBuilder(int index){
    return TextButton(
      onPressed: (){},
      child: Container(
        width: double.maxFinite,
        child: Row(
          children: [
            SizedBox(width: 56,height: 56,
            child: ImageView(imageUrl: "https://d1csarkz8obe9u.cloudfront.net/themedlandingpages/tlp_hero_album-cover-art-73ab5b3d9b81f442cb2288630ab63acf.jpg?ts%20=%201698245952"),
            ),
            Gap(),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView("Album cover",style: ThemeStyle.normalStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w300,),),
                Gap(height: 6,),
                TextView("Album cover",style: ThemeStyle.normalStyle.copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: getTheme(context).dividerColor.withAlpha(175)),),
              ],
            ))
          ],
        ),
      ),
    );
  }

}


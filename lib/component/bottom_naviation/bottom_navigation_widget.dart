import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:music/animation/animated_text.dart';
import 'package:music/component/bottom_naviation/border_widget.dart';
import 'package:music/component/gap.dart';
import 'package:music/utils/theme_style.dart';
import 'package:music/utils/tools_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/bottom_navigator/bottom_navigator_cubit.dart';

import 'model_bottom_navigation.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {



  @override
  Widget build(BuildContext context) {
    List<ModelBottomNavigation> navBtn = [
      ModelBottomNavigation(title: "Profile",icon: FeatherIcons.user,id: 1),
      ModelBottomNavigation(title: "Home",icon: FeatherIcons.home,id: 1),
      ModelBottomNavigation(title: "Store",icon: FeatherIcons.music,id: 1),
    ];
    return SizedBox(
      height: 65.0,
      child: Column(
        children: [
          BorderWidget(width: double.maxFinite,opacity: 10,),
          Expanded(
            child: AnimatedContainer(
              height: 65.0,
              color: getTheme(context).hintColor.withAlpha(100),
              duration: const Duration(milliseconds: 400),
              child: Row(
                children: navBtn.map((e) => buttonItem(navBtn.indexOf(e).toInt(),e)).toList(),),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonItem(int i,ModelBottomNavigation item){
    return BlocBuilder<BottomNavigatorCubit,BottomNavigatorState>(
      builder: (context, state) {
        return (state is BottomNavigatorInitial) ? Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(top: 7),
                    backgroundColor: getTheme(context).dividerColor.withAlpha((state.page == i) ?  7 : 0),
                    foregroundColor: Theme.of(context).dividerColor.withAlpha(80),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
                ),
                onPressed: (){
                  BlocProvider.of<BottomNavigatorCubit>(context).updatePage(i);
                },
                child: SizedBox(
                  width: double.maxFinite,height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Gap(height: 2,),
                      Icon(item.icon,color: (state.page == i) ? getTheme(context).primaryColor : Theme.of(context).dividerColor.withAlpha(50),size: (i == 3) ? 30 : 28,),
                      Gap(height: 6,),
                      Flexible(
                        child: TextView(item.title!,style: ThemeStyle.normalStyle.copyWith(
                            fontWeight: (state.page == i) ? FontWeight.w700 : FontWeight.w500,
                            letterSpacing: 0,
                            wordSpacing: 0,
                            fontSize: 10,
                            color:  (state.page == i) ? getTheme(context).primaryColor : Theme.of(context).dividerColor.withAlpha(50)
                        ),),
                      ),
                      Gap(height: 4,)
                    ],
                  ),
                ),
              ),
            )) : SizedBox();
      },
    );
  }


}

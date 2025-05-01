import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/component/loading_widget.dart';
import 'package:music/gen/assets.gen.dart';
import 'package:music/theme/app_theme.dart';
import 'package:music/utils/tools_app.dart';

class ImageView extends StatelessWidget {
  final BoxFit? boxFit;
  final String imageUrl;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const ImageView(
      {super.key,
      this.color,
      this.boxFit,
      this.borderRadius,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fadeOutDuration: Durations.short2,
      placeholderFadeInDuration: Durations.short2,
      fadeInDuration: Durations.long3,
      fadeInCurve: Curves.decelerate,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: (borderRadius == null)
              ? BorderRadius.circular(lowRadius * 1.5)
              : borderRadius!,
          image: DecorationImage(
              image: imageProvider,
              fit: (boxFit == null) ? BoxFit.cover : boxFit,
              colorFilter: (color != null)
                  ? ColorFilter.mode(color!, BlendMode.color)
                  : null),
        ),
      ),
      placeholder: (context, url) => LoadingWidget(
        size: 20,
        color: getTheme(context).primaryColor,
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withAlpha(20),
            border:
                Border.all(color: Theme.of(context).dividerColor.withAlpha(15)),
            borderRadius: (borderRadius == null)
                ? BorderRadius.circular(lowRadius * 1.5)
                : borderRadius!),
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (context, constraints) => Assets.images.logo.image(
              width: (constraints.maxHeight * 0.7),
              color: getTheme(context).primaryColor.withAlpha(150),
              height: (constraints.maxHeight * 0.7)),
        ),
      ),
    );
  }
}

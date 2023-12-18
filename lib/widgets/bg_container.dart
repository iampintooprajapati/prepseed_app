import 'package:flutter/material.dart';
import 'package:prepseed_app/utlis/app_imagestring.dart';

class BgContainer extends StatefulWidget {
  final Widget child;

  const BgContainer({super.key, required this.child});

  @override
  State<BgContainer> createState() => _BgContainerState();
}

class _BgContainerState extends State<BgContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImageString.icBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: widget.child,
    );
  }
}

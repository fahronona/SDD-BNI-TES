import 'package:flutter/material.dart';
import 'package:flutter_bni_sdd/data/model/promo_model.dart';
import 'package:flutter_bni_sdd/presentation/style/font_style.dart';

class DetailPromo extends StatefulWidget {
  final PromoModel promo;
  const DetailPromo({super.key, required this.promo});

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.promo.nama!,
          style: FontsStyle.fontBold600,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 180,
              width: 400,
              child: Image.network(widget.promo.img!.url!),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 18, left: 18),
            child: Text(
              widget.promo.nama!,
              style: FontsStyle.fontBold600.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, right: 18, left: 18),
            child: Text(
              widget.promo.desc!,
              style: FontsStyle.fontRegular400.copyWith(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_payflow/shared/models/boleto_model.dart';
import 'package:nlw_payflow/shared/themes/app_colors.dart';
import 'package:nlw_payflow/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:nlw_payflow/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:nlw_payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  bool _modificado = false;
  BoletoModel M = BoletoModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: BoletoInfoWidget(
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Meus boletos", style: TextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            /* child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                 BoletoListWidget();
              },*/
            child: Dismissible(
              background: buildSwipeActionRight(),
              confirmDismiss: (direction) async {
                return;
              },
              key: UniqueKey(),
              child: BoletoListWidget(
                key: UniqueKey(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSwipeActionRight() => Container(
      alignment: Alignment.centerRight,
      color: Colors.red,
    );

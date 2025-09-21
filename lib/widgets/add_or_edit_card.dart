import 'package:book_store/core/constants/card_mode.dart';
import 'package:book_store/core/utils/get_card_image_utils.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/cards/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddOrEditCard extends GetView<CardsController> {
  final cardId;
  final userId;
  final mode;
  const AddOrEditCard(
      {this.cardId, required this.userId, required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: Text(mode == CardMode.add
          ? local.card_dialog_add_title
          : local.card_dialog_update_title),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.cardHolderName,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return local.card_holder_name_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.card_holder_name,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80)))),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: '#### #### #### ####')
                ],
                keyboardType: TextInputType.number,
                controller: controller.cardNumber,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 19) {
                    return local.card_number_hint;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.card_number,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80))),
                    suffixIcon: Obx(() => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: getCardImage(controller.cardNumberText.value)))),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                inputFormatters: [MaskTextInputFormatter(mask: '##/##')],
                controller: controller.cardExpiredDate,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  final month = int.tryParse(value?.split('/')[0] ?? '');
                  if (value == null || value.isEmpty) {
                    return local.card_expired_date_hint;
                  }
                  if (month == null || month < 1 || month > 12) {
                    return local.card_expired_date_month_error;
                  }
                },
                decoration: InputDecoration(
                    hint: Text(local.card_expired_date,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withAlpha(80)))),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge),
          child: Text(local.card_dialog_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge),
          child: Text(local.card_dialog_save),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              mode == CardMode.add
                  ? await controller.addCard(userId)
                  : await controller.updateCard(cardId);
              await controller.getCards(userId);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

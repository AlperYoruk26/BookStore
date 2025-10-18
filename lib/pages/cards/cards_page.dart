import 'package:book_store/components/custom_alert_dialog.dart';
import 'package:book_store/core/constants/card_mode.dart';
import 'package:book_store/core/utils/get_card_color_unils.dart';
import 'package:book_store/core/utils/show_form_bottom_sheet.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/cards/cards_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/widgets/add_or_edit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});
  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final controller = Get.find<CardsController>();
  late final String userId;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      userId = args['user_id'];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getCards(userId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: LoadingPage(),
            );
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local.cards_title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 30),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ListTile(
                      trailing: GestureDetector(
                        onTap: () async {
                          controller.loadCardInfo('', '', '');
                          await showFormBottomSheet(
                              context: context,
                              content:
                                  AddOrEditCard(userId: userId, mode: CardMode.add));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add_card,
                                color: Theme.of(context).colorScheme.primary),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              local.add_card_button,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: controller.cards.map((card) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: CreditCardUi(
                                          cardHolderFullName: card.cardHolderName,
                                          cardNumber: card.cardNumber,
                                          validThru: card.cardExpiredDate,
                                          cardProviderLogo: card.isPrimary
                                              ? Chip(
                                                  label: Text(local.default_card),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 46, 105, 48),
                                                )
                                              : null,
                                          showValidFrom: false,
                                          doesSupportNfc: true,
                                          topLeftColor:
                                              getCardColor(card.cardNumber),
                                          bottomRightColor: Colors.black,
                                        ),
                                      ),
                                      MenuAnchor(
                                        style: MenuStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                          Get.isDarkMode
                                              ? Color(0xFF111111)
                                              : Color(0xFFEEEEEE),
                                        )),
                                        builder: (context, controller, child) {
                                          return IconButton(
                                              onPressed: () {
                                                controller.isOpen
                                                    ? controller.close()
                                                    : controller.open();
                                              },
                                              icon: Icon(
                                                Icons.more_vert,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
                                              ));
                                        },
                                        menuChildren: [
                                          MenuItemButton(
                                            onPressed: () async {
                                              await controller.setPrimaryCard(
                                                  userId, card.id);
                                              await controller.getCards(userId);
                                            },
                                            child: Text(
                                              local.card_set_as_default,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary),
                                            ),
                                          ),
                                          MenuItemButton(
                                            onPressed: () async {
                                              controller.loadCardInfo(
                                                  card.cardHolderName,
                                                  card.cardNumber,
                                                  card.cardExpiredDate);
                                              await showFormBottomSheet(
                                                  context: context,
                                                  content: AddOrEditCard(
                                                      cardId: card.id,
                                                      userId: userId,
                                                      mode: CardMode.edit));
                                            },
                                            child: Text(
                                              local.card_edit,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary),
                                            ),
                                          ),
                                          MenuItemButton(
                                            onPressed: () => showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CustomAlertDialog(
                                                      title: local.card_dialog_title,
                                                      content:
                                                          local.card_dialog_content,
                                                      cancelText:
                                                          local.card_dialog_cancel,
                                                      onCancel: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      confirmText: local.card_delete,
                                                      onConfirm: () async {
                                                        await controller
                                                            .deleteCard(card.id);
                                                        await controller
                                                            .getCards(userId);
                                                        Navigator.of(context).pop();
                                                      }),
                                            ),
                                            child: Text(
                                              local.card_delete,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.01,
                                  ),
                                ],
                              );
                            }).toList()),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}

import 'package:book_store/components/custom_alert_dialog.dart';
import 'package:book_store/core/constants/card_mode.dart';
import 'package:book_store/core/utils/show_form_bottom_sheet.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/addresses/addresses_controller.dart';
import 'package:book_store/pages/loading/loading_page.dart';
import 'package:book_store/widgets/add_or_edit_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});
  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  final controller = Get.find<AddressesController>();
  late final String userId;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      userId = args['user_id'];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getAddresses(userId);
      });

      _isInit = false;
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Addresses',
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
                    // onTap: () async {
                    //   controller.loadAddressInfo('', '', '', '', '', '', '', '', '');
                    //   await showFormBottomSheet(
                    //       context: context,
                    //       content: AddOrEditAddress(
                    //         userId: userId,
                    //         mode: CardMode.add,
                    //       ));
                    // },
                    onTap: () async {
                      await controller.scanCard();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_home,
                            color: Theme.of(context).colorScheme.primary),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          'Add Address',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.addresses.asMap().entries.map((entry) {
                        final index = entry.key;
                        final address = entry.value;
                        return Card(
                          child: ListTile(
                            leading: Text(
                              (index + 1).toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            title: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  address.addressName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.01,
                                ),
                                if (address.isPrimary)
                                  Icon(
                                    Icons.home_filled,
                                    color: const Color.fromARGB(255, 29, 157, 33),
                                  )
                              ],
                            ),
                            subtitle: Text(
                              '${address.neighborhood}, ${address.street}, ${address.buildingNumber}/${address.apartmentNumber}, ${address.country}, ${address.city}/${address.district}, ${address.postalCode}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            trailing: MenuAnchor(
                              style: MenuStyle(
                                  backgroundColor: MaterialStatePropertyAll(
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
                                      color:
                                          Theme.of(context).colorScheme.onSecondary,
                                    ));
                              },
                              menuChildren: [
                                MenuItemButton(
                                  onPressed: () async {
                                    await controller.setPrimaryAddress(
                                        userId, address.id);
                                    await controller.getAddresses(userId);
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
                                    controller.loadAddressInfo(
                                      address.addressName,
                                      address.country,
                                      address.city,
                                      address.district,
                                      address.neighborhood,
                                      address.street,
                                      address.buildingNumber,
                                      address.apartmentNumber,
                                      address.postalCode,
                                    );
                                    await showFormBottomSheet(
                                        context: context,
                                        content: AddOrEditAddress(
                                          addressId: address.id,
                                          userId: userId,
                                          mode: CardMode.edit,
                                        ));
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
                                    builder: (context) => CustomAlertDialog(
                                        title: local.card_dialog_title,
                                        content: local.card_dialog_content,
                                        cancelText: local.card_dialog_cancel,
                                        onCancel: () {
                                          Navigator.of(context).pop();
                                        },
                                        confirmText: local.card_delete,
                                        onConfirm: () async {
                                          Navigator.of(context).pop();
                                          await controller.deleteAddress(address.id);
                                          await controller.getAddresses(userId);
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
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/profile/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Text(
                  local.profile_title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 36),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: AlignmentGeometry.xy(0.7, 1.2),
                  children: [
                    Stack(
                      children: [
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(255, 110, 110, 110), width: 2),
                                borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: controller.avatar.isEmpty
                                    ? Image.asset(
                                        'assets/images/no_profile_picture.jpg',
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.width * 0.5,
                                      )
                                    : Image.network(
                                        controller.avatar[0].avatarUrl!,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.width * 0.5,
                                      )),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        color: Colors.redAccent,
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text(local.actionSheet_title),
                                actions: [
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        controller.getImageFromCamera();
                                        Navigator.pop(context);
                                      },
                                      child: Text(local.actionSheet_camera)),
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        controller.getImageFromGallery();
                                        Navigator.pop(context);
                                      },
                                      child: Text(local.actionSheet_gallery)),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  isDefaultAction: true,
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(local.actionSheet_cancel),
                                ),
                              );
                            },
                          );
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 46,
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  title: Text(
                    local.profile_name,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28),
                  ),
                  subtitle: Text(
                    controller.user.value != null
                        ? '${controller.user.value!.userMetadata!['first_name']} ${controller.user.value!.userMetadata!['last_name']}'
                        : '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    local.profile_email,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28),
                  ),
                  subtitle: Text(
                    controller.user.value != null ? controller.user.value!.email! : '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () => controller.authService.logout(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary),
                    child: Text(local.logout)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            );
          }
        }));
  }
}

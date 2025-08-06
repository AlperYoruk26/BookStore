import 'dart:io';

import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/profile_info_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class ProfileController extends GetxController {
  final apiService = Get.find<ApiService>();
  final authService = Get.find<AuthService>();
  final isLoading = Get.find<LoadingController>().isLoading;
  final picker = ImagePicker();

  var user = Rx<User?>(null);
  var icon = Icons.abc_rounded.obs;
  var avatar = <ProfileInfo>[].obs;

  @override
  void onInit() async {
    super.onInit();
    // isLoading.value = true;
    await getProfileInfo();
    await getAvatarUrl();
    // isLoading.value = false;
  }

  Future<void> getProfileInfo() async {
    try {
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        user.value = currentUser;
      }
    } catch (e) {
      debugPrint('Load Profile Error: $e');
    }
  }

  Future<void> getImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final fileName = '${user.value?.id}_${pickedFile.name}.jpg';
        await Supabase.instance.client.storage
            .from('avatars')
            .upload(fileName, File(pickedFile.path), fileOptions: const FileOptions(upsert: true));
        final publicUrl = Supabase.instance.client.storage.from('avatars').getPublicUrl(fileName);
        await apiService.patch('${ApiConstants.baseUrl}/profiles?id=eq.${user.value?.id}',
            data: {"avatar_url": publicUrl});
        await getAvatarUrl();
      }
    } catch (e) {
      debugPrint('Error Get Image From Gallery: $e');
    }
  }

  Future<void> getImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final fileName = '${user.value?.id}_${pickedFile.name}';
        await Supabase.instance.client.storage
            .from('avatars')
            .upload(fileName, File(pickedFile.path), fileOptions: const FileOptions(upsert: true));
        final publicUrl = Supabase.instance.client.storage.from('avatars').getPublicUrl(fileName);
        await apiService.patch('${ApiConstants.baseUrl}/profiles?id=eq.${user.value?.id}',
            data: {"avatar_url": publicUrl});
        await getAvatarUrl();
      }
    } catch (e) {
      debugPrint('Error Get Image From Camera: $e');
    }
  }

  Future<void> getAvatarUrl() async {
    try {
      final response =
          await apiService.get('${ApiConstants.baseUrl}/profiles?id=eq.${user.value?.id}');
      // debugPrint('avatar response: ${avatar.value}');
      if (response.statusCode == 200) {
        final List data = response.data;
        avatar.value = data.map((e) => ProfileInfo.fromJson(e)).toList();
        // debugPrint('avatar: ${avatar.value[0].avatarUrl}');
      }
    } catch (e) {
      debugPrint('Error Get Avatar Url: $e');
    }
  }
}

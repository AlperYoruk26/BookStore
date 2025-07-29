import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

abstract class AuthConstants {
  static String get supabaseUrl => dotenv.get('SUPABASE_URL');
  static String get supabaseAnonKey => dotenv.get('SUPABASE_ANON_KEY');
}

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiService _apiService;
  late final SupabaseClient _supabase;

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiService = Get.find<ApiService>();
    final supabase = await Supabase.initialize(
      url: AuthConstants.supabaseUrl,
      anonKey: AuthConstants.supabaseAnonKey,
    );
    _supabase = supabase.client;

    return this;
  }

  Future<User> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);
      await _storageService.setValue(StorageConstants.userToken, response.session?.accessToken);
      // debugPrint('Access Token: ${await _storageService.getValue(StorageConstants.userToken)}');
      if (response.user == null) {
        throw Exception('Login failed: user not found.');
      }
      return response.user!;
    } catch (e) {
      debugPrint('Supabase login error $e');
      rethrow;
    }
  }

  Future<User> createAccount(
      String email, String password, String firstName, String lastName) async {
    try {
      final response = await _supabase.auth.signUp(
          email: email, password: password, data: {'first_name': firstName, 'last_name': lastName});
      if (response.user == null) {
        throw Exception('Account creation failed: user not found.');
      }
      return response.user!;
    } catch (e) {
      debugPrint('Supabase register error $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      debugPrint('Supabase logout error: $e');
      rethrow;
    } finally {
      await _storageService.remove(StorageConstants.userToken);
      Get.offAllNamed(AppRoutesConstants.LOGIN);
    }
  }
}

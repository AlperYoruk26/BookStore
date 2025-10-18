import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/addresses_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController {
  final apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  final addresses = <Addresses>[].obs;

  final addressName = TextEditingController();
  final country = TextEditingController();
  final city = TextEditingController();
  final district = TextEditingController();
  final neighborhood = TextEditingController();
  final street = TextEditingController();
  final buildingNumber = TextEditingController();
  final apartmentNumber = TextEditingController();
  final postalCode = TextEditingController();

  final cardDetails = Rx<CardDetails?>(null);
  final cardOptions = Rx<CardScanOptions>(CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  ));

  Future<void> scanCard() async {
    try {
      final CardDetails? details =
          await CardScanner.scanCard(scanOptions: cardOptions.value);
      if (cardDetails.value == null) return;
      cardDetails.value = details;
    } catch (e) {
      debugPrint('Error Scan Card: $e');
    }
  }

  Future<void> getAddresses(String userId) async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
          '${ApiConstants.baseUrl}/addresses?user_id=eq.$userId&order=is_primary.desc');
      if (response.statusCode == 200) {
        final List data = response.data;
        addresses.value = data.map((e) => Addresses.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error Get Addresses');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAddress(int id) async {
    try {
      await apiService.patch('${ApiConstants.baseUrl}/addresses?id=eq.$id', data: {
        'address_name': addressName.text,
        'country': country.text,
        'city': city.text,
        'district': district.text,
        'neighborhood': neighborhood.text,
        'street': street.text,
        'building_number': buildingNumber.text,
        'apartment_number': apartmentNumber.text,
        'postal_code': postalCode.text
      });
    } catch (e) {
      debugPrint('Error Update Address: $e');
    }
  }

  Future<void> addAddress(String userId) async {
    try {
      await apiService.post('${ApiConstants.baseUrl}/rpc/add_address', data: {
        'p_user_id': userId,
        'p_address_name': addressName.text,
        'p_country': country.text,
        'p_city': city.text,
        'p_district': district.text,
        'p_neighborhood': neighborhood.text,
        'p_street': street.text,
        'p_building_number': buildingNumber.text,
        'p_apartment_number': apartmentNumber.text,
        'p_postal_code': postalCode.text
      });
    } catch (e) {
      debugPrint('Error Add Address: $e');
    }
  }

  Future<void> setPrimaryAddress(String userId, int id) async {
    try {
      await apiService
          .post('${ApiConstants.baseUrl}/rpc/set_primary_address', data: {
        'p_user_id': userId,
        'p_id': id,
      });
    } catch (e) {
      debugPrint('Error Set Primary Address: $e');
    }
  }

  Future<void> deleteAddress(int id) async {
    try {
      await apiService.delete('${ApiConstants.baseUrl}/addresses?id=eq.$id');
    } catch (e) {
      debugPrint('Error Delete Address: $e');
    }
  }

  void loadAddressInfo(
    String address_name,
    String _country,
    String _city,
    String _district,
    String _neighborhood,
    String _street,
    String _buildingNumber,
    String _apartmentNumber,
    String _postalCode,
  ) {
    addressName.text = address_name;
    country.text = _country;
    city.text = _city;
    district.text = _district;
    neighborhood.text = _neighborhood;
    street.text = _street;
    buildingNumber.text = _buildingNumber;
    apartmentNumber.text = _apartmentNumber;
    postalCode.text = _postalCode;
  }
}

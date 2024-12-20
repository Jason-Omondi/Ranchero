import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final results = await connectivity.checkConnectivity();
    return results.isNotEmpty && results.first != ConnectivityResult.none;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    final results = await connectivity.checkConnectivity();
    return results.first;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return connectivity.onConnectivityChanged.map((results) => results.first);
  }
}


//date helpers
String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return ' Good Evening';
}

String formatDate(String apiDate) {
  try {
    final dateTime = DateTime.parse(apiDate);
    return DateFormat('EEE, dd MMM').format(dateTime);
  } catch (e) {
    return 'Invalid date';
  }
}

var date = new DateTime.now();
var newDate = new DateTime(date.year, date.month + 1, date.day);
var selectedDatee = DateTime.now().obs;
var selectedreturnDate = DateTime.now().obs;
var selectedDateenddate = DateTime.now().obs;
chooseDate() async {
  DateTime? pickedDate = await showDatePicker(
    context: Get.context!,
    initialDate: selectedDatee.value,
    firstDate: DateTime(1800),
    lastDate: newDate,
    //initialEntryMode: DatePickerEntryMode.input,
    // initialDatePickerMode: DatePickerMode.year,
    helpText: 'Select Date',
    cancelText: 'Close',
    confirmText: 'Confirm',
    errorFormatText: 'Enter valid date',
    errorInvalidText: 'Enter valid date range',
    fieldLabelText: 'Date',
    fieldHintText: 'Month/Date/Year',
    //selectableDayPredicate: disableDate
  );
  if (pickedDate != null && pickedDate != selectedDatee.value) {
    selectedDatee.value = pickedDate;
  }
}

chooseEndDate() async {
  DateTime? pickedDate = await showDatePicker(
    context: Get.context!,
    initialDate: selectedDateenddate.value,
    firstDate: DateTime(1800),
    lastDate: newDate,
    //initialEntryMode: DatePickerEntryMode.input,
    // initialDatePickerMode: DatePickerMode.year,
    helpText: 'Select Date',
    cancelText: 'Close',
    confirmText: 'Confirm',
    errorFormatText: 'Enter valid date',
    errorInvalidText: 'Enter valid date range',
    fieldLabelText: 'Date',
    fieldHintText: 'Month/Date/Year',
    //selectableDayPredicate: disableDate
  );
  if (pickedDate != null && pickedDate != selectedDateenddate.value) {
    selectedDateenddate.value = pickedDate;
  }
}

bool disableDate(DateTime day) {
  if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
      day.isBefore(DateTime.now().add(Duration(days: 5))))) {
    return true;
  }
  return false;
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

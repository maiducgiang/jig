import 'dart:ui';

import '../../ui/theme/constant.dart';

enum BookingStatus {
  pending,
  accepted,
  denied,
  canceled,
}

extension BookingStatusExt on BookingStatus {
  String toJsonString() {
    return bookingStatusToString(this);
  }

  BookingStatus parse(String value) {
    return stringToBookingStatus(value);
  }

  String display() {
    switch (this) {
      case BookingStatus.pending:
        return 'Chờ xác nhận';
      case BookingStatus.canceled:
        return "Đã huỷ";
      case BookingStatus.denied:
        return "Đã từ chối";
      case BookingStatus.accepted:
        return "Đã xác nhận";
    }
  }

  String getType() {
    switch (this) {
      case BookingStatus.pending:
        return "pending";
      case BookingStatus.canceled:
        return 'canceled';
      case BookingStatus.denied:
        return "denied";
      case BookingStatus.accepted:
        return 'accepted';
    }
  }

  Color color() {
    switch (this) {
      case BookingStatus.pending:
        return kColorStatusPendingLight;
      case BookingStatus.accepted:
        return kColorActionConfirm;
      case BookingStatus.canceled:
        return kColorActionError;
      case BookingStatus.denied:
        return kColorActionCheckIn;
      default:
        return kColorActionSuccess;
    }
  }
}

BookingStatus stringToBookingStatus(String status) {
  switch (status) {
    case 'pending':
      return BookingStatus.pending;
    case 'accepted':
      return BookingStatus.accepted;
    case 'canceled':
      return BookingStatus.canceled;
    case 'denied':
      return BookingStatus.denied;

    default:
      return BookingStatus.pending;
  }
}

String bookingStatusToString(BookingStatus status) {
  switch (status) {
    case BookingStatus.pending:
      return 'pending';
    case BookingStatus.accepted:
      return 'accepted';
    case BookingStatus.denied:
      return 'denied';
    case BookingStatus.canceled:
      return "canceled";
  }
}

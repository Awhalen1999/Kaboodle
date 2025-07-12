class DateFormatter {
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  /// Formats a date value (String or DateTime) to a readable format
  /// Returns 'No date set' if the date is null or invalid
  static String formatDate(dynamic dateValue) {
    if (dateValue == null) return 'No date set';

    if (dateValue is String) {
      try {
        final date = DateTime.parse(dateValue);
        return formatDateToString(date);
      } catch (e) {
        return 'Invalid date';
      }
    }

    if (dateValue is DateTime) {
      return formatDateToString(dateValue);
    }

    return 'No date set';
  }

  /// Formats a DateTime object to a readable string format (e.g., "Jul 10, 2024")
  static String formatDateToString(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Formats a trip length value to a readable string
  static String formatTripLength(double value) {
    if (value == 0.0) {
      return "1-3 days";
    } else if (value == 0.5) {
      return "3-7 days";
    } else if (value == 1.0) {
      return "1 week";
    } else if (value == 4.0) {
      return "4+ weeks";
    } else {
      return "${value.toStringAsFixed(1)} weeks";
    }
  }
}

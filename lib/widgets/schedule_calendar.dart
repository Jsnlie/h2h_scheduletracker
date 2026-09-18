import 'package:flutter/material.dart';
import '../data/member_data.dart';
import '../models/event_model.dart';
import '../models/member_model.dart';
import '../theme/app_colors.dart';

class ScheduleCalendar extends StatefulWidget {
  final List<EventModel> events;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;

  const ScheduleCalendar({
    super.key,
    required this.events,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  late DateTime _currentMonth;

  final List<String> _weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final List<String> _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  void initState() {
    super.initState();
    // Default to the current month & year (DateTime.now())
    final now = DateTime.now();
    _currentMonth = DateTime(now.year, now.month, 1);
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  void _goToCurrentMonth() {
    final now = DateTime.now();
    setState(() {
      _currentMonth = DateTime(now.year, now.month, 1);
    });
  }

  bool _hasEventOnDay(int day) {
    final target = DateTime(_currentMonth.year, _currentMonth.month, day);
    return widget.events.any((e) => e.isSameDay(target));
  }

  List<MemberModel> _getBirthdayMembers(int day) {
    return membersData.where((m) =>
      m.birthDate.month == _currentMonth.month && m.birthDate.day == day
    ).toList();
  }

  bool _isSelectedDay(int day) {
    if (widget.selectedDate == null) return false;
    return widget.selectedDate!.year == _currentMonth.year &&
        widget.selectedDate!.month == _currentMonth.month &&
        widget.selectedDate!.day == day;
  }

  bool _isToday(int day) {
    final now = DateTime.now();
    return now.year == _currentMonth.year &&
        now.month == _currentMonth.month &&
        now.day == day;
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(_currentMonth.year, _currentMonth.month);
    final firstWeekday = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday % 7; // 0 = Sunday

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Month navigation header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                onPressed: _previousMonth,
                color: AppColors.textPrimary,
                tooltip: 'Previous Month',
              ),
              GestureDetector(
                onTap: _goToCurrentMonth,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month, size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      '${_monthNames[_currentMonth.month - 1]} ${_currentMonth.year}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                onPressed: _nextMonth,
                color: AppColors.textPrimary,
                tooltip: 'Next Month',
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Legend: Events & Birthdays
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Event',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('🎂', style: TextStyle(fontSize: 11)),
                  SizedBox(width: 4),
                  Text(
                    'Birthday',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Day of week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _weekDays.map((day) {
              final isWeekend = day == 'S';
              return SizedBox(
                width: 36,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isWeekend ? AppColors.accentPink : AppColors.textLight,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 6),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 6),

          // Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: firstWeekday + daysInMonth,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              if (index < firstWeekday) {
                return const SizedBox.shrink();
              }

              final day = index - firstWeekday + 1;
              final hasEvents = _hasEventOnDay(day);
              final birthdayMembers = _getBirthdayMembers(day);
              final hasBirthday = birthdayMembers.isNotEmpty;
              final isSelected = _isSelectedDay(day);
              final isToday = _isToday(day);

              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    // Deselect if already selected (show all)
                    widget.onDateSelected(null);
                  } else {
                    widget.onDateSelected(
                      DateTime(_currentMonth.year, _currentMonth.month, day),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : (hasBirthday
                            ? AppColors.accentPinkLight.withValues(alpha: 0.5)
                            : (hasEvents
                                ? AppColors.primaryLight.withValues(alpha: 0.5)
                                : Colors.transparent)),
                    shape: BoxShape.circle,
                    border: isSelected
                        ? null
                        : (isToday
                            ? Border.all(color: AppColors.primary, width: 1.8)
                            : (hasBirthday
                                ? Border.all(color: AppColors.accentPink.withValues(alpha: 0.5), width: 1.5)
                                : (hasEvents
                                    ? Border.all(color: AppColors.primary.withValues(alpha: 0.4), width: 1.5)
                                    : null))),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '$day',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected || hasEvents || hasBirthday || isToday
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Colors.white
                              : (hasBirthday
                                  ? AppColors.accentPink
                                  : (hasEvents ? AppColors.primaryDark : AppColors.textPrimary)),
                        ),
                      ),
                      // Indicators: Birthday Cake or Event Dot
                      Positioned(
                        bottom: 3,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (hasBirthday)
                              const Text(
                                '🎂',
                                style: TextStyle(fontSize: 8),
                              ),
                            if (hasBirthday && hasEvents)
                              const SizedBox(width: 2),
                            if (hasEvents)
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Quick action row (reset filter)
          if (widget.selectedDate != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filtering: ${_monthNames[widget.selectedDate!.month - 1]} ${widget.selectedDate!.day}, ${widget.selectedDate!.year}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => widget.onDateSelected(null),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

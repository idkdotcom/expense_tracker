import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

enum CategoryItems { food, travel, leisure, work }

const categoryIcons = {
  CategoryItems.food: Icons.lunch_dining,
  CategoryItems.travel: Icons.flight_takeoff,
  CategoryItems.leisure: Icons.movie,
  CategoryItems.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.categoryItems})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryItems categoryItems;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> AllExpenses, this.category)
      : expenses =
            AllExpenses.where((expense) => expense.categoryItems == category).toList();

  final CategoryItems category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}

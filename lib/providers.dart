import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) => Clock());

final personRepositoryProvider = Provider((ref) => PersonRepository());
final personProvider = FutureProvider((ref) async {
  final personRepo = ref.watch(personRepositoryProvider);
  final Person person = await personRepo.getPersons();
  return person;
});

class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class Person extends Equatable {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}

class PersonRepository {
  Future<Person> getPersons() async {
    await Future.delayed(const Duration(seconds: 3));
    return const Person(
      name: 'Vikas',
      age: 22,
    );
  }
}

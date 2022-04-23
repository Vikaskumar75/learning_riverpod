import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class FakeApiCall extends ConsumerWidget {
  const FakeApiCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPerson = ref.watch(personProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Api Call'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Data: ',
            ),
            asyncPerson.map(
              data: (person) {
                return Text(
                  person.value.name,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              error: (error) {
                return Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              loading: (_) => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

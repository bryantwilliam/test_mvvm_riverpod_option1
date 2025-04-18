import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_mvvm_riverpod/features/home/ui/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage(this.viewModel, {super.key});

  final HomeViewModel viewModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text("Local: ${widget.viewModel.counter}"),
                  Text(
                    "Global (watch inside of ListenableBuilder): ${widget.viewModel.watchGlobalCounter(ref)}",
                  ),
                ],
              );
            },
          ),
          Text(
            // This should still work, because watching riverpod state doesn't need to be in a ListenableBuilder, it uses ref.
            "Global (watch outside of ListenableBuilder): ${widget.viewModel.watchGlobalCounter(ref)}",
          ),
          ElevatedButton(
            onPressed: () {
              widget.viewModel.incrementCounter();
            },
            child: const Text('Increment Counter'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.viewModel.incrementGlobal(ref);
              print(
                "Global (read): ${widget.viewModel.readGlobalCounter(ref)}",
              );
            },
            child: const Text("Increment Global"),
          ),
        ],
      ),
    );
  }
}

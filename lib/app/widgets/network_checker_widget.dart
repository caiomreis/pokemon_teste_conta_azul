// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'text/headline/headline.dart';

class NetworkChecker extends StatefulWidget {
  final Widget child;
  const NetworkChecker({super.key, required this.child});

  @override
  State<NetworkChecker> createState() => _NetworkCheckerState();
}

class _NetworkCheckerState extends State<NetworkChecker> {
  bool hasConnection = true;

  @override
  void initState() {
    super.initState();

    InternetConnection().onStatusChange.listen((InternetStatus status) {
      setState(() {
        switch (status) {
          case InternetStatus.connected:
            hasConnection = true;
            break;
          case InternetStatus.disconnected:
            hasConnection = false;
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            child: Visibility(
              visible: hasConnection,
              replacement: EmpatyContent(),
              child: widget.child,
            )),
      ),
    );
  }

  Widget EmpatyContent() {
    return Center(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/png/not_found.png'),
          const SizedBox(
            height: 24,
          ),
          Headline.bold(text: 'Parece que você esta sem conexão')
        ],
      ),
    ));
  }
}

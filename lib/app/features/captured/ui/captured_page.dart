// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/captured/interactor/captured_entity.dart';
import 'package:poke_teste/app/features/captured/interactor/captured_interceptor.dart';
import 'package:poke_teste/app/widgets/poke_teste_footer_menu/poke_teste_footer_menu.dart';
import 'package:poke_teste/app/widgets/pokemon_card.dart';
import 'package:poke_teste/app/widgets/pokemon_card_skeleton.dart';
import 'package:poke_teste/app/widgets/text/headline/headline.dart';

class CapturedPage extends StatefulWidget {
  final CapturednIteractor capturedInteractor;
  const CapturedPage({super.key, required this.capturedInteractor});

  @override
  State<CapturedPage> createState() => _CapturedPageState();
}

class _CapturedPageState extends State<CapturedPage> {
  bool loading = true;
  List<String> favorites = [];
  List<String> captured = [];
  @override
  void initState() {
    super.initState();
    widget.capturedInteractor.getList();
    widget.capturedInteractor.addListener(() {
      setState(() {
        loading = widget.capturedInteractor.value.loading;
        favorites = widget.capturedInteractor.value.favorites;
        captured = widget.capturedInteractor.value.captured;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<CapturednIteractor>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0XFFd3d3d3),
                      width: 1,
                    ),
                  ),
                ),
                child: Headline.bold(text: 'Capiturados'),
              ),
              const SizedBox(
                height: 24,
              ),
              if (loading) CardSkeleton(),
              if (!loading) CardList(),
              Poke_testeFooterMenu(
                isCapituredActive: true,
                isFavoriteActive: false,
                isPokedexActive: false,
                isProfileActive: false,
                onFavoriteAction: () {
                  widget.capturedInteractor.goToFavorite();
                },
                onCapituredACtion: () {},
                onPokedexAction: () {
                  widget.capturedInteractor.goToHome();
                },
                onProfileAction: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CardList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ValueNotifierBuilder<CapturednIteractor, ICapturedEntity>(
            builder: (_, value) {
              return Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisCount: 2,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: captured.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: PokemonCard(
                          name: captured[index],
                          isCaptured: true,
                          isFavorite: favorites.contains(captured[index]),
                          onFavoriteAction: () {
                            favorites.contains(captured[index])
                                ? widget.capturedInteractor
                                    .removeFavorite(captured[index])
                                : widget.capturedInteractor
                                    .addFavorite(captured[index]);
                          },
                          onCapturedAction: () {
                            widget.capturedInteractor
                                .removeCaptured(captured[index]);
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget CardSkeleton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ValueNotifierBuilder<CapturednIteractor, ICapturedEntity>(
            builder: (_, value) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: PokemonCardSkeleton(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/favorite/interactor/favorite_entity.dart';
import 'package:poke_teste/app/features/favorite/interactor/favorite_interceptor.dart';
import 'package:poke_teste/app/widgets/poke_teste_footer_menu/poke_teste_footer_menu.dart';
import 'package:poke_teste/app/widgets/pokemon_card.dart';
import 'package:poke_teste/app/widgets/pokemon_card_skeleton.dart';
import 'package:poke_teste/app/widgets/text/headline/headline.dart';

class FavoritePage extends StatefulWidget {
  final FavoritenIteractor favoriteInteractor;
  const FavoritePage({super.key, required this.favoriteInteractor});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool loading = true;
  List<String> favorites = [];
  List<String> captured = [];
  @override
  void initState() {
    super.initState();
    widget.favoriteInteractor.getList();
    widget.favoriteInteractor.addListener(() {
      setState(() {
        loading = widget.favoriteInteractor.value.loading;
        favorites = widget.favoriteInteractor.value.favorites;
        captured = widget.favoriteInteractor.value.captured;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FavoritenIteractor>();
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
                child: Headline.bold(text: 'Favoritos'),
              ),
              const SizedBox(
                height: 24,
              ),
              if (loading) CardSkeleton(),
              if (!loading) CardList(),
              Poke_testeFooterMenu(
                isCapituredActive: false,
                isFavoriteActive: true,
                isPokedexActive: false,
                isProfileActive: false,
                onFavoriteAction: () {},
                onCapituredACtion: () {
                  widget.favoriteInteractor.goToCaptured();
                },
                onPokedexAction: () {
                  widget.favoriteInteractor.goToHome();
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
          child: ValueNotifierBuilder<FavoritenIteractor, IFavoriteEntity>(
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
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: PokemonCard(
                          name: favorites[index],
                          isCaptured: captured.contains(favorites[index]),
                          isFavorite: true,
                          onCapturedAction: () {
                            captured.contains(favorites[index])
                                ? widget.favoriteInteractor
                                    .removeCaptured(favorites[index])
                                : widget.favoriteInteractor
                                    .addCaptured(favorites[index]);
                          },
                          onFavoriteAction: () {
                            widget.favoriteInteractor
                                .removeFavorite(favorites[index]);
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
          child: ValueNotifierBuilder<FavoritenIteractor, IFavoriteEntity>(
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

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/home/data/Ihome_list_ds.dart';
import 'package:poke_teste/app/features/home/interactor/home_entity.dart';
import 'package:poke_teste/app/features/home/interactor/home_interceptor.dart';
import 'package:poke_teste/app/widgets/button/button.dart';
import 'package:poke_teste/app/widgets/poke_teste_footer_menu/poke_teste_footer_menu.dart';
import 'package:poke_teste/app/widgets/pokemon_card.dart';
import 'package:poke_teste/app/widgets/pokemon_card_skeleton.dart';
import 'package:poke_teste/app/widgets/text/headline/headline.dart';

class HomePage extends StatefulWidget {
  final HomenIteractor homeInteractor;
  const HomePage({super.key, required this.homeInteractor});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Results> pokemons = [];
  bool loading = true;
  bool loadingButton = true;
  List<String> favorites = [];
  List<String> captured = [];
  @override
  void initState() {
    super.initState();
    widget.homeInteractor.getList();
    widget.homeInteractor.addListener(() {
      setState(() {
        pokemons = widget.homeInteractor.value.pokemons;
        loading = widget.homeInteractor.value.loading;
        favorites = widget.homeInteractor.value.favorites;
        captured = widget.homeInteractor.value.captured;
        loadingButton = widget.homeInteractor.value.loadingButton;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomenIteractor>();
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
                child: Headline.bold(text: 'Pokédex'),
              ),
              const SizedBox(
                height: 24,
              ),
              if (loading) CardSkeleton(),
              if (!loading) CardList(),
              Poke_testeFooterMenu(
                isCapituredActive: false,
                isFavoriteActive: false,
                isPokedexActive: true,
                isProfileActive: false,
                onFavoriteAction: () {
                  widget.homeInteractor.goToFavorite();
                },
                onCapituredACtion: () {
                  widget.homeInteractor.goToCaptured();
                },
                onPokedexAction: () {},
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
          child: ValueNotifierBuilder<HomenIteractor, HomeEntity>(
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
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: PokemonCard(
                          name: pokemons[index].name!,
                          isCaptured: captured.contains(pokemons[index].name!),
                          isFavorite: favorites.contains(pokemons[index].name!),
                          onCapturedAction: () {
                            captured.contains(pokemons[index].name!)
                                ? widget.homeInteractor
                                    .removeCaptured(pokemons[index].name!)
                                : widget.homeInteractor
                                    .addCaptured(pokemons[index].name!);
                          },
                          onFavoriteAction: () {
                            favorites.contains(pokemons[index].name!)
                                ? widget.homeInteractor
                                    .removeFavorite(pokemons[index].name!)
                                : widget.homeInteractor
                                    .addFavorite(pokemons[index].name!);
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Poke_testeButton(
                      isLoading: loadingButton,
                      text: 'Carregar mais',
                      onPress: () {
                        context.read<HomenIteractor>().getMorePokemons();
                        widget.homeInteractor.getMorePokemons();
                      },
                    ),
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
          child: ValueNotifierBuilder<HomenIteractor, HomeEntity>(
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

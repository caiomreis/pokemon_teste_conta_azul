// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:poke_teste/app/features/pokemons_details/data/Ipokemons_details_ds.dart';
import 'package:poke_teste/app/features/pokemons_details/interactor/pokemons_details_interceptor.dart';
import 'package:poke_teste/app/style/app_colors.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';
import 'package:poke_teste/app/widgets/network_checker_widget.dart';
import 'package:poke_teste/app/widgets/poke_teste_cached_image.dart';
import 'package:poke_teste/app/widgets/text/body/body.dart';
import 'package:poke_teste/app/widgets/text/headline/headline.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsnIteractor pokemondetailsInteractor;
  final String name;
  const PokemonDetailsPage(
      {super.key, required this.pokemondetailsInteractor, required this.name});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  bool loading = true;
  List<String> favorites = [];
  List<String> captured = [];
  IPokemonDetailsListDataSource pokemon_details =
      IPokemonDetailsListDataSource();
  @override
  void initState() {
    super.initState();
    widget.pokemondetailsInteractor.getPokemon(widget.name);
    widget.pokemondetailsInteractor.addListener(() {
      setState(() {
        pokemon_details = widget.pokemondetailsInteractor.value.pokemon_detail;
        loading = widget.pokemondetailsInteractor.value.loading;
        favorites = widget.pokemondetailsInteractor.value.favorites;
        captured = widget.pokemondetailsInteractor.value.captured;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PokemonDetailsnIteractor>();

    return NetworkChecker(
      child: AnimatedContainer(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 1000),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            if (!loading) DetailsContent(),
            if (loading)
              LoadingAnimationWidget.discreteCircle(
                size: 50,
                color: const Color(0xFF173EA5),
              )
          ]),
        ),
      ),
    );
  }

  Widget DetailsContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Poke_testeIcon(
              onTap: () {
                widget.pokemondetailsInteractor.backButton();
              },
              color: Poke_Teste_Colors.theme.gray.strong,
              icon: Poke_testeIconsEnum.back,
              width: 48,
              height: 48,
            )
          ],
        ),
        Poke_testeCachedImage(
          imageUrl: pokemon_details.sprites!.frontDefault,
          heigth: 300,
          width: 300,
          label: widget.name,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Body.bold(text: widget.name.toUpperCase()),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Poke_testeIcon(
                    onTap: () {
                      favorites.contains(widget.name)
                          ? widget.pokemondetailsInteractor
                              .removeFavorite(widget.name)
                          : widget.pokemondetailsInteractor
                              .addFavorite(widget.name);
                    },
                    color: favorites.contains(pokemon_details.name!)
                        ? Poke_Teste_Colors.theme.red.medium
                        : Poke_Teste_Colors.theme.gray.strong,
                    icon: favorites.contains(widget.name)
                        ? Poke_testeIconsEnum.heart_filled
                        : Poke_testeIconsEnum.heart,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Poke_testeIcon(
                    onTap: () {
                      captured.contains(pokemon_details.name!)
                          ? widget.pokemondetailsInteractor
                              .removeCaptured(widget.name)
                          : widget.pokemondetailsInteractor
                              .addCaptured(widget.name);
                    },
                    color: captured.contains(pokemon_details.name!)
                        ? Poke_Teste_Colors.theme.red.medium
                        : Poke_Teste_Colors.theme.gray.strong,
                    icon: Poke_testeIconsEnum.pokebola,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Headline.bold(text: 'Tipagem'),
        const SizedBox(
          height: 12,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 2,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pokemon_details.types!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CardDetails(pokemon_details.types![index].type!.name!),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Headline.bold(text: 'Peso'),
                const SizedBox(
                  height: 8,
                ),
                Body.medium(text: "${pokemon_details.weight.toString()} Kg"),
              ],
            ),
            Column(
              children: [
                Headline.bold(text: 'Altura'),
                const SizedBox(
                  height: 8,
                ),
                Body.medium(
                    text: "${pokemon_details.height.toString()} Metros"),
              ],
            ),
            Column(
              children: [
                Headline.bold(text: ' Exp. base'),
                const SizedBox(
                  height: 8,
                ),
                Body.medium(text: "${pokemon_details.baseExperience} XP"),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Headline.bold(text: 'Status'),
        const SizedBox(
          height: 12,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 2,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pokemon_details.stats!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CardDetails(
                  '${pokemon_details.stats![index].stat!.name!}: ${pokemon_details.stats![index].baseStat}'),
            );
          },
        ),
      ],
    );
  }

  Widget CardDetails(String text) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0Xfff6f6f6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow()],
      ),
      child: Body.bold(text: text),
    );
  }
}

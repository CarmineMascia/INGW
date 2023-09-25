import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

Future<String> takeDataForPlatesOnline(
    void Function(bool) setter, String nome, BuildContext context) async {
  setter(true);
  ProductSearchQueryConfiguration configuration =
      ProductSearchQueryConfiguration(
          parametersList: <Parameter>[
            //Filter.fromType(tagFilterType:  TagFilterType., tagName: OpenFoodAPIConfiguration.userAgent),
            SearchTerms(terms: [nome]),
          ],
          language: OpenFoodAPIConfiguration.globalLanguages?.first,
          country: OpenFoodAPIConfiguration.globalCountry,
          fields: [
            ProductField.ALLERGENS,
            //ProductField.INGREDIENTS,
          ],
          version: ProductQueryVersion.v3);

  SearchResult result = await OpenFoodAPIClient.searchProducts(
    const User(userId: '', password: ''),
    configuration,
  );
  String? prova = result.products?.first.allergens!.names.toString();
  setter(false);
  if (prova != null) {
    return removeFirstAndLastCharacter(prova);
  } else {
    return 'ERRORE NELLA RICEZIONE';
  }
}

String removeFirstAndLastCharacter(String input) {
  if (input.length < 2) {
    // Se la stringa ha meno di 2 caratteri, non c'è nulla da rimuovere.
    return "";
  }
  // Restituisci la sottostringa che va dal secondo carattere al penultimo carattere.
  return input.substring(1, input.length - 1);
}

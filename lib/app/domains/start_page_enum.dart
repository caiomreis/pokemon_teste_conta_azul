enum StartPageEnum { perfil, seuDia, apoio, dados }

extension StartPageEnumExtension on StartPageEnum {
  static StartPageEnum? fromString(String startPage) {
    switch (startPage.toLowerCase()) {
      case 'perfil':
        return StartPageEnum.perfil;
      case 'apoio':
        return StartPageEnum.apoio;
      case 'dados':
        return StartPageEnum.dados;

      default:
        return StartPageEnum.seuDia;
    }
  }

  static List<StartPageEnum> getAllPages() => [
        StartPageEnum.perfil,
        StartPageEnum.seuDia,
        StartPageEnum.apoio,
        StartPageEnum.dados
      ];
}

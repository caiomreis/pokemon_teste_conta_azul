enum StorageKeysEnum { isAuth, favorites, captured }

extension StorageKeysEnumExt on StorageKeysEnum {
  String get getString {
    switch (this) {
      case StorageKeysEnum.favorites:
        return 'favorites';
      case StorageKeysEnum.captured:
        return 'captured';
      case StorageKeysEnum.isAuth:
        return 'isAuth';
      default:
        return '';
    }
  }
}

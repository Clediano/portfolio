class L10n {
  static final locales = ['en', 'pt'];

  static String getFlag(String locale) {
    if(locale == 'pt') return '🇧🇷';
    if(locale == 'en') return '🇺🇸';
    return '';
  }
}

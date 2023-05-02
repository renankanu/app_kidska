enum Alphabet {
  a('A', 'Abacaxi 🍍'),
  b('B', 'Banana 🍌'),
  c('C', 'Casa 🏠'),
  d('D', 'Dado 🎲'),
  e('E', 'Elefante 🐘'),
  f('F', 'Formiga 🐜'),
  g('G', 'Gato 🐈'),
  h('H', 'Helicóptero 🚁'),
  i('I', 'Índio 🏹'),
  j('J', 'Janela 🪟'),
  k('K', 'Kiwi 🥝'),
  l('L', 'Laranja 🍊'),
  m('M', 'Macaco 🐵'),
  n('N', 'Nuvem ☁️'),
  o('O', 'Ovo 🥚'),
  p('P', 'Pato 🦆'),
  q('Q', 'Queijo 🧀'),
  r('R', 'Rato 🐀'),
  s('S', 'Sapo 🐸'),
  t('T', 'Tesoura ✂️ '),
  u('U', 'Uva 🍇'),
  v('V', 'Vaca 🐄'),
  w('W', 'Waffle 🧇'),
  x('X', 'Xícara ☕️'),
  y('Y', ''),
  z('Z', 'Zebra 🦓');

  const Alphabet(this.description, this.letterOf);

  final String description;
  final String letterOf;
}

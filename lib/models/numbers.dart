enum Numbers {
  zero('0', 'Zero'),
  one('1', 'Um'),
  two('2', 'Dois'),
  three('3', 'Três'),
  four('4', 'Quatro'),
  five('5', 'Cinco'),
  six('6', 'Seis'),
  seven('7', 'Sete'),
  eight('8', 'Oito'),
  nine('9', 'Nove');

  const Numbers(this.value, this.description);

  final String value;
  final String description;

  Numbers getNumber(String number) {
    return Numbers.values
        .firstWhere((Numbers element) => element.value == number);
  }
}

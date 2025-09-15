abstract class CardDate {
  static final List months = List.generate(
    12,
    (index) => (index + 1).toString().padLeft(2, '0'),
  );

  static final List years = List.generate(
    21,
    (index) => (DateTime.now().year + index).toString(),
  );
}

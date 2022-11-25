class DBtodo {
  late int id;
  late int idtodo;
  late int first;
  late int second;
  late int thd;
  late int fth;
  late int fiveth;
  late int k1;
  late int k2;
  late int k3;
  late int k4;
  late int k5;
  late DateTime data;

  DBtodo({
    this.idtodo = 0,
    this.first = 0,
    this.second = 0,
    this.thd = 0,
    this.fth = 0,
    this.fiveth = 0,
    this.k1 = 0,
    this.k2 = 0,
    this.k3 = 0,
    this.k4 = 0,
    this.k5 = 0,
  });
  factory DBtodo.fromMap(Map<String, dynamic> json) => DBtodo(
        idtodo: json['idtodo'] ?? 0,
        first: json['first'] ?? 0,
        second: json['second'] ?? 0,
        thd: json['thd'] ?? 0,
        fth: json['fth'] ?? 0,
        fiveth: json['fiveth'] ?? 0,
        k1: json['k1'] ?? 0,
        k2: json['k2'] ?? 0,
        k3: json['k3'] ?? 0,
        k4: json['k4'] ?? 0,
        k5: json['k5'] ?? 0,
      );
  Map<String, dynamic> toMap() => {
        "idtodo": idtodo,
        "first": first,
        "second": second,
        "thd": thd,
        "fth": fth,
        "fiveth": fiveth,
        "k1": k1,
        "k2": k2,
        "k3": k3,
        "k4": k4,
        "k5": k5,
      };
}

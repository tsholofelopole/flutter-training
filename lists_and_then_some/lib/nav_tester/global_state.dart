class GlobalState {
  final Map<dynamic, dynamic> _data = {};

  static GlobalState instance =  GlobalState._();
  GlobalState._();

  Map<dynamic, dynamic> get data => _data;

  get(dynamic key) => _data[key];
  set(dynamic key, dynamic value) => _data[key] = value;

}
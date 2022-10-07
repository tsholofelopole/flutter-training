class Employee {
  String _name = '';
  String _position = '';

  Employee({required name, required position}) {
    _name = name;
    _position = position;
  }

  void printEmployeeInfo() {
    print('Employee: $_name works as $_position');
  }
}
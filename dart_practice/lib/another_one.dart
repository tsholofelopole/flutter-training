class Animal {
  String _name ='';

  Animal(String name) {
    _name = name;
  }

  void sayHello() {
      if (_name != null && _name.isEmpty) {
          print('Hello');
      } else {
        print('Hello $_name, nice to meet you!!!');
      }

  }

}
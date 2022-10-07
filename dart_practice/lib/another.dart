import 'package:dart_practice/another_one.dart';
import 'package:dart_practice/employee.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'my_class.dart';

main(List<String> arguments) async {
  var url = 'http://www.voidrealms.com';
  try {
    http
        .get(
          Uri(scheme: 'http', host: 'www.voidrealms.com'),
        )
        .then((value) =>
        {
          if (value.statusCode >= 200 && value.statusCode < 300) {
            print('Success!!! \nStatus code: ${value.statusCode}')
            //print(value.body)
          } else {
            print('Returned with code: ${value.statusCode}')
          }

    });
  } catch (e) {
    print(e);
  }

  print('-----------------------------------------------');
  String myPath = path.join('First string', 'file.txt');
  print(myPath);
  print('-----------------------------------------------');
  MyClass myClass = MyClass();
  myClass.sayHello('Tsholo');

  Animal animal = Animal('Sammy');
  animal.sayHello();

  Employee employee = Employee(name: 'Tsholo', position: 'Software dev');
  employee.printEmployeeInfo();
  print('\n');
}

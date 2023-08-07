void main() {
  List<int> intList = [5, 4, 3, 6]
}

class Person {

  int age;
  bool gender = true;

  Person(this.age, this.gender);
  Person.age(this.age) ;

  int run(int age) {

    return 10;
  }

  // void run(int age, bool gender) {
  //   return 5;
  // }


}
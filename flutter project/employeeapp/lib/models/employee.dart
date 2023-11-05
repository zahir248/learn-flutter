// create the class

class Employee {

  // 2 - Create the properties < - The property needs to be tally with info from API but camelCase

  final int id;
  final String name;
  final String email;
  final String address;
  final String department;

  // 3- create the constructor

  Employee({required this.id, required this.name, required this.email, required this.address,required this.department });

  // 4- create json to object transformer

factory Employee.fromJson(Map<String, dynamic>json){
  return Employee(id: json["id"], name: json["name"], email: json["email"], address: json["address"], department: json["department"]);
}

  static List<Employee> employeesFromJson(dynamic json ){
    var searchResult = json["sheet1"];
    List<Employee> results = List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(Employee.fromJson(v))
      });
      return results;
    }
    return results;
  }


}
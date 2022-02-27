import Cocoa

// type casting 타입 캐스팅

// 스위프트의 타입 캐스팅은 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
// 확인하는 용도로 사용한다.
// is, as를 사용한다.



// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉰다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 한다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 간다.")
    }
}

var jun: Person = Person()
var yuri: Student = Student()
var yujin: UniversityStudent = UniversityStudent()




// 타입 확인
// is를 사용하여 타입을 확인한다.

var result: Bool

result = jun is Person // true
result = jun is Student // false
result = jun is UniversityStudent // false

result = yuri is Person // true
result = yuri is Student // true
result = yuri is UniversityStudent // false

result = yujin is Person // true
result = yujin is Student // true
result = yujin is UniversityStudent // true

if jun is UniversityStudent {
    print("jun은 대학생이다..")
} else if jun is Student {
    print("jun은 학생이다.")
} else if jun is Person {
    print("jun은 사람이다.")
}
// jun은 사람이다.

switch yujin {
case is UniversityStudent:
    print("yujin은 대학생이다.")
case is Student:
    print("yujin은 학생이다.")
case is Person:
    print("yujin은 사람이다.")
default:
    print("yujin은 사람도, 학생도, 대학생도 아니다.")
}
// yujin은 대학생이다.





// 업 캐스팅
// as를 사용하여 부모 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해준다.
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있다.
// 암시적으로 처리되므로 생략해도 무방하다.

var eunbi: Person = UniversityStudent() as Person
var minju: Student = Student()
// var chaewon: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var sakura: Any = Person() as Any // as Any 생략 가능





// 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해준다.

// 조건부 다운 캐스팅
// as?

var optionalCasted: Student?

optionalCasted = eunbi as? UniversityStudent
optionalCasted = minju as? UniversityStudent // nil
optionalCasted = sakura as? UniversityStudent // nil
optionalCasted = sakura as? Student // nil

// 강제 다운 캐스팅
// as!

var forcedCasted: Student

optionalCasted = eunbi as! UniversityStudent
// optionalCasted = minju as! UniversityStudent // 런타임 오류
// optionalCasted = sakura as! UniversityStudent // 런타임 오류
// optionalCasted = sakura as! Student // 런타임 오류





// 활용

func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: eunbi as Person)
// 멤버쉽 트레이닝을 간다.

doSomethingWithSwitch(someone: eunbi)
// 멤버쉽 트레이닝을 간다.

doSomethingWithSwitch(someone: minju)
// 등교를 한다

doSomethingWithSwitch(someone: jun)
// 숨을 쉰다.



func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person{
        person.breath()
    }
}

doSomething(someone: eunbi as Person)
// 멤버쉽 트레이닝을 간다.

doSomething(someone: eunbi)
// 멤버쉽 트레이닝을 간다.

doSomething(someone: minju)
// 등교를 한다.

doSomething(someone: jun)
// 숨을 쉰다.


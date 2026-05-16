/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class A {
  public static new_A(): A {
    return new A();
  }

  public booleanMethod(a0: int, a1: int): boolean {
      if (a0 + a1 > 10) {
          return true;
      } else {
          return false;
      }
  }

  public booleanMethodVoidParam(): boolean
  {
      return true;
  }

  public booleanMethodMultipleParam(a0: byte, a1: float, a2:float, a3:byte): boolean
  {
      if (a0 > a3) {
          return true;
      } else if (a1 > a2) {
          return false;
      } else {
          return false;
      }
  }

  public static new_A_array(): Array<A> {
    return [];
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0 + a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

class B extends A {
  public static new_B(): B {
    return new B();
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0*a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

class C extends B {
  public static new_C(): C {
    return new C();
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0 - a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

class D {
    public static new_D(): D {
        return new D();
    }

    boolean_method(a0: int): boolean {
        if (a0 > 10) {
            return true;
        } else {
            return false;
        }
    }

    public static new_Union(): D | F {
        return new D();
    }
}

enum Color {
    RED,
    GREEN,
    BLUE
}

enum Items {
    ONE,
    TWO
}

interface I {}

class F implements I {
    public static new_I(): I {
        return new F();
    }

    public static new_F(): F {
        return new F();
    }

    public static new_Union(): D | F {
        return new F();
    }

    public static new_Color(): Color {
        let c: Color = Color.BLUE
        return c;
    }

    public static new_Items(): Items {
        let i: Items = Items.ONE
        return i;
    }

    public static new_Object(): Object {
        return new Object();
    }

    /// @brief Returns boxed primitive, union is required for boxing of int
    public static new_Boxed_Primitive(): Int | String {
        return 5;
    }
}

enum ToFind {
  RED,
  GREEN,
  BLUE
}


class MobilePhone {
  constructor(model: String, weight: int) {
    this.model = model;
    this.weight = weight;
  }
  public model: String;
  public weight: int;
}

function checkModel(p: MobilePhone, model: string): boolean {
    return p.model == model;
}

function checkWeight(p: MobilePhone, weight: int): boolean {
    return p.weight == weight;
}

class MyClass {
    constructor() {
        throw new Error();
    }
};

class Animal {
  constructor(name: string, value: boolean) {
    this.name = name;
    this.value = value;
  }
  public name: string;
  public value: boolean;
}

function newAnimalObject() {
  return new Animal('Cat', true);
}

class Test {
  constructor(a: int, tag: string, animal: Animal) {
    this.a = a;
    this.tag = tag;
    this.animal = animal;
  }

  checkValue(): boolean {
    return this.a == 200 && this.tag == 'Pure P60' && this.animal.name == 'Cat' && this.animal.value == true;
  }

  setValue(a: int, tag: string, animal: Animal) {
    this.a = a;
    this.tag = tag;
    this.animal = animal;
  }

  newTestObject(a: int, tag: string, animal: Animal): Test {
    this.setValue(a, tag, animal);
    return this;
  }

  private a: int;
  private tag: string;
  private animal: Animal;
};

function getNull(): null {
  return null
}

function getIntArray(): int[] {
    let a : int[] = [1, 2, 3, 4, 5]
    return a
}

function getByteArray(): byte[] {
    let a : byte[] = [6, 7, 8, 9]
    return a
}

class Mixture {
    newMixtureObject(v1: null, arr: int[], byteArr: byte[], i: int, f: float, d: double, b: boolean,
                  longVal: long, shortVal: short, str: string, animalObj: Animal): Mixture {
        this.v1 = v1;
        this.arr = arr;
        this.byteArr = byteArr;
        this.i = i;
        this.f = f;
        this.d = d;
        this.b = b;
        this.longVal = longVal;
        this.shortVal = shortVal;
        this.str = str;
        this.animalObj = animalObj;
        return this;
    }

    checkFun(): boolean {
        return true;
    }

    private v1: null = null;
    private arr: int[] = [1, 2, 3];
    private byteArr: byte[] = [10, 11, 12];
    private i: int = 0;
    private f: float = 1.0f;
    private d: double = 20.0;
    private b: boolean = false;
    private longVal: long = 100;
    private shortVal: short = 5;
    private str: string = "";
    private animalObj: Animal = new Animal("Elephant", false);
};

class Woman {
    constructor(name: String, married: boolean) {
        this.name = name;
        this.married = married;
    }
    name: String;
    married: boolean;
}

function newSarahObject() {
    return new Woman("Sarah", true);
}

class Woman2 {
    constructor(name: String, age: byte) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: byte;
}

function newSarahObject2() {
    const age_: byte = 24;
    return new Woman2("Sarah", age_);
}

class Woman3 {
    constructor(name: String, index: char) {
        this.name = name;
        this.index = index;
    }
    name: String;
    index: char;
}

function newSarahObject3() {
    return new Woman3("Sarah", c'a');
}

class Woman4 {
    constructor(name: String, age: double) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: double;
}

function newSarahObject4() {
    return new Woman4("Sarah", 24.0);
}

class Woman5 {
    constructor(name: String, age: float) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: float;
}

function newSarahObject5() {
    const age_: float = 24.0f;
    return new Woman5("Sarah", age_);
}

class Woman6 {
    constructor(name: String, age: int) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: int;
}

function newSarahObject6() {
    return new Woman6("Sarah", 24);
}

class Woman7 {
    constructor(name: String, age: long) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: long;
}

function newSarahObject7() {
    return new Woman7("Sarah", 24);
}

class Woman8 {
    constructor(name: String, age: short) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: short;
}

function newSarahObject8() {
    const age_: short = 24;
    return new Woman8("Sarah", age_);
}

class Man {
    constructor(name: String, age: int) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: int;
}

function newBobObject() {
    return new Man("Bob", 58);
}

class Animal2 {
    constructor(name: String, mammal: boolean) {
        this.name = name;
        this.mammal = mammal;
    }
    name: String;
    mammal: boolean;
}

function newAnimalObject2() {
    return new Animal2("Cat", true);
}

class Animal3 {
    constructor(name: String, age: byte) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: byte;
}

function newAnimalObject3() {
    const age_: byte = 2;
    return new Animal3("Cat", age_);
}

class Animal4 {
    constructor(name: String, index: char) {
        this.name = name;
        this.index = index;
    }
    name: String;
    index: char;
}

function newAnimalObject4() {
    return new Animal4("Cat", c'a');
}

class Animal5 {
    constructor(name: String, age: double) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: double;
}

function newAnimalObject5() {
    return new Animal5("Cat", 2);
}

class Animal6 {
    constructor(name: String, age: float) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: float;
}

function newAnimalObject6() {
    return new Animal6("Cat", 2);
}

class Animal7 {
    constructor(name: String, age: int) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: int;
}

function newAnimalObject7() {
    return new Animal7("Cat", 2);
}

class Animal8 {
    constructor(name: String, age: long) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: long;
}

function newAnimalObject8() {
    return new Animal8("Cat", 2);
}

class Animal9 {
    constructor(name: String, age: short) {
        this.name = name;
        this.age = age;
    }
    name: String;
    age: short;
}

function newAnimalObject9() {
    const age_ : short = 2;
    return new Animal9("Cat", age_);
}

class Car {
    constructor(manufacturer: String, model: String, ecoFriendly: boolean, highPerformance: boolean) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.__ecoFriendly = ecoFriendly;
        this.highPerformance = highPerformance;
    }
    get model(): String {
        return this.__model;
    }
    get ecoFriendly(): boolean {
        return this.__ecoFriendly;
    }
    manufacturer: String;
    private __model: String;
    private __ecoFriendly: boolean;
    highPerformance: boolean;
}

function newCarObject() {
    return new Car("Porsche", "Porsche 911", false, true);
}

class Car2 {
    constructor(manufacturer: String, model: String, price: byte, carAge: byte) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.carAge = carAge;
        this.__price = price;
    }
    get model(): String {
        return this.__model;
    }
    get price(): byte {
        return this.__price;
    }
    manufacturer: String;
    private __model: String;
    carAge: byte;
    private __price: byte;
}

function newCarObject2() {
    const price_: byte = 100;
    const carAge_: byte = 61;
    return new Car2("Porsche", "Porsche 911", price_, carAge_);
}

class Car3 {
    constructor(manufacturer: String, model: String, band: char , type: char) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.type = type;
        this.__band = band;
    }
    get model(): String {
        return this.__model;
    }
    get band(): char  {
        return this.__band;
    }
    manufacturer: String;
    private __model: String;
    type: char;
    private __band: char;
}

function newCarObject3() {
    return new Car3("Porsche", "Porsche 911", c'z', c'a');
}

class Car4 {
    constructor(manufacturer: String, model: String, year: double, length: double) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.length = length;
        this.__year = year;
    }
    get model(): String {
        return this.__model;
    }
    get year(): double {
        return this.__year;
    }
    manufacturer: String;
    private __model: String;
    length: double;
    private __year: double;
}

function newCarObject4() {
    return new Car4("Porsche", "Porsche 911", 1989, 4275);
}

class Car5 {
    constructor(manufacturer: String, model: String, year: float, length: float) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.length = length;
        this.__year = year;
    }
    get model(): String {
        return this.__model;
    }
    get year(): float {
        return this.__year;
    }
    manufacturer: String;
    private __model: String;
    length: float;
    private __year: float;
}

function newCarObject5() {
    return new Car5("Porsche", "Porsche 911", 1989, 4275);
}

class Car6 {
    constructor(manufacturer: String, model: String, year: int, length: int) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.length = length;
        this.__year = year;
    }
    get model(): String {
        return this.__model;
    }
    get year(): int {
        return this.__year;
    }
    manufacturer: String;
    private __model: String;
    length: int;
    private __year: int;
}

function newCarObject6() {
    return new Car6("Porsche", "Porsche 911", 1989, 4275);
}

class Car7 {
    constructor(manufacturer: String, model: String, year: long, length: long) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.length = length;
        this.__year = year;
    }
    get model(): String {
        return this.__model;
    }
    get year(): long {
        return this.__year;
    }
    manufacturer: String;
    private __model: String;
    length: long;
    private __year: long;
}

function newCarObject7() {
    return new Car7("Porsche", "Porsche 911", 1989, 4275);
}

class Car8 {
    constructor(manufacturer: String, model: String, year: short, length: short) {
        this.manufacturer = manufacturer;
        this.__model = model;
        this.length = length;
        this.__year = year;
    }
    get model(): String {
        return this.__model;
    }
    get year(): short {
        return this.__year;
    }
    manufacturer: String;
    private __model: String;
    length: short;
    private __year: short;
}

function newCarObject8() {
    const year_: short = 1989;
    const length_: short = 4275;
    return new Car8("Porsche", "Porsche 911", year_, length_);
}

class Person {
    constructor(name: String, surname: String, age: int, realAge: int) {
        this.name = name;
        this.__surname = surname;
        this.age = age;
        this.__realAge = realAge;
    }
    get surname(): String {
        return this.__surname;
    }
    get realAge(): int {
        return this.__realAge;
    }
    name: String;
    private __surname: String;
    age: int;
    private __realAge: int;
}

function newPersonObject() {
    return new Person("Max", "Pain", 34, 42);
}

class Pack {
    int_value: number = 0;
    string_value: string = "";
    bool_value: boolean = false;
}

function newPackObject(): Pack {
    return new Pack();
}

function checkBooleanValue(p: Pack, value: boolean): boolean {
    return p.bool_value === value;
}

class Pack2 {
    boolean_value: boolean = true;
    string_value: string = "";
    byte_value: byte = 0;
}

function newPackObject2(): Pack2 {
    return new Pack2();
}

function checkByteValue(p: Pack2, value: byte): boolean {
    return p.byte_value === value;
}

class Pack3 {
    boolean_value: boolean = true;
    string_value: string = "";
    char_value: char = c'a';
}

function newPackObject3(): Pack3 {
    return new Pack3();
}

function checkCharValue(p: Pack3, value: char): boolean {
    return p.char_value === value;
}

class Pack4 {
    boolean_value: boolean = true;
    string_value: string = "";
    double_value: number = 0.0;
}

function newPackObject4(): Pack4 {
    return new Pack4();
}

function checkDoubleValue(p: Pack4, value: number): boolean {
    return p.double_value === value;
}

class Pack5 {
    boolean_value: boolean = true;
    string_value: string = "";
    float_value: float = 0.0f;
}

function newPackObject5(): Pack5 {
    return new Pack5();
}

function checkFloatValue(p: Pack5, value: number): boolean {
    return p.float_value === value;
}

class Pack6 {
    int_value: int = 0;
    string_value: String = "";
}

function newPackObject6() {
    return new Pack6();
}

function checkIntValue(p: Pack6, value: int): boolean {
    return p.int_value == value;
}

class Package {
    long_value: long = 0;
    string_value: String = "";
}

function newPackageObject() {
    return new Package();
}

function checkLongValue(p: Package, value: long): boolean {
    return p.long_value == value;
}

class Pack7 {
    boolean_value: boolean = true;
    string_value: string = "";
    short_value: short = 0;
}

function newPackObject7(): Pack7 {
    return new Pack7();
}

function checkShortValue(p: Pack7, value: short): boolean {
    return p.short_value === value;
}

class Boxx {
    int_value: int = 0;
    string_value: String = "";
}

class Boxc extends Boxx {
    str_value: String = "";
}

function newBoxObject() {
    return new Boxx();
}

function newBoxcObject() {
    return new Boxc();
}

function checkStringValue(b: Boxx, value: String): boolean {
    return b.string_value == value;
}

function checkStrValue(b: Boxc, value: String): boolean {
    return b.str_value == value;
}
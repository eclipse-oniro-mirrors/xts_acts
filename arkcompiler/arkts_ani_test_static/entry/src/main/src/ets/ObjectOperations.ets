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
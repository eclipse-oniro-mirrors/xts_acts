class A {
  public static new_A(): A {
    return new A();
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
class Person {
  public static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  public static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  public func(a: int, b: int): int {
    return a + b;
  }

  native foo(): int;

  stringValue: string = "test";
}

class Son extends Person {

}

namespace test001 {
  class TestA001 {
    constructor() {
    }
    public sum(a0: int, a1: int): int
    {
      return a0 + a1;
    }
  }
}

enum Color {
  RED,
  GREEN,
  BLUE
}

interface I {}

class A implements I {}

namespace ops {
  namespace test002B {
    let x: double = 3.0

    class TestA002 {
      constructor() {
      }

      public native foo(): int;

      public native long_foo(): long;
    }

    enum ColorAA {
      RED = 5,
      BLUE,
      GREEN
    }
  }

  function int_method(a0: int, a1: int): int {
    return a0 + a1;
  }
}

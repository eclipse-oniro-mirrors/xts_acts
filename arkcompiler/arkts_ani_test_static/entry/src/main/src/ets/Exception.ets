namespace testing {

  const MAGIC_NUMBER: int = 5

  export function throwError(a: int): int {
    if (a == MAGIC_NUMBER) {
      console.log("11111111111111")
      throw new Error("some error message from throwError")
    }
    return 1
  }

  export function throwErrorNested(a: int): int {
    return baz(a)
  }

  function baz(a: int): int {
    return bar(a)
  }

  function bar(a: int): int {
    return throwError(foo(a))
  }

  function foo(a: int): int {
    return MAGIC_NUMBER;
  }

  export function throwErrorThroughNative(a: int): int {
    return callThroughNative(a)
  }

  native function callThroughNative(a: int): int

  function throwToNativeCaller(a: int): int {
    if (a > 0) {
      throw new Error();
    }
    return a;
  }

}

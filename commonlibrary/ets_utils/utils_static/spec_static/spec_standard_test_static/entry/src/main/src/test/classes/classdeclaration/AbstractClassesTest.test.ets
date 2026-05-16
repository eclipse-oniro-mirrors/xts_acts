/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

abstract class Base {
  field: number = 10 + 5
}

class Derived extends Base {
  constructor() {}
}

class A {
  a: string = 'a'
  foo(b: B): A {
    return b as A;
  }
}

class B extends A {
  b: string = 'b'
  foo(a: A): B {
    return new B()
  }
}

abstract class C {
  c1: int;
  c2: string;
  constructor() {
    this.c1 = 1
    this.c2 = 'c'
  }
  foo(f: int): string|number {
    return f + 1
  }
}

class A1 {
  a: string = 'a'
  foo(b: B1): A1 {
    return b as A1;
  }
}

class B1 extends A1 {
  b: string = 'b'
  foo(a: A1): B1 {
    return new B1()
  }
}

abstract class C1 {
  c1: A1;
  c2: B1;
  constructor() {
    this.c1 = new A1()
    this.c2 = new B1()
  }
  foo(f: A1): string {
    return f.a
  }
}

abstract class A2 {
  static a1: int = 1
  static a2: string = 'a2'
}

class B2 extends A2 {
  static a1: int = 2
  static a2: string = 'b2'
}

abstract class A3 {
  static foo(): int {
    return 1
  }
  static bar(b: int): int {
    return b + 1
  }
}

class B3 extends A3 {
  static foo(): int {
    return 3
  }
  static bar(b: int): int {
    return b - 1
  }
}

abstract class A4 {
  static a1: int = 1
  static a2: string = 'a2'
}

class B4 extends A4 {
  static a1: string = 'a1'
  static a2: int = 2
}

abstract class A5 {
  static foo(): int {
    return 1
  }
  static bar(b: int): int {
    return b + 1
  }
}

class B5 extends A5 {
  static foo(): string {
    return 'a1'
  }
  static bar(b: string): string {
    return b + 2
  }
}

abstract class A6 {
  f: int;
  constructor() {
    this.f = 3;
  }
}

class B6 extends A6 {
  f1: int;
  constructor() {
    this.f1 = this.f + 2;
  }
}

export default function AbstractClassesTest() {
  describe('AbstractClassesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0100
     * @tc.name      testAbstractClasses0001
     * @tc.desc      Field initializers for non-static fields of an abstract class are executed when
     * a non-abstract subclass is instantiated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0001';
      console.log(TAG + ' start');

      let d: Derived = new Derived();
      expect(d.field).assertEqual(15);

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0200
     * @tc.name      testAbstractClasses0002
     * @tc.desc      Instantiate abstract class with object literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0002';
      console.log(TAG + ' start');

      let c: C = {
        c1: 2,
        c2: 'c2'
      }
      expect(c.c1).assertEqual(2);
      expect(c.c2).assertEqual('c2');
      expect(c.foo(1)).assertEqual(2);

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0300
     * @tc.name      testAbstractClasses0003
     * @tc.desc      Instantiate abstract class with object literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0003';
      console.log(TAG + ' start');

      let c: C1 = {
        c1: { a: 'aa'},
        c2: { a: 'aaa', b: 'bb'}
      }
      expect(c.c1.a).assertEqual('aa');
      expect(c.c2.a).assertEqual('aaa');
      expect(c.c2.b).assertEqual('bb');
      expect(c.foo(c.c1)).assertEqual('aa');
      expect(c.foo(c.c2)).assertEqual('aaa');

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0400
     * @tc.name      testAbstractClasses0004
     * @tc.desc      Accessing static fields and methods of abstract class with shadowing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0004';
      console.log(TAG + ' start');

      expect(A2.a1).assertEqual(1);
      expect(A2.a2).assertEqual('a2');
      expect(B2.a1).assertEqual(2);
      expect(B2.a2).assertEqual('b2');

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0500
     * @tc.name      testAbstractClasses0005
     * @tc.desc      Accessing static fields and methods of abstract class with shadowing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0005';
      console.log(TAG + ' start');

      expect(A3.foo()).assertEqual(1);
      expect(A3.bar(1)).assertEqual(2);
      expect(B3.foo()).assertEqual(3);
      expect(B3.bar(1)).assertEqual(0);

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0600
     * @tc.name      testAbstractClasses0006
     * @tc.desc      Accessing static fields and methods of abstract class with shadowing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0006';
      console.log(TAG + ' start');

      expect(A4.a1).assertEqual(1);
      expect(A4.a2).assertEqual('a2');
      expect(B4.a1).assertEqual('a1');
      expect(B4.a2).assertEqual(2);

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0700
     * @tc.name      testAbstractClasses0007
     * @tc.desc      Accessing static fields and methods of abstract class with shadowing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0007';
      console.log(TAG + ' start');

      expect(A5.foo()).assertEqual(1);
      expect(A5.bar(1)).assertEqual(2);
      expect(B5.foo()).assertEqual('a1');
      expect(B5.bar('a')).assertEqual('a2');

    });

    /**
     * @tc.number    SUB_ABSTRACT_CLASSESTEST_0800
     * @tc.name      testAbstractClasses0008
     * @tc.desc      "Subclasses of an abstract class can be non-abstract or in turn abstract. A\
     * \ non-abstract subclass of an abstract superclass can be instantiated. As a result,\
     * \ a constructor for the abstract class, and field initializers\n for non-static\
     * \ fields of that class are executed."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractClasses0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractClasses0008';
      console.log(TAG + ' start');

      let c: B6 = new B6();
      expect(c.f1).assertEqual(5);

    });


  })
}
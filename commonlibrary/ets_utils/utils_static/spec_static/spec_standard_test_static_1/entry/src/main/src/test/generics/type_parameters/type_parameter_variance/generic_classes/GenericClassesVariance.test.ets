/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../../hypium';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class X1<in T1, out T2, T3> {
    readonly t2_obj: T2
    t3_obj: T3
    constructor(p: T2) {
        this.t2_obj = p
    }

    f1(p: T1) {}

    f2(): T2 { return this.t2_obj }

    f3(p: T3): T3 { return p }
}

class A2<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A3<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A4<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A5<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A6<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A7<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A8<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A9<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A10<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A11<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A12<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A13<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A14<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A15<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A16<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A17<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A18<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A19<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A20<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A21<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

export default function GenericClassesVarianceTest() {
  describe("GenericClassesVarianceTest", () => {
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
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0100
     * @tc.name      testGenericClassesVariance0001
     * @tc.desc      Test of usage modifiers in and out, as well as type parameter without modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: X1<number, number, number> = new X1<number, number, number>(1)
      expect(x.f2()).assertEqual(1)
      expect(x.f3(1)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0200
     * @tc.name      testGenericClassesVariance0002
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      let a: A2<string> = new A2<string>(arg)
      expect(a.f(arg)).assertEqual("abc")
      expect(a.f1(arg)).assertEqual("v = abc")
      expect(a.f2()).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0300
     * @tc.name      testGenericClassesVariance0003
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      let a: A3<byte> = new A3<byte>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0400
     * @tc.name      testGenericClassesVariance0004
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      let a: A4<short> = new A4<short>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0500
     * @tc.name      testGenericClassesVariance0005
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      let a: A5<int> = new A5<int>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0600
     * @tc.name      testGenericClassesVariance0006
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      let a: A6<long> = new A6<long>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0700
     * @tc.name      testGenericClassesVariance0007
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      let a: A7<float> = new A7<float>(arg)
      expect(a.f(arg)).assertEqual(1.1f)
      expect(a.f1(arg)).assertEqual("v = 1.1")
      expect(a.f2()).assertEqual(1.1f)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0800
     * @tc.name      testGenericClassesVariance0008
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      let a: A8<double> = new A8<double>(arg)
      expect(a.f(arg)).assertEqual(1.2)
      expect(a.f1(arg)).assertEqual("v = 1.2")
      expect(a.f2()).assertEqual(1.2)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_0900
     * @tc.name      testGenericClassesVariance0009
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      let a: A9<number> = new A9<number>(arg)
      expect(a.f(arg)).assertEqual(1.3)
      expect(a.f1(arg)).assertEqual("v = 1.3")
      expect(a.f2()).assertEqual(1.3)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1000
     * @tc.name      testGenericClassesVariance0010
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      let a: A10<boolean> = new A10<boolean>(arg)
      expect(a.f(arg)).assertTrue()
      expect(a.f1(arg)).assertEqual("v = true")
      expect(a.f2()).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1100
     * @tc.name      testGenericClassesVariance0011
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      let a: A11<bigint> = new A11<bigint>(arg)
      expect(a.f(arg)).assertEqual(10n)
      expect(a.f1(arg)).assertEqual("v = 10")
      expect(a.f2()).assertEqual(10n)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1200
     * @tc.name      testGenericClassesVariance0012
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      let a: A12<string> = new A12<string>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = abc")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1300
     * @tc.name      testGenericClassesVariance0013
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      let a: A13<byte> = new A13<byte>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1400
     * @tc.name      testGenericClassesVariance0014
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      let a: A14<short> = new A14<short>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1500
     * @tc.name      testGenericClassesVariance0015
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      let a: A15<int> = new A15<int>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1600
     * @tc.name      testGenericClassesVariance0016
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      let a: A16<long> = new A16<long>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1700
     * @tc.name      testGenericClassesVariance0017
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      let a: A17<float> = new A17<float>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.1")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1800
     * @tc.name      testGenericClassesVariance0018
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      let a: A18<double> = new A18<double>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.2")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_1900
     * @tc.name      testGenericClassesVariance0019
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      let a: A19<number> = new A19<number>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.3")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_2000
     * @tc.name      testGenericClassesVariance0020
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      let a: A20<boolean> = new A20<boolean>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = true")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_VARIANCE_2100
     * @tc.name      testGenericClassesVariance0021
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesVariance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      let a: A21<bigint> = new A21<bigint>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 10")
    })
  })
}
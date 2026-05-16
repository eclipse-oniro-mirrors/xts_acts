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

interface I2<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A2<T> implements I2<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I3<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A3<T> implements I3<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I4<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A4<T> implements I4<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I5<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A5<T> implements I5<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I6<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A6<T> implements I6<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I7<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A7<T> implements I7<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I8<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A8<T> implements I8<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I9<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A9<T> implements I9<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I10<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A10<T> implements I10<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I11<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class A11<T> implements I11<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I12<in T> {
  f(p: T): void
  f1(p: T): string
}

class A12<in T> implements I12<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I13<in T> {
  f(p: T): void
  f1(p: T): string
}

class A13<in T> implements I13<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I14<in T> {
  f(p: T): void
  f1(p: T): string
}

class A14<in T> implements I14<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I15<in T> {
  f(p: T): void
  f1(p: T): string
}

class A15<in T> implements I15<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I16<in T> {
  f(p: T): void
  f1(p: T): string
}

class A16<in T> implements I16<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I17<in T> {
  f(p: T): void
  f1(p: T): string
}

class A17<in T> implements I17<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I18<in T> {
  f(p: T): void
  f1(p: T): string
}

class A18<in T> implements I18<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I19<in T> {
  f(p: T): void
  f1(p: T): string
}

class A19<in T> implements I19<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I20<in T> {
  f(p: T): void
  f1(p: T): string
}

class A20<in T> implements I20<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I21<in T> {
  f(p: T): void
  f1(p: T): string
}

class A21<in T> implements I21<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

export default function GenericInterfacesVarianceTest() {
  describe("GenericInterfacesVarianceTest", () => {
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
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0100
     * @tc.name      testGenericInterfacesVariance0001
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      let a: I2<string> = new A2<string>(arg)
      expect(a.f(arg)).assertEqual("abc")
      expect(a.f1(arg)).assertEqual("v = abc")
      expect(a.f2()).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0200
     * @tc.name      testGenericInterfacesVariance0002
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      let a: I3<byte> = new A3<byte>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0300
     * @tc.name      testGenericInterfacesVariance0003
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      let a: I4<short> = new A4<short>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0400
     * @tc.name      testGenericInterfacesVariance0004
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      let a: I5<int> = new A5<int>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0500
     * @tc.name      testGenericInterfacesVariance0005
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      let a: I6<long> = new A6<long>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0600
     * @tc.name      testGenericInterfacesVariance0006
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      let a: I7<float> = new A7<float>(arg)
      expect(a.f(arg)).assertEqual(1.1f)
      expect(a.f1(arg)).assertEqual("v = 1.1")
      expect(a.f2()).assertEqual(1.1f)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0700
     * @tc.name      testGenericInterfacesVariance0007
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      let a: I8<double> = new A8<double>(arg)
      expect(a.f(arg)).assertEqual(1.2)
      expect(a.f1(arg)).assertEqual("v = 1.2")
      expect(a.f2()).assertEqual(1.2)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0800
     * @tc.name      testGenericInterfacesVariance0008
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      let a: I9<number> = new A9<number>(arg)
      expect(a.f(arg)).assertEqual(1.3)
      expect(a.f1(arg)).assertEqual("v = 1.3")
      expect(a.f2()).assertEqual(1.3)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_0900
     * @tc.name      testGenericInterfacesVariance0009
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      let a: I10<boolean> = new A10<boolean>(arg)
      expect(a.f(arg)).assertTrue()
      expect(a.f1(arg)).assertEqual("v = true")
      expect(a.f2()).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1000
     * @tc.name      testGenericInterfacesVariance0010
     * @tc.desc      Test of invariant no type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      let a: I11<bigint> = new A11<bigint>(arg)
      expect(a.f(arg)).assertEqual(10n)
      expect(a.f1(arg)).assertEqual("v = 10")
      expect(a.f2()).assertEqual(10n)
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1100
     * @tc.name      testGenericInterfacesVariance0011
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      let a: I12<string> = new A12<string>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = abc")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1200
     * @tc.name      testGenericInterfacesVariance0012
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      let a: I13<byte> = new A13<byte>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1300
     * @tc.name      testGenericInterfacesVariance0013
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      let a: I14<short> = new A14<short>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1400
     * @tc.name      testGenericInterfacesVariance0014
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      let a: I15<int> = new A15<int>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1500
     * @tc.name      testGenericInterfacesVariance0015
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      let a: I16<long> = new A16<long>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1600
     * @tc.name      testGenericInterfacesVariance0016
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      let a: I17<float> = new A17<float>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.1")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1700
     * @tc.name      testGenericInterfacesVariance0017
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      let a: I18<double> = new A18<double>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.2")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1800
     * @tc.name      testGenericInterfacesVariance0018
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      let a: I19<number> = new A19<number>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.3")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_1900
     * @tc.name      testGenericInterfacesVariance0019
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      let a: I20<boolean> = new A20<boolean>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = true")
    })

    /**
     * @tc.number    SUB_GENERIC_INTERFACE_VARIANCE_2000
     * @tc.name      testGenericInterfacesVariance0020
     * @tc.desc      Test of contravariant _in_ type parameter modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInterfacesVariance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      let a: I21<bigint> = new A21<bigint>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 10")
    })
  })
}
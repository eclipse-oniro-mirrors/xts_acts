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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level,
  expect
} from "../../../../../../../hypium"


// 集中定义的类型、接口、类
class Double1 {
  value: double = 0.0
  constructor() {}
}
class Int1 {
  value: int = 0
  constructor() {}
}
// 泛型类定义
class PointIntOrDouble {
  static foo<X extends Int1 | Double1>(i: X): X { return i }
  foo<X extends Int1 | Double1>(i: X): X { return i }
}

class PointAOrB {
  static foo<X extends "a" | "b">(i: X): X { return i }
  foo<X extends "a" | "b">(i: X): X { return i }
}

class PointByte {
  static foo<X extends byte>(i: X): X { return i }
  foo<X extends byte>(i: X): X { return i }
}

class PointShort {
  static foo<X extends short>(i: X): X { return i }
  foo<X extends short>(i: X): X { return i }
}

class PointInt {
  static foo<X extends int>(i: X): X { return i }
  foo<X extends int>(i: X): X { return i }
}

class PointLong {
  static foo<X extends long>(i: X): X { return i }
  foo<X extends long>(i: X): X { return i }
}

class PointFloat {
  static foo<X extends float>(i: X): X { return i }
  foo<X extends float>(i: X): X { return i }
}

class PointDouble {
  static foo<X extends double>(i: X): X { return i }
  foo<X extends double>(i: X): X { return i }
}

class PointNumber {
  static foo<X extends number>(i: X): X { return i }
  foo<X extends number>(i: X): X { return i }
}

class PointBoolean {
  static foo<X extends boolean>(i: X): X { return i }
  foo<X extends boolean>(i: X): X { return i }
}

class PointChar {
  static foo<X extends char>(i: X): X { return i }
  foo<X extends char>(i: X): X { return i }
}

class PointNull {
  static foo<X extends null>(i: X): X { return i }
  foo<X extends null>(i: X): X { return i }
}

// 集中定义的类型、接口、类


// Color 枚举定义
enum Color {
  Red,
  Green,
  Blue
}

// 泛型类定义
class PointUndefined {
  static foo<X extends undefined>(i: X): X { return i }
  foo<X extends undefined>(i: X): X { return i }
}

class PointIntArray {
  static foo<X extends Int1[]>(i: X): X { return i }
  foo<X extends Int1[]>(i: X): X { return i }
}

class PointIntPrimitiveArray {
  static foo<X extends int[]>(i: X): X { return i }
  foo<X extends int[]>(i: X): X { return i }
}

class PointColor {
  static foo<X extends Color>(i: X): X { return i }
  foo<X extends Color>(i: X): X { return i }
}

class PointObjectInt {
  static foo<X extends Object, Z extends int>(i: X, j: Z): X { return i }
  foo<X extends Object, Z extends int>(i: X, j: Z): X { return i }
}

class PointIntObject {
  static foo<X extends int, Z extends Object>(i: X, j: Z): X { return i }
  foo<X extends int, Z extends Object>(i: X, j: Z): X { return i }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericMethodsConstraintTest() {
  describe("GenericMethodsConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0100
     * @tc.name      testGenericMethodsConstraint0001
     * @tc.desc      Generic methods constraint test for PointIntOrDouble with Int1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int1()
      let result1 = PointIntOrDouble.foo<Int1>(a)
      let result2 = new PointIntOrDouble().foo<Int1>(a)
      expect(result1 instanceof Int1).assertTrue()
      expect(result2 instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0200
     * @tc.name      testGenericMethodsConstraint0002
     * @tc.desc      Generic methods constraint test for PointIntOrDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Double1()
      let result1 = PointIntOrDouble.foo<Double1>(a)
      let result2 = new PointIntOrDouble().foo<Double1>(a)
      expect(result1 instanceof Double1).assertTrue()
      expect(result2 instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0300
     * @tc.name      testGenericMethodsConstraint0003
     * @tc.desc      Generic methods constraint test for PointAOrB with "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointAOrB.foo<"a">("a")
      let result2 = new PointAOrB().foo<"a">("a")
      expect(result1).assertEqual("a")
      expect(result2).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0400
     * @tc.name      testGenericMethodsConstraint0004
     * @tc.desc      Generic methods constraint test for PointByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointByte.foo<byte>((1).toByte())
      let result2 = new PointByte().foo<byte>((1).toByte())
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0500
     * @tc.name      testGenericMethodsConstraint0005
     * @tc.desc      Generic methods constraint test for PointShort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointShort.foo<short>(1 as short)
      let result2 = new PointShort().foo<short>(1 as short)
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0600
     * @tc.name      testGenericMethodsConstraint0006
     * @tc.desc      Generic methods constraint test for PointInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointInt.foo<int>(1 as int)
      let result2 = new PointInt().foo<int>(1 as int)
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0700
     * @tc.name      testGenericMethodsConstraint0007
     * @tc.desc      Generic methods constraint test for PointLong
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointLong.foo<long>(1 as long)
      let result2 = new PointLong().foo<long>(1 as long)
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0800
     * @tc.name      testGenericMethodsConstraint0008
     * @tc.desc      Generic methods constraint test for PointFloat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointFloat.foo<float>(1.1f)
      let result2 = new PointFloat().foo<float>(1.1f)
      expect(result1.toString()).assertEqual("1.1")
      expect(result2.toString()).assertEqual("1.1")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_0900
     * @tc.name      testGenericMethodsConstraint0009
     * @tc.desc      Generic methods constraint test for PointDouble with double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointDouble.foo<double>(1.2 as double)
      let result2 = new PointDouble().foo<double>(1.2 as double)
      expect(result1).assertEqual(1.2)
      expect(result2).assertEqual(1.2)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1000
     * @tc.name      testGenericMethodsConstraint0010
     * @tc.desc      Generic methods constraint test for PointDouble with number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointDouble.foo<number>(1.3 as number)
      let result2 = new PointDouble().foo<number>(1.3 as number)
      expect(result1).assertEqual(1.3)
      expect(result2).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1100
     * @tc.name      testGenericMethodsConstraint0011
     * @tc.desc      Generic methods constraint test for PointNumber with double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointNumber.foo<double>(1.4 as double)
      let result2 = new PointNumber().foo<double>(1.4 as double)
      expect(result1).assertEqual(1.4)
      expect(result2).assertEqual(1.4)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1200
     * @tc.name      testGenericMethodsConstraint0012
     * @tc.desc      Generic methods constraint test for PointNumber with number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointNumber.foo<number>(1.5 as number)
      let result2 = new PointNumber().foo<number>(1.5 as number)
      expect(result1).assertEqual(1.5)
      expect(result2).assertEqual(1.5)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1300
     * @tc.name      testGenericMethodsConstraint0013
     * @tc.desc      Generic methods constraint test for PointBoolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointBoolean.foo<boolean>(true)
      let result2 = new PointBoolean().foo<boolean>(true)
      expect(result1).assertEqual(true)
      expect(result2).assertEqual(true)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1400
     * @tc.name      testGenericMethodsConstraint0014
     * @tc.desc      Generic methods constraint test for PointChar
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointChar.foo<char>(c'V')
      let result2 = new PointChar().foo<char>(c'V')
      expect(result1.toString()).assertEqual("V")
      expect(result2.toString()).assertEqual("V")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1500
     * @tc.name      testGenericMethodsConstraint0015
     * @tc.desc      Generic methods constraint test for PointNull
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointNull.foo<null>(null)
      let result2 = new PointNull().foo<null>(null)
      expect(result1).assertNull()
      expect(result2).assertNull()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1600
     * @tc.name      testGenericMethodsConstraint0016
     * @tc.desc      Generic methods constraint test for PointUndefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointUndefined.foo<undefined>(undefined)
      let result2 = new PointUndefined().foo<undefined>(undefined)
      expect(result1).assertUndefined()
      expect(result2).assertUndefined()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1700
     * @tc.name      testGenericMethodsConstraint0017
     * @tc.desc      Generic methods constraint test for PointIntArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [new Int1()]
      let result1 = PointIntArray.foo<Int1[]>(a)
      let result2 = new PointIntArray().foo<Int1[]>(a)
      expect(result1[0] instanceof Int1).assertTrue()
      expect(result2[0] instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1800
     * @tc.name      testGenericMethodsConstraint0018
     * @tc.desc      Generic methods constraint test for PointIntPrimitiveArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = [1 as int]
      let result1 = PointIntPrimitiveArray.foo<int[]>(i)
      let result2 = new PointIntPrimitiveArray().foo<int[]>(i)
      expect(result1[0]).assertEqual(1)
      expect(result2[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_1900
     * @tc.name      testGenericMethodsConstraint0019
     * @tc.desc      Generic methods constraint test for PointColor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointColor.foo<Color>(Color.Red)
      let result2 = new PointColor().foo<Color>(Color.Red)
      expect(result1).assertEqual(Color.Red)
      expect(result2).assertEqual(Color.Red)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_2000
     * @tc.name      testGenericMethodsConstraint0020
     * @tc.desc      Generic methods constraint test for PointObjectInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Object()
      let result1 = PointObjectInt.foo<Object, int>(a, 1 as int)
      let result2 = new PointObjectInt().foo<Object, int>(a, 1 as int)
      expect(result1 instanceof Object).assertTrue()
      expect(result2 instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAINT_2100
     * @tc.name      testGenericMethodsConstraint0021
     * @tc.desc      Generic methods constraint test for PointIntObject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = PointIntObject.foo<int, Object>(2 as int, new Object())
      let result2 = new PointIntObject().foo<int, Object>(2 as int, new Object())
      expect(result1).assertEqual(2)
      expect(result2).assertEqual(2)
    });
  })
}
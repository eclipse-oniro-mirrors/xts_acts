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


class Int1 {
  value: int = 0
}

class Double1 {
  value: double = 0.0
}

class Byte1 {
  value: byte = 0
}

class Short1 {
  value: short = 0
}

class Float1 {
  value: float = 0.0f
}

class Long1 {
  value: long = 0
}

class NumberClass {
  value: number = 0
}

class BooleanClass {
  value: boolean = false
}

class StringClass {
  value: string = ""
}

// 泛型类定义
class Point<T extends Int1 | Double1> {}

final class FinalPoint<T extends Int1 | Double1> {}

class PointA<T extends "a" | "b"> {}

final class FinalPointA<T extends "a" | "b"> {}

class PointByte<T extends Byte1> {}

final class FinalPointByte<T extends Byte1> {}

class PointShort<T extends Short1> {}

final class FinalPointShort<T extends Short1> {}

class PointInt<T extends Int1> {}

final class FinalPointInt<T extends Int1> {}

class PointLong<T extends Long1> {}

final class FinalPointLong<T extends Long1> {}

class PointFloat<T extends Float1> {}

final class FinalPointFloat<T extends Float1> {}

class PointDouble<T extends Double1> {}

final class FinalPointDouble<T extends Double1> {}

class PointNumber<T extends NumberClass> {}

final class FinalPointNumber<T extends NumberClass> {}

class PointBoolean<T extends BooleanClass> {}

final class FinalPointBoolean<T extends BooleanClass> {}

class PointString<T extends StringClass> {}

final class FinalPointString<T extends StringClass> {}

// FixedArray 类型定义
type FixedArray<T> = T[]

// Color 枚举定义
enum Color {
  Red,
  Green,
  Blue
}

// 泛型类定义
class PointVoid<T extends void> {}
final class FinalPointVoid<T extends void> {}

class PointChar<T extends char> {}
final class FinalPointChar<T extends char> {}

class PointNull<T extends null> {}
final class FinalPointNull<T extends null> {}

class PointUndefined<T extends undefined> {}
final class FinalPointUndefined<T extends undefined> {}

class PointIntArray<T extends Int1[]> {}
final class FinalPointIntArray<T extends Int1[]> {}

class PointIntPrimitiveArray<T extends int[]> {}
final class FinalPointIntPrimitiveArray<T extends int[]> {}

class PointColor<T extends Color> {}
final class FinalPointColor<T extends Color> {}

class PointObjectInt<T extends Object, Z extends int> {}
final class FinalPointObjectInt<T extends Object, Z extends int> {}

class PointIntObject<T extends int, Z extends Object> {}
final class FinalPointIntObject<T extends int, Z extends Object> {}

class PointObject<T extends Object> {}
final class FinalPointObject<T extends Object> {}

// 集中定义的类型、接口、类
class A {
  foo(): number { return 1 }
}

// 泛型类定义

class PointAny<T> {}

final class FinalPointAny<T> {}


// 通用类定义
class C<T extends A> {
  constructor(i: T) {
    i.foo()
  }
}

let res: number = 0

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericClassesConstraintTest() {
  describe("GenericClassesConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0100
     * @tc.name      testGenericClassesConstraintGroup0001
     * @tc.desc      Constraint test for Point and FinalPoint with Int1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new Point<Int1>()
      let x2 = new FinalPoint<Int1>()
      expect(x1 instanceof Point).assertTrue()
      expect(x2 instanceof FinalPoint).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0200
     * @tc.name      testGenericClassesConstraintGroup0002
     * @tc.desc      Constraint test for Point and FinalPoint with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new Point<Double1>()
      let x2 = new FinalPoint<Double1>()
      expect(x1 instanceof Point).assertTrue()
      expect(x2 instanceof FinalPoint).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0300
     * @tc.name      testGenericClassesConstraintGroup0003
     * @tc.desc      Constraint test for PointA and FinalPointA with "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointA<"a">()
      let x2 = new FinalPointA<"a">()
      expect(x1 instanceof PointA).assertTrue()
      expect(x2 instanceof FinalPointA).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0400
     * @tc.name      testGenericClassesConstraintGroup0004
     * @tc.desc      Constraint test for PointByte and FinalPointByte with Byte1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointByte<Byte1>()
      let x2 = new FinalPointByte<Byte1>()
      expect(x1 instanceof PointByte).assertTrue()
      expect(x2 instanceof FinalPointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0500
     * @tc.name      testGenericClassesConstraintGroup0005
     * @tc.desc      Constraint test for PointShort and FinalPointShort with Short1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointShort<Short1>()
      let x2 = new FinalPointShort<Short1>()
      expect(x1 instanceof PointShort).assertTrue()
      expect(x2 instanceof FinalPointShort).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0600
     * @tc.name      testGenericClassesConstraintGroup0006
     * @tc.desc      Constraint test for PointInt and FinalPointInt with Int1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointInt<Int1>()
      let x2 = new FinalPointInt<Int1>()
      expect(x1 instanceof PointInt).assertTrue()
      expect(x2 instanceof FinalPointInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0700
     * @tc.name      testGenericClassesConstraintGroup0007
     * @tc.desc      Constraint test for PointLong and FinalPointLong with Long1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointLong<Long1>()
      let x2 = new FinalPointLong<Long1>()
      expect(x1 instanceof PointLong).assertTrue()
      expect(x2 instanceof FinalPointLong).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0800
     * @tc.name      testGenericClassesConstraintGroup0008
     * @tc.desc      Constraint test for PointFloat and FinalPointFloat with Float1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointFloat<Float1>()
      let x2 = new FinalPointFloat<Float1>()
      expect(x1 instanceof PointFloat).assertTrue()
      expect(x2 instanceof FinalPointFloat).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0900
     * @tc.name      testGenericClassesConstraintGroup0009
     * @tc.desc      Constraint test for PointDouble and FinalPointDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointDouble<Double1>()
      let x2 = new FinalPointDouble<Double1>()
      expect(x1 instanceof PointDouble).assertTrue()
      expect(x2 instanceof FinalPointDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1000
     * @tc.name      testGenericClassesConstraintGroup0010
     * @tc.desc      Constraint test for PointNumber and FinalPointNumber with NumberClass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointNumber<NumberClass>()
      let x2 = new FinalPointNumber<NumberClass>()
      expect(x1 instanceof PointNumber).assertTrue()
      expect(x2 instanceof FinalPointNumber).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1100
     * @tc.name      testGenericClassesConstraintGroup0011
     * @tc.desc      Constraint test for PointBoolean and FinalPointBoolean with BooleanClass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointBoolean<BooleanClass>()
      let x2 = new FinalPointBoolean<BooleanClass>()
      expect(x1 instanceof PointBoolean).assertTrue()
      expect(x2 instanceof FinalPointBoolean).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1200
     * @tc.name      testGenericClassesConstraintGroup0012
     * @tc.desc      Constraint test for PointString and FinalPointString with StringClass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointString<StringClass>()
      let x2 = new FinalPointString<StringClass>()
      expect(x1 instanceof PointString).assertTrue()
      expect(x2 instanceof FinalPointString).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1300
     * @tc.name      testGenericClassesConstraintGroup0013
     * @tc.desc      Constraint test for PointVoid and FinalPointVoid with void/undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointVoid<void>()
      let x2 = new FinalPointVoid<void>()
      let x3 = new PointVoid<undefined>()
      let x4 = new FinalPointVoid<undefined>()
      expect(x1 instanceof PointVoid).assertTrue()
      expect(x2 instanceof FinalPointVoid).assertTrue()
      expect(x3 instanceof PointVoid).assertTrue()
      expect(x4 instanceof FinalPointVoid).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1400
     * @tc.name      testGenericClassesConstraintGroup0014
     * @tc.desc      Constraint test for PointChar and FinalPointChar with char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointChar<char>()
      let x2 = new FinalPointChar<char>()
      expect(x1 instanceof PointChar).assertTrue()
      expect(x2 instanceof FinalPointChar).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1500
     * @tc.name      testGenericClassesConstraintGroup0015
     * @tc.desc      Constraint test for PointNull and FinalPointNull with null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointNull<null>()
      let x2 = new FinalPointNull<null>()
      expect(x1 instanceof PointNull).assertTrue()
      expect(x2 instanceof FinalPointNull).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1600
     * @tc.name      testGenericClassesConstraintGroup0016
     * @tc.desc      Constraint test for PointUndefined and FinalPointUndefined with undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointUndefined<undefined>()
      let x2 = new FinalPointUndefined<undefined>()
      expect(x1 instanceof PointUndefined).assertTrue()
      expect(x2 instanceof FinalPointUndefined).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1700
     * @tc.name      testGenericClassesConstraintGroup0017
     * @tc.desc      Constraint test for PointIntArray and FinalPointIntArray with Int1[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointIntArray<Int1[]>()
      let x2 = new FinalPointIntArray<Int1[]>()
      expect(x1 instanceof PointIntArray).assertTrue()
      expect(x2 instanceof FinalPointIntArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1800
     * @tc.name      testGenericClassesConstraintGroup0018
     * @tc.desc      Constraint test for PointIntPrimitiveArray and FinalPointIntPrimitiveArray with int[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointIntPrimitiveArray<int[]>()
      let x2 = new FinalPointIntPrimitiveArray<int[]>()
      expect(x1 instanceof PointIntPrimitiveArray).assertTrue()
      expect(x2 instanceof FinalPointIntPrimitiveArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1900
     * @tc.name      testGenericClassesConstraintGroup0019
     * @tc.desc      Constraint test for PointColor and FinalPointColor with Color
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointColor<Color>()
      let x2 = new FinalPointColor<Color>()
      expect(x1 instanceof PointColor).assertTrue()
      expect(x2 instanceof FinalPointColor).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2000
     * @tc.name      testGenericClassesConstraintGroup0020
     * @tc.desc      Constraint test for PointObjectInt and FinalPointObjectInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObjectInt<Object, int>()
      let x2 = new FinalPointObjectInt<Object, int>()
      expect(x1 instanceof PointObjectInt).assertTrue()
      expect(x2 instanceof FinalPointObjectInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2100
     * @tc.name      testGenericClassesConstraintGroup0021
     * @tc.desc      Constraint test for PointIntObject and FinalPointIntObject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointIntObject<int, Object>()
      let x2 = new FinalPointIntObject<int, Object>()
      expect(x1 instanceof PointIntObject).assertTrue()
      expect(x2 instanceof FinalPointIntObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2200
     * @tc.name      testGenericClassesConstraintGroup0022
     * @tc.desc      Constraint test for PointObject and FinalPointObject with Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObject<Object>()
      let x2 = new FinalPointObject<Object>()
      expect(x1 instanceof PointObject).assertTrue()
      expect(x2 instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2300
     * @tc.name      testGenericClassesConstraintGroup0023
     * @tc.desc      Constraint test for PointObject and FinalPointObject with string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObject<string>()
      let x2 = new FinalPointObject<string>()
      expect(x1 instanceof PointObject).assertTrue()
      expect(x2 instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2400
     * @tc.name      testGenericClassesConstraintGroup0024
     * @tc.desc      Constraint test for PointObject and FinalPointObject with number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObject<number>()
      let x2 = new FinalPointObject<number>()
      expect(x1 instanceof PointObject).assertTrue()
      expect(x2 instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2500
     * @tc.name      testGenericClassesConstraintGroup0025
     * @tc.desc      Constraint test for PointObject and FinalPointObject with Array<int>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObject<Array<int>>()
      let x2 = new FinalPointObject<Array<int>>()
      expect(x1 instanceof PointObject).assertTrue()
      expect(x2 instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2600
     * @tc.name      testGenericClassesConstraintGroup0026
     * @tc.desc      Constraint test for PointObject and FinalPointObject with FixedArray<string>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointObject<FixedArray<string>>()
      let x2 = new FinalPointObject<FixedArray<string>>()
      expect(x1 instanceof PointObject).assertTrue()
      expect(x2 instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2700
     * @tc.name      testGenericClassesConstraintGroup0027
     * @tc.desc      Constraint test for PointAny and FinalPointAny with Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAny<Object>()
      let x2 = new FinalPointAny<Object>()
      expect(x1 instanceof PointAny).assertTrue()
      expect(x2 instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2800
     * @tc.name      testGenericClassesConstraintGroup0028
     * @tc.desc      Constraint test for PointAny and FinalPointAny with Object|undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAny<Object | undefined>()
      let x2 = new FinalPointAny<Object | undefined>()
      expect(x1 instanceof PointAny).assertTrue()
      expect(x2 instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2900
     * @tc.name      testGenericClassesConstraintGroup0029
     * @tc.desc      Constraint test for PointAny and FinalPointAny with Object|null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAny<Object | null>()
      let x2 = new FinalPointAny<Object | null>()
      expect(x1 instanceof PointAny).assertTrue()
      expect(x2 instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3000
     * @tc.name      testGenericClassesConstraintGroup0030
     * @tc.desc      Constraint test for PointAny and FinalPointAny with Object|undefined|null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraintGroup0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAny<Object | undefined | null>()
      let x2 = new FinalPointAny<Object | undefined | null>()
      expect(x1 instanceof PointAny).assertTrue()
      expect(x2 instanceof FinalPointAny).assertTrue()
    });
  })
}

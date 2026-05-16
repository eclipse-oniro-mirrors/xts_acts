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
class Int1 {
  value: int = 0
  constructor() {}
}

class Double1 {
  value: double = 0.0
  constructor() {}
}

function foo1<T extends Int1 | Double1>(p: T): T {
  return p
}

function foo2<T extends "a" | "b">(p: T): T {
  return p
}

function foo3<T extends byte>(p: T): T {
  return p
}

function foo4<T extends short>(p: T): T {
  return p
}

function foo5<T extends int>(p: T): T {
  return p
}

function foo6<T extends long>(p: T): T {
  return p
}

function foo7<T extends float>(p: T): T {
  return p
}

function foo8<T extends double>(p: T): T {
  return p
}

function foo9<T extends number>(p: T): T {
  return p
}

function foo10<T extends boolean>(p: T): T {
  return p
}

function foo11<T extends char>(p: T): T {
  return p
}

function foo12<T extends null>(p: T): T {
  return p
}

function foo13<T extends undefined>(p: T): T {
  return p
}

function foo14<T extends void>(p: T): T {
  return p
}

function foo15<T extends Object>(p: T): T {
  return p
}

function exprFoo1<T extends Int1 | Double1>(p: T): T {
  return p;
}

function exprFoo2<T extends "a" | "b">(p: T): T {
  return p;
}

function exprFoo3<T extends byte>(p: T): T {
  return p;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericFunctionsConstraintTest() {
  describe("GenericFunctionsConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0100
     * @tc.name      testGenericFunctionsConstraintGroup0001
     * @tc.desc      Generic function constraint test for foo1 with Int1 and Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo1<Int1>(new Int1())
      let result2 = foo1<Double1>(new Double1())
      expect(result1 instanceof Int1).assertTrue()
      expect(result2 instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0200
     * @tc.name      testGenericFunctionsConstraintGroup0002
     * @tc.desc      Generic function constraint test for foo2 with "a" and "b"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo2<"a">("a")
      let result2 = foo2<"b">("b")
      expect(result1).assertEqual("a")
      expect(result2).assertEqual("b")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0300
     * @tc.name      testGenericFunctionsConstraintGroup0003
     * @tc.desc      Generic function constraint test for byte, short, int, long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo3<byte>((1).toByte())
      let result2 = foo4<short>((1).toShort())
      let result3 = foo5<int>(1)
      let result4 = foo6<long>((1).toLong())
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
      expect(result3).assertEqual(1)
      expect(result4).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0400
     * @tc.name      testGenericFunctionsConstraintGroup0004
     * @tc.desc      Generic function constraint test for float, double, number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo7<float>(1.1f)
      let result2 = foo8<double>(1.2)
      let result3 = foo9<number>(1.3)
      expect(result1.toString()).assertEqual("1.1")
      expect(result2).assertEqual(1.2)
      expect(result3).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0500
     * @tc.name      testGenericFunctionsConstraintGroup0005
     * @tc.desc      Generic function constraint test for boolean, char, null, undefined, Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo10<boolean>(true)
      let result2 = foo11<char>(c'V')
      let result3 = foo12<null>(null)
      let result4 = foo13<undefined>(undefined)
      let obj = new Int1()
      let result5 = foo15<Int1>(obj)
      expect(result1).assertEqual(true)
      expect(result2.toString()).assertEqual("V")
      expect(result3).assertNull()
      expect(result4).assertUndefined()
      expect(result5 instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0600
     * @tc.name      testGenericFunctionsConstraintGroup0006
     * @tc.desc      Generic expression function constraint test for exprFoo1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = exprFoo1<Int1>(new Int1())
      let result2 = exprFoo1<Double1>(new Double1())
      expect(result1 instanceof Int1).assertTrue()
      expect(result2 instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0700
     * @tc.name      testGenericFunctionsConstraintGroup0007
     * @tc.desc      Generic expression function constraint test for exprFoo2 and exprFoo3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = exprFoo2<"a">("a")
      let result2 = exprFoo2<"b">("b")
      let result3 = exprFoo3<byte>(1 as byte)
      expect(result1).assertEqual("a")
      expect(result2).assertEqual("b")
      expect(result3).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0800
     * @tc.name      testGenericFunctionsConstraintGroup0008
     * @tc.desc      Generic function constraint test for foo8 and foo9 with different numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraintGroup0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = foo8<double>(1.2 as double)
      let result2 = foo8<number>(1.3 as number)
      let result3 = foo9<double>(1.4 as double)
      expect(result1).assertEqual(1.2)
      expect(result2).assertEqual(1.3)
      expect(result3).assertEqual(1.4)
    });
  })
}
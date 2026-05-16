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
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function foo_1() {
}

class A_2 {
  foo() {
  }
}

class A_3 {
  static foo() {
  }
}

function foo_4() {
}

function bar_4() {
}

function foo_5() {
}

function foo_6() {
}

function foo_7(p: number): number {
  return p
}

function bar_7(p: number): number {
  return p
}

class A_8 {
  foo() {
  }
}

class A_9 {
  foo() {
  }
}

class A_10 {
  foo() {
  }
}

class A_11 {
  foo() {
  }

  bar() {
  }
}

class A_12 {
  static foo() {
  }
}

class B_12 {
  static foo() {
  }
}

class A_13 {
  static foo() {
  }
}

class A_14 {
  static foo() {
  }
}

export default function FunctionTypeEqualityOperatorsTest() {
  describe("FunctionTypeEqualityOperatorsTest", () => {
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
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0100
     * @tc.name      testFunctionTypeEqualityOperators0001
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_1 == foo_1).assertTrue()
      expect(foo_1 != foo_1).assertFalse()
      expect(foo_1 === foo_1).assertTrue()
      expect(foo_1 !== foo_1).assertFalse()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0200
     * @tc.name      testFunctionTypeEqualityOperators0002
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a_2 = new A_2()
      expect(a_2.foo == a_2.foo).assertTrue()
      expect(a_2.foo != a_2.foo).assertFalse()
      expect(a_2.foo === a_2.foo).assertTrue()
      expect(a_2.foo !== a_2.foo).assertFalse()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0300
     * @tc.name      testFunctionTypeEqualityOperators0003
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_3.foo == A_3.foo).assertTrue()
      expect(A_3.foo != A_3.foo).assertFalse()
      expect(A_3.foo === A_3.foo).assertTrue()
      expect(A_3.foo !== A_3.foo).assertFalse()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0400
     * @tc.name      testFunctionTypeEqualityOperators0004
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_4 == bar_4).assertFalse()
      expect(foo_4 != bar_4).assertTrue()
      expect(foo_4 === bar_4).assertFalse()
      expect(foo_4 !== bar_4).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0500
     * @tc.name      testFunctionTypeEqualityOperators0005
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_5 == null).assertFalse()
      expect(foo_5 != null).assertTrue()
      expect(foo_5 === null).assertFalse()
      expect(foo_5 !== null).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0600
     * @tc.name      testFunctionTypeEqualityOperators0006
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_6 == undefined).assertFalse()
      expect(foo_6 != undefined).assertTrue()
      expect(foo_6 === undefined).assertFalse()
      expect(foo_6 !== undefined).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0700
     * @tc.name      testFunctionTypeEqualityOperators0007
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_7 == bar_7).assertFalse()
      expect(foo_7 != bar_7).assertTrue()
      expect(foo_7 === bar_7).assertFalse()
      expect(foo_7 !== bar_7).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0800
     * @tc.name      testFunctionTypeEqualityOperators0008
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a_9 = new A_9()
      expect(a_9.foo == null).assertFalse()
      expect(a_9.foo != null).assertTrue()
      expect(a_9.foo === null).assertFalse()
      expect(a_9.foo !== null).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_0900
     * @tc.name      testFunctionTypeEqualityOperators0009
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a_10 = new A_10()
      expect(a_10.foo == undefined).assertFalse()
      expect(a_10.foo != undefined).assertTrue()
      expect(a_10.foo === undefined).assertFalse()
      expect(a_10.foo !== undefined).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_1000
     * @tc.name      testFunctionTypeEqualityOperators0010
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_12.foo == B_12.foo).assertFalse()
      expect(A_12.foo != B_12.foo).assertTrue()
      expect(A_12.foo === B_12.foo).assertFalse()
      expect(A_12.foo !== B_12.foo).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_1100
     * @tc.name      testFunctionTypeEqualityOperators0011
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_13.foo == null).assertFalse()
      expect(A_13.foo != null).assertTrue()
      expect(A_13.foo === null).assertFalse()
      expect(A_13.foo !== null).assertTrue()
    })
    /**
     * @tc.number    SUB_FUNCTION_TYPE_EQUALITY_OPERATORS_1200
     * @tc.name      testFunctionTypeEqualityOperators0012
     * @tc.desc      If both operands refer to the same function object, then the comparison returns true. Otherwise, it is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypeEqualityOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_14.foo == undefined).assertFalse()
      expect(A_14.foo != undefined).assertTrue()
      expect(A_14.foo === undefined).assertFalse()
      expect(A_14.foo !== undefined).assertTrue()
    })
  })
}

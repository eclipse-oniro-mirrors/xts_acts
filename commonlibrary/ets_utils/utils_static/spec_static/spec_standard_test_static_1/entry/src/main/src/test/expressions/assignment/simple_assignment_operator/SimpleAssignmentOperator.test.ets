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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  static fld: string = "";
  fld: string = "";
}

class B extends A {}

type FixedArray<T> = T[];

export default function SimpleAssignmentOperatorTest() {
  describe("SimpleAssignmentOperatorTest", () => {
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
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0100
     * @tc.name      testSimpleAssignmentOperator0001
     * @tc.desc      Positive case for array assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";

      const getArray = (): string[] => {
        result += "getArray ";
        return ["abc", "def", "ghi"];
      };

      const getIndex = (i: int): int => {
        result += "getIndex ";
        return i;
      };

      const getValue = (): string => {
        result += "getValue ";
        return "test";
      };

      let arr_1: string[] = ["abc", "test", "ghi"];
      arr_1 = getArray();
      arr_1[getIndex(1)] = getValue();
      let s: string = arr_1[1];
      let arr_expected: string[] = ["abc", "test", "ghi"];
      for (let j = 0; j < arr_1.length; j++) {
        expect(arr_1[j]).assertEqual(arr_expected[j]);
      }

      expect(result).assertEqual("getArray getIndex getValue ");
      expect(s).assertEqual("test");
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0200
     * @tc.name      testSimpleAssignmentOperator0002
     * @tc.desc      Positive case for field assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";

      const getObj = (): A => {
        result += "getObj classConstructor ";
        return new A();
      };

      const getValue = (): string => {
        result += "getValue ";
        return "test";
      };

      let s: string = getObj().fld = getValue();
      expect(result).assertEqual("getObj classConstructor getValue ");
      expect(s).assertEqual("test");
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0300
     * @tc.name      testSimpleAssignmentOperator0003
     * @tc.desc      Positive case for static field assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";

      const getValue = (): string => {
        result += "getValue ";
        return "test";
      };

      A.fld = "";
      let s: string = ((A.fld)) = getValue();
      expect(result).assertEqual("getValue ");
      expect(s).assertEqual("test");
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0400
     * @tc.name      testSimpleAssignmentOperator0004
     * @tc.desc      Positive case for fixed array assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<A> = [new A(), new A()];
      arr[0] = new B();
      expect(arr[0] instanceof B).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0500
     * @tc.name      testSimpleAssignmentOperator0005
     * @tc.desc      Positive case for record assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      const getRecord = (): Record<string, number> => {
        result += "getRecord ";
        return { "Mary": 21 };
      };

      const getStringIndex = (key: string): string => {
        result += "getIndex ";
        return key;
      };

      let map_17: Record<string, number> = { "Mary": 21 };
      let rec = getRecord();
      rec[getStringIndex("Mary")] = 333;
      expect(map_17["Mary"]).assertEqual(21);
      expect(result).assertEqual("getRecord getIndex ");
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0600
     * @tc.name      testSimpleAssignmentOperator0006
     * @tc.desc      Positive case for simple variable assignment with double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: double = 1.0;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(1.0);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0700
     * @tc.name      testSimpleAssignmentOperator0007
     * @tc.desc      Positive case for simple variable assignment with int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: int = 42;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(42);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0800
     * @tc.name      testSimpleAssignmentOperator0008
     * @tc.desc      Positive case for simple variable assignment with string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: string = "hello";
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual("hello");
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_0900
     * @tc.name      testSimpleAssignmentOperator0009
     * @tc.desc      Positive case for variable assignment with type conversion (int to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: double = 5;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(5.0);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_1000
     * @tc.name      testSimpleAssignmentOperator0010
     * @tc.desc      Positive case for chained variable assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: int = 0;
      let w: int = 0;
      v = w = 100;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(100);
      expect(w).assertEqual(100);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_1100
     * @tc.name      testSimpleAssignmentOperator0011
     * @tc.desc      Positive case for parenthesized variable assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: double = 0.0;
      ((v)) = 3.14;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(3.14);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_1200
     * @tc.name      testSimpleAssignmentOperator0012
     * @tc.desc      Verify normal variable assignment and string concatenation behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: int = 0;
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(0);
    })

    /**
     * @tc.number    SUB_SIMPLE_ASSIGNMENT_OPERATOR_1300
     * @tc.name      testSimpleAssignmentOperator0013
     * @tc.desc      Positive case for assignment expression returning assigned value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSimpleAssignmentOperator0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      let v: int = 0;
      let assigned: int = (v = 77);
      result += "getValue ";
      expect(result).assertEqual("getValue ");
      expect(v).assertEqual(77);
      expect(assigned).assertEqual(77);
    })
  })
}
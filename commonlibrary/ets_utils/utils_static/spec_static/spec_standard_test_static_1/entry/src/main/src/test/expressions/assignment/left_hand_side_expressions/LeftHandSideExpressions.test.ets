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

type FixedArray<T> = T[];
type Keys = "key1" | "key2" | "key3";

interface I {
  key: number;
}

class MyClass {
  static myField: number = 0;
  myField: number = 0;
}

class Inner {
  value: number = 0;
}

class Outer {
  inner: Inner = new Inner();
}

class test_class {
  field: number = 0;
}

export default function LeftHandSideExpressionsTest() {
  describe("LeftHandSideExpressionsTest", () => {
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
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0100
     * @tc.name      testLeftHandSideExpressions0001
     * @tc.desc      Left-hand assignment testing - array element access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myArray: number[] = [1, 2, 3];
      myArray[0] = 4;
      expect(myArray[0]).assertEqual(4);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0200
     * @tc.name      testLeftHandSideExpressions0002
     * @tc.desc      Left-hand assignment testing - fixed array assignment.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<number> = [1, 2, 3];
      arr[1] = 4;
      expect(arr[1]).assertEqual(4);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0300
     * @tc.name      testLeftHandSideExpressions0003
     * @tc.desc      Left-hand assignment testing - nested array access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: number[][] = [[0, 0], [0, 0]];
      matrix[0][1] = 80;
      expect(matrix[0][1]).assertEqual(80);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0400
     * @tc.name      testLeftHandSideExpressions0004
     * @tc.desc      Left-hand assignment testing - nested array access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: FixedArray<FixedArray<number>> = [[0, 0], [0, 0]];
      matrix[0][1] = 80;
      expect(matrix[0][1]).assertEqual(80);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0500
     * @tc.name      testLeftHandSideExpressions0005
     * @tc.desc      Left-hand assignment testing - nested array access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: FixedArray<number[]> = [[0, 0], [0, 0]];
      matrix[0][1] = 80;
      expect(matrix[0][1]).assertEqual(80);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0600
     * @tc.name      testLeftHandSideExpressions0006
     * @tc.desc      Left-hand assignment testing - nested array access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: FixedArray<number>[] = [[0, 0], [0, 0]];
      matrix[0][1] = 80;
      expect(matrix[0][1]).assertEqual(80);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0700
     * @tc.name      testLeftHandSideExpressions0007
     * @tc.desc      Left-hand assignment testing - class field as lhs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myObject = new MyClass();
      myObject.myField = 20;
      expect(myObject.myField).assertEqual(20);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0800
     * @tc.name      testLeftHandSideExpressions0008
     * @tc.desc      Left-hand assignment testing - class field as lhs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      MyClass.myField = 20;
      expect(MyClass.myField).assertEqual(20);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_0900
     * @tc.name      testLeftHandSideExpressions0009
     * @tc.desc      Left-hand assignment testing - nested field access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Outer = new Outer();
      outer.inner.value = 60;
      expect(outer.inner.value).assertEqual(60);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_1000
     * @tc.name      testLeftHandSideExpressions0010
     * @tc.desc      Left-hand expression testing - field access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const test_object = new test_class();
      test_object.field = 20;
      expect(test_object.field).assertEqual(20);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_1100
     * @tc.name      testLeftHandSideExpressions0011
     * @tc.desc      Left-hand assignment testing - Interface (object) property access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: I = { key: 0 };
      record.key = 70;
      expect(record.key).assertEqual(70);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_1200
     * @tc.name      testLeftHandSideExpressions0012
     * @tc.desc      Left-hand expression testing - record element access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myRecord: Record<Keys, number> = {
        'key1': 1,
        'key2': 2,
        'key3': 4
      };
      myRecord['key1'] = 100;
      expect(myRecord['key1']).assertEqual(100);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_1300
     * @tc.name      testLeftHandSideExpressions0013
     * @tc.desc      Left-hand expression testing - record element access testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myRecord: Record<string, number> = {
        'key1': 1,
        'key2': 2,
        'key3': 4
      };
      myRecord['key2'] = 200;
      expect(myRecord['key2']).assertEqual(200);
    })

    /**
     * @tc.number    SUB_LEFT_HAND_SIDE_EXPRESSIONS_1400
     * @tc.name      testLeftHandSideExpressions0014
     * @tc.desc      Left-hand assignment testing - named variable testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLeftHandSideExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let namedVariable: number;
      namedVariable = 10;
      expect(namedVariable).assertEqual(10);
    })
  })
}
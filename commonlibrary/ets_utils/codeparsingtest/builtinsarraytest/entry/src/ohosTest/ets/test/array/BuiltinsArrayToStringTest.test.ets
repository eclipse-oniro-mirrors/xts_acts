/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { Empty, TestA, ToStringNumber, ToStringString } from "../../testability/pages/DataFlg";
import { sleep } from "../../testability/pages/Utils";

export default function builtinsArrayToStringTest() {
  describe('BuiltinsArrayToStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);;
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   builtinsArrayToStringTest1001
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0100
     * @tc.desc   Test basic numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayToStringTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect([1, 2, 3].toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1002
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0200
     * @tc.desc   Test string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(['apple', 'banana', 'cherry'].toString())
        .assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1003
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0300
     * @tc.desc   Test empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([].toString()).assertEqual("");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1004
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0400
     * @tc.desc   Test single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([5].toString()).assertEqual("5");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1005
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0500
     * @tc.desc   Test sparse array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparseArr = [1, , 3];
      expect(sparseArr.toString()).assertEqual("1,,3");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1006
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0600
     * @tc.desc   Test null/undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, null, undefined, 3].toString()).assertEqual("1,,,3");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1007
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0700
     * @tc.desc   Test object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const e: Empty = {};
      const a: TestA = {
        a: 1
      }
      const objArr = [e, a];
      expect(objArr.toString()).assertEqual("[object Object],[object Object]");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1008
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0800
     * @tc.desc   Test nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([[1, 2], [3, 4]].toString()).assertEqual("1,2,3,4");
    });

    /**
     * @tc.name   builtinsArrayToStringTest1009
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_0900
     * @tc.desc   Test Date object handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date();
      expect([date].toString()).assertEqual(date.toString());
    });

    /**
     * @tc.name   builtinsArrayToStringTest1010
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_1000
     * @tc.desc   Test numeric special values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testCases: ToStringNumber[] = [
        {
          input: [Math.floor(1.5)], expected: "1"
        },
        {
          input: [0, -0], expected: "0,0"
        },
        {
          input: [Number.EPSILON], expected: "2.220446049250313e-16"
        },
        {
          input: [Number.MIN_VALUE], expected: "5e-324"
        },
        {
          input: [Number.MAX_VALUE], expected: "1.7976931348623157e+308"
        },
        {
          input: [Infinity, -Infinity], expected: "Infinity,-Infinity"
        },
        {
          input: [123.456], expected: "123.456"
        },
        {
          input: [0xCAFEBABE], expected: "3405691582"
        },
        {
          input: [0x01020304], expected: "16909060"
        }
      ];

      testCases.forEach((item) => {
        expect(item.input.toString()).assertEqual(item.expected);
      });
    });

    /**
     * @tc.name   builtinsArrayToStringTest1011
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_1100
     * @tc.desc   Test string special values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testData: ToStringString[] = [
        {
          input: ["!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"], expected: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
        },
        {
          input: [undefined], expected: ""
        },
        {
          input: [null], expected: ""
        },
        {
          input: [""], expected: ""
        },
        {
          input: ["😊\uD83D\uDE00"], expected: "😊😀"
        },
        {
          input: ["\uDC04\uD83D"], expected: "\uDC04\uD83D"
        },
      ];

      testData.forEach((item) => {
        expect(item.input.toString()).assertEqual(item.expected);
      });
    });

    /**
     * @tc.name   builtinsArrayToStringTest1012
     * @tc.number SUB_BUILTINS_ARRAY_TOSTRING_TEST_1200
     * @tc.desc   Test boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToStringTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([true, false].toString()).assertEqual("true,false");
      expect([!'s'].toString()).assertEqual("false");
      expect([!0].toString()).assertEqual("true");
    });
  });
}
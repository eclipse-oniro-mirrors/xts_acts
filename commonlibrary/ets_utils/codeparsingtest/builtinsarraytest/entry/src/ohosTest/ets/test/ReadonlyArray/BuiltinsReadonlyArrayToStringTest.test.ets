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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { Empty, TestA, ToStringNumber, ToStringString } from "../../testability/pages/DataFlg";
import { sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsReadonlyArrayToStringTest() {
  describe('BuiltinsReadonlyArrayToStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0100
     * @tc.name builtinsReadonlyArrayToStringTest1001
     * @tc.desc Test basic numeric ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0200
     * @tc.name builtinsReadonlyArrayToStringTest1002
     * @tc.desc Test string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly string[] = ['apple', 'banana', 'cherry'];
      expect(arr.toString())
        .assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0300
     * @tc.name builtinsReadonlyArrayToStringTest1003
     * @tc.desc Test empty ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly string[] = [];
      expect(arr.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0400
     * @tc.name builtinsReadonlyArrayToStringTest1004
     * @tc.desc Test single element ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [5];
      expect(arr.toString()).assertEqual("5");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0500
     * @tc.name builtinsReadonlyArrayToStringTest1005
     * @tc.desc Test sparse ReadonlyArray handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined)[] = [1, , 3];
      expect(arr.toString()).assertEqual("1,,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0600
     * @tc.name builtinsReadonlyArrayToStringTest1006
     * @tc.desc Test null/undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined | null)[] = [1, null, undefined, 3];
      expect(arr.toString()).assertEqual("1,,,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0700
     * @tc.name builtinsReadonlyArrayToStringTest1007
     * @tc.desc Test object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const e: Empty = {};
      const a: TestA = {
        a: 1
      };
      const objArr: readonly (Empty | TestA)[] = [e, a];
      expect(objArr.toString()).assertEqual("[object Object],[object Object]");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0800
     * @tc.name builtinsReadonlyArrayToStringTest1008
     * @tc.desc Test nested ReadonlyArrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number[])[] = [[1, 2], [3, 4]];
      expect(arr.toString()).assertEqual("1,2,3,4");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_0900
     * @tc.name builtinsReadonlyArrayToStringTest1009
     * @tc.desc Test Date object handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      let arr: readonly Date[] = [date];
      expect(arr.toString()).assertEqual(date.toString());
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_1000
     * @tc.name builtinsReadonlyArrayToStringTest1010
     * @tc.desc Test numeric special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // 数值类型全集测试
      const testCases: ToStringNumber[] = [
        {
          input: [Math.floor(1.5)], expected: "1"
        },
        {
          input: [0, -0], expected: "0,0"
        }, // -0转换为"0"
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_1100
     * @tc.name builtinsReadonlyArrayToStringTest1011
     * @tc.desc Test string special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOSTRING_TEST_1200
     * @tc.name builtinsReadonlyArrayToStringTest1012
     * @tc.desc Test boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayToStringTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly boolean[] = [true, false, !'s', !0];
      expect(arr.toString()).assertEqual("true,false,false,true");
    });

  });
}
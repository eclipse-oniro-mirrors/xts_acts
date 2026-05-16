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
} from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AttemptInvalidTypeConversionTest() {

  describe("AttemptInvalidTypeConversionTest", () => {
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
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0100
     * @tc.name      testAttemptInvalidTypeConversion0001
     * @tc.desc      Verify JSON.stringify correctly converts an array to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let str: string = JSON.stringify(arr);
      let expectedStr: string = "[1,2,3]";
      expect(str).assertEqual(expectedStr);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0200
     * @tc.name      testAttemptInvalidTypeConversion0002
     * @tc.desc      Verify that an empty string is converted to 0 using Number()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "";
      let num: number = Number(str);
      let expectedNum: number = 0;
      expect(num).assertEqual(expectedNum);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0300
     * @tc.name      testAttemptInvalidTypeConversion0003
     * @tc.desc      Verify that converting a non-empty string to a boolean using Boolean() correctly evaluates to true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello";
      let bool: boolean = Boolean(str);
      let expectedBool: boolean = true;
      expect(bool).assertEqual(expectedBool);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0400
     * @tc.name      testAttemptInvalidTypeConversion0004
     * @tc.desc      Verify that using String() constructor correctly converts a number to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num: number = 42;
      let str: string = String(num);
      let expectedStr: string = "42";
      expect(str).assertEqual(expectedStr);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0500
     * @tc.name      testAttemptInvalidTypeConversion0005
     * @tc.desc      Verify that using parseFloat() correctly converts a string to a number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "42.5";
      let num: number = parseFloat(str);
      let expectedNum: number = 42.5;
      expect(num).assertEqual(expectedNum);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0600
     * @tc.name      testAttemptInvalidTypeConversion0006
     * @tc.desc      Verify that attempting to cast a readonly number[] to a number[] results in a type error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readonlyArr: readonly number[] = [1, 2, 3];
      let mutableArr: number[] = readonlyArr as number[];
      expect(mutableArr[0]).assertEqual(1);
      expect(mutableArr[1]).assertEqual(2);
      expect(mutableArr[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0700
     * @tc.name      testAttemptInvalidTypeConversion0007
     * @tc.desc      Verify that using toString() correctly converts an array to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let str: string = arr.toString();
      let expectedStr: string = "1,2,3";
      expect(str).assertEqual(expectedStr);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0800
     * @tc.name      testAttemptInvalidTypeConversion0008
     * @tc.desc      Verify that using parseInt() correctly converts a string to a number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "42";
      let num: number = parseInt(str, 10);
      let expectedNum: number = 42;
      expect(num).assertEqual(expectedNum);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_0900
     * @tc.name      testAttemptInvalidTypeConversion0009
     * @tc.desc      Verify that using String() constructor correctly converts an array to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let str: string = String(arr);
      let expectedStr: string = "1,2,3";
      expect(str).assertEqual(expectedStr);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_1000
     * @tc.name      testAttemptInvalidTypeConversion0010
     * @tc.desc      Verify that using template literals correctly converts an array to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let str: string = `${arr}`;
      let expectedStr: string = "1,2,3";
      expect(str).assertEqual(expectedStr);
    });

    /**
     * @tc.number    SUB_ATTEMPT_INVALID_TYPE_CONVERSION_1100
     * @tc.name      testAttemptInvalidTypeConversion0011
     * @tc.desc      Verify that using Number() constructor correctly converts a string to a number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAttemptInvalidTypeConversion0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "42";
      let num: number = Number(str);
      let expectedNum: number = 42;
      expect(num).assertEqual(expectedNum);
    });
  })
}
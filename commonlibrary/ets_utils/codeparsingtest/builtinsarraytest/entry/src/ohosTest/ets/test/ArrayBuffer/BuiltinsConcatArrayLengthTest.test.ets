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
import { ConcatArrayTest, sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsConcatArrayLengthTest() {
  describe('BuiltinsConcatArrayLengthTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(50);;
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
     * @tc.name   builtinsConcatArrayLengthTest1001
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0100
     * @tc.desc   Verify empty ConcatArray length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsConcatArrayLengthTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new ConcatArrayTest<number>([]);
      arr.setLength(0);
      expect(arr.length()).assertEqual(0);
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1002
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0200
     * @tc.desc   Verify single element ConcatArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new ConcatArrayTest<string>(['a']);
      expect(arr.length()).assertEqual(1);
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1003
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0300
     * @tc.desc   Test maximum array index exceed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const arr = new ConcatArrayTest<string>([]);
        arr.setLength(4294967297);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1004
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0400
     * @tc.desc   Test valid maximum length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new ConcatArrayTest<string>([]);
      arr.setLength(4294967296);
      expect(arr.length()).assertEqual(4294967296);
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1005
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0500
     * @tc.desc   Test length assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new ConcatArrayTest<string>([]);
      arr.setLength(10);
      expect(arr.length()).assertEqual(10);
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1006
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0600
     * @tc.desc   Test negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const arr = new ConcatArrayTest<string>([]);
        arr.setLength(-1);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name   builtinsConcatArrayLengthTest1007
     * @tc.number SUB_ConcatArray_LENGTH_TEST_0700
     * @tc.desc   Test invalid length type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayLengthTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const arr = new ConcatArrayTest<string>([]);
        arr.setLength('a');
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
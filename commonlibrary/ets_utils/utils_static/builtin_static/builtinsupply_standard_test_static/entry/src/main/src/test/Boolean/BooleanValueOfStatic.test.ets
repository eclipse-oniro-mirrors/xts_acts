/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsBooleanValueOfTest() {
  describe('builtinsBooleanValueOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll( async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_VALUE_OF_TEST_0100
     * @tc.name builtinsBooleanValueOfTest0100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanValueOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanValueOfTest0100';
      console.info(`${caseName} test start`);
      let bool = new Boolean(true);
      expect(bool.valueOf()).assertTrue();
      done.unsafeCall();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_VALUE_OF_TEST_0200
     * @tc.name builtinsBooleanValueOfTest0200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanValueOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanValueOfTest0200';
      console.info(`${caseName} test start`);
      let bool = new Boolean();
      expect(bool.valueOf()).assertFalse();
      done.unsafeCall();
      console.info(`${caseName} test end`);
    })
  })
}
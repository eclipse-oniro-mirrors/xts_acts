/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function builtinsBooleanValueOfTest() {
  describe('builtinsBooleanValueOfTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
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
      done();
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
      done();
      console.info(`${caseName} test end`);
    })
  })
}
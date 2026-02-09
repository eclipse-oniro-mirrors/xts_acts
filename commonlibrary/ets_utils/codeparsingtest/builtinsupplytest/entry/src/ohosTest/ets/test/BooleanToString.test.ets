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

export default function builtinsBooleanToStringTest() {
  describe('builtinsBooleanToStringTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(40);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   builtinsBooleanToStringTest0100
     * @tc.number SUB_BUILTINS_BOOLEAN_TO_STRING_TEST_0100
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsBooleanToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanToStringTest0100';
      console.info(`${caseName} test start`);
      let bool = new Boolean(true);
      expect(bool.toString()).assertEqual('true');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsBooleanToStringTest0200
     * @tc.number SUB_BUILTINS_BOOLEAN_TO_STRING_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsBooleanToStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanToStringTest0200';
      console.info(`${caseName} test start`);
      let bool = new Boolean();
      expect(bool.toString()).assertEqual('false');
      done();
      console.info(`${caseName} test end`);
    })
  })
}
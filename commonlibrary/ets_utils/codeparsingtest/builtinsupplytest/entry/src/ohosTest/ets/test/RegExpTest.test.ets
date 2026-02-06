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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function builtinsRegExpTestTest() {
  describe('builtinsRegExpTestTest', () => {
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
     * @tc.number SUB_BUILTINS_REGEXP_TEST_TEST_0100
     * @tc.name builtinsRegExpTestTest0100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpTestTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpTestTest0100';
      console.info(`${caseName} test start`);

      let pattern = 'hello world!';
      let reg = new RegExp(pattern);
      let res = reg.test('hello world!');
      expect(res).assertTrue();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_TEST_TEST_0200
     * @tc.name builtinsRegExpTestTest0200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpTestTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpTestTest0200';
      console.info(`${caseName} test start`);
      let pattern = /foo/g;
      let reg = new RegExp(pattern);
      expect(reg.test('foo')).assertTrue();
      expect(reg.test('foo')).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })
  })
}
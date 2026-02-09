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
import {
  regExp$str,
  regExpSymbolMatch, regExpSymbolSearch,
  regExpSymbolSpecies,
  regExpSymbolSplit } from '../testability/pages/RegexpUtils';

export default function builtinsRegExpSymbolSplitTest() {
  describe('builtinsRegExpSymbolSplitTest', () => {
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
     * @tc.name   builtinsRegExpSymbolSplitTest0100
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_SPLIT_TEST_0100
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpSymbolSplitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpSymbolSplitTest0100';
      console.info(`${caseName} test start`);
      let reg = regExpSymbolSplit(/-/, 'a-b-c');
      expect(reg).assertDeepEquals(['a', 'b', 'c']);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpSymbolSplitTest0200
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_SPLIT_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpSymbolSplitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpSymbolSplitTest0200';
      console.info(`${caseName} test start`);
      let reg = regExpSymbolSplit(/-/g, '2016-01-02');
      expect(reg).assertDeepEquals(['2016', '01', '02']);
      done();
      console.info(`${caseName} test end`);
    })
  })
}
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
import { regExpSymbolMatch } from '../testability/pages/RegexpUtils';

export default function builtinsRegExpSymbolMatchTest() {
  describe('builtinsRegExpSymbolMatchTest', () => {
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
     * @tc.name   builtinsRegExpSymbolMatchTest0200
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_MATCH_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpSymbolMatchTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpSymbolMatchTest0200';
      console.info(`${caseName} test start`);
      let reg = regExpSymbolMatch(/[0-9]+/g, '2016-01-02');
      expect(reg).assertDeepEquals(['2016', '01', '02']);
      done();
      console.info(`${caseName} test end`);
    })
  })
}
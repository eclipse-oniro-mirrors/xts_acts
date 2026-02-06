/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';

export default function builtinsRegExpSymbolReplaceTest() {
  describe('builtinsRegExpSymbolReplaceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   builtinsRegExpSymbolReplaceTest0100
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_REPLACE_TEST_0100
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpSymbolReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const caseName = 'builtinsRegExpSymbolReplaceTest0100';
      console.info(`${caseName} test start`);
      let reg = new RegExp("a").replace('abc', 'A');
      expect(reg).assertEqual('Abc');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpSymbolReplaceTest0200
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_REPLACE_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpSymbolReplaceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const caseName = 'builtinsRegExpSymbolReplaceTest0200';
      console.info(`${caseName} test start`);
      let reg = new RegExp("-", "g").replace('2016-01-01', '.');
      expect(reg).assertEqual('2016.01.01');
      done();
      console.info(`${caseName} test end`);
    })
  })
}
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

export default function builtinsRegExpStaticPropTest() {
  describe('builtinsRegExpStaticPropTest', () => {
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
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0100
     * @tc.name builtinsRegExpStaticPropTest0100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0100';
      console.info(`${caseName} test start`);
      let reg = /except/g;
      reg.test('except in compliance');
      expect(RegExp.input).assertUndefined();
      reg.test('except in2 com');
      expect(RegExp.$_).assertUndefined();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0200
     * @tc.name builtinsRegExpStaticPropTest0200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0200';
      console.info(`${caseName} test start`);
      let reg = /except/g;
      reg.test('except in compliance');
      expect(RegExp.lastMatch).assertUndefined();
      reg.test('except in2 com');
      expect(regExp$str(reg, '$&')).assertUndefined();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0300
     * @tc.name builtinsRegExpStaticPropTest0300
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0300';
      console.info(`${caseName} test start`);
      let reg = /hello/g;
      reg.test('hello in');
      expect(RegExp.lastParen).assertUndefined();
      reg.test('hello in2');
      expect(regExp$str(reg, '$+')).assertUndefined();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0400
     * @tc.name builtinsRegExpStaticPropTest0400
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0400';
      console.info(`${caseName} test start`);
      let reg = /my/g;
      reg.test('my in');
      expect(RegExp.leftContext).assertUndefined();
      reg.test('my in2');
      expect(regExp$str(reg, '$`')).assertUndefined();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0500
     * @tc.name builtinsRegExpStaticPropTest0500
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0500';
      console.info(`${caseName} test start`);
      let reg = /after/g;
      reg.test('after in');
      expect(RegExp.rightContext).assertUndefined();
      reg.test('after in2');
      expect(regExp$str(reg, '$\'')).assertUndefined();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_STATIC_PROP_TEST_0600
     * @tc.name builtinsRegExpStaticPropTest0600
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpStaticPropTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpStaticPropTest0600';
      console.info(`${caseName} test start`);
      let reg = /before/g;
      expect(regExpSymbolSpecies(reg)).assertInstanceOf('Function');
      done();
      console.info(`${caseName} test end`);
    })
  })
}
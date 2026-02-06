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

export default function builtinsRegExpInstancePropTest() {
  describe('builtinsRegExpInstancePropTest', () => {
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
     * @tc.name   builtinsRegExpInstancePropTest0200
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0200';
      console.info(`${caseName} test start`);
      let reg1 = /except/s;
      let reg2 = /excepts/;
      expect(reg1.dotAll).assertTrue();
      expect(reg2.dotAll).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0300
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0300
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0300';
      console.info(`${caseName} test start`);
      let str1 = /foo/gi.flags;
      let str2 = /bar/muy.flags;
      expect(str1).assertEqual('gi');
      expect(str2).assertEqual('muy');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0400
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0400
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0400';
      console.info(`${caseName} test start`);
      let reg1 = /hello/g;
      let reg2 = /excepts/;
      expect(reg1.global).assertTrue();
      expect(reg2.global).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0500
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0500
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0500';
      console.info(`${caseName} test start`);
      // Not currently supported  hasIndices
      // let reg1 = /hello/d;
      // let reg2 = /excepts/;
      // expect(reg1.hasIndices).assertTrue();
      // expect(reg2.hasIndices).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0600
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0600
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0600';
      console.info(`${caseName} test start`);
      let reg1 = /hello/i;
      let reg2 = /exception/;
      expect(reg1.ignoreCase).assertTrue();
      expect(reg2.ignoreCase).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0700
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0700
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0700';
      console.info(`${caseName} test start`);
      let reg1 = /he/m;
      let reg2 = /exce/;
      expect(reg1.multiline).assertTrue();
      expect(reg2.multiline).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0800
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0800
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0800';
      console.info(`${caseName} test start`);
      let s1 = /fooBar/gi.source;
      let s2 = new RegExp('').source;
      let s3 = new RegExp('\\n').source;
      expect(s1).assertEqual('fooBar');
      expect(s2).assertEqual('(?:)');
      expect(s3).assertEqual('\\n');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest0900
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_0900
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest0900';
      console.info(`${caseName} test start`);
      let reg1 = /fhe/y;
      let reg2 = /bexce/;
      expect(reg1.sticky).assertTrue();
      expect(reg2.sticky).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest1000
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_1000
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest1000';
      console.info(`${caseName} test start`);
      let reg1 = /hef/u;
      let reg2 = /etxce/;
      expect(reg1.unicode).assertTrue();
      expect(reg2.unicode).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpInstancePropTest1100
     * @tc.number SUB_BUILTINS_REGEXP_INSTANCE_PROP_TEST_1100
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpInstancePropTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpInstancePropTest1100';
      console.info(`${caseName} test start`);
      // Not currently supported  unicodeSets
      // let reg1 = /an/v;
      // let reg2 = /str/;
      // expect(reg1.unicodeSets).assertTrue();
      // expect(reg2.unicodeSets).assertFalse();
      done();
      console.info(`${caseName} test end`);
    })
  })
}
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

export default function builtinsRegExpEscapeTest() {
  describe('builtinsRegExpEscapeTest', () => {
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
     * @tc.name   builtinsRegExpEscapeTest0100
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0100
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0100';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('Buy it. use it. break it. fix it.');
      // expect(reg).assertEqual('\\\x42uy\\\x20it\\\\.\\\x20use\\\x20it\\\\.\\\x20break\\\x20it\\\\.\\\x20fix\\\x20it\\\\.');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpEscapeTest0200
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0200
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0200';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('foo.bar');
      // expect(reg).assertEqual('\\\x66oo\\\\.bar');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpEscapeTest0300
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0300
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0300';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('foo-bar');
      // expect(reg).assertEqual('\\\x66oo\\\x2dbar');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpEscapeTest0400
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0400
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0400';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('foo\nbar');
      // expect(reg).assertEqual('\\\x66oo\\\x2dbar');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpEscapeTest0500
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0500
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0500';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('foo\uD800bar');
      // expect(reg).assertEqual('\\\x66oo\\\x2dbar');
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpEscapeTest0600
     * @tc.number SUB_BUILTINS_REGEXP_ESCAPE_TEST_0600
     * @tc.desc   Testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpEscapeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpEscapeTest0600';
      console.info(`${caseName} test start`);
      // let reg = RegExp.escape('foo\u2028bar');
      // expect(reg).assertEqual('\\\x66oo\\\u2028bar');
      done();
      console.info(`${caseName} test end`);
    })
  })
}
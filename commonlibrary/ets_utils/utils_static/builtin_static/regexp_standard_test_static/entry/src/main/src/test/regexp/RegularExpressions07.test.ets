/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';


export default function RegularExpressions07Test() {
  describe('RegularExpressions07Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9700
     * @tc.name      testRegExpCharset0097
     * @tc.desc      RegExp optional decimal [0-9]+(?:\.[0-9]+)? matches "123.45"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re97: RegExp = new RegExp('[0-9]+(?:\\.[0-9]+)?');
      const result97 = "123.45".match(re97);
      expect(result97?.[0])?.assertEqual("123.45");
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9800
     * @tc.name      testRegExpCharset0098
     * @tc.desc      RegExp optional decimal [0-9]+(?:\.[0-9]+)? matches "123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re98: RegExp = new RegExp('[0-9]+(?:\\.[0-9]+)?');
      const result98 = "123".match(re98);
      expect(result98?.[0])?.assertEqual("123");
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_9900
     * @tc.name      testRegExpCharset0099
     * @tc.desc      RegExp letters followed by digits [a-z]*[0-9]+ matches "abc123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re99: RegExp = new RegExp('[a-z]*[0-9]+');
      const result99: boolean = re99.test("abc123");
      expect(result99).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_REGEXP_CHARSET_10000
     * @tc.name      testRegExpCharset0100
     * @tc.desc      RegExp letters followed by digits [a-z]*[0-9]+ does not match "abc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharset0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re100: RegExp = new RegExp('[a-z]*[0-9]+');
      const result100: boolean = re100.test("abc");
      expect(result100).assertFalse();
    });
  })
}
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
import { sleep } from '../../testability/pages/Utils';

export default function builtinsRegExpExecArrayStringTest() {
  describe('builtinsRegExpExecArrayStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   builtinsRegExpExecArrayStringTest0100
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0100
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsRegExpExecArrayStringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0100';
      console.info(`${caseName} test start`);
      try {
        // exp result is match[0]: 'test'
        const exp: string = 'test';
        const reg: RegExp = /test/;

        let str = 'atestb';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match).assertNull()
        }

      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0200
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0200
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0200';
      console.info(`${caseName} test start`);
      try {
        // exp result is result[0]：'123-4567'
        const exp: string = '123-4567';
        const reg: RegExp = /(\d{3})-(\d{4})/;

        let str = '123-4567';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0300
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0300
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0300';
      console.info(`${caseName} test start`);
      try {
        // exp result is result[0]：'2023-10-05'
        const exp: string = '2023-10-05';
        const reg: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;

        let str = '2023-10-05';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0400
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0400
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0400';
      console.info(`${caseName} test start`);
      try {
        // exp result is result[0] === '!"#$%&'()*+,-./:;<=>?@[]^_`{|}~'
        const exp: string = '!"#$%&\'()*+,-./:;<=>?@[]^_`{|}~';
        const reg: RegExp = /([!"#$%&'()*+,-./:;<=>?@[]^_`{|}~]+)/;

        let str = '!"#$%&\'()*+,-./:;<=>?@[]^_`{|}~';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0500
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0500
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0500';
      console.info(`${caseName} test start`);
      try {
        // exp result is result[0] 'undefined'
        const exp: string = 'undefined';
        const reg: RegExp = /^undefined$/;

        let str = 'undefined';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0600
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0600
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0600';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] 'null'
        const exp: string = 'null';
        const reg: RegExp = /^null$/;

        let str = 'null';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0700
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0700
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0700';
      console.info(`${caseName} test start`);
      try {
        // exp result is result[0] '0'
        const exp: string = '0';
        const reg: RegExp = /^0$/;

        let str = '0';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0800
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0800
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0800';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] 'NaN'
        const exp: string = 'NaN';
        const reg: RegExp = /^NaN$/;

        let str = 'NaN';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest0900
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_0900
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest0900';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] ''
        const exp: string = '';
        const reg: RegExp = /^$/;

        let str = '';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest1000
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_1000
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest1000';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] '\ud83d\udc46'
        const exp: string = '\ud83d\udc46';
        const reg: RegExp = /^\ud83d\udc46$/;

        let str = '\ud83d\udc46';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest1100
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_1100
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest1100';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] '\udc04'
        const exp: string = '\udc04';
        const reg: RegExp = /^\udc04$/;

        let str = '\udc04';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsRegExpExecArrayStringTest1200
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_STRING_TEST_1200
     * @tc.desc   Testing RegExpExecArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayStringTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayStringTest1200';
      console.info(`${caseName} test start`);

      try {
        // exp result is result[0] '\a'
        const exp: string = '\\a';
        const reg: RegExp = /^\a$/;

        let str = '\\a';
        let match = reg.exec(str);

        if (match) {
          let result: string = match[0];
          console.info(caseName + ' result is: ' + result);

          expect(result).assertEqual(exp);
        } else {
          console.info(caseName + ' match is: ' + match);

          expect(match === null).assertTrue()
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}
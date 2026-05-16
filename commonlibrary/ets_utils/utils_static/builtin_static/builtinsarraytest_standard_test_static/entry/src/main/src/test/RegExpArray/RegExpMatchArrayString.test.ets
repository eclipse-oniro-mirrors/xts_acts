/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsRegExpMatchArrayStringTest() {
  describe('builtinsRegExpMatchArrayStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0100
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0100
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsRegExpMatchArrayStringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0100';
        console.info(`${caseName} test start`);
        try {
          const exp: string = '123-45-6789';
          const reg: RegExp = new RegExp("(\\d{3})-(\\d{2})-(\\d{4})");

          let str = '123-45-6789';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0200
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0200
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0200';
        console.info(`${caseName} test start`);
        try {
          const exp: string = 'abc-def';
          const reg: RegExp = new RegExp("(\\d{3})-(\\d{2})-(\\d{4})");

          let str = 'abc-def';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0300
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0300
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0300';
        console.info(`${caseName} test start`);
        try {
          const exp: string = '2023-10-05';
          const reg: RegExp = new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})");

          let str = '2023-10-05';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0400
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0400
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0400';
        console.info(`${caseName} test start`);
        try {
          const exp: string = '!"#$%&\'()*+,-./:;<=>?@[]^_`{|}~';
          const reg: RegExp = new RegExp("([!\"#$%&'()*+,-./:;<=>?@[]^_`{|}~]+)");

          let str = '!"#$%&\'()*+,-./:;<=>?@[]^_`{|}~';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0500
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0500
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0500';
        console.info(`${caseName} test start`);
        try {
          const exp: string = 'undefined';
          const reg: RegExp = new RegExp("^undefined$");

          let str = 'undefined';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0600
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0600
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0600';
        console.info(`${caseName} test start`);

        try {
          const exp: string = 'null';
          const reg: RegExp = new RegExp("^null$");

          let str = 'null';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0700
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0700
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0700';
        console.info(`${caseName} test start`);
        try {
          const exp: string = '0';
          const reg: RegExp = new RegExp("^0$");

          let str = '0';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0800
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0800
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0800';
        console.info(`${caseName} test start`);

        try {
          const exp: string = 'NaN';
          const reg: RegExp = new RegExp("^NaN$");

          let str = 'NaN';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest0900
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_0900
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest0900';
        console.info(`${caseName} test start`);

        try {
          const exp: string = '';
          const reg: RegExp = new RegExp("^$");

          let str = '';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest1000
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_1000
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest1000';
        console.info(`${caseName} test start`);

        try {
          const exp: string = '\ud83d\udc46';
          const reg: RegExp = new RegExp("^\ud83d\udc46$");

          let str = '\ud83d\udc46';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest1100
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_1100
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest1100';
        console.info(`${caseName} test start`);

        try {
          const exp: string = '\udc04';
          const reg: RegExp = new RegExp("^\udc04$");

          let str = '\udc04';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
     * @tc.name   builtinsRegExpMatchArrayStringTest1200
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_STRING_TEST_1200
     * @tc.desc   Testing RegExpMatchArray string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpMatchArrayStringTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (done:() => void) => {
        const caseName = 'builtinsRegExpMatchArrayStringTest1200';
        console.info(`${caseName} test start`);

        try {
          const exp: string = '\\a';
          const reg: RegExp = new RegExp("^\\a$");

          let str = '\\a';
          let match = str.match(reg);

          if (match) {
            let result: String | undefined = match[0];
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
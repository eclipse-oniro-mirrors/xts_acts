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

export default function builtinsRegExpMatchArrayInputTest() {
  describe('builtinsRegExpMatchArrayInputTest', () => {
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
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_INPUT_TEST_0100
     * @tc.name builtinsRegExpMatchArrayInputTest0100
     * @tc.desc Testing RegExpMatchArray input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsRegExpMatchArrayInputTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpMatchArrayInputTest0100';
      console.info(`${caseName} test start`);
      try {
        // exp result is match.input === '123-45-6789'
        const exp: string = '123-45-6789';
        const reg: RegExp = /(\d{3})-(\d{2})-(\d{4})/;

        let str: string = '123-45-6789';
        let match = str.match(reg);

        if (match) {
          let result: string | undefined = match.input;

          if (result !== undefined) {
            console.info(caseName + ' result is: ' + result);

            expect(result === exp).assertTrue();
          } else {
            expect(result === undefined).assertTrue()
          }
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
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_INPUT_TEST_0200
     * @tc.name builtinsRegExpMatchArrayInputTest0200
     * @tc.desc Testing RegExpMatchArray input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsRegExpMatchArrayInputTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpMatchArrayInputTest0200';
      console.info(`${caseName} test start`);
      try {
        // exp result is match === null
        const exp: string = 'abc-def';
        const reg: RegExp = /(\d{3})-(\d{2})-(\d{4})/;

        let str: string = 'abc-def';
        let match = str.match(reg);

        if (match) {
          let result: string | undefined = match.input;

          if (result !== undefined) {
            console.info(caseName + ' result is: ' + result);

            expect(result === exp).assertTrue();
          } else {
            expect(result === undefined).assertTrue()
          }
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
     * @tc.number SUB_BUILTINS_REG_EXP_MATCH_ARRAY_INPUT_TEST_0300
     * @tc.name builtinsRegExpMatchArrayInputTest0300
     * @tc.desc Testing RegExpMatchArray input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsRegExpMatchArrayInputTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpMatchArrayInputTest0300';
      console.info(`${caseName} test start`);
      try {
        // exp result is match.input === '2023-10-05'
        const exp: string = '2023-10-05';
        const reg: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;

        let str: string = '2023-10-05';
        let match = str.match(reg);

        if (match) {
          let result: string | undefined = match.input;

          if (result !== undefined) {
            console.info(caseName + ' result is: ' + result);

            expect(result === exp).assertTrue();
          } else {
            expect(result === undefined).assertTrue()
          }
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
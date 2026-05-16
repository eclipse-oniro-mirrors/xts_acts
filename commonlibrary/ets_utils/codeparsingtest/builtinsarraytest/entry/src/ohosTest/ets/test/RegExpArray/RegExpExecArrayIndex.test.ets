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

export default function builtinsRegExpExecArrayIndexTest() {
  describe('builtinsRegExpExecArrayIndexTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   builtinsRegExpExecArrayIndexTest0100
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_INDEX_TEST_0100
     * @tc.desc   Testing RegExpExecArray index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsRegExpExecArrayIndexTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayIndexTest0100';
      console.info(`${caseName} test start`);
      try {
        // exp result is result.index：1
        const exp: number = 1;
        const reg: RegExp = /test/;

        let str: string = 'atestb';
        let match = reg.exec(str);

        if (match) {
          let result: number | undefined = match.index;

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
     * @tc.name   builtinsRegExpExecArrayIndexTest0200
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_INDEX_TEST_0200
     * @tc.desc   Testing RegExpExecArray index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayIndexTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayIndexTest0200';
      console.info(`${caseName} test start`);
      try {
        // exp result is result.index：0
        const exp: number = 0;
        const reg: RegExp = /(\d{3})-(\d{4})/;

        let str: string = '123-4567';
        let match = reg.exec(str);

        if (match) {
          let result: number | undefined = match.index;

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
     * @tc.name   builtinsRegExpExecArrayIndexTest0300
     * @tc.number SUB_BUILTINS_REG_EXP_EXEC_ARRAY_INDEX_TEST_0300
     * @tc.desc   Testing RegExpExecArray index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsRegExpExecArrayIndexTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsRegExpExecArrayIndexTest0300';
      console.info(`${caseName} test start`);
      try {
        // exp result is result.index：0
        const exp: number = 0;
        const reg: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;

        let str: string = '2023-10-05';
        let match = reg.exec(str);

        if (match) {
          let result: number | undefined = match.index;

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
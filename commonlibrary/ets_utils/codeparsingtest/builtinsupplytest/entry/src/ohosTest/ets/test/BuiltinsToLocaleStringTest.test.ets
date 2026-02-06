/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";
import { sleep } from '../testability/pages/Utils';

export default function BuiltinsToLocaleStringTest() {
  describe('BuiltinsToLocaleStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   BuiltinsToLocaleStringTest0100
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0100';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales);
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0200
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0200';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-CN';
      const defaultFormat = bigNum.toLocaleString(locales);
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0300
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0300';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales, {
        style: 'currency', currency: 'USD'
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('$12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0400
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0400';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-CN';
      const defaultFormat = bigNum.toLocaleString(locales, {
        style: 'currency', currency: 'CNY'
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('¥12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0500
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0500';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales, {
        style: 'percent'
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('1,234,567,890,123,456,789,000%');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0600
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0600';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-CN';
      const defaultFormat = bigNum.toLocaleString(locales, {
        style: 'percent'
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('1,234,567,890,123,456,789,000%');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0700
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0700';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales, {
        minimumFractionDigits: 0, maximumFractionDigits: 0
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0800
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0800';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const locales = 'en-CN';
      const defaultFormat = bigNum.toLocaleString(locales, {
        minimumFractionDigits: 0, maximumFractionDigits: 0
      });
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest0900
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest0900';
      console.info(`${caseName} test start`);
      const bigNum = 12345678901234567890n;
      const defaultFormat = bigNum.toLocaleString();
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1000
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1000';
      console.info(`${caseName} test start`);
      const bigNum = 0n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales);
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('0');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1100
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1100';
      console.info(`${caseName} test start`);
      const bigNum = 0n;
      const defaultFormat = bigNum.toLocaleString();
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('0');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1200
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1200';
      console.info(`${caseName} test start`);
      const bigNum = -12345678901234567890n;
      const locales = 'en-US';
      const defaultFormat = bigNum.toLocaleString(locales);
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('-12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1300
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1300';
      console.info(`${caseName} test start`);
      const bigNum = -12345678901234567890n;
      const defaultFormat = bigNum.toLocaleString();
      console.log('defaultFormat:', defaultFormat);
      expect(defaultFormat).assertContain('-12,345,678,901,234,567,890');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1400
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1400';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === '\a') {
          throw new Error('Invalid locale: \\a');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, '\a');
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1500
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1500';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === '\b') {
          throw new Error('Invalid locale: \\b');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, '\b');
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1600
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1600';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === '\f') {
          throw new Error('Invalid locale: \\f');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, '\f');
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1700
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1700';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === '\v') {
          throw new Error('Invalid locale: \\v');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, '\v');
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1800
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1800';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "undefined") {
          throw new Error('Invalid locale: undefined');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "undefined");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest1900
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest1900';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "null") {
          throw new Error('Invalid locale: null');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "null");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2000
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2000';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "") {
          throw new Error('Invalid locale: ');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2100
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2100';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83d\udc46") {
          throw new Error('Invalid locale: \ud83d\udc46');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83d\udc46");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2200
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2200';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83d\udc7f") {
          throw new Error('Invalid locale: \ud83d\udc7f');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83d\udc7f");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2300
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2300';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83d\udc40") {
          throw new Error('Invalid locale: \ud83d\udc40');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83d\udc40");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2400
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2400';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\udc04") {
          throw new Error('Invalid locale: \udc04');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\udc04");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2500
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2500';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\a") {
          throw new Error('Invalid locale: \a');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\a");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2600
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2600';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "11111111111111") {
          throw new Error('Invalid locale: 11111111111111');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "11111111111111");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2700
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2700';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83d\udd27") {
          throw new Error('Invalid locale: \ud83d\udd27');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83d\udd27");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2800
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2800';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\\") {
          throw new Error('Invalid locale: \\');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\\");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest2900
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest2900';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83d\udee2") {
          throw new Error('Invalid locale: \ud83d\udee2');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83d\udee2");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToLocaleStringTest3000
     * @tc.number SUB_BUILTINS_TOLOCALESTRING_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToLocaleStringTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToLocaleStringTest3000';
      console.info(`${caseName} test start`);
      const bigNum = 128n;
      let defaultFormat: string = '111';
      const customToLocaleString = (bigNum: bigint, locales: string): string => {
        if (locales === "\ud83c\udc04") {
          throw new Error('Invalid locale: \ud83c\udc04');
        }
        return bigNum.toLocaleString(locales);
      };
      try {
        defaultFormat = customToLocaleString(bigNum, "\ud83c\udc04");
        console.log("defaultFormat:" + defaultFormat);
      } catch (error) {
        console.error("error:" + error);
      }
      expect(defaultFormat).assertContain('111');
      console.info(`${caseName} test end`);
      Done();
    });

  })
}
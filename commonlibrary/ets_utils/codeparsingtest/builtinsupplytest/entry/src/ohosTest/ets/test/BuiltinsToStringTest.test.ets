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

export default function BuiltinsToStringTest() {
  describe('BuiltinsToStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   BuiltinsToStringTest0100
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0100';
      console.info(`${caseName} test start`);
      const bigIntNumber = 123n;
      const str1 = bigIntNumber.toString();
      console.log("str1:" + str1);
      expect(str1).assertContain('123');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0200
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0200';
      console.info(`${caseName} test start`);
      const bigIntNumber = 15n;
      const str1 = bigIntNumber.toString(16);
      console.log("str1:" + str1);
      expect(str1).assertContain('f');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0300
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0300';
      console.info(`${caseName} test start`);
      const bigIntNumber = -10n;
      const str1 = bigIntNumber.toString(2);
      console.log("str1:" + str1);
      expect(str1).assertContain('-1010');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0400
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0400';
      console.info(`${caseName} test start`);
      const bigIntNumber = 5n;
      const str1 = bigIntNumber.toString(2);
      console.log("str1:" + str1);
      expect(str1).assertContain('101');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0500
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0500';
      console.info(`${caseName} test start`);
      const bigIntNumber = 35n;
      const str1 = bigIntNumber.toString(36);
      console.log("str1:" + str1);
      expect(str1).assertContain('z');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0600
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0600';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(1);
        console.log('No exception was thrown, which is unexpected.');
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0700
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0700';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(37);
        console.log('No exception was thrown, which is unexpected.');
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0800
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0800';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(0);
        console.log('No exception was thrown, which is unexpected.');
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest0900
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest0900';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(2.5);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(conversionResult).assertContain('1010');
      expect(caughtError).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1000
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1000';
      console.info(`${caseName} test start`);
      const bigIntNumber = 0n;
      const str1 = bigIntNumber.toString(10);
      console.log("str1:" + str1);
      expect(str1).assertContain('0');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1100
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1100';
      console.info(`${caseName} test start`);
      const bigIntNumber = 100000000000000000000n;
      const str1 = bigIntNumber.toString(10);
      console.log("str1:" + str1);
      expect(str1).assertContain('100000000000000000000');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1200
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1200';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(-1);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1300
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1300';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(-0);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1400
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1400';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(NaN);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1500
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1500';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(undefined);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(conversionResult).assertContain('10');
      expect(caughtError).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1600
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1600';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(Infinity);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1700
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1700';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(-Infinity);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1800
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1800';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(Math.floor(1.5));
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest1900
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest1900';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(Number.MAX_VALUE);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2000
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2000';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(Number.MIN_VALUE);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2100
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2100';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(Number.EPSILON);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2200
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2200';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(0x3E800000);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2300
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2300';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(123.456);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2400
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2400';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(0x0102);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2500
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2500';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(0x01020304);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(caughtError).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsToStringTest2600
     * @tc.number SUB_BUILTINS_TOSTRING_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsToStringTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsToStringTest2600';
      console.info(`${caseName} test start`);
      let bigIntValue: bigint = 10n;
      let conversionResult: string | undefined;
      let caughtError: boolean = true;
      try {
        conversionResult = bigIntValue.toString(0x3);
        console.log('No exception was thrown, which is unexpected.', conversionResult);
      } catch (error) {
        if (error instanceof Error) {
          caughtError = false;
          console.log('caughtError:' + caughtError);
        }
      }
      expect(conversionResult).assertContain('101');
      expect(caughtError).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });

  })
}
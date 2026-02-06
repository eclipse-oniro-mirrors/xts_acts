/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}
export default function BuiltinsStringPrototypeTest() {
  describe('BuiltinsStringPrototypeTest', () => {
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
     * @tc.name   builtinsStringPrototypeTest0100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0100
     * @tc.desc   test String.prototype.charAt() argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0100'
        console.info(`${caseName}, test start`);
        const myString = 'Every green bus drives fast.';
        const result1 = myString.charAt(0);
        console.log(result1);
        expect(result1).assertEqual('E');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0200
     * @tc.desc   test String.prototype.charAt() argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0200'
        console.info(`${caseName}, test start`);
        const myString = 'Every green bus drives fast.';
        const result2 = myString.charAt(1.5);
        console.log(result2);
        expect(result2).assertEqual('v');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0300
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0300';
        console.info(`${caseName}, test start`);
        const myString = 'Hello, 👋🌍!'
        const result1 = myString.charAt(0);
        const result2 = myString.charAt(-1);
        const result3 = myString.charAt(7)
        console.log(result1);
        console.log(result2);
        console.log(result3);
        expect(result1).assertEqual('H');
        expect(result2).assertEqual('');
        expect(result2).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0400
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0400'
        console.info(`${caseName}, test start`);
        const myString = 'Hello, 👋🌍!'
        const result6 = myString.charAt(100);
        console.log(result6);
        expect(result6).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0500
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0500'
        console.info(`${caseName}, test start`);
        const myString = 'Brave new world!'
        const result = myString.charAt(0);
        console.log(result);
        expect(result).assertEqual('B');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0600
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0600';
        console.info(`${caseName}, test start`);
        const myString = 'Brave new world!'
        const result = myString.charAt(1);
        console.log(result);
        expect(result).assertEqual('r');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0700
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0500';
        console.info(`${caseName}, test start`);
        const myString = 'Brave new world!'
        const result = myString.charAt(1);
        console.log(result);
        expect(result).assertEqual('r');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0800
     * @tc.desc   test String.prototype.charAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0800'
        console.info(`${caseName}, test start`);
        const myString = 'Brave new world!'
        const result = myString.charAt(999);
        console.log(result);
        expect(result).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest0900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0900
     * @tc.desc   test String.prototype.charCodeAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest0900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result = myString.charCodeAt(0);
        console.log(result.toString());
        expect(result).assertEqual(72);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1000
     * @tc.desc   test String.prototype.charCodeAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1000'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result = myString.charCodeAt(4);
        console.log(result.toString());
        expect(result).assertEqual(111);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1100
     * @tc.desc   test String.prototype.charCodeAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result = myString.charCodeAt(5);
        console.log(result.toString());
        expect(result.toString()).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1200
     * @tc.desc   test String.prototype.charCodeAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1200'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result = myString.charCodeAt(-1);
        console.log(result.toString());
        expect(result.toString()).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1300
     * @tc.desc   testString.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1300'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result: number | undefined = myString.codePointAt(0);
        console.log(result?.toString());
        expect(result).assertEqual(72);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1400
     * @tc.desc   testString.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1400'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result: number | undefined = myString.codePointAt(4);
        console.log(result?.toString());
        expect(result).assertEqual(111);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest1500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1500
     * @tc.desc   testString.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1500'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result: number | undefined = myString.codePointAt(5);
        console.log(result?.toString());
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1600
     * @tc.desc   test String.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1600'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result: number | undefined = myString.codePointAt(-1);
        console.log(result?.toString());
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1700
     * @tc.desc   test String.prototype.concat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1700'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result= myString.concat('World');
        console.log(result);
        expect(result).assertEqual('HelloWorld');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1800
     * @tc.desc   test String.prototype.concat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1800'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result= myString.concat('World','ABC');
        console.log(result);
        expect(result).assertEqual('HelloWorldABC');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest1900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_1900
     * @tc.desc   test String.prototype.concat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest1900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result = myString.concat();
        console.log(result);
        expect(result).assertEqual('Hello');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2000
     * @tc.desc   test String.prototype.concat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2000'
        console.info(`${caseName}, test start`);
        const myString = '';
        const result = myString.concat('World');
        console.log(result);
        expect(result).assertEqual('World');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2100
     * @tc.desc   test String.prototype.concat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2100'
        console.info(`${caseName}, test start`);
        const myString = '';
        const result = myString.concat('Hello','World');
        console.log(result);
        expect(result).assertEqual('HelloWorld');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2200
     * @tc.desc   testString.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2200'
        console.info(`${caseName}, test start`);
        const myString = '字符abcd';
        const result: number | undefined = myString.codePointAt(2);
        console.log(result?.toString());
        expect(result).assertEqual(97);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2300
     * @tc.desc   test String.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2300'
        console.info(`${caseName}, test start`);
        const myString = '字符abcd';
        const result: number | undefined = myString.codePointAt(3);
        console.log(result?.toString());
        expect(result).assertEqual(98);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest2400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2400
     * @tc.desc   test String.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2400'
        console.info(`${caseName}, test start`);
        const myString = '字符abcd';
        const result: number | undefined = myString.codePointAt(5);
        console.log(result?.toString());
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2500
     * @tc.desc   test String.prototype.codePointAt() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2500'
        console.info(`${caseName}, test start`);
        const myString = '字符abcd';
        const result: number | undefined = myString.codePointAt(6);
        console.log(result?.toString());
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2600
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2600'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('');
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2700
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2700'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('',24);
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2800
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2800'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('',15);
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest2900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_2900
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest2900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('one');
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3000
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3000'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('one',24);
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3100
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('one',15);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3200
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3200'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('abcd');
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3300
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3300'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('abcd',24);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3400
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3400'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('abcd',15);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest3500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3500
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3500'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('world',15);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3600
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3600'
        console.info(`${caseName}, test start`);
        const myString = 'Hello world everyone';
        const result= myString.endsWith('/o/');
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3700
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3700'
        console.info(`${caseName}, test start`);
        const myString = '';
        const result= myString.endsWith('');
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3800
     * @tc.desc   test String.prototype.endsWith() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3800'
        console.info(`${caseName}, test start`);
        const myString = '';
        const result= myString.endsWith('hello');
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest3900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_3900
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest3900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('');
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4000
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4000'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('hello');
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest4100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4100
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('Hello');
        console.log(result.toString());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4200
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4200'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('notexist');
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4300
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4300'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('Hello',8);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest4400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4400
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4400'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('World',15);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest4500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4500
     * @tc.desc   test String.prototype.includes() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4500'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.includes('World',8);
        console.log(result.toString());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4600
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4600'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4700
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4700'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4800
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4800'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest4900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_4900
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest4900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('hello');
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5000
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5000'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('Hello');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5100
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('notexist');
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5200
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5200'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('Hello',8);
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5300
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5300'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('world',15);
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5400
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5400'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('world',8);
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5500
     * @tc.desc   test String.prototype.indexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5500'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.indexOf('world',-8);
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5600
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5600'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('');
        console.log(result.toString());
        expect(result).assertEqual(11);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest5700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5700
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5700'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('hello');
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5800
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5800'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('Hello');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest5900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_5900
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest5900'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('notexist');
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest6000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6000
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6000'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('Hello',8);
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6100
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('World',15);
        console.log(result.toString());
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest6200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6200
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6200'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('World',8);
        console.log(result.toString());
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6300
     * @tc.desc   test String.prototype.lastIndexOf() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6300'
        console.info(`${caseName}, test start`);
        const myString = 'Hello World';
        const result= myString.lastIndexOf('World',-8);
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6400
     * @tc.desc   test String.prototype.localeCompare() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6400'
        console.info(`${caseName}, test start`);
        const myString = 'b';
        const result= myString.localeCompare('c');
        console.log(result.toString());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6500
     * @tc.desc   test String.prototype.localeCompare() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6500'
        console.info(`${caseName}, test start`);
        const myString = 'b';
        const result= myString.localeCompare('b');
        console.log(result.toString());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6600
     * @tc.desc   test String.prototype.localeCompare() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6600'
        console.info(`${caseName}, test start`);
        const myString = 'b';
        const result= myString.localeCompare('a');
        console.log(result.toString());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6700
     * @tc.desc   test String.prototype.localeCompare() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6700'
        console.info(`${caseName}, test start`);
        const myString = 'check';
        const result= myString.localeCompare('against');
        console.log(result.toString());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })
     
    /**
     * @tc.name   builtinsStringPrototypeTest7700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7700
     * @tc.desc   test String.prototype.localeCompare() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7700'
        console.info(`${caseName}, test start`);
        const myString = 'check';
        const result= myString.localeCompare('against');
        console.log(result.toString());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6800
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6800'
        console.info(`${caseName}, test start`);
        const myString = 'For more information, see Chapter 3.4.5.1';
        const result= myString.match(/see (chapter \d+(\.\d)*)/i);
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('see Chapter 3.4.5.1,Chapter 3.4.5.1,.1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest6900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_6900
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest6900'
        console.info(`${caseName}, test start`);
        const myString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        const result= myString.match(/[A-E]/gi);
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('A,B,C,D,E,a,b,c,d,e');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7000
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7000'
        console.info(`${caseName}, test start`);
        const myString = 'The quick brown fox jumps over the lazy dog. It barked';
        const result= myString.match(/(?<animal>fox|cat) jumps over/);
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('fox jumps over,fox');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7100
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7100'
        console.info(`${caseName}, test start`);
        const myString = 'Hello';
        const result= myString.match('');
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7200
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7200'
        console.info(`${caseName}, test start`);
        const myString = 'NaN 表示不是一个数字。在 JavaScript 中 Infinity 包括了 -Infinity 和 +Infinity。';
        const result= myString.match('数字');
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('数字');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7300
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7300'
        console.info(`${caseName}, test start`);
        const myString = '我的爷爷已经 65 岁了，我的奶奶已经 63 岁';
        const result= myString.match('65');
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('65');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7400
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7400'
        console.info(`${caseName}, test start`);
        const myString = '123';
        const result= myString.match('1.3');
        console.log(result?.toString());
        expect(result?.toString()).assertEqual('123');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest7500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7500
     * @tc.desc   test String.prototype.match() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7600'
        console.info(`${caseName}, test start`);
        const myString = '123';
        const result= myString.match('1\\\\.3');
        console.log(result?.toString());
        expect(result?.toString()).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest7600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7600
     * @tc.desc   test String.prototype.matchAll() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7600'
        console.info(`${caseName}, test start`);
        const myString = 'table football, foosball';
        const result= myString.matchAll(/foo[a-z]*/g);
        console.log(result?.toString());
        const resultArray = Array.from(result);
        const expectedResults = ["football", "foosball"];
        expect(resultArray.map(match => match[0]).toString()).assertEqual(expectedResults.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest7800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7800
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7800'
        console.info(`${caseName}, test start`);
        const myString = '\u00F1';
        const result= myString.normalize('NFD');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ñ');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypeTest7900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_7900
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest7900'
        console.info(`${caseName}, test start`);
        const myString = '\u00F1';
        const result= myString.normalize('NFC');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ñ');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8000
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8000'
        console.info(`${caseName}, test start`);
        const myString = '\u006E\u0303';
        const result= myString.normalize('NFD');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ñ');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8100
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8100'
        console.info(`${caseName}, test start`);
        const myString = '\u006E\u0303';
        const result= myString.normalize('NFC');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ñ');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8200
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8200'
        console.info(`${caseName}, test start`);
        const myString = '\uFB00';
        const result= myString.normalize('NFKD');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8300
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8300'
        console.info(`${caseName}, test start`);
        const myString = '\uFB00';
        const result= myString.normalize('NFKC');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8400
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8400'
        console.info(`${caseName}, test start`);
        const myString = '\u0066\u0066';
        const result= myString.normalize('NFKD');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypeTest8500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_8500
     * @tc.desc   test String.prototype.normalize() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypeTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsStringPrototypeTest8500'
        console.info(`${caseName}, test start`);
        const myString = '\u0066\u0066';
        const result= myString.normalize('NFKC');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
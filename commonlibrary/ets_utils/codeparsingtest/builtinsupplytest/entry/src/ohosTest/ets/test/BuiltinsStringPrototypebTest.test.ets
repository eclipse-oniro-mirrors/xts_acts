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
export default function builtinsStringPrototypebTest() {
  describe('builtinsStringPrototypebTest', () => {
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
     * @tc.name   builtinsStringPrototypebTest8600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_8600
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest8600'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(10);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abc       ');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest8700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_8700
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest8700'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(10,'s');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcsssssss');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest8800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_8800
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest8800'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(10,'s');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcsssssss');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest8900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_8900
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest8900'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(10,'foo');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcfoofoof');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9000
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9000'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(6,'123456');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abc123');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9100
     * @tc.desc   test String.prototype.padEnd() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9100'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padEnd(2);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abc');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypebTest9200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9200
     * @tc.desc   test String.prototype.padStart() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9200'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padStart(10);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('       abc');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypebTest9300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9300
     * @tc.desc   test String.prototype.padStart() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9300'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padStart(10,'s');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('sssssssabc');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9400
     * @tc.desc   test String.prototype.padStart() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9400'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padStart(10,'f00');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('f00f00fabc');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypebTest9500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9500
     * @tc.desc   test String.prototype.padStart() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9500'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padStart(6,'123456');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('123abc');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9600
     * @tc.desc   test String.prototype.padStart() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9600'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.padStart(2);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abc');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9700
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9700'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.repeat(0);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest9800
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9800
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9800'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.repeat(1);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abc');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypebTest9900
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_9900
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest9900'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.repeat(2);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcabc');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest10000
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_10000
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest10000'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.repeat(3);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcabcabc');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0100
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0100
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0100'
        console.info(`${caseName}, test start`);
        const myString = 'abc';
        const result = myString.repeat(3);
        console.log(result?.toString());
        expect(result.toString()).assertEqual('abcabcabc');
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.name   builtinsStringPrototypebTest0200
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0200
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0200'
        console.info(`${caseName}, test start`);
        let flag:boolean = false;
        try {
          const myString = 'abc';
          myString.repeat(-1);
        } catch (error){
          flag = true;
          console.error(`${caseName}, error caught: ${error.message}`);
        }
        expect(flag).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0300
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0300
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0300'
        console.info(`${caseName}, test start`);
        let flag:boolean = false;
        try {
          const myString = 'abc';
          myString.repeat(1/0);
        } catch (error){
          flag = true;
          console.error(`${caseName}, error caught: ${error.message}`);
        }
        expect(flag).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0400
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0400
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0400'
        console.info(`${caseName}, test start`);
        let flag:boolean = false;
        try {
          const myString = 'abc';
          myString.repeat(1/0);
        } catch (error){
          flag = true;
          console.error(`${caseName}, error caught: ${error.message}`);
        }
        expect(flag).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0500
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0500
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0500'
        const myString = 'Twas the night before Xmas...';
        const result = myString.replace(/Xmas/i,'Christmas');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('Twas the night before Christmas...');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0600
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0600
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0600'
        const myString = 'Apples are round, and apples are juicy.';
        const result = myString.replace(/apples/gi,'oranges');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('oranges are round, and oranges are juicy.');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.name   builtinsStringPrototypebTest0700
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPEB_TEST_0700
     * @tc.desc   test String.prototype.repeat() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStringPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'BuiltinsStringPrototypebTest0700'
        const myString = 'Maria Cruz';
        const result = myString.replace(/(\w+)\s(\w+)/,'$2, $1');
        console.log(result?.toString());
        expect(result.toString()).assertEqual('Cruz, Maria');
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
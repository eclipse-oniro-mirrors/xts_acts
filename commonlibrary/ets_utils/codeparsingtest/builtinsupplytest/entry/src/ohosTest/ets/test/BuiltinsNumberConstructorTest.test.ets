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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/Utils';


export default function BuiltinsNumberConstructorTest() {
  describe('BuiltinsNumberConstructorTest', () => {
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
     * @tc.name   builtinsNumberConstructorTest0100
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0100';
      console.log(`${caseName} test start`);
      let numObj = new Number(123);
      console.log(`${numObj}`);
      expect(JSON.stringify(123)).assertEqual(JSON.stringify(numObj));
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest0200
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0200';
      console.log(`${caseName} test start`);
      let numObj = new Number();
      console.log(`${numObj}`);
      expect(JSON.stringify(0)).assertEqual(JSON.stringify(numObj));
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest0300
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0300';
      console.log(`${caseName} test start`);
      let numObj = new Number("123");
      console.log(`${numObj}`);
      expect(JSON.stringify(123)).assertEqual(JSON.stringify(numObj));
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest0400
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0400';
      console.log(`${caseName} test start`);
      let numObj = new Number(123n);
      console.log(`${numObj}`);
      expect(123n).assertEqual(BigInt(JSON.stringify(numObj)));
      console.log(`${caseName} test end`);
      Done()
    })



    /**
     * @tc.name   builtinsNumberConstructorTest0500
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0500';
      console.log(`${caseName} test start`);
      let numObj = new Number(10);
      console.log(`${numObj instanceof Number}`);
      expect(true).assertEqual(numObj instanceof Number);
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest0600
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0600';
      console.log(`${caseName} test start`);
      const object = "object";
      let numObj = new Number(10);
      console.log(`${typeof numObj}`);
      expect(object).assertEqual(typeof numObj);
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest0700
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0700';
      console.log(`${caseName} test start`);
      let strToNumber = Number(10);
      console.log(`${strToNumber}`);
      expect(10).assertEqual(strToNumber);
      console.log(`${caseName} test end`);
      Done()
    })

    /**
     * @tc.name   builtinsNumberConstructorTest0800
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0800';
      console.log(`${caseName} test start`);
      let strToNumber = Number();
      console.log(`${strToNumber}`);
      expect(0).assertEqual(strToNumber);
      console.log(`${caseName} test end`);
      Done()
    })

    /**
     * @tc.name   builtinsNumberConstructorTest0900
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest0900';
      console.log(`${caseName} test start`);
      let strToNumber = Number("123");
      console.log(`${strToNumber}`);
      expect(123).assertEqual(strToNumber);
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest1000
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest1000';
      console.log(`${caseName} test start`);
      let strToNumber = Number(12n);
      console.log(`${strToNumber}`);
      expect(12).assertEqual(strToNumber);
      console.log(`${caseName} test end`);
      Done()
    })

    /**
     * @tc.name   builtinsNumberConstructorTest1100
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest1100';
      console.log(`${caseName} test start`);
      let strToNumber = Number("123");
      let numObj = new Number(strToNumber);
      console.log(`${numObj instanceof Number}`);
      expect(true).assertEqual(numObj instanceof Number);
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.name   builtinsNumberConstructorTest1200
     * @tc.number SUB_BUILTINS_NUMBER_CONSTRUCTOR_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberConstructorTest1200';
      console.log(`${caseName} test start`);
      const number = 'number';
      let strToNumber = Number("0");
      console.log(`${typeof strToNumber}`);
      expect(number).assertEqual(typeof strToNumber);
      console.log(`${caseName} test end`);
      Done()
    })
  })
}
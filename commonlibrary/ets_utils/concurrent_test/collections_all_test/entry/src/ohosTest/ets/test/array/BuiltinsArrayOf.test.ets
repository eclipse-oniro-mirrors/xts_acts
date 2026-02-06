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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { MyArray, TestA } from '../../testability/pages/InterfaceDefined';
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS'

export default function builtinsArrayOfTest() {
  describe('builtinsArrayOfTest', () => {
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
     * @tc.name   builtinsArrayOfTest0100
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0100
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0100';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([]));
        let result = Array.of<number>();
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0200
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0200
     * @tc.desc   Testing a number in isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0200';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([7]));
        let result = Array.of<number>(7);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0300
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0300
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0300';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([1, 2, 3]));
        let result = Array.of<number>(1, 2, 3);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0400
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0400
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0400';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([1, 'hello']));
        let result = Array.of<number | string>(1, 'hello');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0500
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0500
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0500';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['a', 'b', 'c']));
        let result = Array.of<string>('a', 'b', 'c');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0600
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0600
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0600';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([undefined]));
        let result = Array.of<undefined>(undefined);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0700
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0700
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0700';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([null]));
        let result = Array.of<null>(null);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0800
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0800
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0800';
      console.info(`${caseName} test start`);
      try {
        let result = Array.of(() => {});
        expect(result[0]).assertInstanceOf('Function');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest0900
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0900
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest0900';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([9007199254740991n]);
        let result = Array.of<bigint>(BigInt(9007199254740991));
        expect(result.toString()).assertEqual(exp.toString());
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1000
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1000
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1000';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([-1]));
        let result = Array.of<number>(-1);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1100
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1100
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1100';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([3.14]));
        let result = Array.of<number>(3.14);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1200
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1200
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1200';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['7']));
        let result = Array.of<string>('7');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1300
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1300
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1300';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['']));
        let result = Array.of<string>('');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1400
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1400
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1400';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~']));
        let result = Array.of<string>('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1500
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1500
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1500';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['undefined']));
        let result = Array.of<string>('undefined');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1600
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1600
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1600';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['null']));
        let result = Array.of<string>('null');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1700
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1700
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1700';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['']));
        let result = Array.of<string>('');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1800
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1800
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1800';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['\u7b11']));
        let result = Array.of<string>('\u7b11');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest1900
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1900
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest1900';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from(['\uFFFD']));
        let result = Array.of<string>('\uFFFD');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2000
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2000
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2000';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([Math.floor(1.5), 0, -0]));
        let result = Array.of<number>(Math.floor(1.5), 0, -0);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2100
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2100
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2100';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([
          Number.EPSILON,
          Number.MIN_VALUE,
          Number.MAX_VALUE,
          -Infinity,
          Infinity
        ]));
        let result = Array.of<number>(
          Number.EPSILON,
          Number.MIN_VALUE,
          Number.MAX_VALUE,
          -Infinity,
          Infinity
        );
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2200
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2200
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2200';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]));
        let result = Array.of<number>(123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2300
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2300
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2300';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([true, false]));
        let result = Array.of<boolean>(true, false);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2400
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2400
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2400';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([!'s']));
        let result = Array.of<boolean>(!'s');
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2500
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2500
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2500';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([!0]));
        let result = Array.of<boolean>(!0);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2600
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2600
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2600';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([Number.isNaN(NaN)]));
        let result = Array.of<boolean>(Number.isNaN(NaN));
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2700
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2700
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2700';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([1, true]));
        let result = Array.of<number | boolean>(1, true);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayOfTest2800
     * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2800
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayOfTest2800';
      console.info(`${caseName} test start`);
      try {
        let exp = Array.from(collections.Array.from([1, 2, 3]));
        let result = MyArray.of<number>(1, 2, 3);
        expect(result).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}
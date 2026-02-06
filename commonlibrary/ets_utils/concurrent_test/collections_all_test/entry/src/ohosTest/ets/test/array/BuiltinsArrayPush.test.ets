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
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS'

export default function builtinsArrayPushTest() {
  describe('builtinsArrayPushTest', () => {
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
     * @tc.name   builtinsArrayPushTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0100
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayPushTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0100';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([1, 2, 3, 4]);
        let array = collections.Array.from([1, 2, 3]);
        let newValue = array.push(4);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0200
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayPushTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0200';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([1, 2, 3, 4, 5]);
        let array = collections.Array.from([1, 2, 3]);
        let newValue = array.push(4, 5);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0300
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0300';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([1]);
        let array = collections.Array.from<number>([]);
        let newValue = array.push(1);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0400
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0400';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([5, 6]);
        let array = collections.Array.from([5]);
        let newValue = array.push(6);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(2);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0500
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0500';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([, 3]);
        let array = collections.Array.from<undefined|number>([,]);
        let newValue = array.push(3);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(2);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0600
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0600';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([1, null, 3, 4, 5]);
        let array = collections.Array.from([1, null, 3, 4]);
        let newValue = array.push(5);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0700
     * @tc.desc   Testing push
     * @tc.type   FUNCTIO。
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0700';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['apple', 'banana', 'cherry', 'abc']);
        let array = collections.Array.from(['apple', 'banana', 'cherry']);
        let newValue = array.push('abc');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0800
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0800';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['apple', '', 'cherry', 'abc']);
        let array = collections.Array.from(['apple', '', 'cherry']);
        let newValue = array.push('abc');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_0900
     * @tc.desc   Testing push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest0900';
      console.info(`${caseName} test start`);
      try {
        let array = collections.Array.from<undefined|null|number>([]);
        let newValue = array.push(undefined, null, NaN);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(3);
        expect(array[0]).assertUndefined();
        expect(array[1]).assertNull();
        expect(array[2]).assertNaN();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1000
     * @tc.desc   Testing push  特殊字符!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1000';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1100
     * @tc.desc   Testing push  'undefined'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1100';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['undefined']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('undefined');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('undefined');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1200
     * @tc.desc   Testing push  'null'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1200';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['null']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('null');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('null');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1300
     * @tc.desc   Testing push  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1300';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1400
     * @tc.desc   Testing push  Unicode编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1400';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['\u7b11']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('\u7b11');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('\u7b11');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1500
     * @tc.desc   Testing push  非法Unicode编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1500';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from(['\uFFFD']);
        let array = collections.Array.from<string>([]);
        let newValue = array.push('\uFFFD');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual('\uFFFD');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1600
     * @tc.desc   Testing push  Math.floor(1.5),0,-0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1600';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([Math.floor(1.5), 0, -0]);
        let array = collections.Array.from<number>([]);
        let newValue = array.push(Math.floor(1.5), 0, -0);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(3);
        expect(array[0]).assertEqual(Math.floor(1.5));
        expect(array[1]).assertEqual(0);
        expect(array[2]).assertEqual(-0);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1700
     * @tc.desc   Testing push  Number.EPSILON,Number.MIN_VALUE,Number.MAX_VALUE,-Infinity,Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1700';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity]);
        let array = collections.Array.from<number>([]);
        let newValue = array.push(Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array[0]).assertEqual(Number.EPSILON);
        expect(array[1]).assertEqual(Number.MIN_VALUE);
        expect(array[2]).assertEqual(Number.MAX_VALUE);
        expect(array[3]).assertEqual(-Infinity);
        expect(array[4]).assertEqual(Infinity);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1800
     * @tc.desc   Testing push  123.456,0xcafebabe,0x0102，0x01020304,0x3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1800';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]);
        let array = collections.Array.from<number>([]);
        let newValue = array.push(123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array[0]).assertEqual(123.456);
        expect(array[1]).assertEqual(0xcafebabe);
        expect(array[2]).assertEqual(0x0102);
        expect(array[3]).assertEqual(0x01020304);
        expect(array[4]).assertEqual(0x3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_1900
     * @tc.desc   Testing push  true/false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest1900';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([true, false]);
        let array = collections.Array.from<boolean>([]);
        let newValue = array.push(true, false);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(2);
        expect(array[0]).assertTrue();
        expect(array[1]).assertFalse();
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_2000
     * @tc.desc   Testing push  !'s'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest2000';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([!'s']);
        let array = collections.Array.from<boolean>([]);
        let newValue = array.push(!'s');
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertFalse();
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayPushTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PUSH_TEST_2100
     * @tc.desc   Testing push  !0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayPushTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPushTest2100';
      console.info(`${caseName} test start`);
      try {
        let exp = collections.Array.from([!0]);
        let array = collections.Array.from<boolean>([]);
        let newValue = array.push(!0);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertTrue();
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}
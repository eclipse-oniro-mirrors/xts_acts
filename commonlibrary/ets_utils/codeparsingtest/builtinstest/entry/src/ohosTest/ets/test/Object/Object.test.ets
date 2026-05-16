/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

interface GeneratedObjectLiteralInterface {
  a: string;
  b: number;
}

export default function TestObject() {
  describe('TestObject', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name   testObjectConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0100
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testObjectConstructor0001";
      try {
        const obj = new Object();
        console.log("result:" + obj);
        expect(typeof obj).assertDeepEquals('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0200
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testObjectConstructor0002";
      try {
        const obj = new Object(1);
        console.log("result:" + obj);
        expect(typeof obj).assertDeepEquals('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0300
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testObjectConstructor0003";
      try {
        const obj = new Object('Test');
        console.log("result:" + obj);
        expect(typeof obj).assertDeepEquals('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0400
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testObjectConstructor0004";
      try {
        const obj = new Object(undefined);
        console.log("result:" + obj);
        expect(typeof obj).assertDeepEquals('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0500
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testObjectConstructor0005";
      try {
        const obj = new Object(null);
        console.log("result:" + obj);
        expect(typeof obj).assertDeepEquals('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectGetOwnPropertyNames0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0600
     * @tc.desc   Test the function of the interface getOwnPropertyNames.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectGetOwnPropertyNames0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testObjectGetOwnPropertyNames0001";
      try {
        const object1: GeneratedObjectLiteralInterface = {
          a: 'somestring',
          b: 42,
        };
        let value = Object.getOwnPropertyNames(object1);
        console.log('result:' + value);
        expect(JSON.stringify(value)).assertEqual('["a","b"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testObjectGetOwnPropertyNames0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0700
     * @tc.desc   Test the function of the interface getOwnPropertyNames.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectGetOwnPropertyNames0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testObjectGetOwnPropertyNames0002";
      try {
        const object1: GeneratedObjectLiteralInterface = {
          a: 'somestring',
          b: 42,
        };
        let value = Object.getOwnPropertyNames(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Cannot convert a UNDEFINED value to a JSObject');
      }
    })

    /**
     * @tc.name   testObjectGetOwnPropertyNames0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_OBJECT_0800
     * @tc.desc   Test the function of the interface getOwnPropertyNames.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObjectGetOwnPropertyNames0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testObjectGetOwnPropertyNames0003";
      try {
        const object1: GeneratedObjectLiteralInterface = {
          a: 'somestring',
          b: 42,
        };
        let value = Object.getOwnPropertyNames(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Cannot convert a NULL value to a JSObject');
      }
    })
  })
}
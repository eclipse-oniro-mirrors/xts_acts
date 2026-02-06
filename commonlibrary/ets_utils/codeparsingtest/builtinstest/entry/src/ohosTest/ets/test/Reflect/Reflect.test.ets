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

interface GeneratedObjectLiteralInterface_1 {
  x: number;
  y: number;
}

interface GeneratedObjectLiteralInterface_2 {
  x: number;
}

interface GeneratedObjectLiteralInterface_3 {
  property1: number;
  property2: number;
}

interface GeneratedObjectLiteralInterface_4 {
  z: number;
  y: number;
  x: number;
}

interface GeneratedObjectLiteralInterface_5 {
  prop: undefined;
}


export default function ReflectTest() {
  describe('ReflectTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0100
     * @tc.name       : testGet0001
     * @tc.desc       : Test the function of the interface Reflect.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGet0001";
      try {
        let obj: GeneratedObjectLiteralInterface_1 = {
          x: 1, y: 2
        };
        const result = Reflect.get(obj, "x");
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0200
     * @tc.name       : testGet0002
     * @tc.desc       : Test the function of the interface Reflect.get.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGet0002";
      try {
        const result = Reflect.get(["zero", "one"], 1);
        expect(result).assertEqual("one");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0300
     * @tc.name       : testHas0001
     * @tc.desc       : Test the function of the interface Reflect.has.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0001";
      try {
        let x: GeneratedObjectLiteralInterface_2 = {
          x: 0
        }
        const result = Reflect.has(x, "x");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0400
     * @tc.name       : testHas0002
     * @tc.desc       : Test the function of the interface Reflect.has.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0002";
      try {
        let x: GeneratedObjectLiteralInterface_2 = {
          x: 0
        }
        const result = Reflect.has(x, "y");
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0500
     * @tc.name       : testHas0003
     * @tc.desc       : Test the function of the interface Reflect.has.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0003";
      try {
        let x: GeneratedObjectLiteralInterface_2 = {
          x: 0
        }
        const result = Reflect.has(x, "toString");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0600
     * @tc.name       : testOwnKeys0001
     * @tc.desc       : Test the function of the interface Reflect.ownKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOwnKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOwnKeys0001";
      try {
        const object1: GeneratedObjectLiteralInterface_3 = {
          property1: 42,
          property2: 13,
        };
        const array1 = [];
        const result = Reflect.ownKeys(object1);
        console.log(`测试值: ${JSON.stringify(result)}`);
        expect(JSON.stringify(result)).assertEqual('["property1","property2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0700
     * @tc.name       : testOwnKeys0002
     * @tc.desc       : Test the function of the interface Reflect.ownKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOwnKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOwnKeys0002";
      try {
        const object1: GeneratedObjectLiteralInterface_3 = {
          property1: 42,
          property2: 13,
        };
        const array1 = [];
        const result = Reflect.ownKeys(array1);
        console.log(`测试值: ${JSON.stringify(result)}`);
        expect(JSON.stringify(result)).assertEqual('["length"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0800
     * @tc.name       : testOwnKeys0003
     * @tc.desc       : Test the function of the interface Reflect.ownKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOwnKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOwnKeys0003";
      try {
        const obj: GeneratedObjectLiteralInterface_4 = {
          z: 3,
          y: 2,
          x: 1,
        };
        const result = Reflect.ownKeys(obj);
        console.log(`测试值: ${JSON.stringify(result)}`);
        expect(JSON.stringify(result)).assertEqual('["z","y","x"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_0900
     * @tc.name       : testOwnKeys0004
     * @tc.desc       : Test the function of the interface Reflect.ownKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOwnKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOwnKeys0004";
      try {
        const result = Reflect.ownKeys([]);
        console.log(`测试值: ${JSON.stringify(result)}`);
        expect(JSON.stringify(result)).assertEqual('["length"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_1000
     * @tc.name       : testSet0001
     * @tc.desc       : Test the function of the interface Reflect.set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSet0001";
      try {
        let obj: GeneratedObjectLiteralInterface_5 = {
          prop: undefined
        }
        const result = Reflect.set(obj, "prop", "value");
        console.log(`测试值: ${JSON.stringify(result)}`);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_1100
     * @tc.name       : testSet0002
     * @tc.desc       : Test the function of the interface Reflect.set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSet0002";
      try {
        let arr = ["duck", "duck", "duck"];
        const result = Reflect.set(arr, 2, "goose")
        expect(result).assertEqual(true);
        expect(arr[2]).assertEqual("goose");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_1200
     * @tc.name       : testSet0003
     * @tc.desc       : Test the function of the interface Reflect.set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSet0003";
      try {
        let arr = ["duck", "duck", "duck"];
        const result = Reflect.set(arr, "length", 1);
        console.log(`测试值: ${arr}`);
        expect(result).assertEqual(true);
        expect(arr.toString()).assertEqual("duck");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}
/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Constants } from './Int32ArrayData.test'

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Int32ArrayTest() {
  describe('Int32ArrayTest', () => {
    let value: string;
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
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('TypeArray after each called');
      value == '';
      await sleep(10);
      done();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0100
     * @tc.name       : testInt32Constructor0001
     * @tc.desc       : Testing Constructor of Int32Array without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0001";
      try {
        let array = new Int32Array();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0200
     * @tc.name       : testInt32Constructor0002
     * @tc.desc       : Testing Constructor of Int32Array with length 0,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0002";
      try {
        let array = new Int32Array(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0300
     * @tc.name       : testInt32Constructor0003
     * @tc.desc       : Testing Constructor of Int32Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0003";
      try {
        let array = new Int32Array(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0400
     * @tc.name       : testInt32Constructor0004
     * @tc.desc       : Testing Constructor of Int32Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0004";
      try {
        let array = new Int32Array(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0500
     * @tc.name       : testInt32Constructor0005
     * @tc.desc       : Testing Constructor of Int32Array with length 10,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0005";
      try {
        let array = new Int32Array(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0600
     * @tc.name       : testInt32Constructor0006
     * @tc.desc       : Testing Constructor of Int32Array with 'q',and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0006";
      try {
        const array = Constants.int32ConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0700
     * @tc.name       : testInt32Constructor0007
     * @tc.desc       : Testing Constructor of Int32Array with '56',and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0007";
      try {
        const array = Constants.int32ConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0800
     * @tc.name       : testInt32Constructor0008
     * @tc.desc       : Testing Constructor of Int32Array with array[21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0008";
      try {
        let array = new Int32Array([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_0900
     * @tc.name       : testInt32Constructor0009
     * @tc.desc       : Testing Constructor of Int32Array with array[21,31],and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0009";
      try {
        let array = new Int32Array([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1000
     * @tc.name       : testInt32Constructor0010
     * @tc.desc       : Testing Constructor of Int32Array with array[21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0010";
      try {
        let array = new Int32Array([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1100
     * @tc.name       : testInt32Constructor0011
     * @tc.desc       : Testing Constructor of Int32Array with array[21,31],and set value of index 10,get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0011";
      try {
        let array = new Int32Array([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1200
     * @tc.name       : testInt32Constructor0012
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0012";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1300
     * @tc.name       : testInt32Constructor0013
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0013";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1400
     * @tc.name       : testInt32Constructor0014
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array which construct by array [21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0014";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1500
     * @tc.name       : testInt32Constructor0015
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0015";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1600
     * @tc.name       : testInt32Constructor0016
     * @tc.desc       : Testing Constructor of Int32Array with Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0016";
      try {
        let array = new Int32Array(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1700
     * @tc.name       : testInt32Constructor0017
     * @tc.desc       : Testing Constructor of Int32Array with Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0017";
      try {
        let array = new Int32Array(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1800
     * @tc.name       : testInt32Constructor0018
     * @tc.desc       : Testing Constructor of Int32Array with Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0018";
      try {
        let array = new Int32Array(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_1900
     * @tc.name       : testInt32Constructor0019
     * @tc.desc       : Testing Constructor of Int32Array with Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0019";
      try {
        let array = new Int32Array(new Array(21,31));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2000
     * @tc.name       : testInt32Constructor0020
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0020";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2100
     * @tc.name       : testInt32Constructor0021
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0021";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2200
     * @tc.name       : testInt32Constructor0022
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0022";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2300
     * @tc.name       : testInt32Constructor0023
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0023";
      try {
        let array = new Int32Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2400
     * @tc.name       : testInt32Constructor0024
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0024";
      try {
        let array = new Int32Array(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2500
     * @tc.name       : testInt32Constructor0025
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0025";
      try {
        let array = new Int32Array(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2600
     * @tc.name       : testInt32Constructor0026
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0026";
      try {
        let array = new Int32Array(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2700
     * @tc.name       : testInt32Constructor0027
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0027";
      try {
        let array = new Int32Array(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2800
     * @tc.name       : testInt32Constructor0028
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0028";
      try {
        let array = new Int32Array(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_2900
     * @tc.name       : testInt32Constructor0029
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0029";
      try {
        let array = new Int32Array(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3000
     * @tc.name       : testInt32Constructor0030
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0030";
      try {
        let array = new Int32Array(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3100
     * @tc.name       : testInt32Constructor0031
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0031";
      try {
        let array = new Int32Array(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3200
     * @tc.name       : testInt32Constructor0032
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0032";
      try {
        let array = new Int32Array(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3300
     * @tc.name       : testInt32Constructor0033
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0033";
      try {
        let array = new Int32Array(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3400
     * @tc.name       : testInt32Constructor0034
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0034";
      try {
        let array = new Int32Array(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3500
     * @tc.name       : testInt32Constructor0035
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0035";
      try {
        let array = new Int32Array(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3600
     * @tc.name       : testInt32Constructor0036
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0036";
      try {
        let array = new Int32Array(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3700
     * @tc.name       : testInt32Constructor0037
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0037";
      try {
        let array = new Int32Array(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3800
     * @tc.name       : testInt32Constructor0038
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0038";
      try {
        let array = new Int32Array(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_3900
     * @tc.name       : testInt32Constructor0039
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0039";
      try {
        let array = new Int32Array(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4000
     * @tc.name       : testInt32Constructor0040
     * @tc.desc       : Testing Constructor of Int32Array with Int32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0040";
      try {
        let array = new Int32Array(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4100
     * @tc.name       : testInt32Constructor0041
     * @tc.desc       : Testing Constructor of Int32Array with Int32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0041";
      try {
        let array = new Int32Array(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4200
     * @tc.name       : testInt32Constructor0042
     * @tc.desc       : Testing Constructor of Int32Array with Int32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0042";
      try {
        let array = new Int32Array(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4300
     * @tc.name       : testInt32Constructor0043
     * @tc.desc       : Testing Constructor of Int32Array with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0043";
      try {
        let array = new Int32Array(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4400
     * @tc.name       : testInt32Constructor0044
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0044";
      try {
        let array = new Int32Array(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4500
     * @tc.name       : testInt32Constructor0045
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0045";
      try {
        let array = new Int32Array(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4600
     * @tc.name       : testInt32Constructor0046
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0046";
      try {
        let array = new Int32Array(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4700
     * @tc.name       : testInt32Constructor0047
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0047";
      try {
        let array = new Int32Array(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4800
     * @tc.name       : testInt32Constructor0048
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Int32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 2); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_4900
     * @tc.name       : testInt32Constructor0049
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array,and get value is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Int32Array(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5000
     * @tc.name       : testInt32Constructor0050
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Int32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 2); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5100
     * @tc.name       : testInt32Constructor0051
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array, get value error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0051";
      try {
        let array = new Int32Array(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5200
     * @tc.name       : testInt32Constructor0052
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0052";
      try {
        let array = new Int32Array(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5300
     * @tc.name       : testInt32Constructor0053
     * @tc.desc       : Testing Constructor of Int8Array with Float32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0053";
      try {
        let array = new Int32Array(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5400
     * @tc.name       : testInt32Constructor0054
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0054";
      try {
        let array = new Int32Array(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5500
     * @tc.name       : testInt32Constructor0055
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0055";
      try {
        let array = new Int32Array(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5600
     * @tc.name       : testInt32Constructor0056
     * @tc.desc       : Testing Constructor of Int32Array with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5700
     * @tc.name       : testInt32Constructor0057
     * @tc.desc       : Testing Constructor of Int32Array with ArrayBuffer,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5800
     * @tc.name       : testInt32Constructor0058
     * @tc.desc       : Testing Constructor of Int32Array with ArrayBuffer,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_5900
     * @tc.name       : testInt32Constructor0059
     * @tc.desc       : Testing Constructor of Int32Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[3]).assertEqual(undefined);
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_6000
     * @tc.name       : testInt32Constructor0060
     * @tc.desc       : Testing Constructor of Int32Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0060";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_6100
     * @tc.name       : testInt32Constructor0061
     * @tc.desc       : Testing Constructor of Int32Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_6200
     * @tc.name       : testInt32Constructor0062
     * @tc.desc       : Testing Constructor of Int32Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0062";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_6300
     * @tc.name       : testInt32Constructor0063
     * @tc.desc       : Testing Constructor of Int32Array with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0063";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTESPERELEMENT_6400
     * @tc.name       : testBytesPerElement0064
     * @tc.desc       : Testing BYTES_PER_ELEMENT of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBytesPerElement0064";
      try {
        let bytes = Int32Array.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LENGTH_6500
     * @tc.name       : testInt32ArrayLength0065
     * @tc.desc       : Testing length of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayLength0065";
      try {
        let bytes = Int32Array.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_6600
     * @tc.name       : testInt32ArrayFrom0066
     * @tc.desc       : Testing static function from 'foo' of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0066";
      try {
        expect(Constants.int32ConstructTestArray3[0]).assertEqual(0);
        expect(Constants.int32ConstructTestArray3[1]).assertEqual(0);
        expect(Constants.int32ConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_6700
     * @tc.name       : testInt32ArrayFrom0067
     * @tc.desc       : Testing static function from "123" of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0067";
      try {
        expect(Constants.int32ConstructTestArray6[0]).assertEqual(1);
        expect(Constants.int32ConstructTestArray6[1]).assertEqual(2);
        expect(Constants.int32ConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_6800
     * @tc.name       : testInt32ArrayFrom0068
     * @tc.desc       : Testing static function from set() of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0068";
      try {
        expect(Constants.int32ConstructTestArray4[0]).assertEqual(0);
        expect(Constants.int32ConstructTestArray4[1]).assertEqual(0);
        expect(Constants.int32ConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_6900
     * @tc.name       : testInt32ArrayFrom0069
     * @tc.desc       : Testing static function from map() of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0069";
      try {
        expect(Constants.int32ConstructTestArray5[0]).assertEqual(0);
        expect(Constants.int32ConstructTestArray5[1]).assertEqual(0);
        expect(Constants.int32ConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_7000
     * @tc.name       : testInt32ArrayFrom0070
     * @tc.desc       : Testing static function from => func of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0070";
      try {
        let array = Int32Array.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_7100
     * @tc.name       : testInt32ArrayFrom0071
     * @tc.desc       : Testing static function from length => of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0071";
      try {
        expect(Constants.int32FromTestArray[0]).assertEqual(0);
        expect(Constants.int32FromTestArray[1]).assertEqual(1);
        expect(Constants.int32FromTestArray[2]).assertEqual(2);
        expect(Constants.int32FromTestArray[3]).assertEqual(3);
        expect(Constants.int32FromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_7200
     * @tc.name       : testInt32ArrayFrom0072
     * @tc.desc       : Testing static function from range length step + 1 => of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0072";
      try {
        expect(Constants.int32ArrayNumber[0]).assertEqual(0);
        expect(Constants.int32ArrayNumber[1]).assertEqual(1);
        expect(Constants.int32ArrayNumber[2]).assertEqual(2);
        expect(Constants.int32ArrayNumber[3]).assertEqual(3);
        expect(Constants.int32ArrayNumber[4]).assertEqual(4);
        expect(Constants.int32ArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_7300
     * @tc.name       : testInt32ArrayFrom0073
     * @tc.desc       : Testing static function from range length 'A~Z' => of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0073";
      try {
        expect(Constants.int32ArrayCharacter[0]).assertEqual(65);
        expect(Constants.int32ArrayCharacter[1]).assertEqual(66);
        expect(Constants.int32ArrayCharacter[2]).assertEqual(67);
        expect(Constants.int32ArrayCharacter[25]).assertEqual(90);
        expect(Constants.int32ArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7400
     * @tc.name       : testInt32ArrayOf0074
     * @tc.desc       : Testing static function of non of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0074";
      try {
        let array = Int32Array.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7500
     * @tc.name       : testInt32ArrayOf0075
     * @tc.desc       : Testing static function of length 0 of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0075";
      try {
        let array = Int32Array.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7600
     * @tc.name       : testInt32ArrayOf0076
     * @tc.desc       : Testing static function of length 10 of Int32Array, get index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0076";
      try {
        let array = Int32Array.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7700
     * @tc.name       : testInt32ArrayOf0077
     * @tc.desc       : Testing static function of length 10 of Int32Array, get index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0077";
      try {
        let array = Int32Array.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7800
     * @tc.name       : testInt32ArrayOf0078
     * @tc.desc       : Testing static function of length 10 of Int32Array, get index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0078";
      try {
        let array = Int32Array.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_7900
     * @tc.name       : testInt32ArrayOf0079
     * @tc.desc       : Testing static function of [21, 31] of Int32Array, get index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0079";
      try {
        let array = Int32Array.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8000
     * @tc.name       : testInt32ArrayOf0080
     * @tc.desc       : Testing static function of [21, 31] of Int32Array, get index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0080";
      try {
        let array = Int32Array.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8100
     * @tc.name       : testInt32ArrayOf0081
     * @tc.desc       : Testing static function of [21, 31] of Int32Array, get index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0081";
      try {
        let array = Int32Array.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8200
     * @tc.name       : testInt32ArrayOf0082
     * @tc.desc       : Testing static function of [21, 31] of Int32Array, get index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0082";
      try {
        let array = Int32Array.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8300
     * @tc.name       : testInt32ArrayOf0083
     * @tc.desc       : Testing static function of undefined of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0083";
      try {
        expect(Constants.int32OfTestUndefined.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8400
     * @tc.name       : testInt32ArrayOf0084
     * @tc.desc       : Testing static function of "test" of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0084";
      try {
        expect(Constants.int32OfTestStr.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8500
     * @tc.name       : testInt32ArrayOf0085
     * @tc.desc       : Testing static function of "123" of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0085";
      try {
        expect(Constants.int32OfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_8600
     * @tc.name       : testInt32ArrayOf0086
     * @tc.desc       : Testing static function of "1","2","3" of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0086";
      try {
        expect(Constants.int32OfTestNumber2[0]).assertEqual(1);
        expect(Constants.int32OfTestNumber2[1]).assertEqual(2);
        expect(Constants.int32OfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYBYTEOFFSET_8700
     * @tc.name       : testInt32ArrayByteOffset0087
     * @tc.desc       : Testing instance property byteOffset of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayByteOffset0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayByteOffset0087";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int32Array(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Int32Array(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYBYTELENGTH_8800
     * @tc.name       : testInt32ArrayByteLength0088
     * @tc.desc       : Testing instance property byteLength of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayByteLength0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayByteLength0088";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int32Array(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Int32Array(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYBUFFER_8900
     * @tc.name       : testInt32ArrayBuffer0089
     * @tc.desc       : Testing instance property buffer of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayBuffer0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayBuffer0089";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int32Array(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Int32Array(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYLENGTH_9000
     * @tc.name       : testInt32ArrayLength0090
     * @tc.desc       : Testing instance function length of Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayLength0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayLength0090";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int32Array(buffer);
        expect(arrayOffSet0.length).assertEqual(8);
        const arrayOffSet8 = new Int32Array(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9100
     * @tc.name       : testInt32Constructor0091
     * @tc.desc       : Testing Constructor of Int32Array with threshold value([-2147483648]),and get value of index 0 is -2147483648.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0091";
      try {
        let array = new Int32Array([-2147483648]);
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9200
     * @tc.name       : testInt2Constructor0092
     * @tc.desc       : Testing Constructor of Int32Array with out of bounds value([-2147483649]),
     * and get value of index 0 is 2147483647.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0092";
      try {
        let array = new Int32Array([-2147483649]);
        expect(array[0]).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9300
     * @tc.name       : testInt32Constructor0093
     * @tc.desc       : Testing Constructor of Int32Array with threshold value([2147483647]),
     * and get value of index 0 is 2147483647.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0093";
      try {
        let array = new Int32Array([2147483647]);
        expect(array[0]).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9400
     * @tc.name       : testInt32Constructor0094
     * @tc.desc       : Testing Constructor of Int32Array with out of bounds value([2147483648]),
     * and get value of index 0 is -2147483648.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0094";
      try {
        let array = new Int32Array([2147483648]);
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9500
     * @tc.name       : testInt32Constructor0095
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0095";
      try {
        let array = new Int32Array(new Uint8Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9600
     * @tc.name       : testInt32Constructor0096
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0096";
      try {
        let array = new Int32Array(new Uint8Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9700
     * @tc.name       : testInt32Constructor0097
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0097";
      try {
        let array = new Int32Array(new Uint8Array([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9800
     * @tc.name       : testInt32Constructor0098
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array value([254]),
     * and get value of index 0 is 254.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0098";
      try {
        let array = new Int32Array(new Uint8Array([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_9900
     * @tc.name       : testInt32Constructor0099
     * @tc.desc       : Testing Constructor of Int32Array with Uint8Array out of bounds value([256]),
     * and get value of index 0 is xxx.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0099";
      try {
        let array = new Int32Array(new Uint8Array([256]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10000
     * @tc.name       : testInt32Constructor0100
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray threshold value([0]),
     * and get value of index 0 is xxx.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0100";
      try {
        let array = new Int32Array(new Uint8ClampedArray([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10100
     * @tc.name       : testInt32Constructor0101
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray out of bounds value([-1]),
     * and get value of index 0 is xxxxx.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0101";
      try {
        let array = new Int32Array(new Uint8ClampedArray([-1]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10200
     * @tc.name       : testInt32Constructor0102
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0102";
      try {
        let array = new Int32Array(new Uint8ClampedArray([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10300
     * @tc.name       : testInt32Constructor0103
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray out of bounds value([256]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0103";
      try {
        let array = new Int32Array(new Uint8ClampedArray([256]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10400
     * @tc.name       : testInt32Constructor0104
     * @tc.desc       : Testing Constructor of Int32Array with Uint8ClampedArray value([254]),
     * and get value of index 0 is 254.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0104";
      try {
        let array = new Int32Array(new Uint8ClampedArray([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10500
     * @tc.name       : testInt32Constructor0105
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array threshold value([-32768]),
     * and get value of index 0 is -32768.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0105";
      try {
        let array = new Int32Array(new Int16Array([-32768]));
        expect(array[0]).assertEqual(-32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10600
     * @tc.name       : testInt32Constructor0106
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array out of bounds value([-32769]),
     * and get value of index 0 is 32767.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0106";
      try {
        let array = new Int32Array(new Int16Array([-32769]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10700
     * @tc.name       : testInt32Constructor0107
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array threshold value([32767]),
     * and get value of index 0 is 32767.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0107";
      try {
        let array = new Int32Array(new Int16Array([32767]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10800
     * @tc.name       : testInt32Constructor0108
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array out of bounds value([32768]),
     * and get value of index 0 is -32768.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0108";
      try {
        let array = new Int32Array(new Int16Array([32768]));
        expect(array[0]).assertEqual(-32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_10900
     * @tc.name       : testInt32Constructor0109
     * @tc.desc       : Testing Constructor of Int32Array with Int16Array value([32766]),
     * and get value of index 0 is 32766.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0109";
      try {
        let array = new Int32Array(new Int16Array([32766]));
        expect(array[0]).assertEqual(32766);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11000
     * @tc.name       : testInt32Constructor0110
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0110";
      try {
        let array = new Int32Array(new Uint16Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11100
     * @tc.name       : testInt32Constructor0111
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array out of bounds value([-1]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0111";
      try {
        let array = new Int32Array(new Uint16Array([-1]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11200
     * @tc.name       : testInt32Constructor0112
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array threshold value([65535]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0112";
      try {
        let array = new Int32Array(new Uint16Array([65535]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11300
     * @tc.name       : testInt32Constructor0113
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array out of bounds value([65536]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0113";
      try {
        let array = new Int32Array(new Uint16Array([65536]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11400
     * @tc.name       : testInt32Constructor0114
     * @tc.desc       : Testing Constructor of Int32Array with Uint16Array value([65534]),
     * and get value of index 0 is 65534.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0114";
      try {
        let array = new Int32Array(new Uint16Array([65534]));
        expect(array[0]).assertEqual(65534);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11500
     * @tc.name       : testInt32Constructor0115
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array threshold value([-128]),
     * and get value of index 0 is -128.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0115";
      try {
        let array = new Int32Array(new Int8Array([-128]));
        expect(array[0]).assertEqual(-128);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11600
     * @tc.name       : testInt32Constructor0116
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array out of bounds value([-129]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0116";
      try {
        let array = new Int32Array(new Int8Array([-129]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11700
     * @tc.name       : testInt32Constructor0117
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array threshold value([127]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0117";
      try {
        let array = new Int32Array(new Int8Array([127]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11800
     * @tc.name       : testInt32Constructor0118
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array out of bounds value([128]),
     * and get value of index 0 is -128.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0118";
      try {
        let array = new Int32Array(new Int8Array([128]));
        expect(array[0]).assertEqual(-128);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_11900
     * @tc.name       : testInt32Constructor0119
     * @tc.desc       : Testing Constructor of Int32Array with Int8Array value([126]),
     * and get value of index 0 is 126.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0119";
      try {
        let array = new Int32Array(new Int8Array([126]));
        expect(array[0]).assertEqual(126);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12000
     * @tc.name       : testInt32Constructor0120
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0120";
      try {
        let array = new Int32Array(new Uint32Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12100
     * @tc.name       : testInt32Constructor0121
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array out of bounds value([-1]),
     * and get value of index 0 is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0121";
      try {
        let array = new Int32Array(new Uint32Array([-1]));
        expect(array[0]).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12200
     * @tc.name       : testInt32Constructor0122
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array threshold value([4294967295]),
     * and get value of index 0 is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0122";
      try {
        let array = new Int32Array(new Uint32Array([4294967295]));
        expect(array[0]).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12300
     * @tc.name       : testInt32Constructor0123
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array out of bounds value([4294967296]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0123";
      try {
        let array = new Int32Array(new Uint32Array([4294967296]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12400
     * @tc.name       : testInt32Constructor0124
     * @tc.desc       : Testing Constructor of Int32Array with Uint32Array value([4294967294]),
     * and get value of index 0 is -2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0124";
      try {
        let array = new Int32Array(new Uint32Array([4294967294]));
        expect(array[0]).assertEqual(-2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12500
     * @tc.name       : testInt32Constructor0125
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array threshold value([-3.4028235 * 10^38]),
     * and get value of index 0 is -8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0125";
      try {
        let MIN_VALUE = -3.4028235 * 10^38;
        let array = new Int32Array(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(-8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12600
     * @tc.name       : testInt32Constructor0126
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array out of bounds value([-3.4028235 * 10^38 -1]),
     * and get value of index 0 is -5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0126";
      try {
        let MIN_VALUE = -3.4028235 * 10^38 -1;
        let array = new Int32Array(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(-5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12700
     * @tc.name       : testInt32Constructor0127
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array threshold value([3.4028235 × 10^38]),
     * and get value of index 0 is 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0127";
      try {
        let MAX_VALUE = 3.4028235 * 10^38;
        let array = new Int32Array(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12800
     * @tc.name       : testInt32Constructor0128
     * @tc.desc       : Testing Constructor of Int32Array with Float32Array out of bounds value([3.4028235 × 10^38 + 1]),
     * and get value of index 0 is 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0128";
      try {
        let MAX_VALUE = 3.4028235 * 10^38 + 1;
        let array = new Int32Array(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_12900
     * @tc.name       : testInt32Constructor0129
     * @tc.desc       : Testing Constructor of Int32Array with Float64Array threshold value([-1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0129";
      try {
        let MIN_VALUE = -1.8e308;
        let array = new Int32Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13000
     * @tc.name       : testInt32Constructor0130
     * @tc.desc       : Testing Constructor of Int32Array with Float64Array out of bounds value([-1.8e308 -1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0130";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array = new Int32Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13100
     * @tc.name       : testInt32Constructor0131
     * @tc.desc       : Testing Constructor of Int32Array with Float64Array threshold value([1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0131";
      try {
        let MAX_VALUE = 1.8e308;
        let array = new Int32Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13200
     * @tc.name       : testInt32Constructor0132
     * @tc.desc       : Testing Constructor of Int32Array with Float64Array out of bounds value([1.8e308 + 1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0132";
      try {
        let MAX_VALUE = 1.8e308 + 1;
        let array = new Int32Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13300
     * @tc.name       : testInt32Constructor0133
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array threshold value([-(2^63)]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0133";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Int32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(0);
        expect(int32Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13400
     * @tc.name       : testInt32Constructor0134
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array out of bounds value([-(2^63) -1]),
     * and get value of index 0 is 9.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0134";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775809n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Int32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(9);
        expect(int32Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13500
     * @tc.name       : testInt32Constructor0135
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array threshold value([2^63 - 1]),
     * and get value of index 0 is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0135";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775807n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Int32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(9);
        expect(int32Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13600
     * @tc.name       : testInt32Constructor0136
     * @tc.desc       : Testing Constructor of Int32Array with BigInt64Array out of bounds value([2^63]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0136";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Int32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(0);
        expect(int32Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13700
     * @tc.name       : testInt32Constructor0137
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0137";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([0n]);
        // new Int32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 2); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13800
     * @tc.name       : testInt32Constructor0138
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array out of bounds value([-1]),
     * and get value of index 0 is 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0138";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([-1n]);
        // new Int8Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const int32Array  = new Int32Array(byteLength * 3); // because Int8 is 1 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(1);
        expect(int32Array[1]).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_13900
     * @tc.name       : testInt32Constructor0139
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array threshold value([2^64-1n]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0139";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551615n]);
        // new Int8Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(1);
        expect(int32Array[2]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAY_CONSTRUCTOR_14000
     * @tc.name       : testInt32Constructor0140
     * @tc.desc       : Testing Constructor of Int32Array with BigUint64Array out of bounds value([2^64n]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32Constructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32Constructor0140";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551616n]);
        console.info(`${TAG} BigUint64Array is: ${bigUint64Array}`);
        // new Int32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const int32Array  = new Int32Array(byteLength * 3); // because Int32 is 4 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Int32Array
          const bytes = new Int32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.error(`${TAG} bytes, is: ${bytes}`);
          int32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(int32Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14100
     * @tc.name       : testInt32ArrayOf0141
     * @tc.desc       : Testing static function of, of Int32Array value is positive infinity(+infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0141";
      try {
        let infinity = 1 / 0;
        let array = Int32Array.of(infinity);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14200
     * @tc.name       : testInt32ArrayOf0142
     * @tc.desc       : Testing static function of, of Int32Array value is negative infinity(-infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0142";
      try {
        let infinity = -1 / 0;
        let array = Int32Array.of(infinity);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14300
     * @tc.name       : testInt32ArrayOf0143
     * @tc.desc       : Testing static function of, of Int32Array value is (NaN).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0143";
      try {
        let nan = 0 / 0;
        let array = Int32Array.of(nan);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14400
     * @tc.name       : testInt32ArrayOf0144
     * @tc.desc       : Testing static function of, of Int32Array value is bigint(12345678901234567890n).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0144";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let int32Array = Int32Array.of(numberValue);
        console.info(`${TAG} int32Array is: ${int32Array}`);
        expect(int32Array[0]).assertEqual(-350287872);
        expect(int32Array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14500
     * @tc.name       : testInt32ArrayOf0145
     * @tc.desc       : Testing static function of, of Int32Array threshold value is MAX_NUMBER(2147483647).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0145";
      try {
        let array = Int32Array.of(2147483647);
        expect(array[0]).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14600
     * @tc.name       : testInt32ArrayOf0146
     * @tc.desc       : Testing static function of, of Int32Array threshold value is MIN_NUMBER(-2147483648).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0146";
      try {
        let array = Int32Array.of(-2147483648);
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14700
     * @tc.name       : testInt32ArrayOf0147
     * @tc.desc       : Testing static function of, Int32Array value is out of bounds (-2147483649).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0147";
      try {
        let array = Int32Array.of(-2147483649);
        expect(array[0]).assertEqual(2147483647);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14800
     * @tc.name       : testInt32ArrayOf0148
     * @tc.desc       : Testing static function of, Int32Array value is out of bounds (2147483648).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0148";
      try {
        let array = Int32Array.of(2147483648);
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_14900
     * @tc.name       : testInt32ArrayOf0149
     * @tc.desc       : Testing static function of, Int32Array value is normal (2147483646).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0149";
      try {
        let array = Int32Array.of(2147483646);
        expect(array[0]).assertEqual(2147483646);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYOF_15000
     * @tc.name       : testInt32ArrayOf0150
     * @tc.desc       : Testing static function of, Int32Array value is normal (null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayOf0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayOf0150";
      try {
        expect(Constants.int32OfTestNumber3[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15100
     * @tc.name       : testInt32ArrayFrom0151
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (+infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0151";
      try {
        let infinity = 1/0;
        let array = Int32Array.from([infinity]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15200
     * @tc.name       : testInt32ArrayFrom0152
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (-infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0152";
      try {
        let infinity = -1/0;
        let array = Int32Array.from([infinity]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15300
     * @tc.name       : testInt32ArrayFrom0153
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (NaN).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0153";
      try {
        let nan = 0/0;
        let array = Int32Array.from([nan]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15400
     * @tc.name       : testInt32ArrayFrom0154
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal ([1,2,3]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0154";
      try {
        let array = Int32Array.from([1,2,3]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15500
     * @tc.name       : testInt32ArrayFrom0155
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal ([1.1,2.83]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0155";
      try {
        let array = Int32Array.from([1.1,2.83]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15600
     * @tc.name       : testInt32ArrayFrom0156
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal ([12345678901234567890n]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0156";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let array = Int32Array.from([numberValue]);
        expect(array[0]).assertEqual(-350287872);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15700
     * @tc.name       : testInt32ArrayFrom0157
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0157";
      try {
        expect(Constants.int32ConstructTestArray7[0]).assertEqual(1);
        expect(Constants.int32ConstructTestArray7[1]).assertEqual(2);
        expect(Constants.int32ConstructTestArray7[2]).assertEqual(3);
        expect(Constants.int32ConstructTestArray7[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15800
     * @tc.name       : testInt32ArrayFrom0158
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0158";
      try {
        expect(Constants.int32ConstructTestArray8[0]).assertEqual(1);
        expect(Constants.int32ConstructTestArray8[1]).assertEqual(2);
        expect(Constants.int32ConstructTestArray8[2]).assertEqual(3);
        expect(Constants.int32ConstructTestArray8[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_15900
     * @tc.name       : testInt32ArrayFrom0159
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0159";
      try {
        expect(Constants.int32ConstructTestArray9[0]).assertEqual(1);
        expect(Constants.int32ConstructTestArray9[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16000
     * @tc.name       : testInt32ArrayFrom0160
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0160";
      try {
        expect(Constants.int32ArrayNumber1[0]).assertEqual(1);
        expect(Constants.int32ArrayNumber1[1]).assertEqual(2);
        expect(Constants.int32ArrayNumber1[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16100
     * @tc.name       : testInt32ArrayFrom0161
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0161";
      try {
        expect(Constants.int32ConstructTestArray10[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16200
     * @tc.name       : testInt32ArrayFrom0162
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0162";
      try {
        expect(Constants.int32ConstructTestArray11[0]).assertEqual(5);
        expect(Constants.int32ConstructTestArray11[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16300
     * @tc.name       : testInt32ArrayFrom0163
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (Non-array-like objects).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0163";
      try {
        expect(Constants.int32ConstructTestArray12[0]).assertEqual(undefined);
        expect(Constants.int32ConstructTestArray12[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16400
     * @tc.name       : testInt32ArrayFrom0164
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (Non-iterable objects).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0164";
      try {
        expect(Constants.int32ConstructTestArray13[0]).assertEqual(1);
        expect(Constants.int32ConstructTestArray13[1]).assertEqual(2);
        expect(Constants.int32ConstructTestArray13[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16500
     * @tc.name       : testInt32ArrayFrom0165
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0165";
      try {
        expect(Constants.int32ArrayNumber2[0]).assertEqual('a');
        expect(Constants.int32ArrayNumber2[1]).assertEqual('b');
        expect(Constants.int32ArrayNumber2[2]).assertEqual('c');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT32ARRAYFROM_16600
     * @tc.name       : testInt32ArrayFrom0166
     * @tc.desc       : Testing static function from => func of Int32Array, value is normal (sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt32ArrayFrom0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt32ArrayFrom0166";
      try {
        expect(Constants.int32ArrayNumber3[0]).assertEqual(undefined);
        expect(Constants.int32ArrayNumber3[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}
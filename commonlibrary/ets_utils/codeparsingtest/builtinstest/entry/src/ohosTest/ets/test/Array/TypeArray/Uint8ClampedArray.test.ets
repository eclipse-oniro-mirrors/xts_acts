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
import { Constants } from './Uint8ClampedArrayData.test';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Uint8ClampedArrayTest() {
  describe('Uint8ClampedArrayTest', () => {
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
     * @tc.name   testUint8ClampedArrayConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0100
     * @tc.desc   Testing Constructor of Uint8ClampedArray without param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0001";
      try {
        let array = new Uint8ClampedArray();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with length 0,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0002";
      try {
        let array = new Uint8ClampedArray(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with length 10,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0003";
      try {
        let array = new Uint8ClampedArray(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with length 10,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0004";
      try {
        let array = new Uint8ClampedArray(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with length 10,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0005";
      try {
        let array = new Uint8ClampedArray(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with 'q',and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0006";
      try {
        const array = Constants.uint8ClampedConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with '56',and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0007";
      try {
        const array = Constants.uint8ClampedConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0008";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0009";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0010";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with array[21,31],and set value of index 10,get value of index 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0011";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0012";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0013";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUint8ClampedArrayConstructor0014";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0015";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0016";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0017";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0018";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0019";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2000
     * @tc.desc   Testing Constructor of Int8Array with Uint8Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0020";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0021";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0022";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array,Set array[10] element and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0023";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0024";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0025";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0026";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0027";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0028";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0029";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0030";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0031";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0032";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0033";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0034";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0035";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0036";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0037";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0038";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0039";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0040";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0041";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0042";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0043";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0044";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0045";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0046";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0047";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Uint8ClampedArray
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 2); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array,and get value is error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Uint8ClampedArray(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Uint8ClampedArray
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 2); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array, get value error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0051";
      try {
        let array = new Uint8ClampedArray(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0052";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0053";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0054";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0055";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[3]).assertEqual(0);
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_601400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0062";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0063";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
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
     * @tc.name   testUint8ClampedArrayBytesPerElement0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTESPERELEMENT_6400
     * @tc.desc   Testing BYTES_PER_ELEMENT of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayBytesPerElement0064";
      try {
        let bytes = Uint8ClampedArray.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayLength0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAY_BYTESPERELEMENT_6500
     * @tc.desc   Testing length of Uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0065";
      try {
        let bytes = Uint8ClampedArray.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6600
     * @tc.desc   Testing static function from 'foo' of Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0066";
      try {
        expect(Constants.uint8ClampedConstructTestArray3[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6700
     * @tc.desc   Testing static function from "123" of Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0067";
      try {
        expect(Constants.uint8ClampedConstructTestArray6[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray6[1]).assertEqual(2);
        expect(Constants.uint8ClampedConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6800
     * @tc.desc   Testing static function from set() of Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0068";
      try {
        expect(Constants.uint8ClampedConstructTestArray4[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6900
     * @tc.desc   Testing static function from map() of Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0069";
      try {
        expect(Constants.uint8ClampedConstructTestArray5[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_7000
     * @tc.desc   Testing static function from of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0070";
      try {
        let array = Uint8ClampedArray.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7100
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0071";
      try {
        let array = Uint8ClampedArray.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7200
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0072";
      try {
        let array = Uint8ClampedArray.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7300
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0073";
      try {
        let array = Uint8ClampedArray.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7400
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0074";
      try {
        let array = Uint8ClampedArray.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7500
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0075";
      try {
        let array = Uint8ClampedArray.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7600
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0076";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7700
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0077";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7800
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0078";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7900
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0079";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayByteOffset0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTEOFFSET_8000
     * @tc.desc   Testing instance property byteOffset of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayByteOffset0080";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayByteLength0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTELENGTH_8100
     * @tc.desc   Testing instance property byteLength of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayByteLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayByteLength0081";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayBuffer0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BUFFER_8200
     * @tc.desc   Testing instance property buffer of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayBuffer0082";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayLength0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_LENGTH_8300
     * @tc.desc   Testing instance function length of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0083";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.length).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with string param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0084";
      try {
        const array = Constants.uint8ClampedConstructTestArray1;
        expect(array.toString()).assertEqual('');
        const array2 = Constants.uint8ClampedConstructTestArray2;
        expect(array2[1]).assertEqual(0);
        expect(array2.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0085";
      try {
        const array = new Int8Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0086";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0087";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0088";
      try {
        const array = new Int16Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0089";
      try {
        const array = new Uint16Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0090";
      try {
        const array = new Int32Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0091";
      try {
        const array = new Uint32Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0092";
      try {
        const array = new BigInt64Array([21n, 31n]);
        new Uint8ClampedArray(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0093";
      try {
        const array = new BigUint64Array([21n, 31n]);
        new Uint8ClampedArray(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0094";
      try {
        const array = new Float32Array([21, 31]);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayLength0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_length_9500
     * @tc.desc   Testing instance function length of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0095";
      try {
        let uint8ClampedArray = new Uint8ClampedArray(8);
        expect(uint8ClampedArray.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_9600
     * @tc.desc   Testing static function from of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0096";
      try {
        expect(Constants.uint8ClampedConstructTestArray3[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0097";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0098";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0099";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint8ClampedArray = new Uint8ClampedArray(arrayBuffer);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(0);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_10000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0100";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint8ClampedArray = new Uint8ClampedArray(arrayBuffer, 0, 2);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10100
     * @tc.desc   Testing static function from of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0101";
      try {
        expect(Constants.uint8ClampedConstructTestArray4[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10200
     * @tc.desc   Testing static function from of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0102";
      try {
        expect(Constants.uint8ClampedConstructTestArray5[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10300
     * @tc.desc   Testing static function from of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0103";
      try {
        expect(Constants.uint8ClampedFromTestArray[0]).assertEqual(0);
        expect(Constants.uint8ClampedFromTestArray[1]).assertEqual(1);
        expect(Constants.uint8ClampedFromTestArray[2]).assertEqual(2);
        expect(Constants.uint8ClampedFromTestArray[3]).assertEqual(3);
        expect(Constants.uint8ClampedFromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10400
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0104";
      try {
        expect(Constants.uint8ClampedOfTestUndefined.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10500
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0105";
      try {
        expect(Constants.uint8ClampedOfTestStr.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10600
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0106";
      try {
        expect(Constants.uint8ClampedOfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10700
     * @tc.desc   Testing static function of of Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0107";
      try {
        expect(Constants.uint8ClampedOfTestNumber2[0]).assertEqual(1);
        expect(Constants.uint8ClampedOfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10800
     * @tc.desc   Testing static function from range length step + 1 => of Uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0108";
      try {
        expect(Constants.uint8ClampedArrayNumber[0]).assertEqual(0);
        expect(Constants.uint8ClampedArrayNumber[1]).assertEqual(1);
        expect(Constants.uint8ClampedArrayNumber[2]).assertEqual(2);
        expect(Constants.uint8ClampedArrayNumber[3]).assertEqual(3);
        expect(Constants.uint8ClampedArrayNumber[4]).assertEqual(4);
        expect(Constants.uint8ClampedArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10900
     * @tc.desc   Testing static function from range length 'A~Z' => of Uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0109";
      try {
        expect(Constants.uint8ClampedArrayCharacter[0]).assertEqual(65);
        expect(Constants.uint8ClampedArrayCharacter[1]).assertEqual(66);
        expect(Constants.uint8ClampedArrayCharacter[2]).assertEqual(67);
        expect(Constants.uint8ClampedArrayCharacter[25]).assertEqual(90);
        expect(Constants.uint8ClampedArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with threshold value([0]),and get value of index 0 is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0110";
      try {
        let array = new Uint8ClampedArray([0]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0111";
      try {
        let array = new Uint8ClampedArray([-1]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with threshold value([255]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0112";
      try {
        let array = new Uint8ClampedArray([255]);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with out of bounds value([256]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0113";
      try {
        let array = new Uint8ClampedArray([256]);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array threshold value([-128]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0114";
      try {
        let array = new Uint8ClampedArray(new Int8Array([-128]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array out of bounds value([-129]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0115";
      try {
        let array = new Uint8ClampedArray(new Int8Array([-129]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11600
     * @tc.desc   Testing Constructor of Uint8Array with Int8Array threshold value([127]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0116";
      try {
        let array = new Uint8ClampedArray(new Int8Array([127]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array value([126]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0117";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([126]));
        expect(array[0]).assertEqual(126);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int8Array out of bounds value([128]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0118";
      try {
        let array = new Uint8ClampedArray(new Int8Array([128]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0119";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0120";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array threshold value([255]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0121";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array out of bounds value([256]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0122";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([256]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint8Array value([254]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0123";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array threshold value([-32768]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0124";
      try {
        let array = new Uint8ClampedArray(new Int16Array([-32768]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array out of bounds value([-32769]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0125";
      try {
        let array = new Uint8ClampedArray(new Int16Array([-32769]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array threshold value([32767]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0126";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32767]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array out of bounds value([32768]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0127";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32768]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int16Array value([32766]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0128";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32766]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0129";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0130";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array threshold value([65535]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0131";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65535]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array out of bounds value([65536]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0132";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65536]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint16Array value([65534]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0133";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65534]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array threshold value([-2147483648]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0134";
      try {
        let array = new Uint8ClampedArray(new Int32Array([-2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array out of bounds value([-2147483649]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0135";
      try {
        let array = new Uint8ClampedArray(new Int32Array([-2147483649]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array threshold value([2147483647]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0136";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483647]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array out of bounds value([2147483648]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0137";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Int32Array value([2147483646]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0138";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483646]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0139";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0140";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array threshold value([4294967295]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0141";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([4294967295]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array out of bounds value([4294967296]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0142";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([4294967296]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Uint32Array value([4294967294]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0143";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([4294967294]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array threshold value([-3.4028235 * 10^38]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0144";
      try {
        let MIN_VALUE = -3.4028235 * 10^38;
        let array = new Uint8ClampedArray(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array out of bounds value([-3.4028235 * 10^38 -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0145";
      try {
        let MIN_VALUE = -3.4028235 * 10^38 -1;
        let array = new Uint8ClampedArray(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array threshold value([3.4028235 x 10^38]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0146";
      try {
        let MAX_VALUE = 3.4028235 * 10^38;
        let array = new Uint8ClampedArray(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float32Array out of bounds value([3.4028235 x 10^38 + 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0147";
      try {
        let MAX_VALUE = 3.4028235 * 10^38 + 1;
        let array = new Uint8ClampedArray(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float64Array threshold value([-1.8e308]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0148";
      try {
        let MIN_VALUE = -1.8e308;
        let array = new Uint8ClampedArray(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float64Array out of bounds value([-1.8e308 -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0149";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array = new Uint8ClampedArray(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15000
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float64Array threshold value([1.8e308]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0150";
      try {
        let MAX_VALUE = 1.8e308;
        let array = new Uint8ClampedArray(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15100
     * @tc.desc   Testing Constructor of Uint8ClampedArray with Float64Array out of bounds value([1.8e308 + 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0151";
      try {
        let MAX_VALUE = 1.8e308 + 1;
        let array = new Uint8ClampedArray(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15200
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array threshold value([-(2^63)]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0152";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint8ClampedArray
        const byteLength = bigint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8ClampedArray is 1 byte,bigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
        expect(uint8ClampedArray[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15300
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array out of bounds value([-(2^63) -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0153";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775809n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint8ClampedArray
        const byteLength = bigint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(9);
        expect(uint8ClampedArray[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15400
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array threshold value([2^63 - 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0154";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775807n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint8ClampedArray
        const byteLength = bigint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(9);
        expect(uint8ClampedArray[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15500
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigInt64Array out of bounds value([2^63]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0155";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint8ClampedArray
        const byteLength = bigint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
        expect(uint8ClampedArray[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15600
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0156";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([0n]);
        // new Uint8ClampedArray
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 2); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15700
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0157";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([-1n]);
        // new Uint8ClampedArray
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(1);
        expect(uint8ClampedArray[1]).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15800
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array threshold value([2^64-1n]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0158";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551615n]);
        // new Uint8ClampedArray
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(1);
        expect(uint8ClampedArray[2]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayConstructor0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_15900
     * @tc.desc   Testing Constructor of Uint8ClampedArray with BigUint64Array out of bounds value([2^64n]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayConstructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0159";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551616n]);
        console.info(`${TAG} BigUint64Array is: ${bigUint64Array}`);
        // new Uint8ClampedArray
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 3); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.error(`${TAG} bytes, is: ${bytes}`);
          uint8ClampedArray.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16000
     * @tc.desc   Testing static function of, of Uint8ClampedArray value is positive infinity(+infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0160";
      try {
        let infinity = 1 / 0;
        let array = Uint8ClampedArray.of(infinity);
        expect(array[0]).assertEqual(255);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16100
     * @tc.desc   Testing static function of, of Uint8ClampedArray value is negative infinity(-infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0161";
      try {
        let infinity = -1 / 0;
        let array = Uint8ClampedArray.of(infinity);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16200
     * @tc.desc   Testing static function of, of Uint8ClampedArray value is (NaN).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0162";
      try {
        let nan = 0 / 0;
        let array = Uint8ClampedArray.of(nan);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16300
     * @tc.desc   Testing static function of, of Uint8ClampedArray value is bigint(12345678901234567890n).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0163";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let uint8ClampedArray = Uint8ClampedArray.of(numberValue);
        console.info(`${TAG} uint8ClampedArray is: ${uint8ClampedArray}`);
        expect(uint8ClampedArray[0]).assertEqual(255);
        expect(uint8ClampedArray[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16400
     * @tc.desc   Testing static function of, of Uint8ClampedArray threshold value is MAX_NUMBER(255).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0164";
      try {
        let array = Uint8ClampedArray.of(255);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16500
     * @tc.desc   Testing static function of, of Uint8ClampedArray threshold value is MIN_NUMBER(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0165";
      try {
        let array = Uint8ClampedArray.of(0);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16600
     * @tc.desc   Testing static function of, Uint8ClampedArray value is out of bounds (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0166";
      try {
        let array = Uint8ClampedArray.of(-1);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16700
     * @tc.desc   Testing static function of, Uint8ClampedArray value is out of bounds (256).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0167";
      try {
        let array = Uint8ClampedArray.of(256);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16800
     * @tc.desc   Testing static function of, Uint8ClampedArray value is normal (254).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0168";
      try {
        let array = Uint8ClampedArray.of(254);
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayOf0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYOF_16900
     * @tc.desc   Testing static function of, Uint8ClampedArray value is normal (null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayOf0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0169";
      try {
        expect(Constants.uint8ClampedOfTestNumber3[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17000
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (+infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0170";
      try {
        let infinity = 1/0;
        let array = Uint8ClampedArray.from([infinity]);
        expect(array[0]).assertEqual(255);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17100
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (-infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0171";
      try {
        let infinity = -1/0;
        let array = Uint8ClampedArray.from([infinity]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17200
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (NaN).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0172";
      try {
        let nan = 0/0;
        let array = Uint8ClampedArray.from([nan]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17300
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal ([1,2,3]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0173";
      try {
        let array = Uint8ClampedArray.from([1,2,3]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17400
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal ([1.1,2.83]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0174";
      try {
        let array = Uint8ClampedArray.from([1.1,2.83]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(3);
        expect(array[2]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17500
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal ([12345678901234567890n]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0175";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let array = Uint8ClampedArray.from([numberValue]);
        expect(array[0]).assertEqual(255);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17600
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0176";
      try {
        expect(Constants.uint8ClampedConstructTestArray7[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray7[1]).assertEqual(2);
        expect(Constants.uint8ClampedConstructTestArray7[2]).assertEqual(3);
        expect(Constants.uint8ClampedConstructTestArray7[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17700
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0177";
      try {
        expect(Constants.uint8ClampedConstructTestArray8[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray8[1]).assertEqual(2);
        expect(Constants.uint8ClampedConstructTestArray8[2]).assertEqual(3);
        expect(Constants.uint8ClampedConstructTestArray8[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17800
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0178";
      try {
        expect(Constants.uint8ClampedConstructTestArray9[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray9[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_17900
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0179";
      try {
        expect(Constants.uint8ClampedArrayNumber1[0]).assertEqual(1);
        expect(Constants.uint8ClampedArrayNumber1[1]).assertEqual(2);
        expect(Constants.uint8ClampedArrayNumber1[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18000
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0180";
      try {
        expect(Constants.uint8ClampedConstructTestArray10[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18100
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0181";
      try {
        expect(Constants.uint8ClampedConstructTestArray11[0]).assertEqual(5);
        expect(Constants.uint8ClampedConstructTestArray11[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18200
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (Non-array-like objects).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0182";
      try {
        expect(Constants.uint8ClampedConstructTestArray12[0]).assertEqual(undefined);
        expect(Constants.uint8ClampedConstructTestArray12[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18300
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (Non-iterable objects).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0183";
      try {
        expect(Constants.uint8ClampedConstructTestArray13[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray13[1]).assertEqual(2);
        expect(Constants.uint8ClampedConstructTestArray13[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18400
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0184";
      try {
        expect(Constants.uint8ClampedArrayNumber2[0]).assertEqual('a');
        expect(Constants.uint8ClampedArrayNumber2[1]).assertEqual('b');
        expect(Constants.uint8ClampedArrayNumber2[2]).assertEqual('c');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUint8ClampedArrayFrom0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAYFROM_18500
     * @tc.desc   Testing static function from => func of Uint8ClampedArray, value is normal (sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint8ClampedArrayFrom0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0185";
      try {
        expect(Constants.uint8ClampedArrayNumber3[0]).assertEqual(undefined);
        expect(Constants.uint8ClampedArrayNumber3[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}
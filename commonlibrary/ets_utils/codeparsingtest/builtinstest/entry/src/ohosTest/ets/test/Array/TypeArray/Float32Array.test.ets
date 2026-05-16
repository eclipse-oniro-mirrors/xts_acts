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
import { Constants } from './Float32ArrayData.test';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Float32ArrayTest() {
  describe('Float32ArrayTest', () => {
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
     * @tc.name   testFloat32ArrayConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0100
     * @tc.desc   Testing Constructor of Float32Array without param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0001";
      try {
        let array = new Float32Array();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0200
     * @tc.desc   Testing Constructor of Float32Array with length 0,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0002";
      try {
        let array = new Float32Array(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0300
     * @tc.desc   Testing Constructor of Float32Array with length 10,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0003";
      try {
        let array = new Float32Array(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0400
     * @tc.desc   Testing Constructor of Float32Array with length 10,and set index 0 with 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0004";
      try {
        let array = new Float32Array(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0500
     * @tc.desc   Testing Constructor of Float32Array with length 10,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0005";
      try {
        let array = new Float32Array(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0600
     * @tc.desc   Testing Constructor of Float32Array with 'q',and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0006";
      try {
        const array = Constants.float32ConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0700
     * @tc.desc   Testing Constructor of Float32Array with '56',and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0007";
      try {
        const array = Constants.float32ConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0800
     * @tc.desc   Testing Constructor of Float32Array with array[21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0008";
      try {
        let array = new Float32Array([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_0900
     * @tc.desc   Testing Constructor of Float32Array with array[21,31],and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0009";
      try {
        let array = new Float32Array([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1000
     * @tc.desc   Testing Constructor of Float32Array with array[21,31],and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0010";
      try {
        let array = new Float32Array([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1100
     * @tc.desc   Testing Constructor of Float32Array with array[21,31],and set value of index 10,get value of index 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0011";
      try {
        let array = new Float32Array([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1200
     * @tc.desc   Testing Constructor of Float32Array with Float32Array which construct by array [21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0012";
      try {
        let array = new Float32Array(new Float32Array([21, 31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1300
     * @tc.desc   Testing Constructor of Float32Array with Float32Array which construct by array [21,31],and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0013";
      try {
        let array = new Float32Array(new Float32Array([21, 31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1400
     * @tc.desc   Testing Constructor of Float32Array with Float32Array which construct by array [21,31],and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32ArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFloat32ArrayConstructor0014";
      try {
        let array = new Float32Array(new Float32Array([21, 31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1500
     * @tc.desc   Testing Constructor of Float32Array with Float32Array which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0015";
      try {
        let array = new Float32Array(new Float32Array([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1600
     * @tc.desc   Testing Constructor of Float32Array with Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0016";
      try {
        let array = new Float32Array(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1700
     * @tc.desc   Testing Constructor of Float32Array with Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0017";
      try {
        let array = new Float32Array(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1800
     * @tc.desc   Testing Constructor of Float32Array with Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0018";
      try {
        let array = new Float32Array(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_1900
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0019";
      try {
        let array = new Float32Array(new Float32Array([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2000
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0020";
      try {
        let array = new Float32Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2100
     * @tc.desc   Testing Constructor of Float32Array with Int8Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0021";
      try {
        let array = new Float32Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2200
     * @tc.desc   Testing Constructor of Float32Array with Int8Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0022";
      try {
        let array = new Float32Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2300
     * @tc.desc   Testing Constructor of Float32Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0023";
      try {
        let array = new Float32Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2400
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0024";
      try {
        let array = new Float32Array(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2500
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0025";
      try {
        let array = new Float32Array(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2600
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0026";
      try {
        let array = new Float32Array(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2700
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0027";
      try {
        let array = new Float32Array(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2800
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0028";
      try {
        let array = new Float32Array(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_2900
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0029";
      try {
        let array = new Float32Array(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3000
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0030";
      try {
        let array = new Float32Array(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3100
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0031";
      try {
        let array = new Float32Array(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3200
     * @tc.desc   Testing Constructor of Float32Array with Int16Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0032";
      try {
        let array = new Float32Array(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3300
     * @tc.desc   Testing Constructor of Float32Array with Int16Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0033";
      try {
        let array = new Float32Array(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3400
     * @tc.desc   Testing Constructor of Float32Array with Int16Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0034";
      try {
        let array = new Float32Array(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3500
     * @tc.desc   Testing Constructor of Float32Array with Int16Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0035";
      try {
        let array = new Float32Array(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3600
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0036";
      try {
        let array = new Float32Array(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3700
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0037";
      try {
        let array = new Float32Array(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3800
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0038";
      try {
        let array = new Float32Array(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_3900
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0039";
      try {
        let array = new Float32Array(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4000
     * @tc.desc   Testing Constructor of Float32Array with Int32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0040";
      try {
        let array = new Float32Array(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4100
     * @tc.desc   Testing Constructor of Float32Array with Int32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0041";
      try {
        let array = new Float32Array(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4200
     * @tc.desc   Testing Constructor of Float32Array with Int32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0042";
      try {
        let array = new Float32Array(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4300
     * @tc.desc   Testing Constructor of Float32Array with Int32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0043";
      try {
        let array = new Float32Array(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4400
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0044";
      try {
        let array = new Float32Array(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4500
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0045";
      try {
        let array = new Float32Array(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4600
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0046";
      try {
        let array = new Float32Array(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4700
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0047";
      try {
        let array = new Float32Array(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4800
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Float32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 2); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_4900
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array,and get value is error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        let array = new Float32Array(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5000
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Float32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 2); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5100
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array, get value error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0051";
      try {
        let array = new Float32Array(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5200
     * @tc.desc   Testing Constructor of Float32Array with Float32Array,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0052";
      try {
        let array = new Float32Array(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5300
     * @tc.desc   Testing Constructor of Float32Array with Float32Array,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0053";
      try {
        let array = new Float32Array(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5400
     * @tc.desc   Testing Constructor of Float32Array with Float32Array,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0054";
      try {
        let array = new Float32Array(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5500
     * @tc.desc   Testing Constructor of Float32Array with Float32Array,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0055";
      try {
        let array = new Float32Array(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5600
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer,and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5700
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer,and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5800
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer,and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_5900
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer);
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
     * @tc.name   testFloat32ArrayConstructor0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_6000
     * @tc.desc   Testing Constructor of Float32Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_6100
     * @tc.desc   Testing Constructor of Float32Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_6200
     * @tc.desc   Testing Constructor of Float32Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0062";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_6300
     * @tc.desc   Testing Constructor of Float32Array with (ArrayBuffer,0,2),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0063";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float32Array(buffer, 0, 2);
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
     * @tc.name   testFloat32ArrayBytesPerElement0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_BYTESPERELEMENT_6400
     * @tc.desc   Testing BYTES_PER_ELEMENT of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayBytesPerElement0064";
      try {
        let bytes = Float32Array.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayLength0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_BYTESPERELEMENT_6500
     * @tc.desc   Testing length of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayLength0065";
      try {
        let bytes = Float32Array.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_6600
     * @tc.desc   Testing static function from 'foo' of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0066";
      try {
        expect(Constants.float32ConstructTestArray3[0].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray3[1].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray3[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_6700
     * @tc.desc   Testing static function from "123" of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0067";
      try {
        expect(Constants.float32ConstructTestArray6[0]).assertEqual(1);
        expect(Constants.float32ConstructTestArray6[1]).assertEqual(2);
        expect(Constants.float32ConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_6800
     * @tc.desc   Testing static function from set() of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0068";
      try {
        expect(Constants.float32ConstructTestArray4[0].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray4[1].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray4[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_6900
     * @tc.desc   Testing static function from map() of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0069";
      try {
        expect(Constants.float32ConstructTestArray5[0].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray5[1].toString()).assertEqual('NaN');
        expect(Constants.float32ConstructTestArray5[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_7000
     * @tc.desc   Testing static function from of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0070";
      try {
        let array = Float32Array.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7100
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0071";
      try {
        let array = Float32Array.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7200
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0072";
      try {
        let array = Float32Array.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7300
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0073";
      try {
        let array = Float32Array.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7400
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0074";
      try {
        let array = Float32Array.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7500
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0075";
      try {
        let array = Float32Array.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7600
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0076";
      try {
        let array = Float32Array.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7700
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0077";
      try {
        let array = Float32Array.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7800
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0078";
      try {
        let array = Float32Array.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_7900
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0079";
      try {
        let array = Float32Array.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayByteOffset0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_BYTEOFFSET_8000
     * @tc.desc   Testing instance property byteOffset of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayByteOffset0080";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Float32Array(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Float32Array(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayByteLength0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_BYTELENGTH_8100
     * @tc.desc   Testing instance property byteLength of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayByteLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayByteLength0081";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Float32Array(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Float32Array(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayBuffer0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_BUFFER_8200
     * @tc.desc   Testing instance property buffer of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayBuffer0082";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Float32Array(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Float32Array(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayLength0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_LENGTH_8300
     * @tc.desc   Testing instance function length of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayLength0083";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Float32Array(buffer);
        expect(arrayOffSet0.length).assertEqual(8);
        const arrayOffSet8 = new Float32Array(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8400
     * @tc.desc   Testing Constructor of Float32Array with string param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0084";
      try {
        const array = Constants.float32ConstructTestArray1;
        expect(array.toString()).assertEqual('');
        const array2 = Constants.float32ConstructTestArray2;
        expect(array2[1]).assertEqual(0);
        expect(array2.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8500
     * @tc.desc   Testing Constructor of Float32Array with Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0085";
      try {
        const array = new Int8Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8600
     * @tc.desc   Testing Constructor of Float32Array with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0086";
      try {
        const array = new Float32Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8700
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0087";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8800
     * @tc.desc   Testing Constructor of Float32Array with Int16Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0088";
      try {
        const array = new Int16Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_8900
     * @tc.desc   Testing Constructor of Float32Array with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0089";
      try {
        const array = new Float32Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9000
     * @tc.desc   Testing Constructor of Float32Array with Int32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0090";
      try {
        const array = new Int32Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9100
     * @tc.desc   Testing Constructor of Float32Array with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0091";
      try {
        const array = new Float32Array([21, 31])
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9200
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0092";
      try {
        const array = new BigInt64Array([21n, 31n]);
        let array1 = new Float32Array(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9300
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0093";
      try {
        const array = new BigUint64Array([21n, 31n]);
        new Float32Array(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9400
     * @tc.desc   Testing Constructor of Float32Array with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0094";
      try {
        const array = new Float32Array([21, 31]);
        let float32Array = new Float32Array(array);
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayLength0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_length_9500
     * @tc.desc   Testing instance function length of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayLength0095";
      try {
        let float32Array = new Float32Array(8);
        expect(float32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_9600
     * @tc.desc   Testing static function from of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0096";
      try {
        expect(Constants.float32ConstructTestArray3[0]).assertNaN();
        expect(Constants.float32ConstructTestArray3[1]).assertNaN();
        expect(Constants.float32ConstructTestArray3[2]).assertNaN();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9700
     * @tc.desc   Testing Constructor of Float32Array with Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0097";
      try {
        let array: Array<number> = new Array<number>(2);
        let float32Array = new Float32Array(array);
        float32Array[0] = 21;
        float32Array[1] = 31;
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9800
     * @tc.desc   Testing Constructor of Float32Array with Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0098";
      try {
        let array: Array<number> = new Array<number>(2);
        let float32Array = new Float32Array(array);
        float32Array[0] = 21;
        float32Array[1] = 31;
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_9900
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0099";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let float32Array = new Float32Array(arrayBuffer);
        float32Array[0] = 21;
        float32Array[1] = 31;
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(0);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayConstructor0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_10000
     * @tc.desc   Testing Constructor of Float32Array with ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayConstructor0100";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let float32Array = new Float32Array(arrayBuffer, 0, 2);
        float32Array[0] = 21;
        float32Array[1] = 31;
        expect(float32Array[0]).assertEqual(21);
        expect(float32Array[1]).assertEqual(31);
        expect(float32Array[3]).assertEqual(undefined);
        float32Array[10] = 3;
        expect(float32Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_10100
     * @tc.desc   Testing static function from of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0101";
      try {
        expect(Constants.float32ConstructTestArray4[0]).assertNaN();
        expect(Constants.float32ConstructTestArray4[1]).assertNaN();
        expect(Constants.float32ConstructTestArray4[2]).assertNaN();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_10200
     * @tc.desc   Testing static function from of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0102";
      try {
        expect(Constants.float32ConstructTestArray5[0]).assertNaN();
        expect(Constants.float32ConstructTestArray5[1]).assertNaN();
        expect(Constants.float32ConstructTestArray5[2]).assertNaN();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_FROM_10300
     * @tc.desc   Testing static function from of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0103";
      try {
        expect(Constants.float32FromTestArray[0]).assertEqual(0);
        expect(Constants.float32FromTestArray[1]).assertEqual(1);
        expect(Constants.float32FromTestArray[2]).assertEqual(2);
        expect(Constants.float32FromTestArray[3]).assertEqual(3);
        expect(Constants.float32FromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_10400
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0104";
      try {
        expect(Constants.float32OfTestUndefined.toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_10500
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0105";
      try {
        expect(Constants.float32OfTestStr.toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_10600
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0106";
      try {
        expect(Constants.float32OfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_OF_10700
     * @tc.desc   Testing static function of of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0107";
      try {
        expect(Constants.float32OfTestNumber2[0]).assertEqual(1);
        expect(Constants.float32OfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_10800
     * @tc.desc   Testing static function from range length step + 1 => of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0108";
      try {
        expect(Constants.float32ArrayNumber[0]).assertEqual(0);
        expect(Constants.float32ArrayNumber[1]).assertEqual(1);
        expect(Constants.float32ArrayNumber[2]).assertEqual(2);
        expect(Constants.float32ArrayNumber[3]).assertEqual(3);
        expect(Constants.float32ArrayNumber[4]).assertEqual(4);
        expect(Constants.float32ArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_10900
     * @tc.desc   Testing static function from range length 'A~Z' => of Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0109";
      try {
        expect(Constants.float32ArrayCharacter[0]).assertEqual(65);
        expect(Constants.float32ArrayCharacter[1]).assertEqual(66);
        expect(Constants.float32ArrayCharacter[2]).assertEqual(67);
        expect(Constants.float32ArrayCharacter[25]).assertEqual(90);
        expect(Constants.float32ArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11000
     * @tc.desc   Testing Constructor of Float32Array with threshold value([-3.4e38]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0110";
      try {
        let MIN_VALUE = -3.4e38;
        let array = new Float32Array([MIN_VALUE]);
        expect(array[0]).assertEqual(-3.3999999521443642e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11100
     * @tc.desc   Testing Constructor of Float32Array with out of bounds value([-3.4028235 * 10^38 -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0111";
      try {
        let MIN_VALUE = -3.4e38 -1;
        let array = new Float32Array([MIN_VALUE]);
        expect(array[0]).assertEqual(-3.3999999521443642e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11200
     * @tc.desc   Testing Constructor of Float32Array with threshold value([3.4028235 * 10^38;]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0112";
      try {
        let MAX_VALUE = 3.4028235e38;
        let array = new Float32Array([MAX_VALUE]);
        expect(array[0]).assertEqual(3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11300
     * @tc.desc   Testing Constructor of Float32Array with out of bounds value([3.4028235 * 10^38 + 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0113";
      try {
        let MAX_VALUE = 3.4028235e38 + 1;
        let array = new Float32Array([MAX_VALUE]);
        expect(array[0]).assertEqual(3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11400
     * @tc.desc   Testing Constructor of Float32Array with Int8Array threshold value([-128]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0114";
      try {
        let array = new Float32Array(new Int8Array([-128]));
        expect(array[0]).assertEqual(-128);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11500
     * @tc.desc   Testing Constructor of Float32Array with Int8Array out of bounds value([-129]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0115";
      try {
        let array = new Float32Array(new Int8Array([-129]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11600
     * @tc.desc   Testing Constructor of Float32Array with Int8Array threshold value([127]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0116";
      try {
        let array = new Float32Array(new Int8Array([127]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11700
     * @tc.desc   Testing Constructor of Float32Array with Int8Array value([126]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0117";
      try {
        let array = new Float32Array(new Int8Array([126]));
        expect(array[0]).assertEqual(126);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11800
     * @tc.desc   Testing Constructor of Float32Array with Int8Array out of bounds value([128]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0118";
      try {
        let array = new Float32Array(new Int8Array([128]));
        expect(array[0]).assertEqual(-128);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_11900
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0119";
      try {
        let array = new Float32Array(new Uint8ClampedArray([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12000
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0120";
      try {
        let array = new Float32Array(new Uint8ClampedArray([-1]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12100
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray threshold value([255]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0121";
      try {
        let array = new Float32Array(new Uint8ClampedArray([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12200
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray out of bounds value([256]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0122";
      try {
        let array = new Float32Array(new Uint8ClampedArray([256]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12300
     * @tc.desc   Testing Constructor of Float32Array with Uint8ClampedArray value([254]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0123";
      try {
        let array = new Float32Array(new Uint8ClampedArray([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12400
     * @tc.desc   Testing Constructor of Float32Array with Int16Array threshold value([-32768]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0124";
      try {
        let array = new Float32Array(new Int16Array([-32768]));
        expect(array[0]).assertEqual(-32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12500
     * @tc.desc   Testing Constructor of Float32Array with Int16Array out of bounds value([-32769]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0125";
      try {
        let array = new Float32Array(new Int16Array([-32769]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12600
     * @tc.desc   Testing Constructor of Float32Array with Int16Array threshold value([32767]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0126";
      try {
        let array = new Float32Array(new Int16Array([32767]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12700
     * @tc.desc   Testing Constructor of Float32Array with Int16Array out of bounds value([32768]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0127";
      try {
        let array = new Float32Array(new Int16Array([32768]));
        expect(array[0]).assertEqual(-32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12800
     * @tc.desc   Testing Constructor of Float32Array with Int16Array value([32766]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0128";
      try {
        let array = new Float32Array(new Int16Array([32766]));
        expect(array[0]).assertEqual(32766);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_12900
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0129";
      try {
        let array = new Float32Array(new Uint16Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13000
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0130";
      try {
        let array = new Float32Array(new Uint16Array([-1]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13100
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array threshold value([65535]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0131";
      try {
        let array = new Float32Array(new Uint16Array([65535]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13200
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array out of bounds value([65536]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0132";
      try {
        let array = new Float32Array(new Uint16Array([65536]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13300
     * @tc.desc   Testing Constructor of Float32Array with Uint16Array value([65534]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0133";
      try {
        let array = new Float32Array(new Uint16Array([65534]));
        expect(array[0]).assertEqual(65534);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13400
     * @tc.desc   Testing Constructor of Float32Array with Int32Array threshold value([-2147483648]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0134";
      try {
        let array = new Float32Array(new Int32Array([-2147483648]));
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13500
     * @tc.desc   Testing Constructor of Float32Array with Int32Array out of bounds value([-2147483649]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0135";
      try {
        let array = new Float32Array(new Int32Array([-2147483649]));
        expect(array[0]).assertEqual(2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13600
     * @tc.desc   Testing Constructor of Float32Array with Int32Array threshold value([2147483647]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0136";
      try {
        let array = new Float32Array(new Int32Array([2147483647]));
        expect(array[0]).assertEqual(2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13700
     * @tc.desc   Testing Constructor of Float32Array with Int32Array out of bounds value([2147483648]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0137";
      try {
        let array = new Float32Array(new Int32Array([2147483648]));
        expect(array[0]).assertEqual(-2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13800
     * @tc.desc   Testing Constructor of Float32Array with Int32Array value([2147483646]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0138";
      try {
        let array = new Float32Array(new Int32Array([2147483646]));
        expect(array[0]).assertEqual(2147483648);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_13900
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0139";
      try {
        let array = new Float32Array(new Uint32Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14000
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0140";
      try {
        let array = new Float32Array(new Uint32Array([-1]));
        expect(array[0]).assertEqual(4294967296);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14100
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array threshold value([4294967295]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0141";
      try {
        let array = new Float32Array(new Uint32Array([4294967295]));
        expect(array[0]).assertEqual(4294967296);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14200
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array out of bounds value([4294967296]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0142";
      try {
        let array = new Float32Array(new Uint32Array([4294967296]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14300
     * @tc.desc   Testing Constructor of Float32Array with Uint32Array value([4294967294]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0143";
      try {
        let array = new Float32Array(new Uint32Array([4294967294]));
        expect(array[0]).assertEqual(4294967296);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14400
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0144";
      try {
        let array = new Float32Array(new Uint8Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14500
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0145";
      try {
        let array = new Float32Array(new Uint8Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14600
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array threshold value([255]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0146";
      try {
        let array = new Float32Array(new Uint8Array([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14700
     * @tc.desc   Testing Constructor of Float32Array with Uint8Array out of bounds value([3.4028235 x 10^38 + 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0147";
      try {
        let array = new Float32Array(new Uint8Array([256]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14800
     * @tc.desc   Testing Constructor of Float32Array with Float64Array threshold value([-1.8e308]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0148";
      try {
        let MIN_VALUE = -1.8e308;
        let array = new Float32Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_14900
     * @tc.desc   Testing Constructor of Float32Array with Float64Array out of bounds value([-1.8e308 -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0149";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array = new Float32Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15000
     * @tc.desc   Testing Constructor of Float32Array with Float64Array threshold value([1.8e308]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0150";
      try {
        let MAX_VALUE = 1.8e308;
        let array = new Float32Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15100
     * @tc.desc   Testing Constructor of Float32Array with Float64Array out of bounds value([1.8e308 + 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0151";
      try {
        let MAX_VALUE = 1.8e308 + 1;
        let array = new Float32Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15200
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array threshold value([-(2^63)]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0152";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Float32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 3); // because Uint8 is 1 byte,bigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0].toString()).assertEqual('NaN');
        expect(float32Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15300
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array out of bounds value([-(2^63) -1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0153";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775809n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Float32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(9);
        expect(float32Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15400
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array threshold value([2^63 - 1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0154";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775807n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Float32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(9);
        expect(float32Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15500
     * @tc.desc   Testing Constructor of Float32Array with BigInt64Array out of bounds value([2^63]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0155";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Float32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const float32Array  = new Uint8Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(0);
        expect(float32Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15600
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array threshold value([0]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0156";
      try {
        // creat bigUInt64Array
        const bigUint64Array = new BigUint64Array([0n]);
        // new Float32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 2); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15700
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array out of bounds value([-1]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0157";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([-1n]);
        // new Float32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const float32Array  = new Float32Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(1);
        expect(float32Array[1]).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15800
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array threshold value([2^64-1n]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0158";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551615n]);
        // new Float32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const float32Array  = new Float32Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint8Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(1);
        expect(float32Array[2]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32Constructor0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_CONSTRUCTOR_15900
     * @tc.desc   Testing Constructor of Float32Array with BigUint64Array out of bounds value([2^64n]),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32Constructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32Constructor0159";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551616n]);
        console.info(`${TAG} BigUint64Array is: ${bigUint64Array}`);
        // new Float32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const float32Array  = new Float32Array(byteLength * 3); // because Float32Array is 4 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Float32Array
          const bytes = new Float32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.error(`${TAG} bytes, is: ${bytes}`);
          float32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(float32Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16000
     * @tc.desc   Testing static function of, of Float32Array value is positive infinity(+infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0160";
      try {
        let infinity = 1 / 0;
        let array = Float32Array.of(infinity);
        expect(array[0]).assertEqual(Infinity);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16100
     * @tc.desc   Testing static function of, of Float32Array value is negative infinity(-infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0161";
      try {
        let infinity = -1 / 0;
        let array = Float32Array.of(infinity);
        expect(array[0]).assertEqual(-Infinity);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16200
     * @tc.desc   Testing static function of, of Float32Array value is (NaN).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0162";
      try {
        let nan = 0 / 0;
        let array = Float32Array.of(nan);
        expect(array[0].toString()).assertEqual('NaN');
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16300
     * @tc.desc   Testing static function of, of Float32Array value is bigint(12345678901234567890n).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0163";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let float32Array = Float32Array.of(numberValue);
        console.info(`${TAG} float32Array is: ${float32Array}`);
        expect(float32Array[0]).assertEqual(12345679395506094000);
        expect(float32Array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16400
     * @tc.desc   Testing static function of, of Float32Array threshold value is MAX_NUMBER(3.4028235 * 10^38;).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0164";
      try {
        let MAX_VALUE = 3.4028235e38;
        let array = Float32Array.of(MAX_VALUE);
        expect(array[0]).assertEqual(3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16500
     * @tc.desc   Testing static function of, of Float32Array threshold value is MIN_NUMBER(-3.4028235 * 10^38;).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0165";
      try {
        let MIN_VALUE = -3.4028235e38;
        let array = Float32Array.of(MIN_VALUE);
        expect(array[0]).assertEqual(-3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16600
     * @tc.desc   Testing static function of, Float32Array value is out of bounds (-3.4028235 * 10^38 -1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0166";
      try {
        let MIN_VALUE = -3.4028235e38 -1;
        let array = Float32Array.of(MIN_VALUE);
        expect(array[0]).assertEqual(-3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16700
     * @tc.desc   Testing static function of, Float32Array value is out of bounds (3.4028235 * 10^38;).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0167";
      try {
        let MAX_VALUE = 3.4028235e38;
        let array = Float32Array.of(MAX_VALUE);
        expect(array[0]).assertEqual(3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16800
     * @tc.desc   Testing static function of, Float32Array value is normal (3.4028235 * 10^38 - 1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0168";
      try {
        let MAX_VALUE = 3.4028235e38 - 1;
        let array = Float32Array.of(MAX_VALUE);
        expect(array[0]).assertEqual(3.4028234663852886e38);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayOf0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYOF_16900
     * @tc.desc   Testing static function of, Float32Array value is normal (null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayOf0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayOf0169";
      try {
        expect(Constants.float32OfTestNumber3[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17000
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (+infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0170";
      try {
        let infinity = 1/0;
        let array = Float32Array.from([infinity]);
        expect(array[0]).assertEqual(Infinity);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17100
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (-infinity).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0171";
      try {
        let infinity = -1/0;
        let array = Float32Array.from([infinity]);
        expect(array[0]).assertEqual(-Infinity);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17200
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (NaN).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0172";
      try {
        let nan = 0/0;
        let array = Float32Array.from([nan]);
        expect(array[0].toString()).assertEqual('NaN');
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17300
     * @tc.desc   Testing static function from => func of Float32Array, value is normal ([1,2,3]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0173";
      try {
        let array = Float32Array.from([1,2,3]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17400
     * @tc.desc   Testing static function from => func of Float32Array, value is normal ([1.1,2.83]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0174";
      try {
        let array = Float32Array.from([1.1,2.83]);
        expect(array[0]).assertEqual(1.100000023841858);
        expect(array[1]).assertEqual(2.8299999237060547);
        expect(array[2]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17500
     * @tc.desc   Testing static function from => func of Float32Array, value is normal ([12345678901234567890n]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0175";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let array = Float32Array.from([numberValue]);
        expect(array[0]).assertEqual(12345679395506094000);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17600
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0176";
      try {
        expect(Constants.float32ConstructTestArray7[0]).assertEqual(1);
        expect(Constants.float32ConstructTestArray7[1]).assertEqual(2);
        expect(Constants.float32ConstructTestArray7[2]).assertEqual(3);
        expect(Constants.float32ConstructTestArray7[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17700
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0177";
      try {
        expect(Constants.float32ConstructTestArray8[0]).assertEqual(1.100000023841858);
        expect(Constants.float32ConstructTestArray8[1]).assertEqual(2.200000047683716);
        expect(Constants.float32ConstructTestArray8[2]).assertEqual(3.3329999446868896);
        expect(Constants.float32ConstructTestArray8[3]).assertEqual(4.444439888000488);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17800
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0178";
      try {
        expect(Constants.float32ConstructTestArray9[0]).assertEqual(1.100000023841858);
        expect(Constants.float32ConstructTestArray9[1]).assertEqual(2.200000047683716);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_17900
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0179";
      try {
        expect(Constants.float32ArrayNumber1[0]).assertEqual(1.100000023841858);
        expect(Constants.float32ArrayNumber1[1]).assertEqual(2.0999999046325684);
        expect(Constants.float32ArrayNumber1[2]).assertEqual(3.0999999046325684);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18000
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0180";
      try {
        expect(Constants.float32ConstructTestArray10[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18100
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (Sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0181";
      try {
        expect(Constants.float32ConstructTestArray11[0]).assertEqual(5);
        expect(Constants.float32ConstructTestArray11[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18200
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (Non-array-like objects).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0182";
      try {
        expect(Constants.float32ConstructTestArray12[0]).assertEqual(undefined);
        expect(Constants.float32ConstructTestArray12[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18300
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (Non-iterable objects).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0183";
      try {
        expect(Constants.float32ConstructTestArray13[0]).assertEqual(1);
        expect(Constants.float32ConstructTestArray13[1]).assertEqual(2);
        expect(Constants.float32ConstructTestArray13[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18400
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0184";
      try {
        expect(Constants.float32ArrayNumber2[0]).assertEqual('a');
        expect(Constants.float32ArrayNumber2[1]).assertEqual('b');
        expect(Constants.float32ArrayNumber2[2]).assertEqual('c');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFloat32ArrayFrom0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAYFROM_18500
     * @tc.desc   Testing static function from => func of Float32Array, value is normal (sequence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloat32ArrayFrom0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat32ArrayFrom0185";
      try {
        expect(Constants.float32ArrayNumber3[0]).assertEqual(undefined);
        expect(Constants.float32ArrayNumber3[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}
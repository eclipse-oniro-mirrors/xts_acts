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
import { Constants } from './Uint16ArrayData.test';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Uint16ArrayTest() {
  describe('Uint16ArrayTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0100
     * @tc.name       : testUint16ArrayConstructor0001
     * @tc.desc       : Testing Constructor of Uint16Array without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0001";
      try {
        let array = new Uint16Array();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0200
     * @tc.name       : testUint16ArrayConstructor0002
     * @tc.desc       : Testing Constructor of Uint16Array with length 0,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0002";
      try {
        let array = new Uint16Array(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0300
     * @tc.name       : testUint16ArrayConstructor0003
     * @tc.desc       : Testing Constructor of Uint16Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0003";
      try {
        let array = new Uint16Array(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0400
     * @tc.name       : testUint16ArrayConstructor0004
     * @tc.desc       : Testing Constructor of Uint16Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0004";
      try {
        let array = new Uint16Array(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0500
     * @tc.name       : testUint16ArrayConstructor0005
     * @tc.desc       : Testing Constructor of Uint16Array with length 10,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0005";
      try {
        let array = new Uint16Array(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0600
     * @tc.name       : testUint16ArrayConstructor0006
     * @tc.desc       : Testing Constructor of Uint16Array with 'q',and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0006";
      try {
        const array = Constants.uint16ConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0700
     * @tc.name       : testUint16ArrayConstructor0007
     * @tc.desc       : Testing Constructor of Uint16Array with '56',and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0007";
      try {
        const array = Constants.uint16ConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0800
     * @tc.name       : testUint16ArrayConstructor0008
     * @tc.desc       : Testing Constructor of Uint16Array with array[21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0008";
      try {
        let array = new Uint16Array([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_0900
     * @tc.name       : testUint16ArrayConstructor0009
     * @tc.desc       : Testing Constructor of Uint16Array with array[21,31],and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0009";
      try {
        let array = new Uint16Array([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1000
     * @tc.name       : testUint16ArrayConstructor0010
     * @tc.desc       : Testing Constructor of Uint16Array with array[21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0010";
      try {
        let array = new Uint16Array([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1100
     * @tc.name       : testUint16ArrayConstructor0011
     * @tc.desc       : Testing Constructor of Uint16Array with array[21,31],and set value of index 10,get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0011";
      try {
        let array = new Uint16Array([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1200
     * @tc.name       : testUint16ArrayConstructor0012
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0012";
      try {
        let array = new Uint16Array(new Uint16Array([21, 31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1300
     * @tc.name       : testUint16ArrayConstructor0013
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0013";
      try {
        let array = new Uint16Array(new Uint16Array([21, 31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1400
     * @tc.name       : testUint16ArrayConstructor0014
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array which construct by array [21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0014";
      try {
        let array = new Uint16Array(new Uint16Array([21, 31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1500
     * @tc.name       : testUint16ArrayConstructor0015
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0015";
      try {
        let array = new Uint16Array(new Uint16Array([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1600
     * @tc.name       : testUint16ArrayConstructor0016
     * @tc.desc       : Testing Constructor of Uint16Array with Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0016";
      try {
        let array = new Uint16Array(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1700
     * @tc.name       : testUint16ArrayConstructor0017
     * @tc.desc       : Testing Constructor of Uint16Array with Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0017";
      try {
        let array = new Uint16Array(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1800
     * @tc.name       : testUint16ArrayConstructor0018
     * @tc.desc       : Testing Constructor of Uint16Array with Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0018";
      try {
        let array = new Uint16Array(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_1900
     * @tc.name       : testUint16ArrayConstructor0019
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0019";
      try {
        let array = new Uint16Array(new Uint16Array([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2000
     * @tc.name       : testUint16ArrayConstructor0020
     * @tc.desc       : Testing Constructor of Int16Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0020";
      try {
        let array = new Uint16Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2100
     * @tc.name       : testUint16ArrayConstructor0021
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0021";
      try {
        let array = new Uint16Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2200
     * @tc.name       : testUint16ArrayConstructor0022
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0022";
      try {
        let array = new Uint16Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2300
     * @tc.name       : testUint16ArrayConstructor0023
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0023";
      try {
        let array = new Uint16Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2400
     * @tc.name       : testUint16ArrayConstructor0024
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0024";
      try {
        let array = new Int16Array(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2500
     * @tc.name       : testUint16ArrayConstructor0025
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0025";
      try {
        let array = new Uint16Array(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2600
     * @tc.name       : testUint16ArrayConstructor0026
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0026";
      try {
        let array = new Uint16Array(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2700
     * @tc.name       : testUint16ArrayConstructor0027
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0027";
      try {
        let array = new Uint16Array(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2800
     * @tc.name       : testUint16ArrayConstructor0028
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0028";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_2900
     * @tc.name       : testUint16ArrayConstructor0029
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0029";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3000
     * @tc.name       : testUint16ArrayConstructor0030
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0030";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3100
     * @tc.name       : testUint16ArrayConstructor0031
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0031";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3200
     * @tc.name       : testUint16ArrayConstructor0032
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0032";
      try {
        let array = new Uint16Array(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3300
     * @tc.name       : testUint16ArrayConstructor0033
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0033";
      try {
        let array = new Uint16Array(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3400
     * @tc.name       : testUint16ArrayConstructor0034
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0034";
      try {
        let array = new Uint16Array(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3500
     * @tc.name       : testUint16ArrayConstructor0035
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0035";
      try {
        let array = new Uint16Array(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3600
     * @tc.name       : testUint16ArrayConstructor0036
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0036";
      try {
        let array = new Uint16Array(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3700
     * @tc.name       : testUint16ArrayConstructor0037
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0037";
      try {
        let array = new Uint16Array(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3800
     * @tc.name       : testUint16ArrayConstructor0038
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0038";
      try {
        let array = new Uint16Array(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_3900
     * @tc.name       : testUint16ArrayConstructor0039
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0039";
      try {
        let array = new Uint16Array(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4000
     * @tc.name       : testUint16ArrayConstructor0040
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0040";
      try {
        let array = new Uint16Array(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4100
     * @tc.name       : testUint16ArrayConstructor0041
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0041";
      try {
        let array = new Uint16Array(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4200
     * @tc.name       : testUint16ArrayConstructor0042
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0042";
      try {
        let array = new Uint16Array(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4300
     * @tc.name       : testUint16ArrayConstructor0043
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0043";
      try {
        let array = new Uint16Array(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4400
     * @tc.name       : testUint16ArrayConstructor0044
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0044";
      try {
        let array = new Uint16Array(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4500
     * @tc.name       : testUint16ArrayConstructor0045
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0045";
      try {
        let array = new Uint16Array(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4600
     * @tc.name       : testUint16ArrayConstructor0046
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0046";
      try {
        let array = new Uint16Array(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4700
     * @tc.name       : testUint16ArrayConstructor0047
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0047";
      try {
        let array = new Uint16Array(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4800
     * @tc.name       : testUint16ArrayConstructor0048
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Uint16Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 2); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_4900
     * @tc.name       : testUint16ArrayConstructor0049
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array,and get value is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Uint16Array(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5000
     * @tc.name       : testUint16ArrayConstructor0050
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Uint16Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 2); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5100
     * @tc.name       : testUint16ArrayConstructor0051
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array, get value error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0051";
      try {
        let array = new Uint16Array(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5200
     * @tc.name       : testUint16ArrayConstructor0052
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0052";
      try {
        let array = new Uint16Array(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5300
     * @tc.name       : testUint16ArrayConstructor0053
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0053";
      try {
        let array = new Uint16Array(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5400
     * @tc.name       : testUint16ArrayConstructor0054
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0054";
      try {
        let array = new Uint16Array(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5500
     * @tc.name       : testUint16ArrayConstructor0055
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0055";
      try {
        let array = new Uint16Array(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5600
     * @tc.name       : testUint16ArrayConstructor0056
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5700
     * @tc.name       : testUint16ArrayConstructor0057
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5800
     * @tc.name       : testUint16ArrayConstructor0058
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_5900
     * @tc.name       : testUint16ArrayConstructor0059
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_6000
     * @tc.name       : testUint16ArrayConstructor0060
     * @tc.desc       : Testing Constructor of Uint16Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_6100
     * @tc.name       : testUint16ArrayConstructor0061
     * @tc.desc       : Testing Constructor of Uint16Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_6200
     * @tc.name       : testUint16ArrayConstructor0062
     * @tc.desc       : Testing Constructor of Uint16Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0062";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_6300
     * @tc.name       : testUint16ArrayConstructor0063
     * @tc.desc       : Testing Constructor of Uint16Array with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0063";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint16Array(buffer, 0, 2);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_BYTESPERELEMENT_6400
     * @tc.name       : testUint16ArrayBytesPerElement0064
     * @tc.desc       : Testing BYTES_PER_ELEMENT of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayBytesPerElement0064";
      try {
        let bytes = Uint16Array.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_BYTESPERELEMENT_6500
     * @tc.name       : testUint16ArrayLength0065
     * @tc.desc       : Testing length of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayLength0065";
      try {
        let bytes = Uint16Array.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_6600
     * @tc.name       : testUint16ArrayFrom0066
     * @tc.desc       : Testing static function from 'foo' of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0066";
      try {
        expect(Constants.uint16ConstructTestArray3[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray3[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_6700
     * @tc.name       : testUint16ArrayFrom0067
     * @tc.desc       : Testing static function from "123" of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0067";
      try {
        expect(Constants.uint16ConstructTestArray6[0]).assertEqual(1);
        expect(Constants.uint16ConstructTestArray6[1]).assertEqual(2);
        expect(Constants.uint16ConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_6800
     * @tc.name       : testUint16ArrayFrom0068
     * @tc.desc       : Testing static function from set() of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0068";
      try {
        expect(Constants.uint16ConstructTestArray4[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray4[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_6900
     * @tc.name       : testUint16ArrayFrom0069
     * @tc.desc       : Testing static function from map() of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0069";
      try {
        expect(Constants.uint16ConstructTestArray5[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray5[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_7000
     * @tc.name       : testUint16ArrayFrom0070
     * @tc.desc       : Testing static function from of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0070";
      try {
        let array = Uint16Array.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7100
     * @tc.name       : testUint16ArrayOf0071
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0071";
      try {
        let array = Uint16Array.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7200
     * @tc.name       : testUint16ArrayOf0072
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0072";
      try {
        let array = Uint16Array.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7300
     * @tc.name       : testUint16ArrayOf0073
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0073";
      try {
        let array = Uint16Array.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7400
     * @tc.name       : testUint16ArrayOf0074
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0074";
      try {
        let array = Uint16Array.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7500
     * @tc.name       : testUint16ArrayOf0075
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0075";
      try {
        let array = Uint16Array.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7600
     * @tc.name       : testUint16ArrayOf0076
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0076";
      try {
        let array = Uint16Array.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7700
     * @tc.name       : testUint16ArrayOf0077
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0077";
      try {
        let array = Uint16Array.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7800
     * @tc.name       : testUint16ArrayOf0078
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0078";
      try {
        let array = Uint16Array.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_7900
     * @tc.name       : testUint16ArrayOf0079
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0079";
      try {
        let array = Uint16Array.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_BYTEOFFSET_8000
     * @tc.name       : testUint16ArrayByteOffset0080
     * @tc.desc       : Testing instance property byteOffset of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayByteOffset0080";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint16Array(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Uint16Array(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_BYTELENGTH_8100
     * @tc.name       : testUint16ArrayByteLength0081
     * @tc.desc       : Testing instance property byteLength of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayByteLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayByteLength0081";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint16Array(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint16Array(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_BUFFER_8200
     * @tc.name       : testUint16ArrayBuffer0082
     * @tc.desc       : Testing instance property buffer of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayBuffer0082";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint16Array(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint16Array(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_LENGTH_8300
     * @tc.name       : testUint16ArrayLength0083
     * @tc.desc       : Testing instance function length of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayLength0083";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint16Array(buffer);
        expect(arrayOffSet0.length).assertEqual(16);
        const arrayOffSet8 = new Uint16Array(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8400
     * @tc.name       : testUint16ArrayConstructor0084
     * @tc.desc       : Testing Constructor of Uint16Array with string param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0084";
      try {
        const array = Constants.uint16ConstructTestArray1;
        expect(array.toString()).assertEqual('');
        const array2 = Constants.uint16ConstructTestArray2;
        expect(array2[1]).assertEqual(0);
        expect(array2.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8500
     * @tc.name       : testUint16ArrayConstructor0085
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0085";
      try {
        const array = new Int8Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8600
     * @tc.name       : testUint16ArrayConstructor0086
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0086";
      try {
        const array = new Uint16Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8700
     * @tc.name       : testUint16ArrayConstructor0087
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0087";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8800
     * @tc.name       : testUint16ArrayConstructor0088
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0088";
      try {
        const array = new Int16Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_8900
     * @tc.name       : testUint16ArrayConstructor0089
     * @tc.desc       : Testing Constructor of Uint16Array with Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0089";
      try {
        const array = new Uint16Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9000
     * @tc.name       : testUint16ArrayConstructor0090
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0090";
      try {
        const array = new Int32Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9100
     * @tc.name       : testUint16ArrayConstructor0091
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0091";
      try {
        const array = new Uint32Array([21, 31])
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9200
     * @tc.name       : testUint16ArrayConstructor0092
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0092";
      try {
        const array = new BigInt64Array([21n, 31n]);
        new Uint16Array(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9300
     * @tc.name       : testUint16ArrayConstructor0093
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0093";
      try {
        const array = new BigUint64Array([21n, 31n]);
        new Uint16Array(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9400
     * @tc.name       : testUint16ArrayConstructor0094
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0094";
      try {
        const array = new Float32Array([21, 31]);
        let uint16Array = new Uint16Array(array);
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_length_9500
     * @tc.name       : testUint16ArrayLength0095
     * @tc.desc       : Testing instance function length of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayLength0095";
      try {
        let uint16Array = new Uint16Array(8);
        expect(uint16Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_9600
     * @tc.name       : testUint16ArrayFrom0096
     * @tc.desc       : Testing static function from of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0096";
      try {
        expect(Constants.uint16ConstructTestArray3[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray3[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9700
     * @tc.name       : testUint16ArrayConstructor0097
     * @tc.desc       : Testing Constructor of Uint16Array with Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0097";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint16Array = new Uint16Array(array);
        uint16Array[0] = 21;
        uint16Array[1] = 31;
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9800
     * @tc.name       : testUint16ArrayConstructor0098
     * @tc.desc       : Testing Constructor of Uint16Array with Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0098";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint16Array = new Uint16Array(array);
        uint16Array[0] = 21;
        uint16Array[1] = 31;
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_9900
     * @tc.name       : testUint16ArrayConstructor0099
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0099";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint16Array = new Uint16Array(arrayBuffer);
        uint16Array[0] = 21;
        uint16Array[1] = 31;
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(0);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_10000
     * @tc.name       : testUint16ArrayConstructor0100
     * @tc.desc       : Testing Constructor of Uint16Array with ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayConstructor0100";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint16Array = new Uint16Array(arrayBuffer, 0, 2);
        uint16Array[0] = 21;
        uint16Array[1] = 31;
        expect(uint16Array[0]).assertEqual(21);
        expect(uint16Array[1]).assertEqual(31);
        expect(uint16Array[3]).assertEqual(undefined);
        uint16Array[10] = 3;
        expect(uint16Array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_10100
     * @tc.name       : testUint16ArrayFrom0101
     * @tc.desc       : Testing static function from of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0101";
      try {
        expect(Constants.uint16ConstructTestArray4[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray4[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_10200
     * @tc.name       : testUint16ArrayFrom0102
     * @tc.desc       : Testing static function from of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0102";
      try {
        expect(Constants.uint16ConstructTestArray5[0]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray5[1]).assertEqual(0);
        expect(Constants.uint16ConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_10300
     * @tc.name       : testUint16ArrayFrom0103
     * @tc.desc       : Testing static function from of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0103";
      try {
        expect(Constants.uint16FromTestArray[0]).assertEqual(0);
        expect(Constants.uint16FromTestArray[1]).assertEqual(1);
        expect(Constants.uint16FromTestArray[2]).assertEqual(2);
        expect(Constants.uint16FromTestArray[3]).assertEqual(3);
        expect(Constants.uint16FromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_10400
     * @tc.name       : testUint16ArrayOf0104
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0104";
      try {
        expect(Constants.uint16OfTestUndefined.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_10500
     * @tc.name       : testUint16ArrayOf0105
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0105";
      try {
        expect(Constants.uint16OfTestStr.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_10600
     * @tc.name       : testUint16ArrayOf0106
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0106";
      try {
        expect(Constants.uint16OfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_OF_10700
     * @tc.name       : testUint16ArrayOf0107
     * @tc.desc       : Testing static function of of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0107";
      try {
        expect(Constants.uint16OfTestNumber2[0]).assertEqual(1);
        expect(Constants.uint16OfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_10800
     * @tc.name       : testUint16ArrayFrom0108
     * @tc.desc       : Testing static function from range length step + 1 => of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0108";
      try {
        expect(Constants.uint16ArrayNumber[0]).assertEqual(0);
        expect(Constants.uint16ArrayNumber[1]).assertEqual(1);
        expect(Constants.uint16ArrayNumber[2]).assertEqual(2);
        expect(Constants.uint16ArrayNumber[3]).assertEqual(3);
        expect(Constants.uint16ArrayNumber[4]).assertEqual(4);
        expect(Constants.uint16ArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_FROM_10900
     * @tc.name       : testUint16ArrayFrom0109
     * @tc.desc       : Testing static function from range length 'A~Z' => of Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0109";
      try {
        expect(Constants.uint16ArrayCharacter[0]).assertEqual(65);
        expect(Constants.uint16ArrayCharacter[1]).assertEqual(66);
        expect(Constants.uint16ArrayCharacter[2]).assertEqual(67);
        expect(Constants.uint16ArrayCharacter[25]).assertEqual(90);
        expect(Constants.uint16ArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11000
     * @tc.name       : testUint16Constructor0110
     * @tc.desc       : Testing Constructor of Uint16Array with threshold value([0]),and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0110";
      try {
        let array = new Uint16Array([0]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11100
     * @tc.name       : testUint16Constructor0111
     * @tc.desc       : Testing Constructor of Uint16Array with out of bounds value([-1]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0111";
      try {
        let array = new Uint16Array([-1]);
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11200
     * @tc.name       : testUint16Constructor0112
     * @tc.desc       : Testing Constructor of Uint16Array with threshold value([65535]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0112";
      try {
        let array = new Uint16Array([65535]);
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11300
     * @tc.name       : testUint8Constructor0113
     * @tc.desc       : Testing Constructor of Uint16Array with out of bounds value([65536]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8Constructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8Constructor0113";
      try {
        let array = new Uint8Array([65536]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11400
     * @tc.name       : testUint16Constructor0114
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array threshold value([-128]),
     * and get value of index 0 is 65408.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0114";
      try {
        let array = new Uint16Array(new Int8Array([-128]));
        expect(array[0]).assertEqual(65408);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11500
     * @tc.name       : testUint16Constructor0115
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array out of bounds value([-129]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0115";
      try {
        let array = new Uint16Array(new Int8Array([-129]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11600
     * @tc.name       : testUint16Constructor0116
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array threshold value([127]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0116";
      try {
        let array = new Uint16Array(new Int8Array([127]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11700
     * @tc.name       : testUint16Constructor0117
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array value([126]),
     * and get value of index 0 is 126.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0117";
      try {
        let array = new Uint16Array(new Int8Array([126]));
        expect(array[0]).assertEqual(126);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11800
     * @tc.name       : testUint16Constructor0118
     * @tc.desc       : Testing Constructor of Uint16Array with Int8Array out of bounds value([128]),
     * and get value of index 0 is 65408.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0118";
      try {
        let array = new Uint16Array(new Int8Array([128]));
        expect(array[0]).assertEqual(65408);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_11900
     * @tc.name       : testUint16Constructor0119
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0119";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12000
     * @tc.name       : testUint16Constructor0120
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray out of bounds value([-1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0120";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([-1]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12100
     * @tc.name       : testUint16Constructor0121
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0121";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12200
     * @tc.name       : testUint16Constructor0122
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray out of bounds value([256]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0122";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([256]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12300
     * @tc.name       : testUint16Constructor0123
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8ClampedArray value([254]),
     * and get value of index 0 is 254.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0123";
      try {
        let array = new Uint16Array(new Uint8ClampedArray([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12400
     * @tc.name       : testUint16Constructor0124
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array threshold value([-32768]),
     * and get value of index 0 is 32768.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0124";
      try {
        let array = new Uint16Array(new Int16Array([-32768]));
        expect(array[0]).assertEqual(32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12500
     * @tc.name       : testUint16Constructor0125
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array out of bounds value([-32769]),
     * and get value of index 0 is 32767.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0125";
      try {
        let array = new Uint16Array(new Int16Array([-32769]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12600
     * @tc.name       : testUint16Constructor0126
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array threshold value([32767]),
     * and get value of index 0 is 32767.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0126";
      try {
        let array = new Uint16Array(new Int16Array([32767]));
        expect(array[0]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12700
     * @tc.name       : testUint16Constructor0127
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array out of bounds value([32768]),
     * and get value of index 0 is 32768.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0127";
      try {
        let array = new Uint16Array(new Int16Array([32768]));
        expect(array[0]).assertEqual(32768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12800
     * @tc.name       : testUint16Constructor0128
     * @tc.desc       : Testing Constructor of Uint16Array with Int16Array value([32766]),
     * and get value of index 0 is 32766.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0128";
      try {
        let array = new Uint16Array(new Int16Array([32766]));
        expect(array[0]).assertEqual(32766);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_12900
     * @tc.name       : testUint16Constructor0129
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0129";
      try {
        let array = new Uint16Array(new Uint8Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13000
     * @tc.name       : testUint16Constructor0130
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0130";
      try {
        let array = new Uint16Array(new Uint8Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13100
     * @tc.name       : testUint16Constructor0131
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0131";
      try {
        let array = new Uint16Array(new Uint8Array([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13200
     * @tc.name       : testUint16Constructor0132
     * @tc.desc       : Testing Constructor of Uint8Array with Uint16Array out of bounds value([256]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0132";
      try {
        let array = new Uint16Array(new Uint8Array([256]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13300
     * @tc.name       : testUint16Constructor0133
     * @tc.desc       : Testing Constructor of Uint16Array with Uint8Array value([254]),
     * and get value of index 0 is 254.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0133";
      try {
        let array = new Uint16Array(new Uint8Array([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13400
     * @tc.name       : testUint16Constructor0134
     * @tc.desc       : Testing Constructor of Int16Array with Int32Array threshold value([-2147483648]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0134";
      try {
        let array = new Uint16Array(new Int32Array([-2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13500
     * @tc.name       : testUint16Constructor0135
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array out of bounds value([-2147483649]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0135";
      try {
        let array = new Uint16Array(new Int32Array([-2147483649]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13600
     * @tc.name       : testUint16Constructor0136
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array threshold value([2147483647]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0136";
      try {
        let array = new Uint16Array(new Int32Array([2147483647]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13700
     * @tc.name       : testUint16Constructor0137
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array out of bounds value([2147483648]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0137";
      try {
        let array = new Uint16Array(new Int32Array([2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13800
     * @tc.name       : testUint16Constructor0138
     * @tc.desc       : Testing Constructor of Uint16Array with Int32Array value([2147483646]),
     * and get value of index 0 is 65534.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0138";
      try {
        let array = new Uint16Array(new Int32Array([2147483646]));
        expect(array[0]).assertEqual(65534);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_13900
     * @tc.name       : testUint16Constructor0139
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0139";
      try {
        let array = new Uint16Array(new Uint32Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14000
     * @tc.name       : testUint16Constructor0140
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array out of bounds value([-1]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0140";
      try {
        let array = new Uint16Array(new Uint32Array([-1]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14100
     * @tc.name       : testUint16Constructor0141
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array threshold value([4294967295]),
     * and get value of index 0 is 65535.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0141";
      try {
        let array = new Uint16Array(new Uint32Array([4294967295]));
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14200
     * @tc.name       : testUint16Constructor0142
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array out of bounds value([4294967296]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0142";
      try {
        let array = new Uint16Array(new Uint32Array([4294967296]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14300
     * @tc.name       : testUint16Constructor0143
     * @tc.desc       : Testing Constructor of Uint16Array with Uint32Array value([4294967294]),
     * and get value of index 0 is 65534.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0143";
      try {
        let array = new Uint16Array(new Uint32Array([4294967294]));
        expect(array[0]).assertEqual(65534);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14400
     * @tc.name       : testUint16Constructor0144
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array threshold value([-3.4028235 * 10^38]),
     * and get value of index 0 is 65528.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0144";
      try {
        let MIN_VALUE = -3.4028235 * 10^38;
        let array = new Uint16Array(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(65528);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14500
     * @tc.name       : testUint16Constructor0145
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array out of bounds value([-3.4028235 * 10^38 -1]),
     * and get value of index 0 is 65531.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0145";
      try {
        let MIN_VALUE = -3.4028235 * 10^38 -1;
        let array = new Uint16Array(new Float32Array([MIN_VALUE]));
        expect(array[0]).assertEqual(65531);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14600
     * @tc.name       : testUint16Constructor0146
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array threshold value([3.4028235 x 10^38]),
     * and get value of index 0 is 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0146";
      try {
        let MAX_VALUE = 3.4028235 * 10^38;
        let array = new Uint16Array(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14700
     * @tc.name       : testUint16Constructor0147
     * @tc.desc       : Testing Constructor of Uint16Array with Float32Array out of bounds value([3.4028235 x 10^38 + 1]),
     * and get value of index 0 is 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0147";
      try {
        let MAX_VALUE = 3.4028235 * 10^38 + 1;
        let array = new Uint16Array(new Float32Array([MAX_VALUE]));
        expect(array[0]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14800
     * @tc.name       : testUint16Constructor0148
     * @tc.desc       : Testing Constructor of Uint16Array with Float64Array threshold value([-1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0148";
      try {
        let MIN_VALUE = -1.8e308;
        let array = new Uint16Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_14900
     * @tc.name       : testUint16Constructor0149
     * @tc.desc       : Testing Constructor of Uint16Array with Float64Array out of bounds value([-1.8e308 -1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0149";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array = new Uint16Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15000
     * @tc.name       : testUint16Constructor0150
     * @tc.desc       : Testing Constructor of Uint16Array with Float64Array threshold value([1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0150";
      try {
        let MAX_VALUE = 1.8e308;
        let array = new Uint16Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15100
     * @tc.name       : testUint16Constructor0151
     * @tc.desc       : Testing Constructor of Uint16Array with Float64Array out of bounds value([1.8e308 + 1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0151";
      try {
        let MAX_VALUE = 1.8e308 + 1;
        let array = new Uint16Array(new Float64Array([MAX_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15200
     * @tc.name       : testUint16Constructor0152
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array threshold value([-(2^63)]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0152";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint16Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,bigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(0);
        expect(uint16Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15300
     * @tc.name       : testUint16Constructor0153
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array out of bounds value([-(2^63) -1]),
     * and get value of index 0 is 9.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0153";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775809n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint16Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(9);
        expect(uint16Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15400
     * @tc.name       : testUint16Constructor0154
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array threshold value([2^63 - 1]),
     * and get value of index 0 is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0154";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775807n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint16Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint8Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(9);
        expect(uint16Array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15500
     * @tc.name       : testUint16Constructor0155
     * @tc.desc       : Testing Constructor of Uint16Array with BigInt64Array out of bounds value([2^63]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0155";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint16Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(0);
        expect(uint16Array[1]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15600
     * @tc.name       : testUint16Constructor0156
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0156";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([0n]);
        // new Uint16Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 2); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15700
     * @tc.name       : testUint16Constructor0157
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array out of bounds value([-1]),
     * and get value of index 0 is 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0157";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([-1n]);
        // new Uint16Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint16Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(1);
        expect(uint16Array[1]).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15800
     * @tc.name       : testUint16Constructor0158
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array threshold value([2^64-1n]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0158";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551615n]);
        // new Uint16Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint16Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(1);
        expect(uint16Array[2]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAY_CONSTRUCTOR_15900
     * @tc.name       : testUint16Constructor0159
     * @tc.desc       : Testing Constructor of Uint16Array with BigUint64Array out of bounds value([2^64n]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16Constructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16Constructor0159";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551616n]);
        console.info(`${TAG} BigUint64Array is: ${bigUint64Array}`);
        // new Int16Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint16Array  = new Uint16Array(byteLength * 3); // because Uint16 is 2 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint16Array
          const bytes = new Uint16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.error(`${TAG} bytes, is: ${bytes}`);
          uint16Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint16Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16000
     * @tc.name       : testUint16ArrayOf0160
     * @tc.desc       : Testing static function of, of Uint16Array value is positive infinity(+infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0160";
      try {
        let infinity = 1 / 0;
        let array = Uint16Array.of(infinity);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16100
     * @tc.name       : testUint16ArrayOf0161
     * @tc.desc       : Testing static function of, of Uint16Array value is negative infinity(-infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0161";
      try {
        let infinity = -1 / 0;
        let array = Uint16Array.of(infinity);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16200
     * @tc.name       : testUint16ArrayOf0162
     * @tc.desc       : Testing static function of, of Uint16Array value is (NaN).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0162";
      try {
        let nan = 0 / 0;
        let array = Uint16Array.of(nan);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16300
     * @tc.name       : testUint16ArrayOf0163
     * @tc.desc       : Testing static function of, of Uint16Array value is bigint(12345678901234567890n).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0163";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let uint16Array = Uint16Array.of(numberValue);
        console.info(`${TAG} uint16Array is: ${uint16Array}`);
        expect(uint16Array[0]).assertEqual(2048);
        expect(uint16Array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16400
     * @tc.name       : testUint16ArrayOf0164
     * @tc.desc       : Testing static function of, of Uint16Array threshold value is MAX_NUMBER(255).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0164";
      try {
        let array = Uint16Array.of(255);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16500
     * @tc.name       : testUint16ArrayOf0165
     * @tc.desc       : Testing static function of, of Uint16Array threshold value is MIN_NUMBER(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0165";
      try {
        let array = Uint16Array.of(0);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16600
     * @tc.name       : testUint16ArrayOf0166
     * @tc.desc       : Testing static function of, Int16Array value is out of bounds (-1).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0166";
      try {
        let array = Uint16Array.of(-1);
        expect(array[0]).assertEqual(65535);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16700
     * @tc.name       : testUint16ArrayOf0167
     * @tc.desc       : Testing static function of, Uint16Array value is out of bounds (256).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0167";
      try {
        let array = Uint16Array.of(256);
        expect(array[0]).assertEqual(256);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16800
     * @tc.name       : testUint16ArrayOf0168
     * @tc.desc       : Testing static function of, Uint16Array value is normal (254).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0168";
      try {
        let array = Uint16Array.of(254);
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYOF_16900
     * @tc.name       : testUint16ArrayOf0169
     * @tc.desc       : Testing static function of, Uint16Array value is normal (null).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayOf0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayOf0169";
      try {
        expect(Constants.uint16OfTestNumber3[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17000
     * @tc.name       : testUint16ArrayFrom0170
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (+infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0170";
      try {
        let infinity = 1/0;
        let array = Uint16Array.from([infinity]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17100
     * @tc.name       : testUint16ArrayFrom0171
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (-infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0171";
      try {
        let infinity = -1/0;
        let array = Uint16Array.from([infinity]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17200
     * @tc.name       : testUint16ArrayFrom0172
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (NaN).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0172";
      try {
        let nan = 0/0;
        let array = Uint16Array.from([nan]);
        expect(array[0]).assertEqual(0);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17300
     * @tc.name       : testUint16ArrayFrom0173
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal ([1,2,3]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0173";
      try {
        let array = Uint16Array.from([1,2,3]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17400
     * @tc.name       : testUint16ArrayFrom0174
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal ([1.1,2.83]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0174";
      try {
        let array = Uint16Array.from([1.1,2.83]);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17500
     * @tc.name       : testUint16ArrayFrom0175
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal ([12345678901234567890n]).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0175";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let array = Uint16Array.from([numberValue]);
        expect(array[0]).assertEqual(2048);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17600
     * @tc.name       : testUint16ArrayFrom0176
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0176";
      try {
        expect(Constants.uint16ConstructTestArray7[0]).assertEqual(1);
        expect(Constants.uint16ConstructTestArray7[1]).assertEqual(2);
        expect(Constants.uint16ConstructTestArray7[2]).assertEqual(3);
        expect(Constants.uint16ConstructTestArray7[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17700
     * @tc.name       : testUint16ArrayFrom0177
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0177";
      try {
        expect(Constants.uint16ConstructTestArray8[0]).assertEqual(1);
        expect(Constants.uint16ConstructTestArray8[1]).assertEqual(2);
        expect(Constants.uint16ConstructTestArray8[2]).assertEqual(3);
        expect(Constants.uint16ConstructTestArray8[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17800
     * @tc.name       : testUint16ArrayFrom0178
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (obj).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0178";
      try {
        expect(Constants.uint16ConstructTestArray9[0]).assertEqual(1);
        expect(Constants.uint16ConstructTestArray9[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_17900
     * @tc.name       : testUint16ArrayFrom0179
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0179";
      try {
        expect(Constants.uint16ArrayNumber1[0]).assertEqual(1);
        expect(Constants.uint16ArrayNumber1[1]).assertEqual(2);
        expect(Constants.uint16ArrayNumber1[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18000
     * @tc.name       : testUint16ArrayFrom0180
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0180";
      try {
        expect(Constants.uint16ConstructTestArray10[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18100
     * @tc.name       : testUint16ArrayFrom0181
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (Sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0181";
      try {
        expect(Constants.uint16ConstructTestArray11[0]).assertEqual(5);
        expect(Constants.uint16ConstructTestArray11[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18200
     * @tc.name       : testUint16ArrayFrom0182
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (Non-array-like objects).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0182";
      try {
        expect(Constants.uint16ConstructTestArray12[0]).assertEqual(undefined);
        expect(Constants.uint16ConstructTestArray12[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18300
     * @tc.name       : testUint16ArrayFrom0183
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (Non-iterable objects).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0183";
      try {
        expect(Constants.uint16ConstructTestArray13[0]).assertEqual(1);
        expect(Constants.uint16ConstructTestArray13[1]).assertEqual(2);
        expect(Constants.uint16ConstructTestArray13[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18400
     * @tc.name       : testUint16ArrayFrom0184
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0184";
      try {
        expect(Constants.uint16ArrayNumber2[0]).assertEqual('a');
        expect(Constants.uint16ArrayNumber2[1]).assertEqual('b');
        expect(Constants.uint16ArrayNumber2[2]).assertEqual('c');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT16ARRAYFROM_18500
     * @tc.name       : testUint16ArrayFrom0185
     * @tc.desc       : Testing static function from => func of Uint16Array, value is normal (sequence).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint16ArrayFrom0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint16ArrayFrom0185";
      try {
        expect(Constants.uint16ArrayNumber3[0]).assertEqual(undefined);
        expect(Constants.uint16ArrayNumber3[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}
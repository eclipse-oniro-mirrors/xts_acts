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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function Uint8ClampedArrayTest() {
  describe('Uint8ClampedArrayTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0100
     * @tc.name       : testUint8ClampedArray0001
     * @tc.desc       : Testing the iterative ability of Uint8ClampedArray using a for loop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0001";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint8ClampedArray.set(expectedValues);
        for (let i = 0; i < uint8ClampedArray.length; i++) {
          expect(uint8ClampedArray[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0200
     * @tc.name       : testUint8ClampedArray0002
     * @tc.desc       : Testing the iterative ability of Uint8ClampedArray using ... deconstruction.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0002";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint8ClampedArray.set(expectedValues);
        const normalArray: number[] = [...uint8ClampedArray];
        for (let i = 0; i < expectedValues.length; i++) {
          expect(normalArray[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0300
     * @tc.name       : testUint8ClampedArray0003
     * @tc.desc       : Testing create an empty ArkTS TypedArray object with Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0003";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        expect(uint8ClampedArray instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0400
     * @tc.name       : testUint8ClampedArray0004
     * @tc.desc       : Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0004";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0500
     * @tc.name       : testUint8ClampedArray0005
     * @tc.desc       : Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0005";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(0);
        expect(uint8ClampedArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0600
     * @tc.name       : testUint8ClampedArray0006
     * @tc.desc       : Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0006";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        expect(uint8ClampedArray.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0700
     * @tc.name       : testUint8ClampedArray0007
     * @tc.desc       : Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0007";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(100000);
        expect(uint8ClampedArray.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0800
     * @tc.name       : testUint8ClampedArray0008
     * @tc.desc       : Testing construct an object from an ArrayLike.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0900
     * @tc.name       : testUint8ClampedArray0009
     * @tc.desc       : Testing construct an object from an ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayBuffer);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1000
     * @tc.name       : testUint8ClampedArray0010
     * @tc.desc       : Testing construct an object from another ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8Array);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1100
     * @tc.name       : testUint8ClampedArray0011
     * @tc.desc       : Testing create an ArrayBuffer with an empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1200
     * @tc.name       : testUint8ClampedArray0012
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1300
     * @tc.name       : testUint8ClampedArray0013
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1400
     * @tc.name       : testUint8ClampedArray0014
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1500
     * @tc.name       : testUint8ClampedArray0015
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0015";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1600
     * @tc.name       : testUint8ClampedArray0016
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0016";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1700
     * @tc.name       : testUint8ClampedArray0017
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0017";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1800
     * @tc.name       : testUint8ClampedArray0018
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0018";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1900
     * @tc.name       : testUint8ClampedArray0019
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0019";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2000
     * @tc.name       : testUint8ClampedArray0020
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0020";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 2);
        expect(array.toString()).assertEqual('3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2100
     * @tc.name       : testUint8ClampedArray0021
     * @tc.desc       : Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2200
     * @tc.name       : testUint8ClampedArray0022
     * @tc.desc       : Testing the 'from' interface with an array-like structure [].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0022";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2300
     * @tc.name       : testUint8ClampedArray0023
     * @tc.desc       : Testing the array-like map function created from an object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0023";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
          {
            length: 5
          }, (v: Object, k: number) => k);
        expect(array.toString()).assertEqual('0,1,2,3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2400
     * @tc.name       : testUint8ClampedArray0024
     * @tc.desc       : Testing the array-like map function created from a character array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0024";
      try {
        let array: Uint8ClampedArray = Uint8ClampedArray.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2500
     * @tc.name       : testUint8ClampedArray0025
     * @tc.desc       : Testing the array-like map function created from a string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0025";
      try {
        let array: Uint8ClampedArray = Uint8ClampedArray.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2600
     * @tc.name       : testUint8ClampedArray0026
     * @tc.desc       : Testing the array-like map function created from a num array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0026";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
          [1, 3, 5], (v: number, k: number) => v
        );
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2700
     * @tc.name       : testUint8ClampedArray0027
     * @tc.desc       : Testing the array-like map function created from a nesting array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
          ([] as number[]).concat(...nestedArray),
          (v: number) => v
        );
        expect(array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2800
     * @tc.name       : testUint8ClampedArray0028
     * @tc.desc       : Testing the array-like map function without specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2900
     * @tc.name       : testUint8ClampedArray0029
     * @tc.desc       : Testing the array-like map function with specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3000
     * @tc.name       : testUint8ClampedArray0030
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0030";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3100
     * @tc.name       : testUint8ClampedArray0031
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0031";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3200
     * @tc.name       : testUint8ClampedArray0032
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0032";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3300
     * @tc.name       : testUint8ClampedArray0033
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0033";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3400
     * @tc.name       : testUint8ClampedArray0034
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0034";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3500
     * @tc.name       : testUint8ClampedArray0035
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0035";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3600
     * @tc.name       : testUint8ClampedArray0036
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0036";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3700
     * @tc.name       : testUint8ClampedArray0037
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0037";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3800
     * @tc.name       : testUint8ClampedArray0038
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0038";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3900
     * @tc.name       : testUint8ClampedArray0039
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0039";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4000
     * @tc.name       : testUint8ClampedArray0040
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0040";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4100
     * @tc.name       : testUint8ClampedArray0041
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0041";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4200
     * @tc.name       : testUint8ClampedArray0042
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0042";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4300
     * @tc.name       : testUint8ClampedArray0043
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0043";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4400
     * @tc.name       : testUint8ClampedArray0044
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0044";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4500
     * @tc.name       : testUint8ClampedArray0045
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0045";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4600
     * @tc.name       : testUint8ClampedArray0046
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0046";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4700
     * @tc.name       : testUint8ClampedArray0047
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0047";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4800
     * @tc.name       : testUint8ClampedArray0048
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0048";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4900
     * @tc.name       : testUint8ClampedArray0049
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0049";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5000
     * @tc.name       : testUint8ClampedArray0050
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0050";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5100
     * @tc.name       : testUint8ClampedArray0051
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0051";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5200
     * @tc.name       : testUint8ClampedArray0052
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0052";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5300
     * @tc.name       : testUint8ClampedArray0053
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0053";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5400
     * @tc.name       : testUint8ClampedArray0054
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0054";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5500
     * @tc.name       : testUint8ClampedArray0055
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0055";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5600
     * @tc.name       : testUint8ClampedArray0056
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0056";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5700
     * @tc.name       : testUint8ClampedArray0057
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0057";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5800
     * @tc.name       : testUint8ClampedArray0058
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0058";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5900
     * @tc.name       : testUint8ClampedArray0059
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0059";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6000
     * @tc.name       : testUint8ClampedArray0060
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0060";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6100
     * @tc.name       : testUint8ClampedArray0061
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0061";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6200
     * @tc.name       : testUint8ClampedArray0062
     * @tc.desc       : Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0062";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element == 0)).assertEqual(true);
        expect(uint8ClampedArray.some((element: number) => element == 255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6300
     * @tc.name       : testUint8ClampedArray0063
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0063";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element == 300)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6400
     * @tc.name       : testUint8ClampedArray0064
     * @tc.desc       : Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0064";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element >= 0)).assertEqual(true);
        expect(uint8ClampedArray.some((element: number) => element <= 255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6500
     * @tc.name       : testUint8ClampedArray0065
     * @tc.desc       : Testing whether it returns true when all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0065";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6600
     * @tc.name       : testUint8ClampedArray0066
     * @tc.desc       : Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0066";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element < 30)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6700
     * @tc.name       : testUint8ClampedArray0067
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0067";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element > 50)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6800
     * @tc.name       : testUint8ClampedArray0068
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0068";
      try {
        let arrayLike = [1, 2, 3];
        let uint8ClampedArray1: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4);
        let uint8ClampedArray2: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 1);
        let uint8ClampedArray3: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 1, 2);
        expect(uint8ClampedArray1.toString()).assertEqual('4,4,4');
        expect(uint8ClampedArray2.toString()).assertEqual('1,4,4');
        expect(uint8ClampedArray3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6900
     * @tc.name       : testUint8ClampedArray0069
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7000
     * @tc.name       : testUint8ClampedArray0070
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7100
     * @tc.name       : testUint8ClampedArray0071
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7200
     * @tc.name       : testUint8ClampedArray0072
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7300
     * @tc.name       : testUint8ClampedArray0073
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, -1);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7400
     * @tc.name       : testUint8ClampedArray0074
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7500
     * @tc.name       : testUint8ClampedArray0075
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 2);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7600
     * @tc.name       : testUint8ClampedArray0076
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 10);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7700
     * @tc.name       : testUint8ClampedArray0077
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7800
     * @tc.name       : testUint8ClampedArray0078
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7900
     * @tc.name       : testUint8ClampedArray0079
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8000
     * @tc.name       : testUint8ClampedArray0080
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8100
     * @tc.name       : testUint8ClampedArray0081
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8200
     * @tc.name       : testUint8ClampedArray0082
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8300
     * @tc.name       : testUint8ClampedArray0083
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8400
     * @tc.name       : testUint8ClampedArray0084
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8500
     * @tc.name       : testUint8ClampedArray0085
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered: collections.Uint8ClampedArray = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8600
     * @tc.name       : testUint8ClampedArray0086
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0086";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered: collections.Uint8ClampedArray = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8700
     * @tc.name       : testUint8ClampedArray0087
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered1: collections.Uint8ClampedArray = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Uint8ClampedArray = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8800
     * @tc.name       : testUint8ClampedArray0088
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8900
     * @tc.name       : testUint8ClampedArray0089
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0089";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9000
     * @tc.name       : testUint8ClampedArray0090
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res1 = array.find((element: number) => element > 4);
        expect(res1).assertEqual(undefined);
        array.set([5, 6], 2);
        let res2 = array.find((element: number) => element > 4);
        expect(res2).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9100
     * @tc.name       : testUint8ClampedArray0091
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9200
     * @tc.name       : testUint8ClampedArray0092
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9300
     * @tc.name       : testUint8ClampedArray0093
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9400
     * @tc.name       : testUint8ClampedArray0094
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Uint8ClampedArray = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9500
     * @tc.name       : testUint8ClampedArray0095
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0095";
      try {
        const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9600
     * @tc.name       : testUint8ClampedArray0096
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0096";
      try {
        const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9700
     * @tc.name       : testUint8ClampedArray0097
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0097";
      try {
        const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9800
     * @tc.name       : testUint8ClampedArray0098
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0098";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let res = false;
        uint8ClampedArray.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(uint8ClampedArray.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9900
     * @tc.name       : testUint8ClampedArray0099
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0099";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
        let res = false;
        uint8ClampedArray.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,3');
          expect(array.length).assertEqual(3);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10000
     * @tc.name       : testUint8ClampedArray0100
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0100";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        uint8ClampedArray.set([255, 256], 2);
        let res = false;
        uint8ClampedArray.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,255,255,5');
          expect(array.length).assertEqual(5);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10100
     * @tc.name       : testUint8ClampedArray0101
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0101";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10200
     * @tc.name       : testUint8ClampedArray0102
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0102";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10300
     * @tc.name       : testUint8ClampedArray0103
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0103";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
        array.set([4, 5], 1);
        let res = array.indexOf(4);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10400
     * @tc.name       : testUint8ClampedArray0104
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0104";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10500
     * @tc.name       : testUint8ClampedArray0105
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0105";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10600
     * @tc.name       : testUint8ClampedArray0106
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0106";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10700
     * @tc.name       : testUint8ClampedArray0107
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0107";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10800
     * @tc.name       : testUint8ClampedArray0108
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0108";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_10900
     * @tc.name       : testUint8ClampedArray0109
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0109";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11000
     * @tc.name       : testUint8ClampedArray0110
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0110";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11100
     * @tc.name       : testUint8ClampedArray0111
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0111";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11200
     * @tc.name       : testUint8ClampedArray0112
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0112";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11300
     * @tc.name       : testUint8ClampedArray0113
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0113";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11400
     * @tc.name       : testUint8ClampedArray0114
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0114";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11500
     * @tc.name       : testUint8ClampedArray0115
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0115";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11600
     * @tc.name       : testUint8ClampedArray0116
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0116";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11700
     * @tc.name       : testUint8ClampedArray0117
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0117";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11800
     * @tc.name       : testUint8ClampedArray0118
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0118";
      try {
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("");
        expect(mapped.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_11900
     * @tc.name       : testUint8ClampedArray0119
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0119";
      try {
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([25, -81, 360]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,0,16");
        expect(mapped.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12000
     * @tc.name       : testUint8ClampedArray0120
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0120";
      try {
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([25, 36, 49, 100, 256]);
        array.set([-81, 360], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,0,16,16");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12100
     * @tc.name       : testUint8ClampedArray0121
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0121";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12200
     * @tc.name       : testUint8ClampedArray0122
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0122";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let expectedValues: number[] = [1, 3, 6, 10, 15];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          let newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        });
        expect(reducedValue).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12300
     * @tc.name       : testUint8ClampedArray0123
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0123";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        const initialAccumulator = 8;
        const expectedValues: number[] = [9, 11, 14, 18, 23];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          const newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        }, initialAccumulator);
        expect(reducedValue).assertEqual(23);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12400
     * @tc.name       : testUint8ClampedArray0124
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0124";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let initialValue = "initialValue";
        let reducedValue: string = array.reduce<string>((accumulator: string, value: number) =>
        accumulator + value, initialValue);
        expect(reducedValue).assertEqual('initialValue12345');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12500
     * @tc.name       : testUint8ClampedArray0125
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0125";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let reversed: collections.Uint8ClampedArray = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12600
     * @tc.name       : testUint8ClampedArray0126
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0126";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let reversed: collections.Uint8ClampedArray = array.reverse();
        expect(reversed.toString()).assertEqual('5,4,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12700
     * @tc.name       : testUint8ClampedArray0127
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0127";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let reversed: collections.Uint8ClampedArray = array.reverse();
        const expectedValues = [5, 4, 3, 2, 1];
        let res = false;
        reversed.forEach((value, index) => {
          expect(value).assertEqual(expectedValues[index]);
          res = true;
        });
        expect(res).assertEqual(true);
        expect(reversed.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12800
     * @tc.name       : testUint8ClampedArray0128
     * @tc.desc       : Testing the set of int8Array, offset is null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0128";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5]);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_12900
     * @tc.name       : testUint8ClampedArray0129
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is null, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0129";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5]);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1,3,5,0,0,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13000
     * @tc.name       : testUint8ClampedArray0130
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is -1, return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0130";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The targetOffset of This value is less than 0.");
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13100
     * @tc.name       : testUint8ClampedArray0131
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0131";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], 0);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13200
     * @tc.name       : testUint8ClampedArray0132
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is 0, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0132";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], 0);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1,3,5,0,0,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13300
     * @tc.name       : testUint8ClampedArray0133
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0133";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], 2);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13400
     * @tc.name       : testUint8ClampedArray0134
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is 2, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0134";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], 2);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("0,0,1,3,5,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13500
     * @tc.name       : testUint8ClampedArray0135
     * @tc.desc       : Testing the set of Uint8ClampedArray, offset is 10(overstep), return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0135";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buf);
        arrList.set([1, 3, 5], 10);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The sum of length and targetOffset is greater than targetLength.");
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13600
     * @tc.name       : testUint8ClampedArray0136
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is null, start is 1, end is 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0136";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let arrListNew = arrList.slice(1, 3);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13700
     * @tc.name       : testUint8ClampedArray0137
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0137";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13800
     * @tc.name       : testUint8ClampedArray0138
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0138";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_13900
     * @tc.name       : testUint8ClampedArray0139
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0139";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(undefined, undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14000
     * @tc.name       : testUint8ClampedArray0140
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, parameter is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0140";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1);
        expect(arrListNew.toString()).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14100
     * @tc.name       : testUint8ClampedArray0141
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0141";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14200
     * @tc.name       : testUint8ClampedArray0142
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is -1, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0142";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14300
     * @tc.name       : testUint8ClampedArray0143
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is 0, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0143";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(0, -1);
        expect(arrListNew.toString()).assertEqual("1,2,3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14400
     * @tc.name       : testUint8ClampedArray0144
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, parameter is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0144";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2);
        expect(arrListNew.toString()).assertEqual("3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14500
     * @tc.name       : testUint8ClampedArray0145
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, parameter is 10(overstep).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0145";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14600
     * @tc.name       : testUint8ClampedArray0146
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0146";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14700
     * @tc.name       : testUint8ClampedArray0147
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is 2, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0147";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14800
     * @tc.name       : testUint8ClampedArray0148
     * @tc.desc       : Testing the Slice of Uint8ClampedArray, array is not null, start is 2, end is 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0148";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 4);
        expect(arrListNew.toString()).assertEqual("3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_14900
     * @tc.name       : testUint8ClampedArray0149
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0149";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15000
     * @tc.name       : testUint8ClampedArray0150
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0150";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let arrListNew = arrList.sort((a: number, b: number) => a - b);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15100
     * @tc.name       : testUint8ClampedArray0151
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0151";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15200
     * @tc.name       : testUint8ClampedArray0152
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0152";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort(undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15300
     * @tc.name       : testUint8ClampedArray0153
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is not null, parameter is grade down.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0153";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort((a: number, b: number) => b - a);
        expect(arrListNew.toString()).assertEqual("5,4,3,2,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15400
     * @tc.name       : testUint8ClampedArray0154
     * @tc.desc       : Testing the sort of Uint8ClampedArray, array is not null, set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0154";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
        arrList.set([7, 9, 8], 2);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("2,5,7,8,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15500
     * @tc.name       : testUint8ClampedArray0155
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0155";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray();
        expect(arrListNew.toString()).assertEqual("1,3,5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15600
     * @tc.name       : testUint8ClampedArray0156
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is -1, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0156";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15700
     * @tc.name       : testUint8ClampedArray0157
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0157";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15800
     * @tc.name       : testUint8ClampedArray0158
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is -1, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0158";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_15900
     * @tc.name       : testUint8ClampedArray0159
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is -1, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0159";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 7);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16000
     * @tc.name       : testUint8ClampedArray0160
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is 2, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0160";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16100
     * @tc.name       : testUint8ClampedArray0161
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is 2, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0161";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, -1);
        expect(arrListNew.toString()).assertEqual("5,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16200
     * @tc.name       : testUint8ClampedArray0162
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0162";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16300
     * @tc.name       : testUint8ClampedArray0163
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is 2, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0163";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 10);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16400
     * @tc.name       : testUint8ClampedArray0164
     * @tc.desc       : Testing the subarray of Uint8ClampedArray, array is not null, begin is overstep, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0164";
      try {
        let arrList: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(7, 10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16500
     * @tc.name       : testUint8ClampedArray0165
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [], at(1), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0165";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.at(1)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16600
     * @tc.name       : testUint8ClampedArray0166
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], at(5), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0166";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.at(5)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16700
     * @tc.name       : testUint8ClampedArray0167
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], at(-1), return 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0167";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.at(-1)).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16800
     * @tc.name       : testUint8ClampedArray0168
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], at(8), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0168";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.at(8)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_16900
     * @tc.name       : testUint8ClampedArray0169
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], at(0), return 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0169";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.at(0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17000
     * @tc.name       : testUint8ClampedArray0170
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [], includes(2), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0170";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17100
     * @tc.name       : testUint8ClampedArray0171
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], includes(5,-1), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0171";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(5, -1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17200
     * @tc.name       : testUint8ClampedArray0172
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], includes(255,-1), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0172";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(255, -1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17300
     * @tc.name       : testUint8ClampedArray0173
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], includes(100), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0173";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(100)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17400
     * @tc.name       : testUint8ClampedArray0174
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], includes(0), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0174";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17500
     * @tc.name       : testUint8ClampedArray0175
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], includes(50, 8), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0175";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(uint8ClampedArray.includes(50, 8)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17600
     * @tc.name       : testUint8ClampedArray0176
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [], entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0176";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let iterator: IterableIterator<[number, number]> = uint8ClampedArray.entries();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17700
     * @tc.name       : testUint8ClampedArray0177
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0177";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        let iterator: IterableIterator<[number, number]> = uint8ClampedArray.entries();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(iterator.next().value.toString()).assertEqual('0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17800
     * @tc.name       : testUint8ClampedArray0178
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [], keys().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0178";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let iterator: IterableIterator<number> = uint8ClampedArray.keys();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        let tempNum: number = 0;
        for (const key of iterator) {
          console.info("iterator key:" + key);
          tempNum = tempNum + 1;
        }
        expect(tempNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_17900
     * @tc.name       : testUint8ClampedArray0179
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], keys().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0179";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        let iterator: IterableIterator<number> = uint8ClampedArray.keys();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        expect(iterator.next().value).assertEqual(0);
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18000
     * @tc.name       : testUint8ClampedArray0180
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], keys().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0180";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        let iterator: IterableIterator<number> = uint8ClampedArray.keys();
        console.info("uint8ClampedArray: " + uint8ClampedArray);
        let tempNum: number = 0;
        for (const key of iterator) {
          console.info("iterator key:" + key);
          expect(key).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18100
     * @tc.name       : testUint8ClampedArray0181
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [], values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0181";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        let iterator: IterableIterator<number> = uint8ClampedArray.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18200
     * @tc.name       : testUint8ClampedArray0182
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,300], values().iterator.next().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0182";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        let iterator: IterableIterator<number> = uint8ClampedArray.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().value).assertEqual(0);
        expect(iterator.next().value).assertEqual(50);
        expect(iterator.next().value).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18300
     * @tc.name       : testUint8ClampedArray0183
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,100], values().for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0183";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 100]);
        let iterator: IterableIterator<number> = uint8ClampedArray.values();
        console.info("iterator values:" + iterator);
        let tempNum: number = 0;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 50;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18400
     * @tc.name       : testUint8ClampedArray0184
     * @tc.desc       : Testing Collections of uint8ClampedArray, array is [-10,50,100], values().for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0184";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 90]);
        uint8ClampedArray.set([10]);
        let iterator: IterableIterator<number> = uint8ClampedArray.values();
        console.info("uint8ClampedArray values:" + uint8ClampedArray);
        let tempNum: number = 10;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 40;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18500
     * @tc.name       : testUint8ClampedArray0185
     * @tc.desc       : Testing Collections of uint8ClampedArray,
     * array is [-10,50,100], index < 0, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0185";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 100]);
        console.info("uint8ClampedArray is:" + uint8ClampedArray);
        expect(uint8ClampedArray[-1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18600
     * @tc.name       : testUint8ClampedArray0186
     * @tc.desc       : Testing Collections of uint8ClampedArray,
     * index > arrayLength, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0186";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 100]);
        console.info("uint8ClampedArray is:" + uint8ClampedArray);
        expect(uint8ClampedArray[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18700
     * @tc.name       : testUint8ClampedArray0187
     * @tc.desc       : Testing Collections of uint8ClampedArray,
     * 0 <= index < arrayLength, array[index] = array element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArray0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0187";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray([-10, 50, 300]);
        console.info("uint8ClampedArray is:" + uint8ClampedArray);
        expect(uint8ClampedArray[0]).assertEqual(0);
        expect(uint8ClampedArray[1]).assertEqual(50);
        expect(uint8ClampedArray[2]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18800
     * @tc.name       : testUint8ClampedArrayReduceRight0001
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayReduceRight0001";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        array.reduceRight((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_18900
     * @tc.name       : testUint8ClampedArrayReduceRight0002
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayReduceRight0002";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let expectedValues: number[] = [15, 14, 12, 9, 5];
        let reduceRightdValue: number = array.reduceRight((accumulator: number, value: number, index: number) => {
          let newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        });
        expect(reduceRightdValue).assertEqual(15);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19000
     * @tc.name       : testUint8ClampedArrayReduceRight0003
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayReduceRight0003";
      try {
        const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        const initialAccumulator = 8;
        const expectedValues: number[] = [23, 22, 20, 17, 13];
        let reduceRightdValue: number = array.reduceRight((accumulator: number, value: number, index: number) => {
          const newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        }, initialAccumulator);
        expect(reduceRightdValue).assertEqual(23);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19100
     * @tc.name       : testUint8ClampedArrayReduceRight0004
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayReduceRight0004";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
        let initialValue = "initialValue";
        let reduceRightdValue: string = array.reduceRight<string>((accumulator: string, value: number) =>
        accumulator + value, initialValue);
        expect(reduceRightdValue).assertEqual('initialValue54321');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19200
     * @tc.name       : testUint8ClampedArrayToLocaleString0001
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUint8ClampedArrayToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayToLocaleString0001";
      try {
        const array1 = new collections.Uint8ClampedArray();
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19500
     * @tc.name       : testUint8ClampedArrayToLocaleString0002
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUint8ClampedArrayToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayToLocaleString0002";
      try {
        const array1 = new collections.Uint8ClampedArray(1);
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('0');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19501
     * @tc.name       : testUint8ClampedArrayToLocaleString0003
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUint8ClampedArrayToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayToLocaleString0003";
      try {
        const array1 = new collections.Uint8ClampedArray([1,2,3]);
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('1,2,3');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19600
     * @tc.name       : testUint8ClampedArrayLastIndexOf0001
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0001";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
        let res = array.lastIndexOf(3);
        expect(res).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19700
     * @tc.name       : testUint8ClampedArrayLastIndexOf0002
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0002";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
        let res = array.lastIndexOf(4);
        expect(res).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19800
     * @tc.name       : testUint8ClampedArrayLastIndexOf0003
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0003";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
        array.set([4, 5], 1);
        let res = array.lastIndexOf(4);
        expect(res).assertEqual(1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_19900
     * @tc.name       : testUint8ClampedArrayLastIndexOf0004
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0004";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.lastIndexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20000
     * @tc.name       : testUint8ClampedArrayLastIndexOf0005
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0005";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.lastIndexOf(3, 5);
        expect(res).assertEqual(4);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20200
     * @tc.name       : testUint8ClampedArrayLastIndexOf0006
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0006";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.lastIndexOf(3, 3);
        expect(res).assertEqual(3);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20300
     * @tc.name       : testUint8ClampedArrayLastIndexOf0007
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0007";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.lastIndexOf(3, 2);
        expect(res).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20100
     * @tc.name       : testUint8ClampedArrayLastIndexOf0008
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayLastIndexOf0008";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.lastIndexOf(3);
        expect(res).assertEqual(9);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20400
     * @tc.name       : testUint8ClampedArrayOf0001
     * @tc.desc       : Test the function of the interface Of
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayOf0001";
      try {
        let result = collections.Uint8ClampedArray.of(1);
        expect(result.toString()).assertEqual('1');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_20500
     * @tc.name       : testUint8ClampedArrayOf0002
     * @tc.desc       : Test the function of the interface Of
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArrayOf0002";
      try {
        let result = collections.Uint8ClampedArray.of(1, 2, 3);
        expect(result.toString()).assertEqual('1,2,3');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
  })
}
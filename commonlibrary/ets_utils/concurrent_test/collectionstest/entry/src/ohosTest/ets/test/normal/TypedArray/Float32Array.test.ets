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

export default function Float32ArrayTest() {
  describe('Float32ArrayTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0100
     * @tc.name       : testFloat32Array0001
     * @tc.desc       : Testing the iterative ability of Float32Array using a for loop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0001";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        float32Array.set(expectedValues);
        for (let i = 0; i < float32Array.length; i++) {
          expect(float32Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0200
     * @tc.name       : testFloat32Array0002
     * @tc.desc       : Testing the iterative ability of Float32Array using ... deconstruction.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0002";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        float32Array.set(expectedValues);
        const normalArray: number[] = [...float32Array];
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0300
     * @tc.name       : testFloat32Array0003
     * @tc.desc       : Testing create an empty ArkTS TypedArray object with Float32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0003";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array();
        expect(float32Array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0400
     * @tc.name       : testFloat32Array0004
     * @tc.desc       : Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0004";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0500
     * @tc.name       : testFloat32Array0005
     * @tc.desc       : Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0005";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(0);
        expect(float32Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0600
     * @tc.name       : testFloat32Array0006
     * @tc.desc       : Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0006";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        expect(float32Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0700
     * @tc.name       : testFloat32Array0007
     * @tc.desc       : Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0007";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(100000);
        expect(float32Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0800
     * @tc.name       : testFloat32Array0008
     * @tc.desc       : Testing construct an object from an ArrayLike.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0900
     * @tc.name       : testFloat32Array0009
     * @tc.desc       : Testing construct an object from an ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Float32Array = new collections.Float32Array(arrayBuffer);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1000
     * @tc.name       : testFloat32Array0010
     * @tc.desc       : Testing construct an object from another ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let int32Array: collections.Int32Array = new collections.Int32Array(arrayLike);
        let array: collections.Float32Array = new collections.Float32Array(int32Array);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1100
     * @tc.name       : testFloat32Array0011
     * @tc.desc       : Testing create an ArrayBuffer with an empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1200
     * @tc.name       : testFloat32Array0012
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1300
     * @tc.name       : testFloat32Array0013
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1400
     * @tc.name       : testFloat32Array0014
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1500
     * @tc.name       : testFloat32Array0015
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0015";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1600
     * @tc.name       : testFloat32Array0016
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0016";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1700
     * @tc.name       : testFloat32Array0017
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0017";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1800
     * @tc.name       : testFloat32Array0018
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0018";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1900
     * @tc.name       : testFloat32Array0019
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0019";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2000
     * @tc.name       : testFloat32Array0020
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0020";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2100
     * @tc.name       : testFloat32Array0021
     * @tc.desc       : Testing the 'from' interface with an array-like structure [1.5, 3.5, 5.5].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0021";
      try {
        let arrayLike = [1.5, 3.5, 5.5];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        expect(array.toString()).assertEqual('1.5,3.5,5.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2200
     * @tc.name       : testFloat32Array0022
     * @tc.desc       : Testing the 'from' interface with an array-like structure [].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0022";
      try {
        let arrayLike = [];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2300
     * @tc.name       : testFloat32Array0023
     * @tc.desc       : Testing the array-like map function created from an object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0023";
      try {
        let array: collections.Float32Array = collections.Float32Array.from<number>(
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2400
     * @tc.name       : testFloat32Array0024
     * @tc.desc       : Testing the array-like map function created from a character array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0024";
      try {
        let array: Float32Array = Float32Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2500
     * @tc.name       : testFloat32Array0025
     * @tc.desc       : Testing the array-like map function created from a string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0025";
      try {
        let array: Float32Array = Float32Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2600
     * @tc.name       : testFloat32Array0026
     * @tc.desc       : Testing the array-like map function created from a num array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0026";
      try {
        let array: collections.Float32Array = collections.Float32Array.from<number>(
          [1.1, 3.3, 5.5], (v: number, k: number) => v
        );
        expect(array.toString()).assertEqual('1.100000023841858,3.299999952316284,5.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2700
     * @tc.name       : testFloat32Array0027
     * @tc.desc       : Testing the array-like map function created from a nesting array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0027";
      try {
        let nestedArray: number[][] = [[1.1, 2.2], [3.3, 4.4], [5.5, 6.6]];
        let array: collections.Float32Array = collections.Float32Array.from<number>(
          ([] as number[]).concat(...nestedArray),
          (v: number) => v
        );
        expect(array.toString())
          .assertEqual('1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432,5.5,6.599999904632568');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2800
     * @tc.name       : testFloat32Array0028
     * @tc.desc       : Testing the array-like map function without specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Float32Array = collections.Float32Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2900
     * @tc.name       : testFloat32Array0029
     * @tc.desc       : Testing the array-like map function with specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Float32Array = collections.Float32Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3000
     * @tc.name       : testFloat32Array0030
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0030";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3100
     * @tc.name       : testFloat32Array0031
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0031";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3200
     * @tc.name       : testFloat32Array0032
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0032";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3300
     * @tc.name       : testFloat32Array0033
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0033";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3400
     * @tc.name       : testFloat32Array0034
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0034";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3500
     * @tc.name       : testFloat32Array0035
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0035";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3600
     * @tc.name       : testFloat32Array0036
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0036";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3700
     * @tc.name       : testFloat32Array0037
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0037";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3800
     * @tc.name       : testFloat32Array0038
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0038";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3900
     * @tc.name       : testFloat32Array0039
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0039";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4000
     * @tc.name       : testFloat32Array0040
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0040";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4100
     * @tc.name       : testFloat32Array0041
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0041";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4200
     * @tc.name       : testFloat32Array0042
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0042";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4300
     * @tc.name       : testFloat32Array0043
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0043";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4400
     * @tc.name       : testFloat32Array0044
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0044";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4500
     * @tc.name       : testFloat32Array0045
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0045";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4600
     * @tc.name       : testFloat32Array0046
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0046";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4700
     * @tc.name       : testFloat32Array0047
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0047";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4800
     * @tc.name       : testFloat32Array0048
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0048";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4900
     * @tc.name       : testFloat32Array0049
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0049";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5000
     * @tc.name       : testFloat32Array0050
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0050";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5100
     * @tc.name       : testFloat32Array0051
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0051";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5200
     * @tc.name       : testFloat32Array0052
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0052";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5300
     * @tc.name       : testFloat32Array0053
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0053";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5400
     * @tc.name       : testFloat32Array0054
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0054";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5500
     * @tc.name       : testFloat32Array0055
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0055";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5600
     * @tc.name       : testFloat32Array0056
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0056";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5700
     * @tc.name       : testFloat32Array0057
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0057";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5800
     * @tc.name       : testFloat32Array0058
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0058";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5900
     * @tc.name       : testFloat32Array0059
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0059";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6000
     * @tc.name       : testFloat32Array0060
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0060";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6100
     * @tc.name       : testFloat32Array0061
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0061";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6200
     * @tc.name       : testFloat32Array0062
     * @tc.desc       : Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0062";
      try {
        let arrayLike = [12.7, 20.4, 300.5, -5.9, 127.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element < -5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6300
     * @tc.name       : testFloat32Array0063
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0063";
      try {
        let arrayLike = [12.7, 20.4, 300.5, -5.9, 127.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element == 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6400
     * @tc.name       : testFloat32Array0064
     * @tc.desc       : Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0064";
      try {
        let arrayLike = [10.5, 20.8, 30.1, 40.2, 50.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6500
     * @tc.name       : testFloat32Array0065
     * @tc.desc       : Testing whether it returns true when all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0065";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element < 10.0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6600
     * @tc.name       : testFloat32Array0066
     * @tc.desc       : Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0066";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element < 0.0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6700
     * @tc.name       : testFloat32Array0067
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0067";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element > 5.0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6800
     * @tc.name       : testFloat32Array0068
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let float32Array1: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4);
        let float32Array2: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, 1);
        let float32Array3: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, 1, 2);
        expect(float32Array1.toString()).assertEqual('4,4,4');
        expect(float32Array2.toString()).assertEqual('1,4,4');
        expect(float32Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6900
     * @tc.name       : testFloat32Array0069
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, -1);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7000
     * @tc.name       : testFloat32Array0070
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7100
     * @tc.name       : testFloat32Array0071
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 2);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7200
     * @tc.name       : testFloat32Array0072
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 10);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7300
     * @tc.name       : testFloat32Array0073
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0073";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, -1);
        expect(float32Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7400
     * @tc.name       : testFloat32Array0074
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0074";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7500
     * @tc.name       : testFloat32Array0075
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0075";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 2);
        expect(float32Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7600
     * @tc.name       : testFloat32Array0076
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0076";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 10);
        expect(float32Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7700
     * @tc.name       : testFloat32Array0077
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0077";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, -1);
        expect(float32Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7800
     * @tc.name       : testFloat32Array0078
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0078";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7900
     * @tc.name       : testFloat32Array0079
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0079";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 2);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8000
     * @tc.name       : testFloat32Array0080
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0080";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 10);
        expect(float32Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8100
     * @tc.name       : testFloat32Array0081
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0081";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 10, -1);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8200
     * @tc.name       : testFloat32Array0082
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0082";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 10, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8300
     * @tc.name       : testFloat32Array0083
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0083";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 10, 2);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8400
     * @tc.name       : testFloat32Array0084
     * @tc.desc       : Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0084";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 10, 10);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8500
     * @tc.name       : testFloat32Array0085
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let filtered: collections.Float32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8600
     * @tc.name       : testFloat32Array0086
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0086";
      try {
        let arrayLike = [];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let filtered: collections.Float32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8700
     * @tc.name       : testFloat32Array0087
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let filtered1: collections.Float32Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Float32Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8800
     * @tc.name       : testFloat32Array0088
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8900
     * @tc.name       : testFloat32Array0089
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0089";
      try {
        let arrayLike = [];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9000
     * @tc.name       : testFloat32Array0090
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9100
     * @tc.name       : testFloat32Array0091
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9200
     * @tc.name       : testFloat32Array0092
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9300
     * @tc.name       : testFloat32Array0093
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9400
     * @tc.name       : testFloat32Array0094
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Float32Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9500
     * @tc.name       : testFloat32Array0095
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0095";
      try {
        const array: collections.Float32Array = collections.Float32Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9600
     * @tc.name       : testFloat32Array0096
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0096";
      try {
        const array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9700
     * @tc.name       : testFloat32Array0097
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0097";
      try {
        const array: collections.Float32Array = collections.Float32Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9800
     * @tc.name       : testFloat32Array0098
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0098";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([]);
        let res = false;
        float32Array.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(float32Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_9900
     * @tc.name       : testFloat32Array0099
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0099";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.5, 3]);
        let res = false;
        float32Array.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2.5,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10000
     * @tc.name       : testFloat32Array0100
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0100";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.5, 3.7, 4.9, 5]);
        float32Array.set([5, 6], 2);
        let res = false;
        float32Array.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2.5,5,6,5');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10100
     * @tc.name       : testFloat32Array0101
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0101";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10200
     * @tc.name       : testFloat32Array0102
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0102";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10300
     * @tc.name       : testFloat32Array0103
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0103";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10400
     * @tc.name       : testFloat32Array0104
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0104";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10500
     * @tc.name       : testFloat32Array0105
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0105";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10600
     * @tc.name       : testFloat32Array0106
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0106";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10700
     * @tc.name       : testFloat32Array0107
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0107";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10800
     * @tc.name       : testFloat32Array0108
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0108";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_10900
     * @tc.name       : testFloat32Array0109
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0109";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11000
     * @tc.name       : testFloat32Array0110
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0110";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11100
     * @tc.name       : testFloat32Array0111
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0111";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11200
     * @tc.name       : testFloat32Array0112
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0112";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11300
     * @tc.name       : testFloat32Array0113
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0113";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11400
     * @tc.name       : testFloat32Array0114
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0114";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11500
     * @tc.name       : testFloat32Array0115
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0115";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11600
     * @tc.name       : testFloat32Array0116
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0116";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11700
     * @tc.name       : testFloat32Array0117
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0117";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11800
     * @tc.name       : testFloat32Array0118
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0118";
      try {
        let array: collections.Float32Array = new collections.Float32Array([]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_11900
     * @tc.name       : testFloat32Array0119
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0119";
      try {
        let array: collections.Float32Array = new collections.Float32Array([25, 36, 49]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,7");
        expect(mapped.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12000
     * @tc.name       : testFloat32Array0120
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0120";
      try {
        let array: collections.Float32Array = new collections.Float32Array([25, 36, 49, 100, 256]);
        array.set([81, 64], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,9,8,16");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12100
     * @tc.name       : testFloat32Array0121
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0121";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12200
     * @tc.name       : testFloat32Array0122
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0122";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12300
     * @tc.name       : testFloat32Array0123
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0123";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12400
     * @tc.name       : testFloat32Array0124
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0124";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12500
     * @tc.name       : testFloat32Array0125
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0125";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
        let reversed: collections.Float32Array = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12600
     * @tc.name       : testFloat32Array0126
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0126";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Float32Array = array.reverse();
        expect(reversed.toString()).assertEqual('5,4,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12700
     * @tc.name       : testFloat32Array0127
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0127";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Float32Array = array.reverse();
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12800
     * @tc.name       : testFloat32Array0128
     * @tc.desc       : Testing the set of Float32Array, offset is null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0128";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.2, 3.3, 5.2]);
        expect(arrList.toString()).assertEqual("1.2000000476837158,3.299999952316284,5.199999809265137,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_12900
     * @tc.name       : testFloat32Array0129
     * @tc.desc       : Testing the set of Float32Array, offset is null, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0129";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.3, 3.2, 5.5]);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1.2999999523162842,3.200000047683716,5.5,0,0,0,0,0");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13000
     * @tc.name       : testFloat32Array0130
     * @tc.desc       : Testing the set of Float32Array, offset is -1, return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0130";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.1, 3.2, 5.2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The targetOffset of This value is less than 0.");
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13100
     * @tc.name       : testFloat32Array0131
     * @tc.desc       : Testing the set of Float32Array, offset is 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0131";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.1, 3.3, 5.5], 0);
        expect(arrList.toString()).assertEqual("1.100000023841858,3.299999952316284,5.5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13200
     * @tc.name       : testFloat32Array0132
     * @tc.desc       : Testing the set of Float32Array, offset is 0, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0132";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.1, 3.2, 5.3], 0);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1.100000023841858,3.200000047683716,5.300000190734863,0,0,0,0,0");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13300
     * @tc.name       : testFloat32Array0133
     * @tc.desc       : Testing the set of Float32Array, offset is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0133";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.1, 3.3, 5.5], 2);
        expect(arrList.toString()).assertEqual("0,0,1.100000023841858,3.299999952316284,5.5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13400
     * @tc.name       : testFloat32Array0134
     * @tc.desc       : Testing the set of Float32Array, offset is 2, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0134";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1.1, 3.2, 5.3], 2);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Float32Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("0,0,1.100000023841858,3.200000047683716,5.300000190734863,0,0,0");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13500
     * @tc.name       : testFloat32Array0135
     * @tc.desc       : Testing the set of Float32Array, offset is 10(overstep), return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0135";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Float32Array = new collections.Float32Array(buf);
        arrList.set([1, 3, 5], 10);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The sum of length and targetOffset is greater than targetLength.");
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13600
     * @tc.name       : testFloat32Array0136
     * @tc.desc       : Testing the Slice of Float32Array, array is null, start is 1, end is 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0136";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array();
        let arrListNew = arrList.slice(1, 3);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13700
     * @tc.name       : testFloat32Array0137
     * @tc.desc       : Testing the Slice of Float32Array, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0137";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array();
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13800
     * @tc.name       : testFloat32Array0138
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0138";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice();
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432,5.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_13900
     * @tc.name       : testFloat32Array0139
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0139";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(undefined, undefined);
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432,5.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14000
     * @tc.name       : testFloat32Array0140
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, parameter is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0140";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(-1);
        expect(arrListNew.toString()).assertEqual("5.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14100
     * @tc.name       : testFloat32Array0141
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0141";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14200
     * @tc.name       : testFloat32Array0142
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is -1, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0142";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(-1, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14300
     * @tc.name       : testFloat32Array0143
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is 0, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0143";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(0, -1);
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14400
     * @tc.name       : testFloat32Array0144
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, parameter is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0144";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(2);
        expect(arrListNew.toString()).assertEqual("3.299999952316284,4.400000095367432,5.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14500
     * @tc.name       : testFloat32Array0145
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, parameter is 10(overstep).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0145";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14600
     * @tc.name       : testFloat32Array0146
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0146";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14700
     * @tc.name       : testFloat32Array0147
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is 2, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0147";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(2, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14800
     * @tc.name       : testFloat32Array0148
     * @tc.desc       : Testing the Slice of Float32Array, array is not null, start is 2, end is 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0148";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
        let arrListNew = arrList.slice(2, 4);
        expect(arrListNew.toString()).assertEqual("3.299999952316284,4.400000095367432");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_14900
     * @tc.name       : testFloat32Array0149
     * @tc.desc       : Testing the sort of Float32Array, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0149";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array();
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15000
     * @tc.name       : testFloat32Array0150
     * @tc.desc       : Testing the sort of Float32Array, array is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0150";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array();
        let arrListNew = arrList.sort((a: number, b: number) => a - b);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15100
     * @tc.name       : testFloat32Array0151
     * @tc.desc       : Testing the sort of Float32Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0151";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([5.1, 2.1, 3.1, 4.1, 1.1]);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,2.0999999046325684,3.0999999046325684,4.099999904632568,5.099999904632568");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15200
     * @tc.name       : testFloat32Array0152
     * @tc.desc       : Testing the sort of Float32Array, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0152";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([5.1, 2.1, 3.1, 4.1, 1.1]);
        let arrListNew = arrList.sort(undefined);
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,2.0999999046325684,3.0999999046325684,4.099999904632568,5.099999904632568");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15300
     * @tc.name       : testFloat32Array0153
     * @tc.desc       : Testing the sort of Float32Array, array is not null, parameter is grade down.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0153";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([5.1, 2.1, 3.1, 4.1, 1.1]);
        let arrListNew = arrList.sort((a: number, b: number) => b - a);
        expect(arrListNew.toString())
          .assertEqual("5.099999904632568,4.099999904632568,3.0999999046325684,2.0999999046325684,1.100000023841858");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15400
     * @tc.name       : testFloat32Array0154
     * @tc.desc       : Testing the sort of Float32Array, array is not null, set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0154";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([5.1, 2.1, 3.1, 4.1, 1.1]);
        arrList.set([7.1, 9.1, 8.1], 2);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString())
          .assertEqual("2.0999999046325684,5.099999904632568,7.099999904632568,8.100000381469727,9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15500
     * @tc.name       : testFloat32Array0155
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0155";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray();
        expect(arrListNew.toString())
          .assertEqual("1.100000023841858,3.0999999046325684,5.099999904632568,7.099999904632568,9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15600
     * @tc.name       : testFloat32Array0156
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is -1, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0156";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(-1);
        expect(arrListNew.toString()).assertEqual("9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15700
     * @tc.name       : testFloat32Array0157
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0157";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15800
     * @tc.name       : testFloat32Array0158
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is -1, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0158";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(-1, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_15900
     * @tc.name       : testFloat32Array0159
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is -1, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0159";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(-1, 7);
        expect(arrListNew.toString()).assertEqual("9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16000
     * @tc.name       : testFloat32Array0160
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is 2, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0160";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(2);
        expect(arrListNew.toString()).assertEqual("5.099999904632568,7.099999904632568,9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16100
     * @tc.name       : testFloat32Array0161
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is 2, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0161";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(2, -1);
        expect(arrListNew.toString()).assertEqual("5.099999904632568,7.099999904632568");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16200
     * @tc.name       : testFloat32Array0162
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0162";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16300
     * @tc.name       : testFloat32Array0163
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is 2, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0163";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(2, 10);
        expect(arrListNew.toString()).assertEqual("5.099999904632568,7.099999904632568,9.100000381469727");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16400
     * @tc.name       : testFloat32Array0164
     * @tc.desc       : Testing the subarray of Float32Array, array is not null, begin is overstep, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0164";
      try {
        let arrList: collections.Float32Array = new collections.Float32Array([1.1, 3.1, 5.1, 7.1, 9.1]);
        let arrListNew = arrList.subarray(7, 10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16500
     * @tc.name       : testFloat32Array0165
     * @tc.desc       : Testing Collections of Float32array, array is [], at(1), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0165";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array();
        console.info("float32Array: " + float32Array);
        expect(float32Array.at(1)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16600
     * @tc.name       : testFloat32Array0166
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1], at(3), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0166";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1]);
        console.info("float32Array: " + float32Array);
        expect(float32Array.at(3)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16700
     * @tc.name       : testFloat32Array0167
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], at(-1), return element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0167";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array: " + float32Array);
        expect(float32Array.at(-1)).assertEqual(5.0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16800
     * @tc.name       : testFloat32Array0168
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], at(5), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0168";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array: " + float32Array);
        expect(float32Array.at(5)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_16900
     * @tc.name       : testFloat32Array0169
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], at(0), return element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0169";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.0, 4.0, 5.0]);
        console.info("float32Array: " + float32Array);
        expect(float32Array.at(0)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17000
     * @tc.name       : testFloat32Array0170
     * @tc.desc       : Testing Collections of Float32array, array is [], includes(2), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0170";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17100
     * @tc.name       : testFloat32Array0171
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], includes(5,-1), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0171";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(10, -1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17200
     * @tc.name       : testFloat32Array0172
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], includes(5.0,-1), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0172";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(5.0, -1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17300
     * @tc.name       : testFloat32Array0173
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], includes(10), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0173";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(10)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17400
     * @tc.name       : testFloat32Array0174
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], includes(4.1), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0174";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17500
     * @tc.name       : testFloat32Array0175
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], includes(4.1,5), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0175";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.2, 4.1, 5.0]);
        console.info("float32Array includes: " + float32Array);
        expect(float32Array.includes(4.1, 5)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17600
     * @tc.name       : testFloat32Array0176
     * @tc.desc       : Testing Collections of Float32array, array is [], entries(), .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0176";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([]);
        let iterator: IterableIterator<[number, number]> = float32Array.entries();
        console.info("float32Array: " + float32Array);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17700
     * @tc.name       : testFloat32Array0177
     * @tc.desc       : Testing Collections of Float32array, array is [3.2, 4.1, 5.0], entries() .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0177";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([3.0, 4.1, 5.0]);
        let iterator: IterableIterator<[number, number]> = float32Array.entries();
        console.info("float32Array: " + float32Array);
        expect(iterator.next().value.toString()).assertEqual('0,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17800
     * @tc.name       : testFloat32Array0178
     * @tc.desc       : Testing Collections of Float32array, array is [], keys().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0178";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([]);
        let iterator: IterableIterator<number> = float32Array.keys();
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_17900
     * @tc.name       : testFloat32Array0179
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], keys(),iterator.next().value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0179";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        let iterator: IterableIterator<number> = float32Array.keys();
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18000
     * @tc.name       : testFloat32Array0180
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], keys(),for iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0180";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        let iterator: IterableIterator<number> = float32Array.keys();
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18100
     * @tc.name       : testFloat32Array0181
     * @tc.desc       : Testing Collections of Float32array, array is [], values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0181";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([]);
        let iterator: IterableIterator<number> = float32Array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18200
     * @tc.name       : testFloat32Array0182
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], values(),iterator.next().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0182";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        let iterator: IterableIterator<number> = float32Array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().value).assertEqual(1.0);
        expect(iterator.next().value).assertEqual(2.0);
        expect(iterator.next().value).assertEqual(3.0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18300
     * @tc.name       : testFloat32Array0183
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], values(),for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0183";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        let iterator: IterableIterator<number> = float32Array.values();
        console.info("iterator values:" + iterator);
        let tempNum: number = 1;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18400
     * @tc.name       : testFloat32Array0184
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], set array,values(),for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0184";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        float32Array.set([4, 5, 6]);
        let iterator: IterableIterator<number> = float32Array.values();
        console.info("float32Array values:" + float32Array);
        let tempNum: number = 4;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18500
     * @tc.name       : testFloat32Array0185
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], index < 0, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0185";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        console.info("float32Array is:" + float32Array);
        expect(float32Array[-1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18600
     * @tc.name       : testFloat32Array0186
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0], index > arrayLength, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0186";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        console.info("float32Array is:" + float32Array);
        expect(float32Array[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18700
     * @tc.name       : testFloat32Array0187
     * @tc.desc       : Testing Collections of Float32array, array is [1.0,2.0,3.0],
     * 0 <= index < arrayLength, array[index] = array element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32Array0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0187";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1.0, 2.0, 3.0]);
        console.info("float32Array is:" + float32Array);
        expect(float32Array[1]).assertEqual(2.0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18800
     * @tc.name       : testFloat32ArrayReduceRight0001
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayReduceRight0001";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_18900
     * @tc.name       : testFloat32ArrayReduceRight0002
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayReduceRight0002";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19000
     * @tc.name       : testFloat32ArrayReduceRight0003
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayReduceRight0003";
      try {
        const array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19100
     * @tc.name       : testFloat32ArrayReduceRight0004
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayReduceRight0004";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19200
     * @tc.name       : testFloat32ArrayToLocaleString0001
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testFloat32ArrayToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayToLocaleString0001";
      try {
        const array1 = new collections.Float32Array();
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19500
     * @tc.name       : testFloat32ArrayToLocaleString0002
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testFloat32ArrayToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayToLocaleString0002";
      try {
        const array1 = new collections.Float32Array(1);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19501
     * @tc.name       : testFloat32ArrayToLocaleString0003
     * @tc.desc       : Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testFloat32ArrayToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayToLocaleString0003";
      try {
        const array1 = new collections.Float32Array([1,2,3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19600
     * @tc.name       : testFloat32ArrayLastIndexOf0001
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0001";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19700
     * @tc.name       : testFloat32ArrayLastIndexOf0002
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0002";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19800
     * @tc.name       : testFloat32ArrayLastIndexOf0003
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0003";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_19900
     * @tc.name       : testFloat32ArrayLastIndexOf0004
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0004";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20000
     * @tc.name       : testFloat32ArrayLastIndexOf0005
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0005";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20200
     * @tc.name       : testFloat32ArrayLastIndexOf0006
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0006";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20300
     * @tc.name       : testFloat32ArrayLastIndexOf0007
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0007";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20100
     * @tc.name       : testFloat32ArrayLastIndexOf0008
     * @tc.desc       : Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayLastIndexOf0008";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20400
     * @tc.name       : testFloat32ArrayOf0001
     * @tc.desc       : Test the function of the interface Of
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayOf0001";
      try {
        let result = collections.Float32Array.of(1);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_20500
     * @tc.name       : testFloat32ArrayOf0002
     * @tc.desc       : Test the function of the interface Of
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat32ArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32ArrayOf0002";
      try {
        let result = collections.Float32Array.of(1, 2, 3);
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../../testability/TestUtils';

export default function Int8ArrayTest() {
  describe('Int8ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(20);
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
     * @tc.name   testInt8Array0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0100
     * @tc.desc   Testing the iterative ability of Int8Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0001";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int8Array.set(expectedValues);
        for (let i = 0; i < expectedValues.length; i++) {
          expect(int8Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0200
     * @tc.desc   Testing the iterative ability of Int8Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0002";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int8Array.set(expectedValues);
        const normalArray: number[] = [...int8Array];
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
     * @tc.name   testInt8Array0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0003";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array();
        expect(int8Array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0004";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0005";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(0);
        expect(int8Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0006";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        expect(int8Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0007";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(100000);
        expect(int8Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Int8Array = new collections.Int8Array(arrayBuffer);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
        let array: collections.Int8Array = new collections.Int8Array(uint8Array);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0015";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0016";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0017";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0018";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0019";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0020";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 2);
        expect(array.toString()).assertEqual('0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0022";
      try {
        let arrayLike = [];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0023";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<number>(
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
     * @tc.name   testInt8Array0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0024";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2500
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0025";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2600
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0026";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<number>(
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
     * @tc.name   testInt8Array0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2700
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Int8Array = collections.Int8Array.from<number>(
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
     * @tc.name   testInt8Array0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int8Array = collections.Int8Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int8Array = collections.Int8Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0030";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0031";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0032";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0033";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0034";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0035";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0036";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0037";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0038";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0039";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0040";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0041";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0042";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0043";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0044";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0045";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0046";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0047";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0048";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0049";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0050";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0051";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0052";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0053";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0054";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0055";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0056";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0057";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0058";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0059";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0060";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0061";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int8Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0062";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.some((element: number) => element < 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0063";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.some((element: number) => element > 40)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0064";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.some((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6500
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0065";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.every((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0066";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.every((element: number) => element < 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0067";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(int8Array.every((element: number) => element > 40)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let int8Array1: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4);
        let int8Array2: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 1);
        let int8Array3: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 1, 2);
        expect(int8Array1.toString()).assertEqual('4,4,4');
        expect(int8Array2.toString()).assertEqual('1,4,4');
        expect(int8Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, -1);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 0);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 2);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 10);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 0, -1);
        expect(int8Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 0);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 2);
        expect(int8Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 10);
        expect(int8Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 2, -1);
        expect(int8Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 0);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 2);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 10);
        expect(int8Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 10, -1);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 0);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 2);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 10);
        expect(int8Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let filtered: collections.Int8Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0086";
      try {
        let arrayLike = [];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let filtered: collections.Int8Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let filtered1: collections.Int8Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Int8Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0089";
      try {
        let arrayLike = [];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
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
     * @tc.name   testInt8Array0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let res = array.find((index: number) => index == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let res = array.find((index: number) => index == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9400
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Int8Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9500
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0095";
      try {
        const array: collections.Int8Array = collections.Int8Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9600
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0096";
      try {
        const array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9700
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0097";
      try {
        const array: collections.Int8Array = collections.Int8Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9800
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0098";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([]);
        let res = false;
        int8Array.forEach((value: number, index: number, array: collections.Int8Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(int8Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_9900
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0099";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let res = false;
        int8Array.forEach((value: number, index: number, array: collections.Int8Array) => {
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
     * @tc.name   testInt8Array0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10000
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0100";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        int8Array.set([5, 6], 2);
        let res = false;
        int8Array.forEach((value: number, index: number, array: collections.Int8Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,5,6,5');
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
     * @tc.name   testInt8Array0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10100
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0101";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10200
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0102";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10300
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0103";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
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
     * @tc.name   testInt8Array0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10400
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0104";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10500
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0105";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10600
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0106";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10700
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0107";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10800
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0108";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_10900
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0109";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11000
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0110";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11100
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0111";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11200
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0112";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11300
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0113";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11400
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0114";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11500
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0115";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11600
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0116";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11700
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0117";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11800
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0118";
      try {
        let array: collections.Int8Array = new collections.Int8Array([]);
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
     * @tc.name   testInt8Array0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_11900
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0119";
      try {
        let array: collections.Int8Array = new collections.Int8Array([25, 36, 49]);
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
     * @tc.name   testInt8Array0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12000
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0120";
      try {
        let array: collections.Int8Array = new collections.Int8Array([25, 36, 49, 100, 256]);
        array.set([81, 64], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,9,8,0");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0121";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12200
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0122";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8Array0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12300
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0123";
      try {
        const array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8Array0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12400
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0124";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8Array0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12500
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0125";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let reversed: collections.Int8Array = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12600
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0126";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Int8Array = array.reverse();
        expect(reversed.toString()).assertEqual('5,4,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12700
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0127";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Int8Array = array.reverse();
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
     * @tc.name   testInt8Array0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12800
     * @tc.desc   Testing the set of int8Array, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0128";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5]);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_12900
     * @tc.desc   Testing the set of int8Array, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0129";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5]);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int8Array) => {
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
     * @tc.name   testInt8Array0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13000
     * @tc.desc   Testing the set of int8Array, offset is -1, return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0130";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The targetOffset of This value is less than 0.");
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13100
     * @tc.desc   Testing the set of int8Array, offset is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0131";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], 0);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13200
     * @tc.desc   Testing the set of int8Array, offset is 0, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0132";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], 0);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int8Array) => {
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
     * @tc.name   testInt8Array0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13300
     * @tc.desc   Testing the set of int8Array, offset is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0133";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], 2);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13400
     * @tc.desc   Testing the set of int8Array, offset is 2, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0134";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], 2);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int8Array) => {
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
     * @tc.name   testInt8Array0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13500
     * @tc.desc   Testing the set of int8Array, offset is 10(overstep), return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0135";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
        let arrList: collections.Int8Array = new collections.Int8Array(buf);
        arrList.set([1, 3, 5], 10);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The sum of length and targetOffset is greater than targetLength.");
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13600
     * @tc.desc   Testing the Slice of int8Array, array is null, start is 1, end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0136";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array();
        let arrListNew = arrList.slice(1, 3);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13700
     * @tc.desc   Testing the Slice of int8Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0137";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array();
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13800
     * @tc.desc   Testing the Slice of int8Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0138";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_13900
     * @tc.desc   Testing the Slice of int8Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0139";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(undefined, undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14000
     * @tc.desc   Testing the Slice of int8Array, array is not null, parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0140";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1);
        expect(arrListNew.toString()).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14100
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0141";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14200
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is -1, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0142";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14300
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is 0, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0143";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(0, -1);
        expect(arrListNew.toString()).assertEqual("1,2,3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14400
     * @tc.desc   Testing the Slice of int8Array, array is not null, parameter is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0144";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2);
        expect(arrListNew.toString()).assertEqual("3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14500
     * @tc.desc   Testing the Slice of int8Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0145";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14600
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0146";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14700
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is 2, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0147";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14800
     * @tc.desc   Testing the Slice of int8Array, array is not null, start is 2, end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0148";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 4);
        expect(arrListNew.toString()).assertEqual("3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testInt8Array0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_14900
     * @tc.desc   Testing the sort of int8Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0149";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array();
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15000
     * @tc.desc   Testing the sort of int8Array, array is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0150";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array();
        let arrListNew = arrList.sort((a: number, b: number) => a - b);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15100
     * @tc.desc   Testing the sort of int8Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0151";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15200
     * @tc.desc   Testing the sort of int8Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0152";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort(undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15300
     * @tc.desc   Testing the sort of int8Array, array is not null, parameter is grade down.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0153";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort((a: number, b: number) => b - a);
        expect(arrListNew.toString()).assertEqual("5,4,3,2,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15400
     * @tc.desc   Testing the sort of int8Array, array is not null, set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0154";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([5, 2, 3, 4, 1]);
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
     * @tc.name   testInt8Array0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15500
     * @tc.desc   Testing the subarray of int8Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0155";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray();
        expect(arrListNew.toString()).assertEqual("1,3,5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15600
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is -1, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0156";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15700
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0157";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15800
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is -1, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0158";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_15900
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is -1, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0159";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 7);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16000
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is 2, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0160";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16100
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is 2, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0161";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, -1);
        expect(arrListNew.toString()).assertEqual("5,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16200
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0162";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16300
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is 2, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0163";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 10);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16400
     * @tc.desc   Testing the subarray of int8Array, array is not null, begin is overstep, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0164";
      try {
        let arrList: collections.Int8Array = new collections.Int8Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(7, 10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16500
     * @tc.desc   Testing Collections of int8array, array is [], at(1), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0165";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        console.info("array: " + array);
        expect(array.at(1)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16600
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], at(3), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0166";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(3)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16700
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], at(-1), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0167";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(-1)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16800
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], at(5), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0168";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(5)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_16900
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], at(0), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0169";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17000
     * @tc.desc   Testing Collections of int8array, array is [], includes(2), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0170";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        console.info("array includes: " + array);
        expect(array.includes(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17100
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], includes(5,-1), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0171";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(5, -1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17200
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], includes(3,-1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0172";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(3, -1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17300
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], includes(10), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0173";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(10)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17400
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], includes(1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0174";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17500
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], includes(1,5), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0175";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1, 5)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17600
     * @tc.desc   Testing Collections of int8array, array is [], entries(), undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0176";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let iterator: IterableIterator<[number, number]> = array.entries();
        console.info("array includes: " + array);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17700
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], entries() .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0177";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let iterator: IterableIterator<[number, number]> = array.entries();
        console.info("array includes: " + array);
        expect(iterator.next().value.toString()).assertEqual('0,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17800
     * @tc.desc   Testing Collections of int8array, array is [], keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0178";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let iterator: IterableIterator<number> = array.keys();
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
     * @tc.name   testInt8Array0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_17900
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], keys(),iterator.next().value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0179";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([-1, 2, 3]);
        let iterator: IterableIterator<number> = array.keys();
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
     * @tc.name   testInt8Array0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18000
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], keys(),for iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0180";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.keys();
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
     * @tc.name   testInt8Array0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18100
     * @tc.desc   Testing Collections of int8array, array is [], values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0181";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18200
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], values(),iterator.next().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0182";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
        expect(iterator.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18300
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0183";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.values();
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
     * @tc.name   testInt8Array0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18400
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], set array,values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0184";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        array.set([4, 5, 6]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
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
     * @tc.name   testInt8Array0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18500
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0185";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[-1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18600
     * @tc.desc   Testing Collections of int8array, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0186";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18700
     * @tc.desc   Testing Collections of int8array, array is [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0187";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8ArrayReduceRight0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18800
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayReduceRight0001";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
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
     * @tc.name   testInt8ArrayReduceRight0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_18900
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayReduceRight0002";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8ArrayReduceRight0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19000
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayReduceRight0003";
      try {
        const array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8ArrayReduceRight0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayReduceRight0004";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testInt8ArrayToLocaleString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19200
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayToLocaleString0001";
      try {
        const array1 = new collections.Int8Array();
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
     * @tc.name   testInt8ArrayToLocaleString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19500
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayToLocaleString0002";
      try {
        const array1 = new collections.Int8Array(1);
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
     * @tc.name   testInt8ArrayToLocaleString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19501
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayToLocaleString0003";
      try {
        const array1 = new collections.Int8Array([1,2,3]);
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
     * @tc.name   testInt8ArrayLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19600
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0001";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([]);
        let res : number = array.lastIndexOf(3);
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
     * @tc.name   testInt8ArrayLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19700
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0002";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        let res : number = array.lastIndexOf(4);
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
     * @tc.name   testInt8ArrayLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19800
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0003";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        array.set([4, 5], 1);
        let res : number = array.lastIndexOf(4);
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
     * @tc.name   testInt8ArrayLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_19900
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0004";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res : number = array.lastIndexOf(3, -1);
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
     * @tc.name   testInt8ArrayLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20000
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0005";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res : number = array.lastIndexOf(3, 5);
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
     * @tc.name   testInt8ArrayLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20200
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0006";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res : number = array.lastIndexOf(3, 3);
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
     * @tc.name   testInt8ArrayLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20300
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0007";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res : number = array.lastIndexOf(3, 2);
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
     * @tc.name   testInt8ArrayLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20100
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayLastIndexOf0008";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res : number = array.lastIndexOf(3);
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
     * @tc.name   testInt8ArrayOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20400
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayOf0001";
      try {
        let result : collections.Int8Array = collections.Int8Array.of(1);
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
     * @tc.name   testInt8ArrayOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_20500
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8ArrayOf0002";
      try {
        let result : collections.Int8Array = collections.Int8Array.of(1, 2, 3);
        expect(result.toString()).assertEqual('1,2,3');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });

    /**
     * @tc.name   testInt8ArrayMissing0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0100
     * @tc.desc   Testing 'from' return properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Int8Array = collections.Int8Array.from([1,2,3]);
      expect(array.toString()).assertEqual('1,2,3');
      expect(array[1]).assertEqual(2);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(3);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testInt8ArrayMissing0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0200
     * @tc.desc   Testing 'from' return properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Int8Array = collections.Int8Array.from<string>(
        ["1", "3", "5"], (v: string, k: number) => parseInt(v));
      expect(array.toString()).assertEqual('1,3,5');
      expect(array[1]).assertEqual(3);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(3);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testInt8ArrayMissing0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0300
     * @tc.desc   Testing 'from' interface with undefined mapFn.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let myset = new Set([1, 3, 5]);
      let array: collections.Int8Array = collections.Int8Array.from(myset, undefined);
      expect(array.toString()).assertEqual('1,3,5');
      expect(array[1]).assertEqual(3);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(3);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testInt8ArrayMissing0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0400
     * @tc.desc   Testing 'copyWithin' with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      int8Array.copyWithin(0, 3, undefined);
      expect(int8Array[1]).assertEqual(5);
      expect(int8Array.toString()).assertEqual('4,5,3,4,5');
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(int8Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(int8Array.byteLength).assertEqual(5);
      expect(int8Array.byteOffset).assertEqual(0);
      expect(int8Array.length).assertEqual(5);
      done()
    })

    /**
     * @tc.name   testInt8ArrayMissing0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0500
     * @tc.desc   Testing 'fill' with undefined start parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      let result = int8Array.fill(9, undefined, 3);
      expect(int8Array[1]).assertEqual(9);
      expect(result.toString()).assertEqual('9,9,9,4,5');
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(int8Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(int8Array.byteLength).assertEqual(5);
      expect(int8Array.byteOffset).assertEqual(0);
      expect(int8Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0600
     * @tc.desc   Testing 'fill' with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      int8Array.fill(9, 1, undefined);
      expect(int8Array[1]).assertEqual(9);
      expect(int8Array.toString()).assertEqual('1,9,9,9,9');
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(int8Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(int8Array.byteLength).assertEqual(5);
      expect(int8Array.byteOffset).assertEqual(0);
      expect(int8Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0700
     * @tc.desc   Testing 'fill' with undefined start/end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      int8Array.fill(9, undefined, undefined);
      expect(int8Array[1]).assertEqual(9);
      expect(int8Array.toString()).assertEqual('9,9,9,9,9');
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(int8Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(int8Array.byteLength).assertEqual(5);
      expect(int8Array.byteOffset).assertEqual(0);
      expect(int8Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0800
     * @tc.desc   Testing 'filter' with undefined predicate parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayLike = [0, 1, 2, 3, 4];
      let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
      let filtered: collections.Int8Array = array.filter((element: number) => element % 2 == 0);
      expect(filtered.toString()).assertEqual('0,2,4');
      expect(filtered[1]).assertEqual(2);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(filtered.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(filtered.byteLength).assertEqual(3);
      expect(filtered.byteOffset).assertEqual(0);
      expect(filtered.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_0900
     * @tc.desc   Testing 'indexOf' with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.indexOf(3, undefined);
      expect(result).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1000
     * @tc.desc   Testing 'join' with undefined separator parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.join(undefined);
      expect(result).assertEqual('1,2,3,4,5');
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1100
     * @tc.desc   Testing 'join' with empty string separator parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.join('');
      expect(result).assertEqual('12345');
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1200
     * @tc.desc   Testing 'set' with undefined offset parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      int8Array.set([6, 7], undefined);
      expect(int8Array.toString()).assertEqual('6,7,3,4,5')
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1300
     * @tc.desc   Testing 'slice' with undefined start parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.slice(undefined,4);
      expect(result.toString()).assertEqual('1,2,3,4');
      expect(result[1]).assertEqual(2);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(4);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(4);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1400
     * @tc.desc   Testing 'slice' with null end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.slice();
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(result[1]).assertEqual(2);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(5);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1500
     * @tc.desc   Testing 'slice' with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.slice(4, undefined);
      expect(result.toString()).assertEqual('5');
      expect(result[0]).assertEqual(5);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(1);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1600
     * @tc.desc   Testing 'sort' with undefined compareFn parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([5, 3, 1, 4, 2]);
      int8Array.sort(undefined);
      expect(int8Array.toString()).assertEqual('1,2,3,4,5');
      expect(int8Array[0]).assertEqual(1);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(int8Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(int8Array.byteLength).assertEqual(5);
      expect(int8Array.byteOffset).assertEqual(0);
      expect(int8Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1700
     * @tc.desc   Testing 'subarray' with undefined begin parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.subarray(undefined);
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(result[0]).assertEqual(1);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(5);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1800
     * @tc.desc   Testing 'subarray' with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.subarray(2, undefined);
      expect(result.toString()).assertEqual('3,4,5');
      expect(result[0]).assertEqual(3);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(3);
      expect(result.byteOffset).assertEqual(2);
      expect(result.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_1900
     * @tc.desc   Testing 'subarray' return properties: BYTES_PER_ELEMENT, buffer, byteLength, byteOffset, length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const subarray = int8Array.subarray(1, 4);
      expect(subarray.toString()).assertEqual('2,3,4');
      expect(subarray[0]).assertEqual(2);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(subarray.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(subarray.byteLength).assertEqual(3);
      expect(subarray.byteOffset).assertEqual(1);
      expect(subarray.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_2000
     * @tc.desc   Testing 'includes' with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.includes(3, undefined);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_2100
     * @tc.desc   Testing 'lastIndexOf' with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Array: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const result = int8Array.lastIndexOf(3, undefined);
      expect(result).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_2200
     * @tc.desc   Testing 'of' with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result : collections.Int8Array = collections.Int8Array.of(1, 2, 3);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result[0]).assertEqual(1);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(3);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_2300
     * @tc.desc   Testing 'of' with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Int8Array = new collections.Int8Array([25, 36, 49]);
      const mapped = array.map(Math.sqrt);
      expect(mapped.toString()).assertEqual("5,6,7");
      expect(mapped[0]).assertEqual(5);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(mapped.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(mapped.byteLength).assertEqual(3);
      expect(mapped.byteOffset).assertEqual(0);
      expect(mapped.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testInt8ArrayMissing0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_MISSING_2400
     * @tc.desc   Testing 'of' with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInt8ArrayMissing0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Int8Array = new collections.Int8Array([1,2,3,4,5]);
      const mapped = array.reverse();
      expect(mapped.toString()).assertEqual("5,4,3,2,1");
      expect(mapped[0]).assertEqual(5);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(mapped.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(mapped.byteLength).assertEqual(5);
      expect(mapped.byteOffset).assertEqual(0);
      expect(mapped.length).assertEqual(5);
      done();
    })
  })
}
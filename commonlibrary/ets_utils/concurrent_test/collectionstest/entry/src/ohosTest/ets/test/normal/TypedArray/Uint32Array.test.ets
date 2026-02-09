
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../../testability/TestUtils';

export default function Uint32ArrayTest() {
  describe('Uint32ArrayTest', () => {
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
     * @tc.name   testUint32Array0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0100
     * @tc.desc   Testing the iterative ability of Uint32Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0001";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint32Array.set(expectedValues);
        for (let i = 0; i < uint32Array.length; i++) {
          expect(uint32Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0200
     * @tc.desc   Testing the iterative ability of Uint32Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0002";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint32Array.set(expectedValues);
        const normalArray: number[] = [...uint32Array];
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
     * @tc.name   testUint32Array0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0003";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        expect(uint32Array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0004";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0005";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(0);
        expect(uint32Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0006";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        expect(uint32Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0007";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(100000);
        expect(uint32Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Uint32Array = new collections.Uint32Array(arrayBuffer);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let int32Array: collections.Int32Array = new collections.Int32Array(arrayLike);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0015";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0016";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0017";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0018";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0019";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0020";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0022";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0023";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0024";
      try {
        let array: Uint32Array = Uint32Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2500
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0025";
      try {
        let array: Uint32Array = Uint32Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2600
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0026";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2700
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint32Array = collections.Uint32Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint32Array = collections.Uint32Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0030";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0031";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0032";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0033";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0034";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0035";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0036";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0037";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0038";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0039";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0040";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0041";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0042";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0043";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0044";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0045";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0046";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0047";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0048";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0049";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0050";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0051";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0052";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0053";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0054";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0055";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0056";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0057";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0058";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0059";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0060";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0061";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0062";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element == 4294967286)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0063";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element < 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0064";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element >= 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6500
     * @tc.desc   Testing whether it returns true when all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0065";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element >= 20)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0066";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element < 30)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0067";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element < 20)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let uint32Array1: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4);
        let uint32Array2: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1);
        let uint32Array3: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1, 2);
        expect(uint32Array1.toString()).assertEqual('4,4,4');
        expect(uint32Array2.toString()).assertEqual('1,4,4');
        expect(uint32Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, -1);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 10);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, -1);
        expect(uint32Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 2);
        expect(uint32Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 10);
        expect(uint32Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, -1);
        expect(uint32Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 10);
        expect(uint32Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, -1);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 10);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered: collections.Uint32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0086";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered: collections.Uint32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered1: collections.Uint32Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Uint32Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0089";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
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
     * @tc.name   testUint32Array0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9400
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Uint32Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9500
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0095";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9600
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0096";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9700
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0097";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9800
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0098";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([]);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(uint32Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_9900
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0099";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10000
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0100";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        uint32Array.set([5, 6], 2);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10100
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0101";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10200
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0102";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10300
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0103";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_104000
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0104";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_105000
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0105";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_106000
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0106";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1070000
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0107";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10800000
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0108";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_10900
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0109";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_110000000
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0110";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11100
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0111";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11200
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0112";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11300
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0113";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11400
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0114";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11500
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0115";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11600
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0116";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11700
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0117";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11800
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0118";
      try {
        let array: collections.Uint32Array = new collections.Uint32Array([]);
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
     * @tc.name   testUint32Array0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_11900
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0119";
      try {
        let array: collections.Uint32Array = new collections.Uint32Array([25, -4294967260, 49]);
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
     * @tc.name   testUint32Array0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_120000000
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0120";
      try {
        let array: collections.Uint32Array = new collections.Uint32Array([25, -4294967260, 49, 100, 256]);
        array.set([-333, 64], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,65535,8,16");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0121";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12200
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0122";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32Array0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12300
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0123";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32Array0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12400
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0124";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32Array0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12500
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0125";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        let reversed: collections.Uint32Array = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12600
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0126";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Uint32Array = array.reverse();
        expect(reversed.toString()).assertEqual('5,4,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12700
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0127";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Uint32Array = array.reverse();
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
     * @tc.name   testUint32Array0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12800
     * @tc.desc   Testing the set of int8Array, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0128";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5]);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_12900
     * @tc.desc   Testing the set of Uint32Array, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0129";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5]);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13000
     * @tc.desc   Testing the set of Uint32Array, offset is -1, return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0130";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The targetOffset of This value is less than 0.");
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13100
     * @tc.desc   Testing the set of Uint32Array, offset is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0131";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], 0);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13200
     * @tc.desc   Testing the set of Uint32Array, offset is 0, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0132";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], 0);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13300
     * @tc.desc   Testing the set of Uint32Array, offset is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0133";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], 2);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13400
     * @tc.desc   Testing the set of Uint32Array, offset is 2, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0134";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], 2);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13500
     * @tc.desc   Testing the set of Uint32Array, offset is 10(overstep), return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0135";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(32);
        let arrList: collections.Uint32Array = new collections.Uint32Array(buf);
        arrList.set([1, 3, 5], 10);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The sum of length and targetOffset is greater than targetLength.");
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13600
     * @tc.desc   Testing the Slice of Uint32Array, array is null, start is 1, end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0136";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array();
        let arrListNew = arrList.slice(1, 3);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13700
     * @tc.desc   Testing the Slice of Uint32Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0137";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array();
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13800
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0138";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_13900
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0139";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(undefined, undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14000
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0140";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1);
        expect(arrListNew.toString()).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14100
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0141";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14200
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is -1, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0142";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14300
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is 0, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0143";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(0, -1);
        expect(arrListNew.toString()).assertEqual("1,2,3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14400
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, parameter is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0144";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2);
        expect(arrListNew.toString()).assertEqual("3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14500
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0145";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14600
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0146";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14700
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is 2, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0147";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_148000000
     * @tc.desc   Testing the Slice of Uint32Array, array is not null, start is 2, end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0148";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 4);
        expect(arrListNew.toString()).assertEqual("3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testUint32Array0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_14900
     * @tc.desc   Testing the sort of Uint32Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0149";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array();
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15000
     * @tc.desc   Testing the sort of Uint32Array, array is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0150";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array();
        let arrListNew = arrList.sort((a: number, b: number) => a - b);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15100
     * @tc.desc   Testing the sort of Uint32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0151";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15200
     * @tc.desc   Testing the sort of Uint32Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0152";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort(undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15300
     * @tc.desc   Testing the sort of Uint32Array, array is not null, parameter is grade down.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0153";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort((a: number, b: number) => b - a);
        expect(arrListNew.toString()).assertEqual("5,4,3,2,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15400
     * @tc.desc   Testing the sort of Uint32Array, array is not null, set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0154";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([5, 2, 3, 4, 1]);
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
     * @tc.name   testUint32Array0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15500
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0155";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray();
        expect(arrListNew.toString()).assertEqual("1,3,5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15600
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is -1, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0156";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15700
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0157";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15800
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is -1, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0158";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_15900
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is -1, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0159";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 7);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16000
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is 2, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0160";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16100
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is 2, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0161";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, -1);
        expect(arrListNew.toString()).assertEqual("5,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16200
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0162";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16300
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is 2, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0163";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 10);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16400
     * @tc.desc   Testing the subarray of Uint32Array, array is not null, begin is overstep, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0164";
      try {
        let arrList: collections.Uint32Array = new collections.Uint32Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(7, 10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16500
     * @tc.desc   Testing Collections of uint32array, array is [], at(1), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0165";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        console.info("array: " + array);
        expect(array.at(1)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16600
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], at(3), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0166";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(3)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16700
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], at(-1), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0167";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(-1)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16800
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], at(5), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0168";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(5)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_16900
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], at(0), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0169";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17000
     * @tc.desc   Testing Collections of uint32array, array is [], includes(2), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0170";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        console.info("array includes: " + array);
        expect(array.includes(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17100
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], includes(5,-1), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0171";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(5, -1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17200
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], includes(3,-1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0172";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(3, -1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17300
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], includes(10), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0173";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(10)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17400
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], includes(1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0174";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17500
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], includes(1,5), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0175";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1, 5)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17600
     * @tc.desc   Testing Collections of uint32array, array is [], entries(), .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0176";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32Array0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17700
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], entries() .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0177";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17800
     * @tc.desc   Testing Collections of uint32array, array is [], keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0178";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32Array0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_17900
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], keys(),iterator.next().value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0179";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18000
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], keys(),for iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0180";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32Array0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18100
     * @tc.desc   Testing Collections of uint32array, array is [], values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0181";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32Array0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18200
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], values(),iterator.next().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0182";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18300
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0183";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18400
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], set array,values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0184";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18500
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0185";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[-1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18600
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0186";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18700
     * @tc.desc   Testing Collections of uint32array, array is [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0187";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testUint32ArrayReduceRight0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18800
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayReduceRight0001";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32ArrayReduceRight0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_18900
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayReduceRight0002";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32ArrayReduceRight0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19000
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayReduceRight0003";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32ArrayReduceRight0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayReduceRight0004";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
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
     * @tc.name   testUint32ArrayToLocaleString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19200
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayToLocaleString0001";
      try {
        const array1 = new collections.Uint32Array();
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
     * @tc.name   testUint32ArrayToLocaleString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19500
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayToLocaleString0002";
      try {
        const array1 = new collections.Uint32Array(1);
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
     * @tc.name   testUint32ArrayToLocaleString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19501
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayToLocaleString0003";
      try {
        const array1 = new collections.Uint32Array([1,2,3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19600
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0001";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
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
     * @tc.name   testUint32ArrayLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19700
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0002";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19800
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0003";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_19900
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0004";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20000
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0005";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20200
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0006";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20300
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0007";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.name   testUint32ArrayLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20100
     * @tc.desc   Testing whether lastIndexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayLastIndexOf0008";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
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
     * @tc.name   testUint32ArrayOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20400
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayOf0001";
      try {
        let result : collections.Uint32Array = collections.Uint32Array.of(1);
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
     * @tc.name   testUint32ArrayOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_20500
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32ArrayOf0002";
      try {
        let result : collections.Uint32Array = collections.Uint32Array.of(1, 2, 3);
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
     * @tc.name   testUint32ArrayMissing0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0100
     * @tc.desc   Test from() creating Uint32Array from array with properties validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Uint32Array = collections.Uint32Array.from([1,2,3]);
      expect(array.toString()).assertEqual('1,2,3');
      expect(array[1]).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(12);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testUint32ArrayMissing0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0200
     * @tc.desc   Test from() with mapFn callback for string to number conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Uint32Array = collections.Uint32Array.from<string>(
        ["1", "3", "5"], (v: string, k: number) => parseInt(v));
      expect(array.toString()).assertEqual('1,3,5');
      expect(array[1]).assertEqual(3);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(12);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testUint32ArrayMissing0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0300
     * @tc.desc   Test from() from Set with undefined mapFn parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let myset = new Set([1, 3, 5]);
      let array: collections.Uint32Array = collections.Uint32Array.from(myset, undefined);
      expect(array.toString()).assertEqual('1,3,5');
      expect(array[1]).assertEqual(3);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(array.byteLength).assertEqual(12);
      expect(array.byteOffset).assertEqual(0);
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testUint32ArrayMissing0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0400
     * @tc.desc   Test copyWithin() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      uint32Array.copyWithin(0, 3, undefined);
      expect(uint32Array[1]).assertEqual(5);
      expect(uint32Array.toString()).assertEqual('4,5,3,4,5');
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(uint32Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(uint32Array.byteLength).assertEqual(20);
      expect(uint32Array.byteOffset).assertEqual(0);
      expect(uint32Array.length).assertEqual(5);
      done()
    })

    /**
     * @tc.name   testUint32ArrayMissing0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0500
     * @tc.desc   Test fill() with undefined start parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      let result = uint32Array.fill(9, undefined, 3);
      expect(uint32Array[1]).assertEqual(9);
      expect(result.toString()).assertEqual('9,9,9,4,5');
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(uint32Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(uint32Array.byteLength).assertEqual(20);
      expect(uint32Array.byteOffset).assertEqual(0);
      expect(uint32Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0600
     * @tc.desc   Test fill() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      uint32Array.fill(9, 1, undefined);
      expect(uint32Array[1]).assertEqual(9);
      expect(uint32Array.toString()).assertEqual('1,9,9,9,9');
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(uint32Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(uint32Array.byteLength).assertEqual(20);
      expect(uint32Array.byteOffset).assertEqual(0);
      expect(uint32Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0700
     * @tc.desc   Test fill() with undefined start and end parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      uint32Array.fill(9, undefined, undefined);
      expect(uint32Array[1]).assertEqual(9);
      expect(uint32Array.toString()).assertEqual('9,9,9,9,9');
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(uint32Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(uint32Array.byteLength).assertEqual(20);
      expect(uint32Array.byteOffset).assertEqual(0);
      expect(uint32Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0800
     * @tc.desc   Test filter() with even numbers predicate callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayLike = [0, 1, 2, 3, 4];
      let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
      let filtered: collections.Uint32Array = array.filter((element: number) => element % 2 == 0);
      expect(filtered.toString()).assertEqual('0,2,4');
      expect(filtered[1]).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(filtered.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(filtered.byteLength).assertEqual(12);
      expect(filtered.byteOffset).assertEqual(0);
      expect(filtered.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_0900
     * @tc.desc   Test indexOf() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.indexOf(3, undefined);
      expect(result).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1000
     * @tc.desc   Test join() with undefined separator parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.join(undefined);
      expect(result).assertEqual('1,2,3,4,5');
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1100
     * @tc.desc   Test join() with empty string separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.join('');
      expect(result).assertEqual('12345');
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1200
     * @tc.desc   Test set() with undefined offset parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      uint32Array.set([6, 7], undefined);
      expect(uint32Array.toString()).assertEqual('6,7,3,4,5')
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1300
     * @tc.desc   Test slice() with undefined start parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.slice(undefined,4);
      expect(result.toString()).assertEqual('1,2,3,4');
      expect(result[1]).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(16);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(4);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1400
     * @tc.desc   Test slice() with no parameters (clone array).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.slice();
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(result[1]).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(20);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1500
     * @tc.desc   Test slice() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.slice(4, undefined);
      expect(result.toString()).assertEqual('5');
      expect(result[0]).assertEqual(5);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(4);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1600
     * @tc.desc   Test sort() with undefined compareFn parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([5, 3, 1, 4, 2]);
      uint32Array.sort(undefined);
      expect(uint32Array.toString()).assertEqual('1,2,3,4,5');
      expect(uint32Array[0]).assertEqual(1);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(uint32Array.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(uint32Array.byteLength).assertEqual(20);
      expect(uint32Array.byteOffset).assertEqual(0);
      expect(uint32Array.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1700
     * @tc.desc   Test subarray() with undefined begin parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.subarray(undefined);
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(result[0]).assertEqual(1);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(20);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1800
     * @tc.desc   Test subarray() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.subarray(2, undefined);
      expect(result.toString()).assertEqual('3,4,5');
      expect(result[0]).assertEqual(3);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(12);
      expect(result.byteOffset).assertEqual(8);
      expect(result.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_1900
     * @tc.desc   Test subarray() return properties validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const subarray = uint32Array.subarray(1, 4);
      expect(subarray.toString()).assertEqual('2,3,4');
      expect(subarray[0]).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(subarray.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(subarray.byteLength).assertEqual(12);
      expect(subarray.byteOffset).assertEqual(4);
      expect(subarray.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_2000
     * @tc.desc   Test includes() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.includes(3, undefined);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_2100
     * @tc.desc   Test lastIndexOf() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let uint32Array: collections.Uint32Array = new collections.Uint32Array([1, 2, 3, 4, 5]);
      const result = uint32Array.lastIndexOf(3, undefined);
      expect(result).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_2200
     * @tc.desc   Test of() creating Uint32Array from variadic arguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result : collections.Uint32Array = collections.Uint32Array.of(1, 2, 3);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result[0]).assertEqual(1);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(result.byteLength).assertEqual(12);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_2300
     * @tc.desc   Test map() with Math.sqrt callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Uint32Array = new collections.Uint32Array([25, 36, 49]);
      const mapped = array.map(Math.sqrt);
      expect(mapped.toString()).assertEqual("5,6,7");
      expect(mapped[0]).assertEqual(5);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(mapped.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(mapped.byteLength).assertEqual(12);
      expect(mapped.byteOffset).assertEqual(0);
      expect(mapped.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testUint32ArrayMissing0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_MISSING_2400
     * @tc.desc   Test reverse() mutating array in place.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUint32ArrayMissing0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array: collections.Uint32Array = new collections.Uint32Array([1,2,3,4,5]);
      const mapped = array.reverse();
      expect(mapped.toString()).assertEqual("5,4,3,2,1");
      expect(mapped[0]).assertEqual(5);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(mapped.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(mapped.byteLength).assertEqual(20);
      expect(mapped.byteOffset).assertEqual(0);
      expect(mapped.length).assertEqual(5);
      done();
    })
  })
}
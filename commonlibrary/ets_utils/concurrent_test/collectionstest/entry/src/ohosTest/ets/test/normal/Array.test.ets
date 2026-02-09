
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';
import { sleep } from '../../testability/TestUtils';

@Sendable
export class ImplISendableClass implements lang.ISendable {
  count: number = 0;
  getNum() {
    return this.count;
  }
}

export default function ArrayTest() {
  describe('ArrayTest', () => {
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
     * @tc.name   testCollectionsArray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0100
     * @tc.desc   Testing Collections of Array, create collection Array 1~10, for this Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0001";
      try {
          let newArray : collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
          console.info("newArray is: ", newArray);
          let tempNum : number = 1;
          for (let item of newArray) {
            console.info(`value : ${item}`);
            expect(item).assertEqual(tempNum);
            tempNum = tempNum + 1;
          }
      } catch (err) {
       console.error(`${TAG} failed, error: ${err}`);
       expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0200
     * @tc.desc   Testing Collections of Array with ...,create collection Array 1~10, for this Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0002";
      try {
        let newArray : collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.info("newArray is: ", newArray);
        let tempArray = new collections.Array<number>(...newArray);
        console.info("tempArray is: ", tempArray);
        let tempNum : number = 1;
        for (let item of tempArray) {
          console.info(`value : ${item}`);
          expect(item).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0300
     * @tc.desc   Testing Collections of Array Constructor, not new.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0003";
      try {
        let array : collections.Array<number> = new collections.Array<number>(1);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0400
     * @tc.desc   Testing Collections of Array Constructor, param string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0004";
      try {
        let array : collections.Array<string> = new collections.Array<string>('a', 'b');
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('a,b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0500
     * @tc.desc   Testing Collections of Array Constructor, param number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0005";
      try {
        let array : collections.Array<number> = new collections.Array<number>(1, 2, 3);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0600
     * @tc.desc   Testing Collections of Array Constructor, param boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0006";
      try {
        let array : collections.Array<boolean> = new collections.Array<boolean>(true, false, true);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('true,false,true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0700
     * @tc.desc   Testing Collections of Array Constructor, param undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0007";
      try {
        let array : collections.Array<undefined> = new collections.Array<undefined>(undefined);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0800
     * @tc.desc   Testing Collections of Array Constructor, param null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0008";
      try {
        let array : collections.Array<null> = new collections.Array<null>(null);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0900
     * @tc.desc   Testing Collections of Array Constructor, param bigint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0009";
      try {
        let num1 : bigint = 98765432109876543210n;
        let num2 : bigint = 12345678901234567890n;
        let array : collections.Array<bigint> = new collections.Array<bigint>(num1, num2);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('98765432109876543210,12345678901234567890');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    //=====================================================================
    //=====================================================================
    /**
     * @tc.name   testCollectionsArray0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0010";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let concatArray1 : collections.ConcatArray<number> = new collections.Array<number>(6, 8);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        newArray.push(concatArray1);
        console.info("newArray is: ", newArray);
        expect(newArray.toString()).assertEqual('1,2,4,6,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0011";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        newArray.pop();
        console.info("newArray is: ", newArray);
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0012";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        console.info("newArray is: ", newArray);
        console.info("newArray.at(0) is: ", newArray[0]);
        expect(newArray[0].toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1300
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.push element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0013";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        let array1: collections.Array<number> = new collections.Array<number>(4,5,6);
        newArray.push(array1);
        expect(newArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1400
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.pop element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0014";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        let array1: collections.Array<number> = new collections.Array<number>(4,5,6);
        newArray.push(array1);
        expect(newArray.toString()).assertEqual('1,2,3,4,5,6');
        newArray.pop();
        expect(newArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1500
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.index element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0015";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        expect(newArray[0].toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1600
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0016";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        newArray.push(arrayBuffer1);
        expect(newArray[0].byteLength).assertEqual(10);
        expect(newArray[1].byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1700
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0017";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        newArray.push(arrayBuffer1);
        expect(newArray[0].byteLength).assertEqual(10);
        expect(newArray[1].byteLength).assertEqual(20);
        newArray.pop();
        expect(newArray[0].byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1800
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0018";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        expect(newArray[0].byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1900
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0019";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        let int8Array1: collections.Int8Array = collections.Int8Array.from([8,9]);
        newArray.push(int8Array1);
        expect(newArray.toString()).assertEqual('-1,2,3,8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0020";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0021";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        let int8Array1: collections.Int8Array = collections.Int8Array.from([8,9]);
        newArray.push(int8Array1);
        expect(newArray[0].includes(-1)).assertEqual(true);
        expect(newArray[1].toString()).assertEqual('8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0022";
      try {
        let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(uint8Array);
        let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8,9]);
        newArray.push(uint8Array1);
        expect(newArray.toString()).assertEqual('255,2,3,8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2300
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0023";
      try {
        let int8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(int8Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2400
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0024";
      try {
        let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(uint8Array);
        let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8,9]);
        newArray.push(uint8Array1);
        expect(newArray[0].includes(255)).assertEqual(true);
        expect(newArray[1].includes(9)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2500
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0025";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([150,300]);
        newArray.push(uint8ClampedArray1);
        expect(newArray.toString()).assertEqual('0,50,90,150,255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2600
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0026";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2700
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0027";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([300]);
        newArray.push(uint8ClampedArray1);
        expect(newArray[0].includes(0)).assertEqual(true);
        expect(newArray[1].includes(255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2800
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0028";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        let int16Array1: collections.Int16Array = collections.Int16Array.from([100]);
        newArray.push(int16Array1);
        expect(newArray.toString()).assertEqual('-10,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2900
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0029";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0030";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50,90]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        let int16Array1: collections.Int16Array = collections.Int16Array.from([300]);
        newArray.push(int16Array1);
        expect(newArray[0].includes(-10)).assertEqual(true);
        expect(newArray[1].includes(300)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0031";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([100]);
        newArray.push(uint16Array1);
        expect(newArray.toString()).assertEqual('65526,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0032";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3300
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0033";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([300]);
        newArray.push(uint16Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(65526)).assertEqual(true);
        expect(newArray[1].includes(300)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3400
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0034";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
        newArray.push(int32Array1);
        expect(newArray.toString()).assertEqual('-10,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3500
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0035";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3600
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0036";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
        newArray.push(int32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(-10)).assertEqual(true);
        expect(newArray[1].includes(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3700
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0037";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
        newArray.push(uint32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('4294967286,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3800
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0038";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3900
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0039";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
        newArray.push(uint32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(4294967286)).assertEqual(true);
        expect(newArray[1].includes(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0040";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        let float32Array1: collections.Float32Array = collections.Float32Array.from([10.0]);
        newArray.push(float32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('0,5,10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0041";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0042";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([-1.0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        let float32Array1: collections.Float32Array = collections.Float32Array.from([0]);
        newArray.push(float32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(-1)).assertEqual(true);
        expect(newArray[1].includes(0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4300
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0043";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        const testMap1 = new collections.Map<number, string>([
          [2, "xoo"]
        ]);
        newArray.push(testMap1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4400
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0044";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4500
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0045";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual('foo');
        expect(iterator.next().value).assertEqual('bar');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4600
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0046";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        const testSet1 = new collections.Set<number>([3]);
        newArray.push(testSet1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4700
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0047";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4800
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0048";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4900
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0049";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        let bitVector1: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0]
        newArray.push(bitVector1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0050";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0051";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0052";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let lock2 = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
        newArray.push(lock2);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5300
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0053";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let lock2 = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
        newArray.push(lock2);
        newArray.pop();
        expect(newArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5400
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0054";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock);
        expect(newArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5500
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0055";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const newArray = new collections.Array<SendableTestClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray[0].getNum()).assertEqual(10);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5600
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0056";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass = new SendableTestClass();
        sendableClass.num = 10;
        const newArray = new collections.Array<SendableTestClass>(sendableClass);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5700
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0057";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const newArray = new collections.Array<SendableTestClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray.length).assertEqual(2);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5800
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0058";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 10;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 20;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray[0].getNum()).assertEqual(10);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5900
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0059";
      try {
        let sendableClass = new ImplISendableClass();
        sendableClass.count = 10;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6000
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0060";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 10;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 20;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray.length).assertEqual(2);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6100
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0061";
      try {
        let newArray = new collections.Array<number|string>(1);
        newArray.push('a');
        expect(newArray[0]).assertEqual(1);
        expect(newArray[1]).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6200
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0062";
      try {
        let newArray = new collections.Array<number|string>(1,'a',2,'b');
        newArray.pop();
        expect(newArray.toString()).assertEqual('1,a,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6300
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0063";
      try {
        let newArray = new collections.Array<number|string>(1,'a',2,'b');
        expect(newArray.includes('b')).assertEqual(true);
        expect(newArray.includes(1)).assertEqual(true);
        expect(newArray.includes('c')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6400
     * @tc.desc   Testing Collections of Array create, arrayLength -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0064";
      try {
        let array = collections.Array.create<number>(-1, 10);
        console.info("array is: " + array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Invalid array length.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6500
     * @tc.desc   Testing Collections of Array create, arrayLength 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0065";
      try {
        let array = collections.Array.create<number>(0, 10);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6600
     * @tc.desc   Testing Collections of Array create, arrayLength 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0066";
      try {
        let array = collections.Array.create<number>(10, 3);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('3,3,3,3,3,3,3,3,3,3');
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6700
     * @tc.desc   Testing Collections of Array create, arrayLength 100000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0067";
      try {
        let array = collections.Array.create<number>(100000, 5);
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6800
     * @tc.desc   Testing Collections of Array create, arrayLength 1,initialValue RegExp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0068";
      try {
        const regex = new RegExp("abc", "ig")
        let array = collections.Array.create<RegExp>(1, regex);
        console.info("array is: " + array);
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Only accept sendable value.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6900
     * @tc.desc   Testing Collections of Array from, arrayLike Array<T>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0069";
      try {
        let array : Array<string> = ['d', 'e', 'f'];
        let sendableArray = collections.Array.from<string>(array);
        console.info("sendableArray is: " + sendableArray);
        expect(sendableArray.toString()).assertEqual('d,e,f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7000
     * @tc.desc   Testing Collections of Array from, arrayLike [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0070";
      try {
        let array : Array<string> = [];
        let sendableArray = collections.Array.from<string>(array);
        console.info("sendableArray is: " + sendableArray);
        expect(sendableArray.toString()).assertEqual('');
        expect(sendableArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7100
     * @tc.desc   Testing Collections of Array from, arrayLike [null].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0071";
      try {
        let array : Array<null> = [null];
        let sendableArray = collections.Array.from<null>(array);
        console.info("sendableArray is: " + sendableArray);
        expect(sendableArray.toString()).assertEqual('');
        console.info("sendableArray length: " + sendableArray.length);
        expect(sendableArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7200
     * @tc.desc   Testing Collections of Array from, arrayLike [undefined].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0072";
      try {
        let array : Array<undefined> = [undefined];
        let sendableArray = collections.Array.from<undefined>(array);
        console.info("sendableArray is: " + sendableArray);
        expect(sendableArray.toString()).assertEqual('');
        expect(sendableArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7300
     * @tc.desc   Testing Collections of Array from, arrayLike arrayLike abnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0073";
      try {
        const regex = new RegExp("abc", "ig");
        let sendableArray = collections.Array.from<RegExp>([regex]);
        console.info("sendableArray is: " + sendableArray);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Only accept sendable value.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7400
     * @tc.desc   Testing Collections of Array pop, non collectionsArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0074";
      try {
        let array = new collections.Array<number>();
        let lastElement = array.pop();
        console.info("lastElement is: " + lastElement);
        expect(lastElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7500
     * @tc.desc   Testing Collections of Array pop, collectionsArray is ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0075";
      try {
        let array = new collections.Array<string>('');
        let lastElement = array.pop();
        console.info("lastElement is: " + lastElement);
        expect(lastElement).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7600
     * @tc.desc   Testing Collections of Array pop, collectionsArray is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0076";
      try {
        let array = new collections.Array<null>(null);
        let lastElement = array.pop();
        console.info("lastElement is: " + lastElement);
        expect(lastElement).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7700
     * @tc.desc   Testing Collections of Array pop, collectionsArray is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0077";
      try {
        let array = new collections.Array<undefined>(undefined);
        let lastElement = array.pop();
        console.info("lastElement is: " + lastElement);
        expect(lastElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7800
     * @tc.desc   Testing Collections of Array pop, collectionsArray is [1,2,3].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0078";
      try {
        let array = new collections.Array<number>(1,2,3);
        let lastElement = array.pop();
        console.info("lastElement is: " + lastElement);
        expect(lastElement).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7900
     * @tc.desc   Testing Collections of Array push, push non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0079";
      try {
        let array = new collections.Array<number>();
        let length = array.push();
        console.info("length is: " + length);
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8000
     * @tc.desc   Testing Collections of Array push, push 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0080";
      try {
        let array = new collections.Array<number>();
        let length = array.push(0);
        console.info("length is: " + length);
        expect(length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8100
     * @tc.desc   Testing Collections of Array push, push ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0081";
      try {
        let array = new collections.Array<string>();
        let length = array.push('');
        console.info("length is: " + length);
        expect(length).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8200
     * @tc.desc   Testing Collections of Array push, push null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0082";
      try {
        let array = new collections.Array<null>();
        let length = array.push(null);
        console.info("length is: " + length);
        expect(length).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8300
     * @tc.desc   Testing Collections of Array push, push undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0083";
      try {
        let array = new collections.Array<undefined>();
        let length = array.push(undefined);
        console.info("length is: " + length);
        expect(length).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8400
     * @tc.desc   Testing Collections of Array push, push 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0084";
      try {
        let array = new collections.Array<number>(1,2);
        let length = array.push(3);
        console.info("length is: " + length);
        expect(length).assertEqual(3);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8500
     * @tc.desc   Testing Collections of Array push, push abnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testCollectionsArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   const TAG = "testCollectionsArray0085";
    //   try {
    //     let array = new collections.Array<number>(1,2);
    //     let length = array.push(3);
    //     console.info("length is: " + length);
    //     expect(length).assertEqual(3);
    //     expect(array.toString()).assertEqual('1,2,3');
    //   } catch (err) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect().assertFail();
    //   }
    // });
    /**
     * @tc.name   testCollectionsArray0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8600
     * @tc.desc   Testing Collections of Array join, collectionsArray non, join non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0086";
      try {
        let array = new collections.Array<string>();
        let newArray = array.join();
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8700
     * @tc.desc   Testing Collections of Array join, collectionsArray non, join '-'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0087";
      try {
        let array = new collections.Array<string>();
        let newArray = array.join('-');
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8800
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0088";
      try {
        let array = new collections.Array<number>(1,3,5);
        let newArray = array.join();
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8900
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0089";
      try {
        let array = new collections.Array<number>(1,3,5);
        let newArray = array.join('');
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('135');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9000
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0090";
      try {
        let array = new collections.Array<number>(1,2,3);
        let newArray = array.join(undefined);
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9100
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join 分隔符.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0091";
      try {
        let array = new collections.Array<number>(1,2);
        let newArray = array.join('分隔符');
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1分隔符2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9200
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join ,。\￥·.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0092";
      try {
        let array = new collections.Array<number>(1,2);
        let newArray = array.join(',。\￥·');
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1,。￥·2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9300
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join 녕하こんйте.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0093";
      try {
        let array = new collections.Array<number>(1,2);
        let newArray = array.join( "녕하こんйте");
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1녕하こんйте2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9400
     * @tc.desc   Testing Collections of Array join, collectionsArray has value,join ，.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0094";
      try {
        let array = new collections.Array<number>(1,2);
        let newArray = array.join("，");
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('1，2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9500
     * @tc.desc   Testing Collections of Array shift, collectionsArray non ,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0095";
      try {
        let array = new collections.Array<number>();
        let firstElement = array.shift();
        console.info("newArray is: " + firstElement);
        expect(firstElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9600
     * @tc.desc   Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0096";
      try {
        let array = new collections.Array<string>('');
        let firstElement = array.shift();
        console.info("newArray is: " + firstElement);
        expect(firstElement).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9700
     * @tc.desc   Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0097";
      try {
        let array = new collections.Array<null>(null);
        let firstElement = array.shift();
        console.info("newArray is: " + firstElement);
        expect(firstElement).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9800
     * @tc.desc   Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0098";
      try {
        let array = new collections.Array<undefined>(undefined);
        let firstElement = array.shift();
        console.info("newArray is: " + firstElement);
        expect(firstElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9900
     * @tc.desc   Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0099";
      try {
        let array = new collections.Array<number>(1,2,3);
        let firstElement = array.shift();
        console.info("newArray is: " + firstElement);
        expect(firstElement).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10000
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0100";
      try {
        let array = new collections.Array<number>();
        let newLength = array.unshift();
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10100
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0101";
      try {
        let array = new collections.Array<number>();
        let newLength = array.unshift(0);
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10200
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0102";
      try {
        let array = new collections.Array<string>();
        let newLength = array.unshift('');
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10300
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0103";
      try {
        let array = new collections.Array<null>();
        let newLength = array.unshift(null);
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10400
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0104";
      try {
        let array = new collections.Array<undefined>();
        let newLength = array.unshift(undefined);
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(1);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10500
     * @tc.desc   Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0105";
      try {
        let array = new collections.Array<number>(1,2,3);
        let newLength = array.unshift(0);
        console.info("newLength is: " + newLength);
        expect(newLength).assertEqual(4);
        expect(array.toString()).assertEqual('0,1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10600
     * @tc.desc   Testing Collections of Array slice, collectionsArray non ,slice 0,3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0106";
      try {
        let array = new collections.Array<number>();
        let slicedArray = array.slice(0, 3);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10700
     * @tc.desc   Testing Collections of Array slice, collectionsArray non ,slice non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0107";
      try {
        let array = new collections.Array<number>();
        let slicedArray = array.slice();
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10800
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0108";
      try {
        let array = new collections.Array<number>(1,2);
        let slicedArray = array.slice();
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10900
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0109";
      try {
        let array = new collections.Array<number>(1,2);
        let slicedArray = array.slice(undefined);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11000
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0110";
      try {
        let array = new collections.Array<number>(1,2);
        let slicedArray = array.slice(-1);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11100
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice -1,-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0111";
      try {
        let array = new collections.Array<number>(1,2);
        let slicedArray = array.slice(-1,-1);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11200
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice -1,0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0112";
      try {
        let array = new collections.Array<number>(1,2);
        let slicedArray = array.slice(-1,0);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11300
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 0,-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0113";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let slicedArray = array.slice(0,-1);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11400
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0114";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let slicedArray = array.slice(2);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11500
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0115";
      try {
        let array = new collections.Array<number>(1,2,3);
        let slicedArray = array.slice(10);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11600
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 2,4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0116";
      try {
        let array = new collections.Array<number>(1,2,3);
        let slicedArray = array.slice(2,4);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11700
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 2,4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0117";
      try {
        let array = new collections.Array<number>(1);
        let slicedArray = array.slice(2,4);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11800
     * @tc.desc   Testing Collections of Array slice, collectionsArray has value ,slice 2,0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0118";
      try {
        let array = new collections.Array<number>(1);
        let slicedArray = array.slice(2,0);
        console.info("slicedArray is: " + slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11900
     * @tc.desc   Testing Collections of Array sort, collectionsArray non ,sort a,b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0119";
      try {
        let array = new collections.Array<number>();
        array.sort((a: number, b: number) => a - b);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12000
     * @tc.desc   Testing Collections of Array sort, collectionsArray non ,sort non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0120";
      try {
        let array = new collections.Array<number>();
        array.sort();
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12100
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0121";
      try {
        let array = new collections.Array<number>(5,2,3,1);
        array.sort();
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1,2,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12200
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0122";
      try {
        let array = new collections.Array<number>(5,2,3,1);
        array.sort(undefined);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1,2,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12300
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort b-a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0123";
      try {
        let array = new collections.Array<number>(5,2,3,1);
        array.sort((a: number, b: number) => b - a);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('5,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12400
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort b-a,pop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0124";
      try {
        let array = new collections.Array<number>(5,2,3,1);
        array.sort((a: number, b: number) => b - a);
        console.info("array is: " + array);
        array.pop();
        expect(array.toString()).assertEqual('5,3,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12500
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort b-a,push.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0125";
      try {
        let array = new collections.Array<number>(5,3,1);
        array.sort((a: number, b: number) => b - a);
        console.info("array sort is: " + array);
        array.push(6,7);
        console.info("array push is: " + array);
        expect(array.toString()).assertEqual('5,3,1,6,7');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12600
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort b-a,shift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0126";
      try {
        let array = new collections.Array<number>(5,3,1);
        array.sort((a: number, b: number) => b - a);
        console.info("array sort is: " + array);
        array.shift();
        console.info("array shift is: " + array);
        expect(array.toString()).assertEqual('3,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12700
     * @tc.desc   Testing Collections of Array sort, collectionsArray has value ,sort b-a,unshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0127";
      try {
        let array = new collections.Array<number>(5,3,1);
        array.sort((a: number, b: number) => b - a);
        console.info("array sort is: " + array);
        array.unshift(0);
        console.info("array unshift is: " + array);
        expect(array.toString()).assertEqual('0,5,3,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12800
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0128";
      try {
        let array = new collections.Array<string>();
        let index = array.indexOf('b');
        console.info("index is: " + index);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12900
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray ['a','b','c'], indexOf d does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0129";
      try {
        let array = new collections.Array<string>('a','b','c');
        let index = array.indexOf('d');
        console.info("index is: " + index);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13000
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray ['a','b','c'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0130";
      try {
        let array = new collections.Array<string>('a','b','c');
        let index = array.indexOf('b',-1);
        console.info("index is: " + index);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13100
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','a'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0131";
      try {
        let array = new collections.Array<string>('a','b','c','a','a');
        let index = array.indexOf('a',1);
        console.info("index is: " + index);
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13200
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','a'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0132";
      try {
        let array = new collections.Array<string>('a','b','c','a','a');
        let index = array.indexOf('a');
        console.info("index is: " + index);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13300
     * @tc.desc   Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','d','a'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0133";
      try {
        let array = new collections.Array<string>('a','b','c','a','d','a');
        let index = array.indexOf('a', 4);
        console.info("index is: " + index);
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13400
     * @tc.desc   Testing Collections of Array forEach, collectionsArray non, length 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0134";
      try {
        let array = new collections.Array<string>();
        array.forEach((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
        });
        console.info("array.length is: " + array.length);
        expect(array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13500
     * @tc.desc   Testing Collections of Array forEach, collectionsArray [2,3,4], length 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0135";
      try {
        let array = new collections.Array<number>(2,3,4);
        array.forEach((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(array[index]);
        });
        console.info("array.length is: " + array.length);
        expect(array.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13600
     * @tc.desc   Testing Collections of Array forEach, collectionsArray [1,2,3],pop->forEach, length 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0136";
      try {
        let array = new collections.Array<number>(1,2,3);
        array.pop();
        array.forEach((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(array[index]);
        });
        console.info("array.length is: " + array.length);
        expect(array.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13700
     * @tc.desc   Testing Collections of Array forEach, collectionsArray [1,2,3],push->forEach, length 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0137";
      try {
        let array = new collections.Array<number>(1,2,3);
        array.push(8);
        array.forEach((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(array[index]);
        });
        console.info("array length is: " + array.length);
        expect(array.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13800
     * @tc.desc   Testing Collections of Array map, collectionsArray non,map length 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0138";
      try {
        let array = new collections.Array<number>();
        let mappedArray = array.map((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(array[index]);
          value = value + 1;
          return value;
        });
        console.info("mappedArray is:" + mappedArray);
        expect(mappedArray.toString()).assertEqual('');
        console.info("mappedArray.length is: " + mappedArray.length);
        expect(mappedArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13900
     * @tc.desc   Testing Collections of Array map, collectionsArray [1,2,3],map length 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0139";
      try {
        let array = new collections.Array<number>(1,2,3);
        let mappedArray = array.map((value, index, array) => {
          console.info(`Element ${value} at index ${index}`);
          value = value + 1;
          return value;
        });
        let tempArray = new collections.Array<number>(2,3,4);
        mappedArray.forEach((value, index, mappedArray) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(tempArray[index]);
        });
        console.info("mappedArray is:" + mappedArray);
        expect(mappedArray.toString()).assertEqual('2,3,4');
        console.info("mappedArray.length is: " + mappedArray.length);
        expect(mappedArray.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14000
     * @tc.desc   Testing Collections of Array map, collectionsArray [1,2,3],pop->map length 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0140";
      try {
        let array = new collections.Array<number>(1,2,3);
        let mappedArray = array.map((value, index, array) => {
          value = value + 1;
          return value;
        });
        console.info("mappedArray is:" + mappedArray);
        expect(mappedArray.toString()).assertEqual('2,3,4');
        mappedArray.pop();
        let mappedArray1 = mappedArray.map((value, index, mappedArray) => {
          value = value * 2;
          return value;
        });
        console.info("mappedArray1 is:" + mappedArray1);
        expect(mappedArray1.toString()).assertEqual('4,6');
        console.info("mappedArray1.length is: " + mappedArray1.length);
        expect(mappedArray1.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14100
     * @tc.desc   Testing Collections of Array map, collectionsArray [1,2,3],push->map length 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0141";
      try {
        let array = new collections.Array<number>(1,2,3);
        let mappedArray = array.map((value, index, array) => {
          value = value + 1;
          return value;
        });
        console.info("mappedArray is:" + mappedArray);
        expect(mappedArray.toString()).assertEqual('2,3,4');
        mappedArray.push(9);
        let mappedArray1 = mappedArray.map((value, index, mappedArray) => {
          value = value * 2;
          return value;
        });
        console.info("mappedArray1 is:" + mappedArray1);
        expect(mappedArray1.toString()).assertEqual('4,6,8,18');
        console.info("mappedArray1.length is: " + mappedArray1.length);
        expect(mappedArray1.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14200
     * @tc.desc   Testing Collections of Array filter, collectionsArray non, filter % 2 === 0 length 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0142";
      try {
        let array = new collections.Array<number>();
        let filteredArray = array.filter((value : number) => value % 2 === 0);
        console.info("filteredArray is:" + filteredArray);
        expect(filteredArray.toString()).assertEqual('');
        expect(filteredArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14300
     * @tc.desc   Testing Collections of Array filter, collectionsArray [1,2,3,4], filter % 2 === 0 length 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0143";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let filteredArray = array.filter((value : number) => value % 2 === 0);
        console.info("filteredArray is:" + filteredArray);
        let tempArray = new collections.Array<number>(2,4);
        filteredArray.forEach((value, index, filteredArray) => {
          console.info(`Element ${value} at index ${index}`);
          expect(value).assertEqual(tempArray[index]);
        });

        expect(filteredArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14400
     * @tc.desc   Testing Collections of Array filter, collectionsArray [1,2,3,4],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0144";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let filteredArray = array.filter((value : number) => value % 2 === 0);
        console.info("filteredArray is:" + filteredArray);
        filteredArray.pop();
        let filteredArray1 = filteredArray.filter((value : number) => value % 2 === 1);
        console.info("filteredArray1 is:" + filteredArray1);
        expect(filteredArray1.toString()).assertEqual('');
        expect(filteredArray1.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14500
     * @tc.desc   Testing Collections of Array filter, collectionsArray [1,2,3,4,5],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0145";
      try {
        let array = new collections.Array<number>(1,2,3,4,5);
        let filteredArray = array.filter((value : number) => value % 2 === 1);
        console.info("filteredArray is:" + filteredArray);
        filteredArray.push(7);
        let filteredArray1 = filteredArray.filter((value : number) => value % 2 === 1);
        console.info("filteredArray1 is:" + filteredArray1);
        expect(filteredArray1.toString()).assertEqual('1,3,5,7');
        expect(filteredArray1.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14600
     * @tc.desc   Testing Collections of Array reduce, collectionsArray [], reduce out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0146";
      try {
        let array = new collections.Array<number>();
        let reducedValue = array.reduce((accumulator, value) => accumulator + value);
        console.info("reducedValue is:" + reducedValue);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('out of range.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14700
     * @tc.desc   Testing Collections of Array reduce, collectionsArray [1,2,3,4], reduce 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0147";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let reducedValue = array.reduce((accumulator, value) => accumulator + value);
        console.info("array is:" + array);
        console.info("reducedValue is:" + reducedValue);
        expect(reducedValue).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14800
     * @tc.desc   Testing Collections of Array reduce, collectionsArray [1,2,3,4], reduce 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0148";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        let reducedValue = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 10);
        console.info("array is:" + array);
        console.info("reducedValue is:" + reducedValue);
        expect(reducedValue).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14900
     * @tc.desc   Testing Collections of Array reduce, collectionsArray [1,2,3,4],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0149";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        array.pop();
        let reducedValue = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 5);
        console.info("array is:" + array);
        console.info("reducedValue is:" + reducedValue);
        expect(reducedValue).assertEqual(11);
        array.pop();
        let reducedValue1 = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 5);
        console.info("array is:" + array);
        console.info("reducedValue1 is:" + reducedValue1);
        expect(reducedValue1).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15000
     * @tc.desc   Testing Collections of Array reduce, collectionsArray [1,2,3,4],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0150";
      try {
        let array = new collections.Array<number>(1,2,3,4);
        array.push(5);
        let reducedValue = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 1);
        console.info("array is:" + array);
        console.info("reducedValue is:" + reducedValue);
        expect(reducedValue).assertEqual(16);
        array.push(6);
        let reducedValue1 = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 0);
        console.info("array is:" + array);
        console.info("reducedValue1 is:" + reducedValue1);
        expect(reducedValue1).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15100
     * @tc.desc   Testing Collections of Array at, collectionsArray [], at(a) undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0151";
      try {
        let array = new collections.Array<number>();
        let elementAtIndex = array.at(2);
        console.info("elementAtIndex is:" + elementAtIndex);
        expect(elementAtIndex).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15200
     * @tc.desc   Testing Collections of Array at, collectionsArray [1,2,3,4,5], at(5) undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0152";
      try {
        let array = new collections.Array<number>(1,2,3,4,5);
        let elementAtIndex = array.at(5);
        console.info("elementAtIndex is:" + elementAtIndex);
        expect(elementAtIndex).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15300
     * @tc.desc   Testing Collections of Array at, collectionsArray [1,2,3,4,5], at(-2)  4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0153";
      try {
        let array = new collections.Array<number>(1,2,3,4,5);
        let elementAtIndex = array.at(-2);
        console.info("elementAtIndex is:" + elementAtIndex);
        expect(elementAtIndex).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15400
     * @tc.desc   Testing Collections of Array at, collectionsArray [1,2,3], at(5)  undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0154";
      try {
        let array = new collections.Array<number>(1,2,3);
        let elementAtIndex = array.at(5);
        console.info("elementAtIndex is:" + elementAtIndex);
        expect(elementAtIndex).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15500
     * @tc.desc   Testing Collections of Array at, collectionsArray [1,2,3], at(1)  2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0155";
      try {
        let array = new collections.Array<number>(1,2,3);
        let elementAtIndex = array.at(1);
        console.info("elementAtIndex is:" + elementAtIndex);
        expect(elementAtIndex).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15600
     * @tc.desc   Testing Collections of Array entries, collectionsArray [], entries, undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0156";
      try {
        let array = new collections.Array<string>();
        let iterator = array.entries();
        console.info("iterator is:" + iterator.next().value);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15700
     * @tc.desc   Testing Collections of Array entries, collectionsArray ['a','b','c'], entries key-value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0157";
      try {
        let array = new collections.Array<string>('a','b','c');
        let iterator = array.entries();
        expect(iterator.next().value.toString()).assertEqual('0,a');
        expect(iterator.next().value.toString()).assertEqual("1,b");
        expect(iterator.next().value.toString()).assertEqual("2,c");
        expect(iterator.next().value).assertEqual(undefined);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15800
     * @tc.desc   Testing Collections of Array keys, collectionsArray [], keys non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0158";
      try {
        let array = new collections.Array<string>();
        let iterator = array.keys();
        let keyNum : number = 0;
        for (const key of iterator) {
          keyNum = keyNum + 1;
          console.info("" + key);
        }
        expect(keyNum).assertEqual(0);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15900
     * @tc.desc   Testing Collections of Array keys, collectionsArray ['a','b','c'], keys 0,1,2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0159";
      try {
        let array = new collections.Array<string>('a','b','c');
        let iterator = array.keys();
        let keyNum : number = 0;
        for (const key of iterator) {
          console.info("" + key);
          expect(key).assertEqual(keyNum);
          keyNum = keyNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16000
     * @tc.desc   Testing Collections of Array keys, collectionsArray ['a','b','c'], keys 0,1,2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0160";
      try {
        let array = new collections.Array<string>('a','b','c');
        let iterator = array.keys();
        let keyNum : number = 0;
        for (const key of iterator) {
          console.info("" + key);
          expect(key).assertEqual(keyNum);
          keyNum = keyNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16100
     * @tc.desc   Testing Collections of Array values, collectionsArray [], values  true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0161";
      try {
        let array = new collections.Array<string>();
        let iterator = array.values();
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16200
     * @tc.desc   Testing Collections of Array values, collectionsArray ['e','f','g'], values 'e','f','g'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0162";
      try {
        let array = new collections.Array<string>('e','f','g');
        let iterator = array.values();
        expect(iterator.next().value).assertEqual('e');
        expect(iterator.next().value).assertEqual('f');
        expect(iterator.next().value).assertEqual('g');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16300
     * @tc.desc   Testing Collections of Array values, collectionsArray ['e','f','g'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0163";
      try {
        let array = new collections.Array<string>('e','f','g');
        array.pop();
        let iterator = array.values();
        expect(iterator.next().value).assertEqual('e');
        expect(iterator.next().value).assertEqual('f');
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16400
     * @tc.desc   Testing Collections of Array values, collectionsArray ['e','f','g'],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0164";
      try {
        let array = new collections.Array<string>('e','f','g');
        array.push('h');
        let iterator = array.values();
        expect(iterator.next().value).assertEqual('e');
        expect(iterator.next().value).assertEqual('f');
        expect(iterator.next().value).assertEqual('g');
        expect(iterator.next().value).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16500
     * @tc.desc   Testing Collections of Array find, collectionsArray [], find undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0165";
      try {
        let array = new collections.Array<number>();
        let foundValue = array.find((value: number) => value % 2 === 0);
        console.info("foundValue is:" + foundValue);
        expect(foundValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16600
     * @tc.desc   Testing Collections of Array find, collectionsArray [1,3,5], find undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0166";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundValue = array.find((value: number) => value % 2 === 0);
        console.info("foundValue is:" + foundValue);
        expect(foundValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16700
     * @tc.desc   Testing Collections of Array find, collectionsArray [1,3,5], find index -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0167";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundValue = array.find((value: number, index:number) => index === -1);
        console.info("foundValue is:" + foundValue);
        expect(foundValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16800
     * @tc.desc   Testing Collections of Array find, collectionsArray [1,3,5], find index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0168";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundValue = array.find((value:number, index: number) => index === 0);
        console.info("foundValue is:" + foundValue);
        expect(foundValue).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16900
     * @tc.desc   Testing Collections of Array find, collectionsArray [1,3,5], find value % 2 === 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0169";
      try {
        let array = new collections.Array<number>(3,5);
        let foundValue = array.find((value: number) => value % 2 === 1);
        console.info("foundValue is:" + foundValue);
        expect(foundValue).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17000
     * @tc.desc   Testing Collections of Array includes, collectionsArray [], includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0170";
      try {
        let array = new collections.Array<number>();
        let includesResult = array.includes(1);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17100
     * @tc.desc   Testing Collections of Array includes, collectionsArray [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0171";
      try {
        let array = new collections.Array<number>(1,2,3);
        let includesResult = array.includes(4,-1);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17200
     * @tc.desc   Testing Collections of Array includes, collectionsArray [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0172";
      try {
        let array = new collections.Array<number>(1,2,3);
        let includesResult = array.includes(2,-1);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17300
     * @tc.desc   Testing Collections of Array includes, collectionsArray [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0173";
      try {
        let array = new collections.Array<number>(1,2,3);
        let includesResult = array.includes(5);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17400
     * @tc.desc   Testing Collections of Array includes, collectionsArray [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0174";
      try {
        let array = new collections.Array<number>(1,2,3);
        let includesResult = array.includes(3);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17500
     * @tc.desc   Testing Collections of Array includes, collectionsArray [1,2,3],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0175";
      try {
        let array = new collections.Array<number>(1,2,3);
        let includesResult = array.includes(3,4);
        console.info("foundValue is:" + includesResult);
        expect(includesResult).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17600
     * @tc.desc   Testing Collections of Array findIndex, collectionsArray [],
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0176";
      try {
        let array = new collections.Array<number>();
        let foundIndex = array.findIndex((value: number) => value % 2 === 0);
        console.info("foundValue is:" + foundIndex);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17700
     * @tc.desc   Testing Collections of Array findIndex, collectionsArray [2,3,4], Index  -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0177";
      try {
        let array = new collections.Array<number>(2,4);
        let foundIndex = array.findIndex((value: number,index:number) => index === -1);
        console.info("foundIndex is:" + foundIndex);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17800
     * @tc.desc   Testing Collections of Array findIndex, collectionsArray [1,3,5], return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0178";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundIndex = array.findIndex((value: number) => value % 2 === 0);
        console.info("foundIndex is:" + foundIndex);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17900
     * @tc.desc   Testing Collections of Array findIndex, collectionsArray [1,3,5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0179";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundIndex = array.findIndex((value: number) => value % 2 === 1);
        console.info("foundIndex is:" + foundIndex);
        expect(foundIndex).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18000
     * @tc.desc   Testing Collections of Array findIndex, collectionsArray [1,3,5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0180";
      try {
        let array = new collections.Array<number>(1,3,5);
        let foundIndex = array.findIndex((value: number, index: number) => value % 2 === 1 && index === 5);
        console.info("foundIndex is:" + foundIndex);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18100
     * @tc.desc   Testing Collections of Array fill, start -1,end normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0181";
      try {
        let array = new collections.Array(1,2,3,4,5);
        let fillArray = array.fill(-1, -1, 3);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18200
     * @tc.desc   Testing Collections of Array fill, start normal,end -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0182";
      try {
        let array = new collections.Array(1,2,3,4,5);
        let fillArray = array.fill(-1, 0, -1);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('-1,-1,-1,-1,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18300
     * @tc.desc   Testing Collections of Array fill, start out of range, end normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0183";
      try {
        let array = new collections.Array(1,2,3,4,5);
        let fillArray = array.fill(-1, 10, 2);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18400
     * @tc.desc   Testing Collections of Array fill, start normal, end out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0184";
      try {
        let array = new collections.Array(1, 2, 3, 4, 5);
        let fillArray = array.fill(-1, 0, 10);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('-1,-1,-1,-1,-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18500
     * @tc.desc   Testing Collections of Array fill, fill null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0185";
      try {
        let array = new collections.Array<null>(null);
        let fillArray = array.fill(null);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18600
     * @tc.desc   Testing Collections of Array fill, fill undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0186";
      try {
        let array = new collections.Array<undefined>();
        let fillArray = array.fill(undefined);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18700
     * @tc.desc   Testing Collections of Array fill, fill 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0187";
      try {
        let array = new collections.Array<number>(1,2,3,4,5);
        let fillArray = array.fill(8,0,5);
        console.info("fillArray is:" + fillArray);
        expect(fillArray.toString()).assertEqual('8,8,8,8,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0188
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18800
     * @tc.desc   Testing Collections of Array shrinkTo, arrayLength >= array.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0188";
      try {
        let array = new collections.Array<number>(1, 2, 3, 4, 5);
        array.shrinkTo(10);
        console.info("array is:" + array);
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0189
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18900
     * @tc.desc   Testing Collections of Array shrinkTo, arrayLength<array.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0189";
      try {
        let array = new collections.Array<number>(1, 2, 3, 4, 5);
        array.shrinkTo(2);
        console.info("array is:" + array);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0190
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19000
     * @tc.desc   Testing Collections of Array shrinkTo, arrayLength=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0190";
      try {
        let array = new collections.Array<number>(1, 2, 3, 4, 5);
        array.shrinkTo(-1);
        console.info("array is:" + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Invalid array length.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0191
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19100
     * @tc.desc   Testing Collections of Array extendTo, arrayLength <= array.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0191";
      try {
        let array = new collections.Array<number>(1,2,3,4,5);
        array.extendTo(2,10);
        console.info("array is:" + array);
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0192
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19200
     * @tc.desc   Testing Collections of Array extendTo, arrayLength>array.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0192";
      try {
        let array = new collections.Array<number>(1,2,3);
        array.extendTo(5,10);
        console.info("array is:" + array);
        expect(array.toString()).assertEqual('1,2,3,10,10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0193
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19300
     * @tc.desc   Testing Collections of Array extendTo, arrayLength -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0193";
      try {
        let array = new collections.Array<number>(1,2,3);
        array.extendTo(-1,10);
        console.info("array is:" + array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Invalid array length.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0194
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19400
     * @tc.desc   Testing Collections of Array concat, one array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0194";
      try {
        let array = new collections.Array<number>(1,2,3);
        let concatArray = array.concat();
        console.info("concatArray is:" + concatArray);
        expect(concatArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0195
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19500
     * @tc.desc   Testing Collections of Array concat, two array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0195";
      try {
        let array1 = new collections.Array<number>(1,2,3);
        let array2 = new collections.Array<number>(4,5,6);
        let concatArray = array1.concat(array2);
        console.info("concatArray is:" + concatArray);
        expect(concatArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0196
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19600
     * @tc.desc   Testing Collections of Array concat, param is abnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0196";
      try {
        let array = new collections.Array<null>(null);
        let array1 = new collections.Array<null>(null);
        let concatArray = array.concat(array1);
        console.info("concatArray is:" + concatArray);
        expect(concatArray.toString()).assertEqual(',');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0197
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19700
     * @tc.desc   Testing Collections of Array splice, array [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0197";
      try {
        let array = new collections.Array<number>();
        let removeArray = array.splice(2);
        console.info("removeArray is:" + removeArray);
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0198
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19800
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0198";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(-1);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('1,2');
        expect(removeArray.toString()).assertEqual('3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0199
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19900
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0199";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(5);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('1,2,3');
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20000
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start< -array.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0200";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(-5);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('');
        expect(removeArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0201
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20100
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0201";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(0);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('');
        expect(removeArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0202
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20200
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0202";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(2);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('1,2');
        expect(removeArray.toString()).assertEqual('3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0203
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20300
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0203";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(0, -1);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('1,2,3');
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0204
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20400
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0204";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(0, 0);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('1,2,3');
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0205
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20500
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0205";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(0, 2);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('3');
        expect(removeArray.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0206
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20600
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0206";
      try {
        let array = new collections.Array<number>(1,2,3);
        let removeArray = array.splice(0, 10);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual('');
        expect(removeArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0207
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20700
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0, items null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0207";
      try {
        let array = new collections.Array<null>(null,null,null);
        let removeArray = array.splice(0, 0, null);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual(',,,');
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0208
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20800
     * @tc.desc   Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0, items undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0208";
      try {
        let array = new collections.Array<undefined>(undefined,undefined);
        let removeArray = array.splice(0, 0, undefined);
        console.info("array is:" + array);
        console.info("removeArray is:" + removeArray);
        expect(array.toString()).assertEqual(',,');
        expect(removeArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0209
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20900
     * @tc.desc   Testing Collections of Array [index:number], index -5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0209";
      try {
        let array = new collections.Array<number>(1,2,3);
        let elementVal = array[-5]
        console.info("elementVal is:" + elementVal);
        expect(elementVal).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0210
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_21000
     * @tc.desc   Testing Collections of Array [index:number], index 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0210";
      try {
        let array = new collections.Array<number>(1,2,3);
        let elementVal = array[5]
        console.info("elementVal is:" + elementVal);
        expect(elementVal).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0211
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_21100
     * @tc.desc   Testing Collections of Array [index:number], index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0211";
      try {
        let array = new collections.Array<number>(1,2,3);
        let elementVal = array[1]
        console.info("elementVal is:" + elementVal);
        expect(elementVal).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2300
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayOf0001";
      try {
        let result: collections.Array<number> = collections.Array.of(1);
        expect(JSON.stringify(result)).assertEqual('[1]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2400
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayOf0002";
      try {
        let result: collections.Array<number> = collections.Array.of(1, 2, 3);
        expect(JSON.stringify(result)).assertEqual('[1,2,3]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2500
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayOf0003";
      try {
        let result: collections.Array<undefined> = collections.Array.of(undefined);
        expect(JSON.stringify(result)).assertEqual('[null]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2600
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayOf0004";
      try {
        let result: collections.Array<null> = collections.Array.of(null);
        expect(JSON.stringify(result)).assertEqual('[null]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });

    /**
     * @tc.name   testCollectionsArrayCopyWithin0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3500
     * @tc.desc   Test the function of the interface ArkTS Array CopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayCopyWithin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayCopyWithin0001";
      try {
        let arr1 : collections.Array<number> = new collections.Array(1, 2, 3, 4, 5);
        const obj : collections.Array<number> = arr1.copyWithin(-2, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,2,3]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayCopyWithin0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3600
     * @tc.desc   Test the function of the interface ArkTS Array CopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayCopyWithin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayCopyWithin0002";
      try {
        let arr1 : collections.Array<number> = new collections.Array(1, 2, 3, 4, 5);
        const obj : collections.Array<number> = arr1.copyWithin(0, 3);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,5,3,4,5]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayCopyWithin0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3700
     * @tc.desc   Test the function of the interface ArkTS Array CopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayCopyWithin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayCopyWithin0003";
      try {
        let arr1 : collections.Array<number> = new collections.Array(1, 2, 3, 4, 5);
        const obj : collections.Array<number> = arr1.copyWithin(0, 3, 4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,2,3,4,5]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayCopyWithin0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3800
     * @tc.desc   Test the function of the interface ArkTS Array CopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayCopyWithin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayCopyWithin0004";
      try {
        let arr1 : collections.Array<number> = new collections.Array(1, 2, 3, 4, 5);
        const obj : collections.Array<number> = arr1.copyWithin(-2, -3, -1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,3,4]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayReverse0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_127000
     * @tc.desc   Test the function of the interface ArkTS Array Reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayReverse0001";
      try {
        const items : collections.Array<number> = new collections.Array(1, 2, 3);
        const result : collections.Array<number> = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[3,2,1]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayReverse0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_128000
     * @tc.desc   Test the function of the interface ArkTS Array Reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayReverse0002";
      try {
        const items : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : collections.Array<number | undefined> = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[null,2,1]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayReverse0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_129000
     * @tc.desc   Test the function of the interface ArkTS Array Reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReverse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayReverse0003";
      try {
        const items : collections.Array<number | null> = new collections.Array<number | null>(1, null , 3);
        const result : collections.Array<number | null> = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[3,null,1]');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_104000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0001";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_105000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0002";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(2.5);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_106000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0003";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(7);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_107000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0004";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(2, 3);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_108000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0005";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(2, 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_109000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0006";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(2, -2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_111000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0008";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(-1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_112000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0009";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(500);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_113000
     * @tc.desc   Test the function of the interface ArkTS Array LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayLastIndexOf0010";
      try {
        const numbers : collections.Array<number> = new collections.Array(2, 5, 9, 2);
        const result : number = numbers.lastIndexOf(NaN);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_160000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0001";
      try {
        let array : collections.Array<number> = new collections.Array(1, 2, 3);
        const result: boolean = array.some((x: number) => x === 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_161000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0002";
      try {
        let array : collections.Array<number> = new collections.Array(1, 2, 3);
        const result : boolean  = array.some((x: number) => x === -1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_162000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0003";
      try {
        let array : collections.Array<number> = new collections.Array(1, 2, 3);
        const result : boolean  = array.some((x: number) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_163000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0004";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null>(1, null , 3);
        const result : boolean  = array.some((x: number | null) => x === 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_164000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0005";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null>(1, null , 3);
        const result : boolean  = array.some((x: number | null) => x === -2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_165000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0006";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null>(1, null , 3);
        const result: boolean  = array.some((x: number | null) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_166000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0007";
      try {
        let array : collections.Array<number | string> = new collections.Array<number | string>(1, '2', 3);
        const result : boolean  = array.some((x: number | string) => x === 3);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_167000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0008";
      try {
        let array : collections.Array<number | string> = new collections.Array<number | string>(1, '2', 3);
        const result : boolean  = array.some((x: number | string) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_168000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0009";
      try {
        let array : collections.Array<number | string> = new collections.Array<number | string>(1, '2', 3);
        const result : boolean  = array.some((x: number | string) => x === -5);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_169000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0010";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean  = array.some((x: number | undefined) => x === 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_170000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0011";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean  = array.some((x: number | undefined) => x === -10);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArraySome0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_171000
     * @tc.desc   Test the function of the interface ArkTS Array Some.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArraySome0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArraySome0012";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean  = array.some((x: number | undefined) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_195000
     * @tc.desc   Test the function of the interface ArkTS Array ToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToString0001";
      try {
        const array1 : collections.Array<number|string> = new collections.Array<number|string>(1, 2, 'a', '1a');
        const result : string = array1.toString();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,2,a,1a');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_196000
     * @tc.desc   Test the function of the interface ArkTS Array ToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToString0002";
      try {
        const array1 : collections.Array<string> = new collections.Array('1a');
        let value : string = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('1a');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_197000
     * @tc.desc   Test the function of the interface ArkTS Array ToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToString0003";
      try {
        const array1 : collections.Array<string> = new collections.Array('');
        let value : string = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_198000
     * @tc.desc   Test the function of the interface ArkTS Array ToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToString0004";
      try {
        const array1 : collections.Array<number | null> = new collections.Array(null);
        let value : string = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToLocaleString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_190000
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToLocaleString0002";
      try {
        const array1 : collections.Array<number> = new collections.Array<number>();
        const iterator1 : string = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToLocaleString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_191000
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToLocaleString0003";
      try {
        const array1 : collections.Array<number | undefined> = new collections.Array(undefined);
        const iterator1 : string = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToLocaleString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_192000
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToLocaleString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToLocaleString0004";
      try {
        const array1 : collections.Array<number | null> = new collections.Array(null);
        const iterator1 : string = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToLocaleString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_193000
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToLocaleString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToLocaleString0005";
      try {
        const array1 : collections.Array<number> = new collections.Array(1);
        const iterator1 : string = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('1');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayToLocaleString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_194000
     * @tc.desc   Test the function of the interface ArkTS Array ToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayToLocaleString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayToLocaleString0006";
      try {
        const array1 : collections.Array<string> = new collections.Array('Test');
        const iterator1 : string = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('Test');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayReduceRight0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYReduceRight_0100
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReduceRight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayReduceRight0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduceRight((accumulator: number, value: number) => accumulator + value);
        console.log(`${caseName} reduceRight ${sum}`);
        expect(55).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testCollectionsArrayReduceRight0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYReduceRight_0200
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReduceRight0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayReduceRight0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduceRight((accumulator: number, value: number) => accumulator + value, 0);
        console.log(`${caseName} reduceRight ${sum}`);
        expect(55).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testCollectionsArrayReduceRight0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYReduceRight_0300
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReduceRight0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayReduceRight0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduceRight((accumulator: number, value: number) => accumulator + value, 10);
        console.log(`${caseName} reduce ${sum}`);
        expect(65).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testCollectionsArrayReduceRight0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYReduceRight_0400
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayReduceRight0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayReduceRight0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduceRight((accumulator: number, value: number) => accumulator + value, -1);
        console.log(`${caseName} reduceRight ${sum}`);
        expect(54).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });
    /**
     * @tc.name   testCollectionsArrayFrom0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYFrom_0400
     * @tc.desc   Create a new ArkTS Array from an object that implements the ArrayLike interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayFrom0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayFrom0400';
      console.log(`${caseName} test start `);
      try {
        let arrayLike: ArrayLike<number> = [1, 2, 3];
        let array: collections.Array<number> = collections.Array.from<number>(arrayLike, (value: number, index: number) => value + index);
        console.log(`${caseName} array length ${array.length}`);
        expect('1,3,5').assertEqual(array.toString());
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });;
    /**
     * @tc.name   testCollectionsArrayFrom0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYFrom_0500
     * @tc.desc   Create a new ArkTS Array from an object that implements the ArrayLike interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayFrom0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testCollectionsArrayFrom0500';
      console.log(`${caseName} test start `);
      try {
        let arrayLike: ArrayLike<number> = [1, 2, 3];
        let array: collections.Array<string> = collections.Array.from<number, string>(arrayLike, (value: number, index: number) => value + "." + index);
        console.log(`${caseName} array length ${array.length}`);
        expect('1.0,2.1,3.2').assertEqual(array.toString());
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });;

    /**
     * @tc.name   testCollectionsArrayEvery0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_160000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0001";
      try {
        let array = new collections.Array(1, 2, 3);
        const result : boolean = array.every((x: number) => x > 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_161000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0002";
      try {
        let array : collections.Array<number> = new collections.Array(1, 2, 3);
        const result : boolean = array.every((x: number) => x > 3 );
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_162000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0003";
      try {
        let array : collections.Array<number> = new collections.Array(1, 2, 3);
        const result : boolean = array.every((x: number) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_163000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0004";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null >(1, null , 3);
        const result : boolean = array.every((x: number | null) => x != 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_164000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0005";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null >(1, null , 3);
        const result : boolean = array.every((x: number | null) => x != 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_165000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0006";
      try {
        let array : collections.Array<number | null> = new collections.Array<number | null >(1, null , 3);
        const result : boolean = array.every((x: number | null) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_166000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0007";
      try {
        let array : collections.Array<number | string> = new collections.Array<number|string>(1, '2', 3);
        const result : boolean = array.every((x: number|string) => x != 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_167000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0008";
      try {
        let array : collections.Array<number | string> = new collections.Array<number|string>(1, '2', 3);
        const result : boolean = array.every((x: number|string) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_168000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0009";
      try {
        let array : collections.Array<number | string> = new collections.Array<number|string>(1, '2', 3);
        const result : boolean = array.every((x: number|string) => x === '2');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_169000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0010";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean = array.every((x: number | undefined) => x != 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_170000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0011";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean = array.every((x: number | undefined) => x === 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayEvery0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_171000
     * @tc.desc   Test the function of the interface ArkTS Array Every.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayEvery0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayEvery0012";
      try {
        let array : collections.Array<number | undefined> = new collections.Array(1, 2, undefined);
        const result : boolean = array.every((x: number | undefined) => x != 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
      done()
    });

    /**
     * @tc.name   testConcatArrayMissing0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCATARRAY_MISSING_0100
     * @tc.desc   Test ConcatArray slice() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcatArrayMissing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let slicedArray = concatArray.slice(2, undefined);
      expect(slicedArray.toString()).assertEqual('3,4,5');
      done();
    })

    /**
     * @tc.name   testArrayMissing0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0100
     * @tc.desc   Test Array.from() with empty arrayLike and mapFn.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayLike: ArrayLike<number> = [];
      let array: collections.Array<number> = collections.Array.from<number>(arrayLike, (value: number, index: number) => value + index);
      expect(array.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testArrayMissing0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0200
     * @tc.desc   Test Array.from() with empty arrayLike and string concatenation mapFn.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayLike: ArrayLike<number> = [];
      let array: collections.Array<string> = collections.Array.from<number, string>(arrayLike, (value: number, index: number) => value + "." + index);
      expect(array.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testArrayMissing0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0300
     * @tc.desc   Test Array slice() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      const result = array.slice(4, undefined);
      expect(result.toString()).assertEqual('5');
      expect(result[0]).assertEqual(5);
      done()
    })

    /**
     * @tc.name   testArrayMissing0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0400
     * @tc.desc   Test empty Array slice() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array<number>();
      const result = array.slice(4, undefined);
      expect(result.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testArrayMissing0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0500
     * @tc.desc   Test Array indexOf() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      const result = array.indexOf(3, undefined);
      expect(result).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testArrayMissing0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0600
     * @tc.desc   Test Array includes() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      const result = array.includes(3, undefined);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   testArrayMissing0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0700
     * @tc.desc   Test Array fill() with undefined start parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      let result = array.fill(9, undefined, 3);
      expect(array[1]).assertEqual(9);
      expect(result.toString()).assertEqual('9,9,9,4,5');
      array = new collections.Array();
      result = array.fill(9, undefined, 3);
      expect(result.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testArrayMissing0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0800
     * @tc.desc   Test Array fill() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      array.fill(9, 1, undefined);
      expect(array.toString()).assertEqual('1,9,9,9,9');
      done();
    })

    /**
     * @tc.name   testArrayMissing0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_0900
     * @tc.desc   Test Array fill() with undefined start and end parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      array.fill(9, undefined, undefined);
      expect(array.toString()).assertEqual('9,9,9,9,9');
      done();
    })

    /**
     * @tc.name   testArrayMissing0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1000
     * @tc.desc   Test Array.isArray() with null and undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(collections.Array.isArray(null)).assertEqual(false);
      expect(collections.Array.isArray(undefined)).assertEqual(false);
      done();
    })

    /**
     * @tc.name   testArrayMissing0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1100
     * @tc.desc   Test Array copyWithin() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      array.copyWithin(0, 3, undefined);
      expect(array.toString()).assertEqual('4,5,3,4,5');
      done();
    })

    /**
     * @tc.name   testArrayMissing0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1200
     * @tc.desc   Test Array lastIndexOf() with undefined fromIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      const result = array.lastIndexOf(3, undefined);
      expect(result).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   testArrayMissing0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1300
     * @tc.desc   Test ArrayBuffer slice() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(1,undefined);
      console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
      expect(slicedBuffer.byteLength).assertEqual(4);
      done();
    })

    /**
     * @tc.name   testArrayMissing0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1400
     * @tc.desc   Test empty Array concat().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array<number>();
      let concatArray = array.concat();
      expect(concatArray.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testArrayMissing0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_MISSING_1500
     * @tc.desc   Test empty Array copyWithin() with undefined end parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMissing0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let array = new collections.Array<number>();
      array.copyWithin(0, 3, undefined);
      expect(array.toString()).assertEqual('');
      done();
    })
  })
}
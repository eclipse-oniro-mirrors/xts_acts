
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function ConcatArrayTest() {
  describe('ConcatArrayTest', () => {
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
     * @tc.name   testCollectionsConcatArray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0100
     * @tc.desc   Testing Collections of ConcatArray without param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0001";
      try {
      let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
      console.info("Element at index 1: ", concatArray[1]);
      expect(concatArray[1]).assertEqual(2);
      } catch (err) {
       console.error(`${TAG} failed, error: ${err}`);
       expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0200
     * @tc.desc   Testing Collections of ConcatArray without param -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0002";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let tempNum : number = concatArray[-1];
        console.info("Element at index -1: ", tempNum);
        expect(tempNum).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0300
     * @tc.desc   Testing Collections of ConcatArray without param 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0003";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let tempNum : number = concatArray[5];
        console.info("Element at index 5: ", tempNum);
        expect(tempNum).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0400
     * @tc.desc   Testing Collections of ConcatArray join without param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0004";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join();
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a,b,c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0500
     * @tc.desc   Testing Collections of ConcatArray join ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0005";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0600
     * @tc.desc   Testing Collections of ConcatArray join undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0006";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join(undefined);
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a,b,c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0700
     * @tc.desc   Testing Collections of ConcatArray join 'ww'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0007";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("ww");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("awwbwwc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0800
     * @tc.desc   Testing Collections of ConcatArray join '分隔符'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0008";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("分隔符");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a分隔符b分隔符c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0900
     * @tc.desc   Testing Collections of ConcatArray join ', '.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0009";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join(", ");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a, b, c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1000
     * @tc.desc   Testing Collections of ConcatArray join '|'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0010";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("|");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a|b|c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1100
     * @tc.desc   Testing Collections of ConcatArray join ',。\￥·'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0011";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join(",。\￥·");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a,。￥·b,。￥·c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1200
     * @tc.desc   Testing Collections of ConcatArray join '😊'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0012";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("😊");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a😊b😊c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1300
     * @tc.desc   Testing Collections of ConcatArray join '녕하こんйте'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0013";
      try {
        let concatArray : collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        let joinedString = concatArray.join("녕하こんйте");
        console.info("Array join: ", joinedString);
        expect(joinedString).assertEqual("a녕하こんйтеb녕하こんйтеc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1400
     * @tc.desc   Testing Collections of ConcatArray slice no start, no end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0014";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice();
        console.info("Array slice slicedArray: ", slicedArray.toString());
        let newArray = new collections.Array<number>(1, 2, 3, 4, 5);
        console.info("Array slice newArray: ", newArray.toString());
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1500
     * @tc.desc   Testing Collections of ConcatArray slice start index 0, no end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0015";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(0);
        console.info("Array slice slicedArray: ", slicedArray);
        let newArray = new collections.Array<number>(1, 2, 3, 4, 5);
        console.info("Array slice newArray: ", newArray.toString());
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1600
     * @tc.desc   Testing Collections of ConcatArray slice start index -1, no end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0016";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(-1);
        console.info("Array slice slicedArray: ", slicedArray);
        let newArray = new collections.Array<number>(5);
        console.info("Array slice newArray: ", newArray.toString());
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1700
     * @tc.desc   Testing Collections of ConcatArray slice start index 2, no end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0017";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(2);
        console.info("Array slice slicedArray: ", slicedArray);
        let newArray = new collections.Array<number>(3, 4, 5);
        console.info("Array slice newArray: ", newArray.toString());
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1800
     * @tc.desc   Testing Collections of ConcatArray slice start index 10, no end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0018";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(10);
        console.info("Array slice index 10: ", slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1900
     * @tc.desc   Testing Collections of ConcatArray slice no start, end index -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0019";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(undefined, -1);
        console.info("Array slice end index -1: ", slicedArray);
        let newArray = new collections.Array<number>(1, 2, 3, 4);
        console.info("Array slice newArray: ", newArray);
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2000
     * @tc.desc   Testing Collections of ConcatArray slice slice no start, end index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0020";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(undefined, 0);
        console.info("Array slice end index -1: ", slicedArray);
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2100
     * @tc.desc   Testing Collections of ConcatArray slice slice no start, end index 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0021";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(undefined, 2);
        console.info("Array slice end index 2: ", slicedArray);
        let newArray = new collections.Array<number>(1, 2);
        console.info("Array slice newArray: ", newArray);
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2200
     * @tc.desc   Testing Collections of ConcatArray slice slice no start, end index 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0022";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(undefined, 10);
        console.info("Array slice end index 10: ", slicedArray.toString());
        let newArray = new collections.Array<number>(1, 2, 3, 4, 5);
        console.info("Array slice newArray: ", newArray);
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2300
     * @tc.desc   Testing Collections of ConcatArray slice slice start index 2, end index 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0023";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(2, 4);
        console.info("Array slice slicedArray: ", slicedArray.toString());
        let newArray = new collections.Array<number>(3, 4);
        console.info("Array slice newArray: ", newArray);
        expect(slicedArray.toString()).assertEqual(newArray.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2400
     * @tc.desc   Testing Collections of ConcatArray slice slice start index 2, end index 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0024";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(2, 2);
        console.info("Array slice slicedArray: ", slicedArray.toString());
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsConcatArray0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2500
     * @tc.desc   Testing Collections of ConcatArray slice slice start index 2, end index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsConcatArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsConcatArray0025";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let slicedArray = concatArray.slice(2, 0);
        console.info("Array slice slicedArray: ", slicedArray.toString());
        expect(slicedArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
  })
}
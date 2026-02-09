import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';
import { sleep } from '../../testability/TestUtils';

@Sendable
class SendableTestClass {
  num: number = 5;
  getNum() {
    return this.num;
  }
};

@Sendable
export class ImplISendableClass implements lang.ISendable {
  count: number = 0;
  getNum() {
    return this.count;
  }
}

export default function SetTest() {
  describe('SetTest', () => {
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
    afterAll(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(100);
    })
    /**
     * @tc.name   testSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0100
     * @tc.desc   Testing the set for 1~10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0001";
      try {
        const setList = new collections.Set<number>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        let num1: number = 0;
        for (let item of setList) {
          num1 = num1 + 1;
          expect(item).assertEqual(num1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0200
     * @tc.desc   Testing the size of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0002";
      try {
        const setList = new collections.Set<number>();
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0300
     * @tc.desc   Testing the size of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0003";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0400
     * @tc.desc   Testing the size of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0004";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        let rstDel = setList.delete(2);
        expect(rstDel).assertTrue();
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0500
     * @tc.desc   Testing the size of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0005";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.add(4);
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0600
     * @tc.desc   Testing the size of set, clear set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0006";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.clear();
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0700
     * @tc.desc   Testing the size of set, add repeating element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0007";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.add(2);
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0800
     * @tc.desc   Testing the Constructor of set, element is string, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0008";
      try {
        const setList = new collections.Set<string>(["one"]);
        setList.add("four");
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("one");
        expect(iterator.next().value.toString()).assertEqual("four");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0900
     * @tc.desc   Testing the Constructor of set, element is string, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0009";
      try {
        const setList = new collections.Set<string>(["one", "two"]);
        let rst = setList.delete("two");
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("one");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1000
     * @tc.desc   Testing the Constructor of set, element is string, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0010";
      try {
        const setList = new collections.Set<string>(["one", "two"]);
        let rst = setList.has("two");
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1100
     * @tc.desc   Testing the Constructor of set, element is number, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0011";
      try {
        const setList = new collections.Set<number>([1]);
        setList.add(3);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1200
     * @tc.desc   Testing the Constructor of set, element is number, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0012";
      try {
        const setList = new collections.Set<number>([1, 2]);
        let rst = setList.delete(2);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1300
     * @tc.desc   Testing the Constructor of set, element is number, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0013";
      try {
        const setList = new collections.Set<number>([1, 2]);
        let rst = setList.has(2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1400
     * @tc.desc   Testing the Constructor of set, element is boolean, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0014";
      try {
        const setList = new collections.Set<boolean>([true]);
        setList.add(false);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(true);
        expect(iterator.next().value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1500
     * @tc.desc   Testing the Constructor of set, element is boolean, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0015";
      try {
        const setList = new collections.Set<boolean>([true, false]);
        let rst = setList.delete(true);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1600
     * @tc.desc   Testing the Constructor of set, element is boolean, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0016";
      try {
        const setList = new collections.Set<boolean>([true, false]);
        let rst = setList.has(true);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1700
     * @tc.desc   Testing the Constructor of set, element is undefined, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0017";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        setList.add(undefined);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(undefined);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1800
     * @tc.desc   Testing the Constructor of set, element is undefined, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0018";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        let rst = setList.delete(undefined);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(undefined);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1900
     * @tc.desc   Testing the Constructor of set, element is undefined, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0019";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        let rst = setList.has(undefined);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2000
     * @tc.desc   Testing the Constructor of set, element is null, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0020";
      try {
        const setList = new collections.Set<null>([null]);
        setList.add(null);
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(iterator.next().value == null).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2100
     * @tc.desc   Testing the Constructor of set, element is null, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0021";
      try {
        const setList = new collections.Set<null>([null, null]);
        let rst = setList.delete(null);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2200
     * @tc.desc   Testing the Constructor of set, element is null, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0022";
      try {
        const setList = new collections.Set<null>([null, null]);
        let rst = setList.has(null);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2300
     * @tc.desc   Testing the Constructor of set, element is bigint, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0023";
      try {
        const setList = new collections.Set<bigint>([555555n]);
        setList.add(99999999n);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(555555n);
        expect(iterator.next().value).assertEqual(99999999n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2400
     * @tc.desc   Testing the Constructor of set, element is bigint, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0024";
      try {
        const setList = new collections.Set<bigint>([66666666n, 99999999n]);
        let rst = setList.delete(66666666n);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(99999999n);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2500
     * @tc.desc   Testing the Constructor of set, element is bigint, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0025";
      try {
        const setList = new collections.Set<bigint>([66666666n, 99999999n]);
        let rst = setList.has(99999999n);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2600
     * @tc.desc   Testing the Constructor of set, element is Array, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0026";
      try {
        let arrayList = new collections.Array<number>(1,2,3);
        const setList = new collections.Set<collections.Array<number>>([arrayList]);
        let arrayList1 = new collections.Array<number>(4,5,6);
        setList.add(arrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,2,3");
        expect(iterator.next().value.toString()).assertEqual("4,5,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2700
     * @tc.desc   Testing the Constructor of set, element is Array, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0027";
      try {
        let arrayList1 = new collections.Array<number>(1,2,3);
        let arrayList2 = new collections.Array<number>(4,5,6);
        const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
        setList.delete(arrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("4,5,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2800
     * @tc.desc   Testing the Constructor of set, element is Array, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0028";
      try {
        let arrayList1 = new collections.Array<number>(1,2,3);
        let arrayList2 = new collections.Array<number>(4,5,6);
        const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
        let rst = setList.has(arrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2900
     * @tc.desc   Testing the Constructor of set, element is Map, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0029";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        const setList = new collections.Set<collections.Map<number, string>>([mapList1]);
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
        setList.add(mapList2);
        const iterator = setList.values();
        expect(iterator.next().value.entries().next().value.toString()).assertEqual("1,a");
        expect(iterator.next().value.entries().next().value.toString()).assertEqual("2,b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3000
     * @tc.desc   Testing the Constructor of set, element is Map, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0030";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
        const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
        setList.delete(mapList2);
        const iterator = setList.values();
        expect(iterator.next().value.entries().next().value.toString()).assertEqual("1,a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3100
     * @tc.desc   Testing the Constructor of set, element is Map, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0031";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
        const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
        let rst = setList.has(mapList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3200
     * @tc.desc   Testing the Constructor of set, element is Set, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0032";
      try {
        let setList1 = new collections.Set<number>([1]);
        const setList = new collections.Set<collections.Set<number>>([setList1]);
        let setList2 = new collections.Set<number>([2]);
        setList.add(setList2);
        const iterator = setList.values();
        expect(iterator.next().value.values().next().value.toString()).assertEqual("1");
        expect(iterator.next().value.values().next().value.toString()).assertEqual("2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3300
     * @tc.desc   Testing the Constructor of set, element is Set, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0033";
      try {
        let setList1 = new collections.Set<number>([1]);
        let setList2 = new collections.Set<number>([2]);
        const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
        setList.delete(setList1);
        const iterator = setList.values();
        expect(iterator.next().value.values().next().value.toString()).assertEqual("2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3400
     * @tc.desc   Testing the Constructor of set, element is Set, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0034";
      try {
        let setList1 = new collections.Set<number>([1]);
        let setList2 = new collections.Set<number>([2]);
        const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
        let rst = setList.has(setList1);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3500
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0035";
      try {
        let arrayBuf1 = new collections.ArrayBuffer(5);
        const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1]);
        let arrayBuf2 = new collections.ArrayBuffer(3);
        setList.add(arrayBuf2);
        const iterator = setList.values();
        expect(iterator.next().value.byteLength).assertEqual(5);
        expect(iterator.next().value.byteLength).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3600
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0036";
      try {
        let arrayBuf1 = new collections.ArrayBuffer(5);
        let arrayBuf2 = new collections.ArrayBuffer(3);
        const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
        setList.delete(arrayBuf2);
        const iterator = setList.values();
        expect(iterator.next().value.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3700
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0037";
      try {
        let arrayBuf1 = new collections.ArrayBuffer(5);
        let arrayBuf2 = new collections.ArrayBuffer(3);
        const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
        let rst = setList.has(arrayBuf2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3800
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0038";
      try {
        let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
        const setList = new collections.Set<collections.Int8Array>([int8ArrayList1]);
        let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
        setList.add(int8ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_3900
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0039";
      try {
        let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
        let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
        setList.delete(int8ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4000
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0040";
      try {
        let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
        let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
        let rst = setList.has(int8ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4100
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0041";
      try {
        let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
        const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1]);
        let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
        setList.add(uint8ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4200
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0042";
      try {
        let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
        let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
        setList.delete(uint8ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4300
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0043";
      try {
        let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
        let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
        let rst = setList.has(uint8ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4400
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0044";
      try {
        let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
        const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1]);
        let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
        setList.add(uint8ClampedArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4500
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0045";
      try {
        let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
        let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
        setList.delete(uint8ClampedArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4600
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0046";
      try {
        let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
        let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
        let rst = setList.has(uint8ClampedArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4700
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0047";
      try {
        let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
        const setList = new collections.Set<collections.Int16Array>([int16ArrayList1]);
        let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
        setList.add(int16ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4800
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0048";
      try {
        let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
        let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
        setList.delete(int16ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_4900
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0049";
      try {
        let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
        let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
        let rst = setList.has(int16ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5000
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0050";
      try {
        let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
        const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1]);
        let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
        setList.add(uint16ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5100
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0051";
      try {
        let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
        let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
        setList.delete(uint16ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5200
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0052";
      try {
        let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
        let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
        let rst = setList.has(uint16ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5300
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0053";
      try {
        let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
        const setList = new collections.Set<collections.Int32Array>([int32ArrayList1]);
        let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
        setList.add(int32ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5400
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0054";
      try {
        let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
        let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
        setList.delete(int32ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5500
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0055";
      try {
        let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
        let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
        let rst = setList.has(int32ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5600
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0056";
      try {
        let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
        const setList = new collections.Set<collections.Float32Array>([float32ArrayList1]);
        let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
        setList.add(float32ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1.5,3.5,5.5");
        expect(iterator.next().value.toString()).assertEqual("7.5,9.5,11.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5700
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0057";
      try {
        let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
        let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
        const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
        setList.delete(float32ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7.5,9.5,11.5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5800
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0058";
      try {
        let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
        let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
        const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
        let rst = setList.has(float32ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_5900
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0059";
      try {
        let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
        const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1]);
        let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
        setList.add(uint32ArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6000
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0060";
      try {
        let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
        let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
        setList.delete(uint32ArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("7,9,11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6100
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0061";
      try {
        let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
        let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
        let rst = setList.has(uint32ArrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6200
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0062";
      try {
        let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1,3,5);
        let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2,4,6);
        const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1]);
        setList.add(concatArrayList2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,3,5");
        expect(iterator.next().value.toString()).assertEqual("2,4,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6300
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0063";
      try {
        let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1,3,5);
        let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2,4,6);
        const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
        setList.delete(concatArrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("2,4,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6400
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0064";
      try {
        let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1,3,5);
        let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2,4,6);
        const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
        let rst = setList.has(concatArrayList1);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6500
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0065";
      try {
        let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1,3,5);
        let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2,4,6);
        const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6600
     * @tc.desc   Testing the Constructor of set, element is Array, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0066";
      try {
        let arrayList1 = new collections.Array<number>(1,2,3);
        let arrayList2 = new collections.Array<number>(4,5,6);
        const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6700
     * @tc.desc   Testing the Constructor of set, element is Map, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0067";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
        const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6800
     * @tc.desc   Testing the Constructor of set, element is Set, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0068";
      try {
        let setList1 = new collections.Set<number>([1]);
        let setList2 = new collections.Set<number>([2]);
        const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_6900
     * @tc.desc   Testing the Constructor of set, element is string, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0069";
      try {
        const setList = new collections.Set<string>(["one", "two"]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7000
     * @tc.desc   Testing the Constructor of set, element is number, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0070";
      try {
        const setList = new collections.Set<number>([1, 2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7100
     * @tc.desc   Testing the Constructor of set, element is boolean, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0071";
      try {
        const setList = new collections.Set<boolean>([true, false]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7200
     * @tc.desc   Testing the Constructor of set, element is undefined, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0072";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7300
     * @tc.desc   Testing the Constructor of set, element is null, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0073";
      try {
        const setList = new collections.Set<null>([null, null]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7400
     * @tc.desc   Testing the Constructor of set, element is bigint, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0074";
      try {
        const setList = new collections.Set<bigint>([66666666n, 99999999n]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7500
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0075";
      try {
        let arrayBuf1 = new collections.ArrayBuffer(5);
        let arrayBuf2 = new collections.ArrayBuffer(3);
        const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7600
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0076";
      try {
        let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
        let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7700
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0077";
      try {
        let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
        let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7800
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0078";
      try {
        let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
        let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
        const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_7900
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0079";
      try {
        let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
        let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8000
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0080";
      try {
        let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
        let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8100
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0081";
      try {
        let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
        let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8200
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0082";
      try {
        let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
        let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
        const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8300
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0083";
      try {
        let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
        let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
        const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8400
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0084";
      try {
        let bitVectorList1 = new collections.BitVector(0);
        bitVectorList1.push(0);
        let bitVectorList2 = new collections.BitVector(0);
        bitVectorList2.push(1);
        const setList = new collections.Set<collections.BitVector>([bitVectorList1]);
        setList.add(bitVectorList2);
        const iterator = setList.values();
        expect(iterator.next().value.values().next().value).assertEqual(0);
        expect(iterator.next().value.values().next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8500
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0085";
      try {
        let bitVectorList1 = new collections.BitVector(0);
        bitVectorList1.push(0);
        let bitVectorList2 = new collections.BitVector(0);
        bitVectorList2.push(1);
        const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
        setList.delete(bitVectorList1);
        const iterator = setList.values();
        expect(iterator.next().value.values().next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8600
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0086";
      try {
        let bitVectorList1 = new collections.BitVector(0);
        bitVectorList1.push(0);
        let bitVectorList2 = new collections.BitVector(0);
        bitVectorList2.push(1);
        const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8700
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0087";
      try {
        let bitVectorList1 = new collections.BitVector(0);
        bitVectorList1.push(0);
        let bitVectorList2 = new collections.BitVector(0);
        bitVectorList2.push(1);
        const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
        let rst = setList.has(bitVectorList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8800
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0088";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let lock2 = new ArkTSUtils.locks.AsyncLock();
        const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1]);
        setList.add(lock2);
        expect(setList.size).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_8900
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0089";
      try {
        let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
        let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
        const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
        setList.delete(lock1);
        expect(setList.size).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9000
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0090";
      try {
        let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
        let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
        const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9100
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0091";
      try {
        let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
        let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
        const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
        let rst = setList.has(lock1);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9200
     * @tc.desc   Testing the Constructor of set, element is sendableClass, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0092";
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const setList = new collections.Set<SendableTestClass>([sendableClass1]);
        setList.add(sendableClass2);
        const iterator = setList.values();
        expect(iterator.next().value.getNum()).assertEqual(10);
        expect(iterator.next().value.getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9300
     * @tc.desc   Testing the Constructor of set, element is sendableClass, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0093";
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
        setList.delete(sendableClass1);
        const iterator = setList.values();
        expect(iterator.next().value.getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9400
     * @tc.desc   Testing the Constructor of set, element is sendableClass, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0094";
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9500
     * @tc.desc   Testing the Constructor of set, element is sendableClass, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0095";
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
        let rst = setList.has(sendableClass2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9600
     * @tc.desc   Testing the Constructor of set, element is union, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0096";
      try {
        let union1: number|string = 3;
        let union2: number|string = "abc"
        const setList = new collections.Set<number|string>([union1]);
        setList.add(union2);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("3");
        expect(iterator.next().value.toString()).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9700
     * @tc.desc   Testing the Constructor of set, element is union, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0097";
      try {
        let union1: number|string = 3;
        let union2: number|string = "abc"
        const setList = new collections.Set<number|string>([union1, union2]);
        setList.delete(union1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9800
     * @tc.desc   Testing the Constructor of set, element is union, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0098";
      try {
        let union1: number|string = 3;
        let union2: number|string = "abc"
        const setList = new collections.Set<number|string>([union1, union2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_9900
     * @tc.desc   Testing the Constructor of set, element is union, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0099";
      try {
        let union1: number|string = 3;
        let union2: number|string = "abc"
        const setList = new collections.Set<number|string>([union1, union2]);
        let rst = setList.has(union1);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10000
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0100";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 6;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 8;
        const setList = new collections.Set<ImplISendableClass>([sendableClass1]);
        setList.add(sendableClass2);
        const iterator = setList.values();
        expect(iterator.next().value.getNum()).assertEqual(6);
        expect(iterator.next().value.getNum()).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10100
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0101";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 6;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 8;
        const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
        setList.delete(sendableClass1);
        const iterator = setList.values();
        expect(iterator.next().value.getNum()).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10200
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0102";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 6;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 8;
        const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
        setList.clear();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10300
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0103";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 6;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 8;
        const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
        let rst = setList.has(sendableClass1);
        expect(rst).assertTrue()  ;
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10400
     * @tc.desc   Testing the entries of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0104";
      try {
        const setList = new collections.Set<number>();
        const iterator = setList.entries();
        expect(iterator.next().value == null).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10500
     * @tc.desc   Testing the entries of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0105";
      try {
        const setList = new collections.Set<number>([2, 4, 6]);
        const iterator = setList.entries();
        expect(iterator.next().value.toString()).assertEqual("2,2");
        expect(iterator.next().value.toString()).assertEqual("4,4");
        expect(iterator.next().value.toString()).assertEqual("6,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10600
     * @tc.desc   Testing the entries of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0106";
      try {
        const setList = new collections.Set<number>([1, 3]);
        setList.add(2);
        const iterator = setList.entries();
        expect(iterator.next().value.toString()).assertEqual("1,1");
        expect(iterator.next().value.toString()).assertEqual("3,3");
        expect(iterator.next().value.toString()).assertEqual("2,2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10700
     * @tc.desc   Testing the entries of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0107";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let rst = setList.delete(2);
        expect(rst).assertTrue();
        const iterator = setList.entries();
        expect(iterator.next().value.toString()).assertEqual("1,1");
        expect(iterator.next().value.toString()).assertEqual("3,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10800
     * @tc.desc   Testing the entries of set, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0108";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        setList.clear();
        const iterator = setList.entries();
        expect(iterator.next().value == null).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_10900
     * @tc.desc   Testing the forEach of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0109";
      try {
        const setList = new collections.Set<number>();
        let rstNum = 1;
        setList.forEach((value1, value2, setList) => {
          rstNum = value1;
        });
        expect(setList.size).assertEqual(0);
        expect(rstNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11000
     * @tc.desc   Testing the forEach of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0110";
      try {
        const setList = new collections.Set<number>([3, 5]);
        let rstNum = 0;
        setList.forEach((value1, value2, setList) => {
          rstNum = value1 + value2;
        });
        expect(rstNum).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11100
     * @tc.desc   Testing the forEach of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0111";
      try {
        const setList = new collections.Set<number>([3, 5]);
        let rstNum = 0;
        setList.add(7);
        setList.forEach((value1, value2, setList) => {
          rstNum = value1 + value2;
        });
        expect(rstNum).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11200
     * @tc.desc   Testing the forEach of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0112";
      try {
        const setList = new collections.Set<number>([3, 5]);
        let rstNum = 0;
        let rst = setList.delete(3);
        expect(rst).assertTrue();
        setList.forEach((value1, value2, setList) => {
          rstNum = value1 + value2;
        });
        expect(rstNum).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11300
     * @tc.desc   Testing the forEach of set, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0113";
      try {
        const setList = new collections.Set<number>([3, 5]);
        let rstNum = 0;
        setList.clear();
        setList.forEach((value1, value2, setList) => {
          rstNum = value1 + value2;
        });
        expect(rstNum).assertEqual(0);
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11400
     * @tc.desc   Testing the keys of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0114";
      try {
        const setList = new collections.Set<number>();
        const iterator = setList.keys();
        expect(iterator.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11500
     * @tc.desc   Testing the keys of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0115";
      try {
        const setList = new collections.Set<number>([3, 5, 7]);
        const iterator = setList.keys();
        expect(iterator.next().value).assertEqual(3);
        expect(iterator.next().value).assertEqual(5);
        expect(iterator.next().value).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11600
     * @tc.desc   Testing the values of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0116";
      try {
        const setList = new collections.Set<string>();
        const iterator = setList.values();
        expect(iterator.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11700
     * @tc.desc   Testing the values of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0117";
      try {
        const setList = new collections.Set<string>(["a", "b", "c"]);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual("a");
        expect(iterator.next().value).assertEqual("b");
        expect(iterator.next().value).assertEqual("c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11800
     * @tc.desc   Testing the values of set, set is not null, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0118";
      try {
        const setList = new collections.Set<string>(["a", "b", "c"]);
        setList.add("abc");
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual("a");
        expect(iterator.next().value).assertEqual("b");
        expect(iterator.next().value).assertEqual("c");
        expect(iterator.next().value).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_11900
     * @tc.desc   Testing the values of set, set is not null, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0119";
      try {
        const setList = new collections.Set<string>(["a", "b", "c"]);
        let rst = setList.delete("a");
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual("b");
        expect(iterator.next().value).assertEqual("c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12000
     * @tc.desc   Testing the values of set, set is not null, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0120";
      try {
        const setList = new collections.Set<string>(["a", "b", "c"]);
        setList.clear();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12100
     * @tc.desc   Testing the clear of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0121";
      try {
        const setList = new collections.Set<number>();
        setList.clear();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12200
     * @tc.desc   Testing the clear of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0122";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        setList.clear();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12300
     * @tc.desc   Testing the clear of set, set is not null, clear, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0123";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        setList.clear();
        expect(setList.size).assertEqual(0);
        setList.add(3);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(3);
        expect(setList.size).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12400
     * @tc.desc   Testing the delete of set, delete non-exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0124";
      try {
        const setList = new collections.Set<number>([1, 3, 5]);
        let rst = setList.delete(2);
        expect(rst).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12500
     * @tc.desc   Testing the delete of set, delete exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0125";
      try {
        const setList = new collections.Set<number>([1, 3, 5]);
        let rst = setList.delete(3);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12600
     * @tc.desc   Testing the delete of set, delete null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0126";
      try {
        const setList = new collections.Set<null>([null]);
        expect(setList.size).assertEqual(1);
        let rst = setList.delete(null);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12700
     * @tc.desc   Testing the delete of set, delete undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0127";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        expect(setList.size).assertEqual(1);
        let rst = setList.delete(undefined);
        expect(rst).assertTrue();
        expect(setList.size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12800
     * @tc.desc   Testing the has of set, has non-exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0128";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let rst = setList.has(5);
        expect(rst).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_12900
     * @tc.desc   Testing the has of set, has exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0129";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let rst = setList.has(2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13000
     * @tc.desc   Testing the has of set, has null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0130";
      try {
        const setList = new collections.Set<null>([null]);
        let rst = setList.has(null);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13100
     * @tc.desc   Testing the has of set, has undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0131";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        let rst = setList.has(undefined);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13200
     * @tc.desc   Testing the add of set, add non-exist value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0132";
      try {
        const setList = new collections.Set<number>([1, 2]);
        setList.add(3);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
        expect(iterator.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13300
     * @tc.desc   Testing the add of set, add exist value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0133";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        setList.add(3);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
        expect(iterator.next().value).assertEqual(3);
        expect(setList.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13400
     * @tc.desc   Testing the add of set, add null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0134";
      try {
        const setList = new collections.Set<null>([null]);
        expect(setList.size).assertEqual(1);
        setList.add(null);
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(setList.size).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_13500
     * @tc.desc   Testing the add of set, add undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0135";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        expect(setList.size).assertEqual(1);
        setList.add(undefined);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(undefined);
        expect(setList.size).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
  })
}
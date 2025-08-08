import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function BitVectorTest() {
  describe('BitVectorTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0100
     * @tc.name       : testBitVectorConstructor0001
     * @tc.desc       : Testing the constructor of bitVector, length is -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(-1);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0200
     * @tc.name       : testBitVectorConstructor0002
     * @tc.desc       : Testing the constructor of bitVector, length is 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0300
     * @tc.name       : testBitVectorConstructor0003
     * @tc.desc       : Testing the constructor of bitVector, length is 10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        expect(bitVectorList.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0400
     * @tc.name       : testBitVectorConstructor0004
     * @tc.desc       : Testing the constructor of bitVector, length is 100000
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(100000);
        expect(bitVectorList.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0500
     * @tc.name       : testBitVectorPush0001
     * @tc.desc       : Testing the Push of bitVector, push 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0600
     * @tc.name       : testBitVectorPush0002
     * @tc.desc       : Testing the Push of bitVector, push 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0700
     * @tc.name       : testBitVectorPush0003
     * @tc.desc       : Testing the Push of bitVector, push -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(-1);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0800
     * @tc.name       : testBitVectorPush0004
     * @tc.desc       : Testing the Push of bitVector, push 65535
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(65535);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0900
     * @tc.name       : testBitVectorPush0005
     * @tc.desc       : Testing the Push of bitVector, push -65535
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(-65535);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1000
     * @tc.name       : testBitVectorPush0006
     * @tc.desc       : Testing the Push of bitVector, push 2.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(2.5);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1100
     * @tc.name       : testBitVectorPush0007
     * @tc.desc       : Testing the Push of bitVector, push 10 times 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        for (let i = 0; i < 10; i++) {
          rst = bitVectorList.push(1);
        }
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1200
     * @tc.name       : testBitVectorPush0008
     * @tc.desc       : Testing the Push of bitVector, push 100000 times 0 and 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        for (let i = 0; i < 100000; i++) {
          rst = bitVectorList.push(0);
          rst = bitVectorList.push(1);
        }
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(200000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1300
     * @tc.name       : testBitVectorPop0001
     * @tc.desc       : Testing the pop of bitVector, pop 10 times
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = 0;
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        for (let i = 0; i < 10; i++) {
          rst = bitVectorList.pop();
          expect(rst).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1400
     * @tc.name       : testBitVectorPop0002
     * @tc.desc       : Testing the pop of bitVector, pop 100000 times
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(100000);
        let rst = 0;
        for (let i = 0; i < 100000; i++) {
          rst = bitVectorList.pop();
        }
        expect(rst).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1500
     * @tc.name       : testBitVectorPop0003
     * @tc.desc       : Testing the pop of bitVector, pop succeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1600
     * @tc.name       : testBitVectorPop0004
     * @tc.desc       : Testing the pop of bitVector, pop succeed and return length
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(3);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1700
     * @tc.name       : testBitVectorPop0005
     * @tc.desc       : Testing the pop of bitVector, bitVector is null, pop failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorPop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(undefined);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1800
     * @tc.name       : testBitVectorHas0001
     * @tc.desc       : Testing the has of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(0, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1900
     * @tc.name       : testBitVectorHas0002
     * @tc.desc       : Testing the has of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(0, 0, 5);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2000
     * @tc.name       : testBitVectorHas0003
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 0, 4);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2100
     * @tc.name       : testBitVectorHas0004
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2200
     * @tc.name       : testBitVectorHas0005
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, -1, 10);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2300
     * @tc.name       : testBitVectorHas0006
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 0, 11);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2400
     * @tc.name       : testBitVectorHas0007
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 5, 4);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2500
     * @tc.name       : testBitVectorHas0008
     * @tc.desc       : Testing the has of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 5, 5);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2600
     * @tc.name       : testBitVectorSetBitsByRange0001
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(0, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2700
     * @tc.name       : testBitVectorSetBitsByRange0002
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(0, 0, 5);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2800
     * @tc.name       : testBitVectorSetBitsByRange0003
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, 0, 4);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2900
     * @tc.name       : testBitVectorSetBitsByRange0004
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3000
     * @tc.name       : testBitVectorSetBitsByRange0005
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, -1, 10);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3100
     * @tc.name       : testBitVectorSetBitsByRange0006
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, 0, 11);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3200
     * @tc.name       : testBitVectorSetBitsByRange0007
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, 5, 4);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3300
     * @tc.name       : testBitVectorSetBitsByRange0008
     * @tc.desc       : Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 5, 10);
        let rst = bitVectorList.has(1, 5, 5);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3400
     * @tc.name       : testBitVectorSetBitsByRange0009
     * @tc.desc       : Testing the setBitsByRange of bitVector, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetBitsByRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetBitsByRange0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.setBitsByRange(1,1,3);
        expect(bitVectorList[0].toString()).assertEqual("0");
        expect(bitVectorList[1].toString()).assertEqual("1");
        expect(bitVectorList[2].toString()).assertEqual("1");
        expect(bitVectorList[3].toString()).assertEqual("0");
        expect(bitVectorList[4].toString()).assertEqual("0");
        expect(bitVectorList[5].toString()).assertEqual("1");
        expect(bitVectorList[6].toString()).assertEqual("1");
        expect(bitVectorList[7].toString()).assertEqual("1");
        expect(bitVectorList[8].toString()).assertEqual("1");
        expect(bitVectorList[9].toString()).assertEqual("1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3500
     * @tc.name       : testBitVectorSetAllBits0001
     * @tc.desc       : Testing the SetAllBits of bitVector, set 0, return 0(all).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetAllBits0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(0);
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("0");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3600
     * @tc.name       : testBitVectorSetAllBits0002
     * @tc.desc       : Testing the SetAllBits of bitVector, set 1, return 1(all).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetAllBits0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(1);
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3700
     * @tc.name       : testBitVectorSetAllBits0003
     * @tc.desc       : Testing the SetAllBits of bitVector, set -1, return 1(all).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetAllBits0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(-1);
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3800
     * @tc.name       : testBitVectorSetAllBits0004
     * @tc.desc       : Testing the SetAllBits of bitVector, set 65535, return 1(all).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetAllBits0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(65535);
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3900
     * @tc.name       : testBitVectorSetAllBits0005
     * @tc.desc       : Testing the SetAllBits of bitVector, set 2.5, return 1(all).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorSetAllBits0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(2.5);
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4000
     * @tc.name       : testBitVectorGetBitsByRange0001
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=0,toIndex=6, return 000001.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(0,6);
        for (let i=0; i<6; i++) {
          if (i < 5) {
            expect(bitVectorList2[i].toString()).assertEqual("0");
          } else {
            expect(bitVectorList2[i].toString()).assertEqual("1");
          }
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4100
     * @tc.name       : testBitVectorGetBitsByRange0002
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=10, return 011111.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(4,10);
        for (let i=0; i<6; i++) {
          if (i < 1) {
            expect(bitVectorList2[i].toString()).assertEqual("0");
          } else {
            expect(bitVectorList2[i].toString()).assertEqual("1");
          }
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4200
     * @tc.name       : testBitVectorGetBitsByRange0003
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(4,11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4300
     * @tc.name       : testBitVectorGetBitsByRange0004
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(-1,10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4400
     * @tc.name       : testBitVectorGetBitsByRange0005
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(5,4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4500
     * @tc.name       : testBitVectorGetBitsByRange0006
     * @tc.desc       : Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitsByRange0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let bitVectorList2 = bitVectorList.getBitsByRange(5,5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4600
     * @tc.name       : testBitVectorResize0001
     * @tc.desc       : Testing the resize of bitVector, size is -1, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.resize(-1);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"length\" is out of range. It must be >= 0. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4700
     * @tc.name       : testBitVectorResize0002
     * @tc.desc       : Testing the resize of bitVector, size is 5, return 01000.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.resize(5);
        expect(bitVectorList.length).assertEqual(5);
        expect(bitVectorList[0].toString()).assertEqual("0");
        expect(bitVectorList[1].toString()).assertEqual("1");
        expect(bitVectorList[2].toString()).assertEqual("0");
        expect(bitVectorList[3].toString()).assertEqual("0");
        expect(bitVectorList[4].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4800
     * @tc.name       : testBitVectorResize0003
     * @tc.desc       : Testing the resize of bitVector, size is 1, return 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.resize(1);
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList[0].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4900
     * @tc.name       : testBitVectorGetBitCountByRange0001
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is 0~6, return 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,0,6);
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5000
     * @tc.name       : testBitVectorGetBitCountByRange0002
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is 4~10, return 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,4,10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5100
     * @tc.name       : testBitVectorGetBitCountByRange0003
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is 4~11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,4,11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5200
     * @tc.name       : testBitVectorGetBitCountByRange0004
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is -1~10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,-1,10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5300
     * @tc.name       : testBitVectorGetBitCountByRange0005
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is 5~4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,5,4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5400
     * @tc.name       : testBitVectorGetBitCountByRange0006
     * @tc.desc       : Testing the getBitCountByRange of bitVector, range is 5~5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetBitCountByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetBitCountByRange0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getBitCountByRange(1,5,5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5500
     * @tc.name       : testBitVectorGetIndexOf0001
     * @tc.desc       : Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0,0,10);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5600
     * @tc.name       : testBitVectorGetIndexOf0002
     * @tc.desc       : Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0,0,5);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5700
     * @tc.name       : testBitVectorGetIndexOf0003
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,0,5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5800
     * @tc.name       : testBitVectorGetIndexOf0004
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,0,10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5900
     * @tc.name       : testBitVectorGetIndexOf0005
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,-1,10);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6000
     * @tc.name       : testBitVectorGetIndexOf0006
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,0,11);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6100
     * @tc.name       : testBitVectorGetIndexOf0007
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,5,4);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6200
     * @tc.name       : testBitVectorGetIndexOf0008
     * @tc.desc       : Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1,5,5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6300
     * @tc.name       : testBitVectorGetLastIndexOf0001
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(0,0,10);
        expect(num).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6400
     * @tc.name       : testBitVectorGetLastIndexOf0002
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(0,0,5);
        expect(num).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6500
     * @tc.name       : testBitVectorGetLastIndexOf0003
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,0,5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6600
     * @tc.name       : testBitVectorGetLastIndexOf0004
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 9.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,0,10);
        expect(num).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6700
     * @tc.name       : testBitVectorGetLastIndexOf0005
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,-1,10);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6800
     * @tc.name       : testBitVectorGetLastIndexOf0006
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,0,11);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6900
     * @tc.name       : testBitVectorGetLastIndexOf0007
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,5,4);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7000
     * @tc.name       : testBitVectorGetLastIndexOf0008
     * @tc.desc       : Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorGetLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetLastIndexOf0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getLastIndexOf(1,5,5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7100
     * @tc.name       : testBitVectorFlipBitByIndex0001
     * @tc.desc       : Testing the flipBitByIndex of bitVector, index is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitByIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitByIndex0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(0);
        expect(bitVectorList[0].toString()).assertEqual("1");
        expect(bitVectorList[1].toString()).assertEqual("1");
        expect(bitVectorList[2].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7200
     * @tc.name       : testBitVectorFlipBitByIndex0002
     * @tc.desc       : Testing the flipBitByIndex of bitVector, index is 5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitByIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitByIndex0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(5);
        expect(bitVectorList[0].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7300
     * @tc.name       : testBitVectorFlipBitByIndex0003
     * @tc.desc       : Testing the flipBitByIndex of bitVector, index is -1, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitByIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitByIndex0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(-1);
        expect(bitVectorList[0].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7400
     * @tc.name       : testBitVectorFlipBitsByRange0001
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=0,toIndex=6.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(0,6);
        let arrayList = new collections.Array<string>("1","1","1","1","1","0","1","1","1","1");
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7500
     * @tc.name       : testBitVectorFlipBitsByRange0002
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(4,10);
        let arrayList = new collections.Array<string>("0","0","0","0","1","0","0","0","0","0");
        for (let i=0; i<10; i++) {
          expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7600
     * @tc.name       : testBitVectorFlipBitsByRange0003
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(4,11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7700
     * @tc.name       : testBitVectorFlipBitsByRange0004
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(-1,10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7800
     * @tc.name       : testBitVectorFlipBitsByRange0005
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(5,4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7900
     * @tc.name       : testBitVectorFlipBitsByRange0006
     * @tc.desc       : Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorFlipBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorFlipBitsByRange0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i=0; i<10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.flipBitsByRange(5,5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8000
     * @tc.name       : testBitVectorValues0001
     * @tc.desc       : Testing the values of bitVector, bitvector is null, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8100
     * @tc.name       : testBitVectorValues0002
     * @tc.desc       : Testing the values of bitVector, bitvector is not null, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0,1,1);
        let i = 0;
        for (let iter of bitVectorList.values()) {
          expect(iter).assertEqual(arrayList[i])
          i++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8200
     * @tc.name       : testBitVectorValues0003
     * @tc.desc       : Testing the values of bitVector, bitvector is not null, return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBitVectorValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0,1,1);
        let i = 0;
        let iter = bitVectorList.values();
        let tmp = iter.next();
        expect(tmp.value).assertEqual(0);
        tmp = iter.next();
        expect(tmp.value).assertEqual(1);
        tmp = iter.next();
        expect(tmp.value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
  })
}
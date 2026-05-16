import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../testability/TestUtils';

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
    afterAll(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(100);
    })
    /**
     * @tc.name   testBitVectorConstructor0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1000
     * @tc.desc   Testing the constructor of bitVector, length is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorConstructor0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1010
     * @tc.desc   Testing the constructor of bitVector, length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorConstructor0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1020
     * @tc.desc   Testing the constructor of bitVector, length is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorConstructor0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1030
     * @tc.desc   Testing the constructor of bitVector, length is 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorConstructor0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1040
     * @tc.desc   Testing the constructor of bitVector, NaN parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorConstructor0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1050
     * @tc.desc   Testing the constructor of bitVector, Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorConstructor0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1060
     * @tc.desc   Testing the constructor of bitVector, -Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(-Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorConstructor0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1070
     * @tc.desc   Testing the constructor of bitVector, float 0.5 parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorConstructor0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1080
     * @tc.desc   Testing the constructor of bitVector, instance type validation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        expect(bitVectorList instanceof collections.BitVector).assertTrue();
        expect(typeof bitVectorList.length).assertEqual("number");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPush0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1090
     * @tc.desc   Testing the Push of bitVector, push 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1100
     * @tc.desc   Testing the Push of bitVector, push 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1110
     * @tc.desc   Testing the Push of bitVector, push -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1120
     * @tc.desc   Testing the Push of bitVector, push 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1130
     * @tc.desc   Testing the Push of bitVector, push -65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1140
     * @tc.desc   Testing the Push of bitVector, push 2.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1150
     * @tc.desc   Testing the Push of bitVector, push 10 times 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPush0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1160
     * @tc.desc   Testing the Push of bitVector, push 100000 times 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        for (let i = 0; i < 1000; i++) {
          rst = bitVectorList.push(0);
          rst = bitVectorList.push(1);
        }
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPush0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1170
     * @tc.desc   BitVector push with extra parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPush0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1180
     * @tc.desc   BitVector push return value type validation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(typeof rst).assertEqual("boolean");
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1190
     * @tc.desc   Testing the pop of bitVector, pop 10 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPop0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1200
     * @tc.desc   Testing the pop of bitVector, pop 100000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10000);
        let rst = 0;
        for (let i = 0; i < 10000; i++) {
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
     * @tc.name   testBitVectorPop0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1210
     * @tc.desc   Testing the pop of bitVector, pop succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPop0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1220
     * @tc.desc   Testing the pop of bitVector, pop succeed and return length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPop0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1230
     * @tc.desc   Testing the pop of bitVector, bitVector is null, pop failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorPop0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1240
     * @tc.desc   Testing the pop of bitVector, pop called without parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1250
     * @tc.desc   Testing the pop of bitVector, pop called with extra parameters should ignore them.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1260
     * @tc.desc   Testing the pop of bitVector, return value type should be number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(typeof num).assertEqual('number');
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1270
     * @tc.desc   Testing the pop of bitVector, return value should be 0 or 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num1 = bitVectorList.pop();
        expect(num1 === 0 || num1 === 1).assertTrue();
        let num2 = bitVectorList.pop();
        expect(num2 === 0 || num2 === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1280
     * @tc.desc   Testing the pop of bitVector, push after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList.length).assertEqual(2);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1290
     * @tc.desc   Testing the pop of bitVector, alternating push and pop operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.push(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1300
     * @tc.desc   Testing the pop of bitVector, single element BitVector becomes empty after pop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(1);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
        let num2 = bitVectorList.pop();
        expect(num2).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1310
     * @tc.desc   Testing the pop of bitVector, index access after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(3);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1320
     * @tc.desc   Testing the pop of bitVector, iterator after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorPop0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1330
     * @tc.desc   Testing the pop of bitVector, length change after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(3);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(2);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(1);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1340
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorHas0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1350
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorHas0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1360
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorHas0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1370
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorHas0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1380
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1390
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(`${err.message}`)
          .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1400
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1410
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1420
     * @tc.desc   BitVector has with single parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(1, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1430
     * @tc.desc   BitVector has with two parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 1, 4);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1440
     * @tc.desc   BitVector has with extra parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(1, 0, 3);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1450
     * @tc.desc   BitVector has with fromIndex=NaN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.has(0, NaN, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1460
     * @tc.desc   BitVector has with fromIndex=float number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        let rst = bitVectorList.has(0, 1.5, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1470
     * @tc.desc   BitVector has on empty BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0020";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.has(0, 0, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1480
     * @tc.desc   BitVector has return value type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0021";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst1 = bitVectorList.has(0, 0, 3);
        expect(typeof rst1).assertEqual("boolean");
        expect(rst1).assertEqual(true);
        let rst2 = bitVectorList.has(1, 0, 1);
        expect(typeof rst2).assertEqual("boolean");
        expect(rst2).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1490
     * @tc.desc   BitVector has with element=positive number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0022";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(2, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorHas0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1500
     * @tc.desc   BitVector has with element=negative number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0023";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(-1, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1510
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
     * @tc.name   testBitVectorSetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1520
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
     * @tc.name   testBitVectorSetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1530
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
     * @tc.name   testBitVectorSetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1540
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
     * @tc.name   testBitVectorSetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1550
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1560
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1570
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1580
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1590
     * @tc.desc   Testing the setBitsByRange of bitVector, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          bitVectorList.setBitsByRange(1, 1, 3);
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
     * @tc.name   testBitVectorSetBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1600
     * @tc.desc   BitVector setBitsByRange with extra parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 2);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList.length).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1610
     * @tc.desc   BitVector setBitsByRange with negative fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, -1, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1620
     * @tc.desc   BitVector setBitsByRange with toIndex out of range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1630
     * @tc.desc   BitVector setBitsByRange with fromIndex greater than toIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 2, 1);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1640
     * @tc.desc   BitVector setBitsByRange set entire range and verify return value as void test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 5);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(1);
          expect(bitVectorList[4]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1650
     * @tc.desc   BitVector setBitsByRange set large range (1000 elements) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 0, 100);
          for (let i = 0; i < 100; i++) {
            expect(bitVectorList[i]).assertEqual(1);
          }
          expect(bitVectorList.length).assertEqual(100);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetAllBits0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1660
     * @tc.desc   Testing the SetAllBits of bitVector, set 0, return 0(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("0");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1670
     * @tc.desc   Testing the SetAllBits of bitVector, set 1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1680
     * @tc.desc   Testing the SetAllBits of bitVector, set -1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(-1);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1690
     * @tc.desc   Testing the SetAllBits of bitVector, set 65535, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(65535);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1700
     * @tc.desc   Testing the SetAllBits of bitVector, set 2.5, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(2.5);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1710
     * @tc.desc   BitVector setAllBits with extra parameters test, extra params should be ignored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1720
     * @tc.desc   BitVector setAllBits return value void verification and large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0015";
      try {
        let emptyBitVector: collections.BitVector = new collections.BitVector(0);
        emptyBitVector.setAllBits(0);
        expect(emptyBitVector.length).assertEqual(0);
        let largeBitVector: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1000; i++) {
          largeBitVector.push(i % 2);
        }
        largeBitVector.setAllBits(1);
        expect(largeBitVector.length).assertEqual(1000);
        for (let i = 0; i < 10; i++) {
          expect(largeBitVector[i]).assertEqual(1);
          expect(largeBitVector[999 - i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1730
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=0,toIndex=6, return 000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(0, 6);
          for (let i = 0; i < 6; i++) {
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
     * @tc.name   testBitVectorGetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1740
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=10, return 011111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(4, 10);
          for (let i = 0; i < 6; i++) {
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
     * @tc.name   testBitVectorGetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1750
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1760
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(-1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1770
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1780
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1790
     * @tc.desc   BitVector getBitsByRange with NaN fromIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(NaN, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1800
     * @tc.desc   BitVector getBitsByRange with NaN toIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1810
     * @tc.desc   BitVector getBitsByRange with negative fromIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(-1, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1820
     * @tc.desc   BitVector getBitsByRange with toIndex out of range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(0, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1830
     * @tc.desc   BitVector getBitsByRange with large range 1000 elements test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let result = bitVectorList.getBitsByRange(50, 100);
          expect(result.length).assertEqual(50);
          expect(result instanceof collections.BitVector).assertTrue();
          for (let i = 0; i < 50; i++) {
            expect(result[i]).assertEqual((50 + i) % 2);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorResize0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1840
     * @tc.desc   Testing the resize of bitVector, size is -1, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(`${err.message}`)
          .assertEqual("The value of \"length\" is out of range. It must be >= 0. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1850
     * @tc.desc   Testing the resize of bitVector, size is 5, return 01000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorResize0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1860
     * @tc.desc   Testing the resize of bitVector, size is 1, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorResize0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1870
     * @tc.desc   BitVector resize with extra parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.resize(10);
        expect(bitVectorList.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1880
     * @tc.desc   BitVector resize with NaN parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.resize(NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1890
     * @tc.desc   BitVector resize with Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.resize(Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1900
     * @tc.desc   BitVector resize to 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.resize(0);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1910
     * @tc.desc   BitVector resize to large size 100000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(100000);
        expect(bitVectorList.length).assertEqual(100000);
        expect(bitVectorList[0].toString()).assertEqual("0");
        expect(bitVectorList[1].toString()).assertEqual("1");
        expect(bitVectorList[99999].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1920
     * @tc.desc   BitVector resize to same size test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.resize(3);
        expect(bitVectorList.length).assertEqual(3);
        expect(bitVectorList[0].toString()).assertEqual("0");
        expect(bitVectorList[1].toString()).assertEqual("1");
        expect(bitVectorList[2].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorResize0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1930
     * @tc.desc   BitVector resize verify original data preserved test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorResize0016";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(10);
        expect(bitVectorList.length).assertEqual(10);
        expect(bitVectorList[0].toString()).assertEqual("1");
        expect(bitVectorList[1].toString()).assertEqual("0");
        expect(bitVectorList[2].toString()).assertEqual("1");
        expect(bitVectorList[3].toString()).assertEqual("0");
        expect(bitVectorList[4].toString()).assertEqual("1");
        expect(bitVectorList[5].toString()).assertEqual("0");
        expect(bitVectorList[6].toString()).assertEqual("0");
        expect(bitVectorList[7].toString()).assertEqual("0");
        expect(bitVectorList[8].toString()).assertEqual("0");
        expect(bitVectorList[9].toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1940
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 0~6, return 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 6);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1950
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 4, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1960
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1970
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is -1~10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, -1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1980
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1990
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2000
     * @tc.desc   BitVector getBitCountByRange element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0007";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(2, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2010
     * @tc.desc   BitVector getBitCountByRange element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(-1, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2020
     * @tc.desc   BitVector getBitCountByRange fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, NaN, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2030
     * @tc.desc   BitVector getBitCountByRange toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, 0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2040
     * @tc.desc   BitVector getBitCountByRange all zeros return 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 0, 5);
          expect(num).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2050
     * @tc.desc   BitVector getBitCountByRange all ones return 5 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(1, 0, 5);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2060
     * @tc.desc   BitVector getBitCountByRange large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 100);
          expect(num).assertEqual(50);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2070
     * @tc.desc   BitVector getBitCountByRange single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(1, 0, 1);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2080
     * @tc.desc   BitVector getBitCountByRange return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 10);
          expect(typeof num).assertEqual('number');
          expect(num >= 0).assertTrue();
          expect(num <= 10).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2090
     * @tc.desc   BitVector getBitCountByRange fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, Infinity, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2100
     * @tc.desc   BitVector getBitCountByRange toIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, 0, Infinity);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2110
     * @tc.desc   BitVector getBitCountByRange alternating bits test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2120
     * @tc.desc   BitVector getBitCountByRange fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0027";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(0, 4, 5);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2130
     * @tc.desc   BitVector getBitCountByRange toIndex fromIndex+1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0028";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 1, 2);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2140
     * @tc.desc   BitVector getBitCountByRange toIndex fromIndex+2 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0029";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 1, 3);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2150
     * @tc.desc   BitVector getBitCountByRange single element match return 1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0030";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(0, 0, 5);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2160
     * @tc.desc   BitVector getIndexOf multiple matches return first test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0026";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 1, 5);
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2170
     * @tc.desc   BitVector getIndexOf last element match test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0027";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 2, 5);
        expect(num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2180
     * @tc.desc   BitVector getIndexOf fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0028";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 4, 5);
        expect(num).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2190
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 10);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2200
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 5);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2210
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2220
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2230
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, -1, 10);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2240
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 11);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2250
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 5, 4);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2260
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 5, 5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2270
     * @tc.desc   BitVector getIndexOf element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(2, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2280
     * @tc.desc   BitVector getIndexOf element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(-1, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2290
     * @tc.desc   BitVector getIndexOf fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.getIndexOf(1, NaN, 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2300
     * @tc.desc   BitVector getIndexOf toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.getIndexOf(1, 0, NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2310
     * @tc.desc   BitVector getIndexOf all zeros return -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(1, 0, 3);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2320
     * @tc.desc   BitVector getIndexOf all ones return -1 for 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let num = bitVectorList.getIndexOf(0, 0, 3);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2330
     * @tc.desc   BitVector getIndexOf large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0016";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(100);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 50, 51);
        let num = bitVectorList.getIndexOf(1, 0, 100);
        expect(num).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2340
     * @tc.desc   BitVector getIndexOf single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0017";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 0, 1);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2350
     * @tc.desc   BitVector getIndexOf return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 10);
        expect(typeof num).assertEqual('number');
        expect(num >= -1 && num < 10).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2360
     * @tc.desc   BitVector getIndexOf first element match test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0020";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 0, 5);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2370
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 10);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2380
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2390
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2400
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 10);
          expect(num).assertEqual(9);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2410
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, -1, 10);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2420
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 11);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2430
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0007";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 5, 4);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2440
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 5, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2450
     * @tc.desc   BitVector getLastIndexOf element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0009";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(2, 0, 5);
          expect(num).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2460
     * @tc.desc   BitVector getLastIndexOf element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(-1, 0, 5);
          expect(num).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2470
     * @tc.desc   BitVector getLastIndexOf fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, NaN, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2480
     * @tc.desc   BitVector getLastIndexOf fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, Infinity, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2490
     * @tc.desc   BitVector getLastIndexOf toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, 0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2500
     * @tc.desc   BitVector getLastIndexOf all zeros return -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(1, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2510
     * @tc.desc   BitVector getLastIndexOf all ones return -1 for 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2520
     * @tc.desc   BitVector getLastIndexOf large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 100);
          expect(num).assertEqual(98);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2530
     * @tc.desc   BitVector getLastIndexOf single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 0, 1);
          expect(num).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2540
     * @tc.desc   BitVector getLastIndexOf method binding error code 10200011 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0019";
        let bitVectorList: collections.BitVector | null = null;
        try {
          bitVectorList = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let getLastIndexOfFn = bitVectorList.getLastIndexOf;
          bitVectorList = null;
          getLastIndexOfFn(0, 0, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200011);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2550
     * @tc.desc   BitVector getLastIndexOf return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(typeof num).assertEqual('number');
          expect(num >= -1 && num < 5).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2560
     * @tc.desc   BitVector getLastIndexOf fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0024";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 4, 5);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2570
     * @tc.desc   BitVector getLastIndexOf toIndex fromIndex+1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0025";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 2, 3);
          expect(num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2580
     * @tc.desc   BitVector getLastIndexOf multiple matches return last test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0026";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(6);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 0, 6);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2590
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
     * @tc.name   testBitVectorFlipBitByIndex0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2600
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2610
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is -1, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          expect(`${err.message}`)
            .assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2620
     * @tc.desc   BitVector flipBitByIndex with extra parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(2);
          expect(bitVectorList[2]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2630
     * @tc.desc   BitVector flipBitByIndex with NaN parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2640
     * @tc.desc   BitVector flipBitByIndex with Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0009";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(Infinity);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2650
     * @tc.desc   BitVector flipBitByIndex with negative index test, throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(-1);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2660
     * @tc.desc   BitVector flipBitByIndex flips bit from 0 to 1 and verifies return value is void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let result = bitVectorList.flipBitByIndex(0);
          expect(result).assertEqual(undefined);
          expect(bitVectorList[0]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitByIndex0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2670
     * @tc.desc   BitVector flipBitByIndex flips bit from 1 to 0 and double flip returns original value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let originalValue = bitVectorList[1];
          expect(originalValue).assertEqual(1);
          bitVectorList.flipBitByIndex(1);
          expect(bitVectorList[1]).assertEqual(0);
          bitVectorList.flipBitByIndex(1);
          expect(bitVectorList[1]).assertEqual(originalValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2680
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=0,toIndex=6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(0, 6);
          let arrayList = new collections.Array<string>("1", "1", "1", "1", "1", "0", "1", "1", "1", "1");
          for (let i = 0; i < 10; i++) {
            expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2690
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(4, 10);
          let arrayList = new collections.Array<string>("0", "0", "0", "0", "1", "0", "0", "0", "0", "0");
          for (let i = 0; i < 10; i++) {
            expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2700
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2710
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(-1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2720
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2730
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2740
     * @tc.desc   BitVector flipBitsByRange fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.flipBitsByRange(NaN, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2750
     * @tc.desc   BitVector flipBitsByRange full range flip test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, 5);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(0);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(0);
          expect(bitVectorList[4]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2760
     * @tc.desc   BitVector flipBitsByRange single element range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(2, 3);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2770
     * @tc.desc   BitVector flipBitsByRange range outside unchanged test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[0]).assertEqual(0);
          expect(bitVectorList[4]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2780
     * @tc.desc   BitVector flipBitsByRange double flip restore test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let original0 = bitVectorList[0];
          let original1 = bitVectorList[1];
          bitVectorList.flipBitsByRange(0, 2);
          bitVectorList.flipBitsByRange(0, 2);
          expect(bitVectorList[0]).assertEqual(original0);
          expect(bitVectorList[1]).assertEqual(original1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2790
     * @tc.desc   BitVector flipBitsByRange single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, 1);
          expect(bitVectorList[0]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2800
     * @tc.desc   BitVector flipBitsByRange large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          bitVectorList.flipBitsByRange(0, 100);
          for (let i = 0; i < 100; i++) {
            expect(bitVectorList[i]).assertEqual((i + 1) % 2);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2810
     * @tc.desc   BitVector flipBitsByRange return undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let result = bitVectorList.flipBitsByRange(0, 5);
          expect(result).assertEqual(undefined);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2820
     * @tc.desc   BitVector flipBitsByRange length unchanged test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let originalLength = bitVectorList.length;
          bitVectorList.flipBitsByRange(0, 5);
          expect(bitVectorList.length).assertEqual(originalLength);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2830
     * @tc.desc   BitVector flipBitsByRange fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0021";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(Infinity, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2840
     * @tc.desc   BitVector flipBitsByRange toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0022";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2850
     * @tc.desc   BitVector flipBitsByRange hex fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0023";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(50);
          for (let i = 0; i < 50; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.flipBitsByRange(0x1A, 0x1E);
          expect(bitVectorList[0x1A]).assertEqual(1);
          expect(bitVectorList[0x1D]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2860
     * @tc.desc   BitVector flipBitsByRange octal fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0024";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(20);
          for (let i = 0; i < 20; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.flipBitsByRange(0o12, 0o15);
          expect(bitVectorList[0o12]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2870
     * @tc.desc   BitVector flipBitsByRange fromIndex included verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0025";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[1]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2880
     * @tc.desc   BitVector flipBitsByRange toIndex excluded verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0026";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[4]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorFlipBitsByRange0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2890
     * @tc.desc   BitVector flipBitsByRange multiple different ranges test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0027";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, 2);
          bitVectorList.flipBitsByRange(2, 4);
          bitVectorList.flipBitsByRange(4, 5);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(0);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(0);
          expect(bitVectorList[4]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorValues0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2900
     * @tc.desc   Testing the values of bitVector, bitvector is null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBitVectorValues0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2910
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0, 1, 1);
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
     * @tc.name   testBitVectorValues0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2920
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0, 1, 1);
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
    /**
     * @tc.name   testBitVectorValues0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2930
     * @tc.desc   BitVector values() for...of iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result: number[] = [];
        for (let item of bitVectorList.values()) {
          result.push(item);
        }
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2940
     * @tc.desc   BitVector values() while loop iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let result: number[] = [];
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          result.push(temp.value);
          temp = iter.next();
        }
        expect(result.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2950
     * @tc.desc   BitVector values() single element iterator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(1);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp1: IteratorResult<number> = iter.next();
        expect(temp1.done).assertFalse();
        expect(temp1.value).assertEqual(0);
        let temp2: IteratorResult<number> = iter.next();
        expect(temp2.done).assertFalse();
        expect(temp2.value).assertEqual(1);
        let temp3: IteratorResult<number> = iter.next();
        expect(temp3.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2960
     * @tc.desc   BitVector values() all zeros iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(0);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2970
     * @tc.desc   BitVector values() all ones iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(1);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2980
     * @tc.desc   BitVector values() return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        expect(typeof iter.next).assertEqual('function');
        let temp = iter.next();
        expect(typeof temp.done).assertEqual('boolean');
        expect(typeof temp.value).assertEqual('number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2990
     * @tc.desc   BitVector values() large BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1000; i++) {
          bitVectorList.push(i % 2);
        }
        let iter = bitVectorList.values();
        let count = 0;
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3000
     * @tc.desc   BitVector values() multiple iterators independence test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter1 = bitVectorList.values();
        let iter2 = bitVectorList.values();
        expect(iter1 === iter2).assertFalse();
        let temp1 = iter1.next();
        let temp2 = iter2.next();
        expect(temp1.value).assertEqual(temp2.value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3010
     * @tc.desc   BitVector values() iterator consumed done test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          temp = iter.next();
        }
        expect(temp.done).assertTrue();
        let temp2: IteratorResult<number> = iter.next();
        expect(temp2.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3020
     * @tc.desc   BitVector values() spread operator to array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0017";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = Array.from(bitVectorList.values());
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3030
     * @tc.desc   BitVector values() Array.from conversion test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = Array.from(bitVectorList.values());
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3040
     * @tc.desc   BitVector values() partial iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let result: number[] = [];
        for (let i = 0; i < 3; i++) {
          let temp = iter.next();
          if (!temp.done) {
            result.push(temp.value);
          }
        }
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3050
     * @tc.desc   BitVector values() destructuring assignment test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0021";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let nextResult = iter.next();
        expect(nextResult.done).assertFalse();
        expect(nextResult.value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3060
     * @tc.desc   BitVector values() break early termination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0022";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result: number[] = [];
        for (let item of bitVectorList.values()) {
          result.push(item);
          if (result.length === 3) {
            break;
          }
        }
        expect(result.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3070
     * @tc.desc   BitVector values() iteration order verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0023";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let index = 0;
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(bitVectorList[index]);
          index++;
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3080
     * @tc.desc   BitVector values() value consistency verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0024";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value === 0 || temp.value === 1).assertTrue();
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorValues0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3090
     * @tc.desc   BitVector values() re-iterate after modification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0025";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter1 = bitVectorList.values();
        let result1: number[] = [];
        for (let item of iter1) {
          result1.push(item);
        }
        bitVectorList.flipBitsByRange(0, 5);
        let iter2 = bitVectorList.values();
        let result2: number[] = [];
        for (let item of iter2) {
          result2.push(item);
        }
        expect(result2[0]).assertEqual(1);
        expect(result2[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorMissing0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3100
     * @tc.desc   Test BitVector getBitsByRange().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBitVectorMissing0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let bitVector: collections.BitVector = new collections.BitVector(0);
      bitVector.push(0);
      bitVector.push(1);
      bitVector.push(0);
      bitVector.push(1);
      bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
      let result = bitVector.getBitsByRange(1, 3); // bitVector2: [1, 0]
      expect(result.length).assertEqual(2);
      done();
    });

    /**
     * @tc.name   testBitVectorIterator0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3110
     * @tc.desc   BitVector [Symbol.iterator] empty BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(result.done).assertTrue();
        expect(result.value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3120
     * @tc.desc   BitVector [Symbol.iterator] single element BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(result.done).assertFalse();
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(result.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3130
     * @tc.desc   BitVector [Symbol.iterator] multiple elements BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0, 1, 1];
        let index = 0;
        let result = iter.next();
        while (!result.done) {
          expect(result.value).assertEqual(expectedValues[index]);
          index++;
          result = iter.next();
        }
        expect(index).assertEqual(5);
        expect(result.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3140
     * @tc.desc   BitVector [Symbol.iterator] for...of traversal all elements test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let expectedValues: number[] = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3150
     * @tc.desc   BitVector [Symbol.iterator] verify iteration order from head to tail test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let first = iter.next();
        expect(first.value).assertEqual(1);
        expect(first.done).assertFalse();
        let second = iter.next();
        expect(second.value).assertEqual(0);
        expect(second.done).assertFalse();
        let third = iter.next();
        expect(third.value).assertEqual(1);
        expect(third.done).assertFalse();
        let fourth = iter.next();
        expect(fourth.value).assertEqual(0);
        expect(fourth.done).assertFalse();
        let fifth = iter.next();
        expect(fifth.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3160
     * @tc.desc   BitVector [Symbol.iterator] next() method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result1 = iter.next();
        expect(result1.value).assertEqual(0);
        let result2 = iter.next();
        expect(result2.value).assertEqual(1);
        let result3 = iter.next();
        expect(result3.done).assertTrue();
        let result4 = iter.next();
        expect(result4.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3170
     * @tc.desc   BitVector [Symbol.iterator] done property verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertTrue();
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3180
     * @tc.desc   BitVector [Symbol.iterator] value property verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(0);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(0);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(result.value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3190
     * @tc.desc   BitVector [Symbol.iterator] iteration during BitVector modification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result1 = iter.next();
        expect(result1.value).assertEqual(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result2 = iter.next();
        expect(result2.value).assertEqual(1);
        let result3 = iter.next();
        expect(result3.value).assertEqual(0);
        let result4 = iter.next();
        expect(result4.value).assertEqual(1);
        let result5 = iter.next();
        expect(result5.value).assertEqual(0);
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3200
     * @tc.desc   BitVector [Symbol.iterator] compare with values() method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let symbolIter: IterableIterator<number> = bitVectorList.values();
        let valuesIter: IterableIterator<number> = bitVectorList.values();
        let symbolResult = symbolIter.next();
        let valuesResult = valuesIter.next();
        while (!symbolResult.done && !valuesResult.done) {
          expect(symbolResult.value).assertEqual(valuesResult.value);
          symbolResult = symbolIter.next();
          valuesResult = valuesIter.next();
        }
        expect(symbolResult.done).assertTrue();
        expect(valuesResult.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3210
     * @tc.desc   BitVector [Symbol.iterator] large elements iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(i % 2);
        }
        let count = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(count % 2);
          count++;
        }
        expect(count).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3220
     * @tc.desc   BitVector [Symbol.iterator] BitVector created with initial length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        let iter: IterableIterator<number> = bitVectorList.values();
        let count = 0;
        let result = iter.next();
        while (!result.done) {
          expect(result.value).assertEqual(0);
          count++;
          result = iter.next();
        }
        expect(count).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3230
     * @tc.desc   BitVector [Symbol.iterator] use spread operator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let arr: number[] = [...bitVectorList];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(1);
        expect(arr[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3240
     * @tc.desc   BitVector [Symbol.iterator] use Array.from test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let arr: number[] = Array.from(bitVectorList);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(1);
        expect(arr[2]).assertEqual(1);
        expect(arr[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3250
     * @tc.desc   BitVector [Symbol.iterator] after pop operation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0016";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3260
     * @tc.desc   BitVector [index] access first element (index=0) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3270
     * @tc.desc   BitVector [index] access last element (index=length-1) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList[bitVectorList.length - 1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3280
     * @tc.desc   BitVector [index] return value type validation (number) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value0 = bitVectorList[0];
        let value1 = bitVectorList[1];
        expect(typeof value0).assertEqual("number");
        expect(typeof value1).assertEqual("number");
        expect(value0 === 0 || value0 === 1).assertTrue();
        expect(value1 === 0 || value1 === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3290
     * @tc.desc   BitVector [index] empty BitVector index access test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let value = bitVectorList[0];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3300
     * @tc.desc   BitVector [index] index equals length (out of bounds) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[bitVectorList.length];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3310
     * @tc.desc   BitVector [index] large index value (out of bounds) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[100000];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3320
     * @tc.desc   BitVector [index] negative index (-1) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[-1];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3330
     * @tc.desc   BitVector [index] NaN as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[NaN];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3340
     * @tc.desc   BitVector [index] Infinity as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[Infinity];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3350
     * @tc.desc   BitVector [index] float number (1.5) as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let value = bitVectorList[1.5];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3360
     * @tc.desc   BitVector [index] multiple indices access test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i % 2 === 0) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3370
     * @tc.desc   BitVector [index] with constructor initial length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

  })
}




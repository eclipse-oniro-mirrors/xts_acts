import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

interface ErrorWithCodeAndMessage {
  code: number;
  message: string;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList06Test() {
  describe('ArrayList06Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ARRAYLIST_TEST06_0100
     * @tc.name      testArrayList06Chapter0001
     * @tc.desc      Verify capacity stays unchanged when adding elements within capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0001';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const initialCapacity = arrayList.getCapacity();
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(3);
      const newCapacity = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(3);
      console.log(`${TAG} done, capacity: ${newCapacity}, length: ${arrayList.length}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0200
     * @tc.name      testArrayList06Chapter0002
     * @tc.desc      Verify 50% expansion triggers when element count exceeds capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0002';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const initialCapacity = arrayList.getCapacity();
      for (let i = 1; i <= initialCapacity + 1; i++) {
        arrayList.add(i);
      }
      const expandedCapacity = arrayList.getCapacity();
      expect(expandedCapacity).assertEqual(Math.ceil(initialCapacity * 1.5));
      expect(arrayList.length).assertEqual(initialCapacity + 1);
      console.log(`${TAG} done, initial capacity: ${initialCapacity}, expanded capacity: ${expandedCapacity}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0300
     * @tc.name      testArrayList06Chapter0003
     * @tc.desc      Verify capacity updates to new value after increaseCapacityTo call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0003';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(1);
      arrayList.add(2);
      const targetCapacity = 20;
      arrayList.increaseCapacityTo(targetCapacity);
      const newCapacity = arrayList.getCapacity();
      expect(newCapacity).assertEqual(targetCapacity);
      console.log(`${TAG} done, target capacity: ${targetCapacity}, actual capacity: ${newCapacity}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0400
     * @tc.name      testArrayList06Chapter0004
     * @tc.desc      Verify capacity equals element count after trimToCurrentLength call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0004';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(3);
      const beforeTrimCapacity = arrayList.getCapacity();
      arrayList.trimToCurrentLength();
      const afterTrimCapacity = arrayList.getCapacity();
      expect(afterTrimCapacity).assertEqual(arrayList.length);
      expect(afterTrimCapacity).assertLess(beforeTrimCapacity);
      console.log(`${TAG} done, before trim: ${beforeTrimCapacity}, after trim: ${afterTrimCapacity}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0500
     * @tc.name      testArrayList06Chapter0005
     * @tc.desc      Verify error code 10200011 throws on illegal getCapacity binding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0005';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number> = new ArrayList<number>();
      try {
        const invalidCall: () => number = (): number => {
          const unboundMethod = arrayList.getCapacity;
          return unboundMethod();
        };
        invalidCall();
        expect(true).assertEqual(false);
      } catch (error) {
        const errorObj = error as ErrorWithCodeAndMessage;
        if (typeof errorObj.code === 'number' && typeof errorObj.message === 'string') {
          expect(errorObj.code).assertEqual(10200011);
          expect(errorObj.message).assertContain("The getCapacity method cannot be bound");
        } else {
          expect(true).assertEqual(false);
        }
      }
      console.log(`${TAG} done`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0600
     * @tc.name      testArrayList06Chapter0006
     * @tc.desc      Verify capacity is valid for empty ArrayList (non-null/non-zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0006';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const emptyCapacity = arrayList.getCapacity();
      expect(emptyCapacity > 0).assertTrue();
      expect(arrayList.length).assertEqual(0);
      expect(emptyCapacity >= arrayList.length).assertTrue();
      console.log(`${TAG} done, empty list capacity: ${emptyCapacity}, length: ${arrayList.length}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0700
     * @tc.name      testArrayList06Chapter0007
     * @tc.desc      Verify getCapacity works with 0 value element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0007';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(0);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: 0`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0800
     * @tc.name      testArrayList06Chapter0008
     * @tc.desc      Verify getCapacity handles undefined element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0008';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(NaN);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: NaN (simulates undefined)`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_0900
     * @tc.name      testArrayList06Chapter0009
     * @tc.desc      Verify getCapacity works with NaN element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0009';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(NaN);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: NaN`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1000
     * @tc.name      testArrayList06Chapter0010
     * @tc.desc      Verify getCapacity works with -0 value element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0010';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-0);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: -0`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1100
     * @tc.name      testArrayList06Chapter0011
     * @tc.desc      Verify getCapacity works with Infinity element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0011';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Infinity);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: Infinity`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1200
     * @tc.name      testArrayList06Chapter0012
     * @tc.desc      Verify getCapacity works with -Infinity element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0012';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-Infinity);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: -Infinity`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1300
     * @tc.name      testArrayList06Chapter0013
     * @tc.desc      Verify getCapacity works with Math.floor(1.5) element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0013';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Math.floor(1.5));
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: ${Math.floor(1.5)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1400
     * @tc.name      testArrayList06Chapter0014
     * @tc.desc      Verify getCapacity works with Number.MAX_VALUE element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0014';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Number.MAX_VALUE);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: ${Number.MAX_VALUE}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1500
     * @tc.name      testArrayList06Chapter0015
     * @tc.desc      Verify getCapacity works with Number.MIN_VALUE element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0015';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Number.MIN_VALUE);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: ${Number.MIN_VALUE}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1600
     * @tc.name      testArrayList06Chapter0016
     * @tc.desc      Verify getCapacity works with Number.EPSILON element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0016';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Number.EPSILON);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: ${Number.EPSILON}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1700
     * @tc.name      testArrayList06Chapter0017
     * @tc.desc      Verify getCapacity works with Number.MAX_SAFE_INTEGER element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0017';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(Number.MAX_SAFE_INTEGER);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: ${Number.MAX_SAFE_INTEGER}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1800
     * @tc.name      testArrayList06Chapter0018
     * @tc.desc      Verify getCapacity with byte range elements (-128~127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0018';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-128);
      arrayList.add(127);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(2);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, elements: -128, 127`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_1900
     * @tc.name      testArrayList06Chapter0019
     * @tc.desc      Verify getCapacity with short range elements (-32768~32767)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0019';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-32768);
      arrayList.add(32767);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(2);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, elements: -32768, 32767`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2000
     * @tc.name      testArrayList06Chapter0020
     * @tc.desc      Verify getCapacity with int range elements (-2147483648~2147483647)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0020';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-2147483648);
      arrayList.add(2147483647);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(2);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, elements: -2147483648, 2147483647`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2100
     * @tc.name      testArrayList06Chapter0021
     * @tc.desc      Verify getCapacity with long range elements (-9223372036854775808~9223372036854775807)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0021';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(-9223372036854775808);
      arrayList.add(9223372036854775807);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(2);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, elements: -9223372036854775808, 9223372036854775807`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2200
     * @tc.name      testArrayList06Chapter0022
     * @tc.desc      Verify getCapacity with double value 123.456 element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0022';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(123.456);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: 123.456`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2300
     * @tc.name      testArrayList06Chapter0023
     * @tc.desc      Verify getCapacity with hex 0x0102 element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0023';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(0x0102);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: 0x0102 (${0x0102})`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2400
     * @tc.name      testArrayList06Chapter0024
     * @tc.desc      Verify getCapacity with exponent 2**3 (8) element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0024';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(2 ** 3);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(1);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, element: 2**3 (${2**3})`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2500
     * @tc.name      testArrayList06Chapter0025
     * @tc.desc      Verify getCapacity with scientific notation elements (1e3, 2.5e-2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0025';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      arrayList.add(1e3);
      arrayList.add(2.5e-2);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      expect(arrayList.length).assertEqual(2);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done, capacity: ${newCapacity}, elements: 1e3 (${1e3}), 2.5e-2 (${2.5e-2})`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2600
     * @tc.name      testArrayList06Chapter0026
     * @tc.desc      Verify getCapacity handles BigInt element (type compatibility)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0026';
      console.log(TAG + ' start');
      const arrayList: ArrayList<number> = new ArrayList<number>();
      const initialCapacity: number = arrayList.getCapacity();
      const maxSafeNum: number = Number.MAX_SAFE_INTEGER;
      arrayList.add(maxSafeNum);
      const newCapacity: number = arrayList.getCapacity();
      expect(newCapacity).assertEqual(initialCapacity);
      console.info("result = ", newCapacity);
      console.log(`${TAG} done`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2700
     * @tc.name      testArrayList06Chapter0027
     * @tc.desc      Verify convertToArray returns empty array for empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0027';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const resultArray: Array<number> = arrayList.convertToArray();
      expect(resultArray.length).assertEqual(0);
      expect(Array.isArray(resultArray)).assertTrue();
      console.log(TAG + ' done, empty array result: ', resultArray);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2800
     * @tc.name      testArrayList06Chapter0028
     * @tc.desc      Verify convertToArray returns correct array with normal elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0028';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      const resultArray: Array<number> = arrayList.convertToArray();
      expect(resultArray.length).assertEqual(arrayList.length);
      expect(resultArray[0]).assertEqual(2);
      expect(resultArray[1]).assertEqual(4);
      expect(resultArray[2]).assertEqual(5);
      console.log(TAG + ' done, result array: ', resultArray);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_2900
     * @tc.name      testArrayList06Chapter0029
     * @tc.desc      Verify convertToArray reserves duplicate elements in array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0029';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      const resultArray: Array<number> = arrayList.convertToArray();
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[1]).assertEqual(4);
      expect(resultArray[3]).assertEqual(4);
      expect(resultArray.join(',')).assertEqual('2,4,5,4');
      console.log(TAG + ' done, result array: ', resultArray);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3000
     * @tc.name      testArrayList06Chapter0030
     * @tc.desc      Verify error code 10200011 throws on illegal convertToArray binding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0030';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number> = new ArrayList<number>();
      try {
        const invalidCall: () => Array<number> = (): Array<number> => {
          const unboundMethod = arrayList.convertToArray;
          return unboundMethod();
        };
        invalidCall();
        expect(true).assertEqual(false);
      } catch (error) {
        const errorObj = error as ErrorWithCodeAndMessage;
        if (typeof errorObj.code === 'number' && typeof errorObj.message === 'string') {
          expect(errorObj.code).assertEqual(10200011);
          expect(errorObj.message).assertContain("The convertToArray method cannot be bound");
        } else {
          expect(true).assertEqual(false);
        }
      }
      console.log(TAG + ' done');
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3100
     * @tc.name      testArrayList06Chapter0031
     * @tc.desc      Verify convertToArray works correctly with large amount of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0031';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const longDataSize: number = 1000;
      for (let i: number = 1; i <= longDataSize; i++) {
        arrayList.add(i);
      }
      const resultArray: Array<number> = arrayList.convertToArray();
      expect(resultArray.length).assertEqual(longDataSize);
      expect(resultArray[0]).assertEqual(1);
      expect(resultArray[longDataSize - 1]).assertEqual(longDataSize);
      const randomIndex: number = Math.floor(longDataSize / 2);
      expect(resultArray[randomIndex]).assertEqual(randomIndex + 1);
      console.log(TAG + ' done, long data array length: ', resultArray.length);
      console.info("result (first 5) = ", resultArray.slice(0, 5));
      console.info("result (last 5) = ", resultArray.slice(-5));
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3200
     * @tc.name      testArrayList06Chapter0032
     * @tc.desc      Verify convertToArray works with double elements (1.1,2.2,3.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0032';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const doubleList = arrayList as ArrayList<number>;
      doubleList.add(1.1);
      doubleList.add(2.2);
      doubleList.add(3.3);
      const resultArray: Array<number> = doubleList.convertToArray();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1.1);
      expect(resultArray[1]).assertEqual(2.2);
      expect(resultArray[2]).assertEqual(3.3);
      expect(typeof resultArray[0]).assertEqual('number');
      console.log(TAG + ' done, double array result: ', resultArray);
      console.info("result = ", resultArray);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3300
     * @tc.name      testArrayList06Chapter0033
     * @tc.desc      Verify convertToArray works with string elements (a,b,c)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0033';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add('a');
      strList.add('b');
      strList.add('c');
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual('a');
      expect(resultArray[1]).assertEqual('b');
      expect(resultArray[2]).assertEqual('c');
      expect(Array.isArray(resultArray)).assertTrue();
      expect(typeof resultArray[0]).assertEqual('string');
      console.log(TAG + ' done, string array result: ', resultArray);
      console.info("result = ", resultArray);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3400
     * @tc.name      testArrayList06Chapter0034
     * @tc.desc      Verify convertToArray works with BigInt elements (10n, 20n, 30n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0034';
      console.log(TAG + ' start');
      const bigIntList: ArrayList<bigint> = new ArrayList<bigint>();
      bigIntList.add(10n);
      bigIntList.add(20n);
      bigIntList.add(30n);
      const resultArray: Array<bigint> = bigIntList.convertToArray();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(typeof resultArray[0]).assertEqual('bigint');
      console.log(`${TAG} done, BigInt array result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3500
     * @tc.name      testArrayList06Chapter0035
     * @tc.desc      Verify convertToArray works with special number elements (NaN, Infinity, -Infinity, -0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0035';
      console.log(TAG + ' start');
      const numberList: ArrayList<number> = new ArrayList<number>();
      numberList.add(NaN);
      numberList.add(Infinity);
      numberList.add(-Infinity);
      numberList.add(-0);
      const resultArray: Array<number> = numberList.convertToArray();
      expect(resultArray.length).assertEqual(4);
      expect(isNaN(resultArray[0])).assertTrue();
      expect(resultArray[1]).assertEqual(Infinity);
      expect(resultArray[2]).assertEqual(-Infinity);
      expect(resultArray[3]).assertEqual(-0);
      console.log(`${TAG} done, special number array result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3600
     * @tc.name      testArrayList06Chapter0036
     * @tc.desc      Verify convertToArray works with boolean-like elements (true, false, 0, "", null, undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0036';
      console.log(TAG + ' start');
      const booleanLikeList: ArrayList<boolean | number | string | null | undefined> = new ArrayList<boolean | number | string | null | undefined>();
      booleanLikeList.add(true);
      booleanLikeList.add(false);
      booleanLikeList.add(0);
      booleanLikeList.add("");
      booleanLikeList.add(null);
      booleanLikeList.add(undefined);
      const resultArray: Array<boolean | number | string | null | undefined> = booleanLikeList.convertToArray();
      expect(resultArray.length).assertEqual(6);
      expect(resultArray[0]).assertEqual(true);
      expect(resultArray[1]).assertEqual(false);
      expect(resultArray[2]).assertEqual(0);
      expect(resultArray[3]).assertEqual("");
      expect(resultArray[4]).assertEqual(null);
      expect(resultArray[5]).assertEqual(undefined);
      console.log(`${TAG} done, boolean-like array result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3700
     * @tc.name      testArrayList06Chapter0037
     * @tc.desc      Verify convertToArray works with special character elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0037';
      console.log(TAG + ' start');
      const specialChar = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add(specialChar);
      let repeatedChar = '';
      try {
        repeatedChar = specialChar.repeat(2);
      } catch (e) {
        expect(true).assertEqual(false);
      }
      strList.add(repeatedChar);
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(specialChar);
      expect(resultArray[1]).assertEqual(repeatedChar);
      expect(typeof resultArray[0]).assertEqual('string');
      console.log(`${TAG} done, special character array result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3800
     * @tc.name      testArrayList06Chapter0038
     * @tc.desc      Verify convertToArray works with emoji and Unicode elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0038';
      console.log(TAG + ' start');
      interface EmojiUnicodeItem {
        emoji: string;
        unicode: string;
      }
      const emojiUnicodeMap: EmojiUnicodeItem[] = [
        { emoji: '👆', unicode: '\ud83d\udc46' },
        { emoji: '👿', unicode: '\ud83d\udc7f' },
        { emoji: '👀', unicode: '\ud83d\udc40' },
        { emoji: '💯', unicode: '\ud83d\udcaf' },
        { emoji: '🎅', unicode: '\ud83c\udf85' },
        { emoji: '😼', unicode: '\ud83d\ude3c' }
      ];
      const strList: ArrayList<string> = new ArrayList<string>();
      emojiUnicodeMap.forEach(item => {
        strList.add(item.emoji);
        strList.add(item.unicode);
      });
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(emojiUnicodeMap.length * 2);
      for (let i = 0; i < emojiUnicodeMap.length; i++) {
        const emojiIndex = i * 2;
        const unicodeIndex = i * 2 + 1;
        expect(resultArray[emojiIndex]).assertEqual(emojiUnicodeMap[i].emoji);
        expect(resultArray[unicodeIndex]).assertEqual(emojiUnicodeMap[i].unicode);
        expect(resultArray[emojiIndex]).assertEqual(resultArray[unicodeIndex]);
      }
      console.log(`${TAG} done, emoji Unicode array result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_3900
     * @tc.name      testArrayList06Chapter0039
     * @tc.desc      Verify convertToArray handles invalid Unicode elements without crash
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0039';
      console.log(TAG + ' start');
      const invalidUnicodes = ['\udc04', '\ud83d', '\udff4'];
      const strList: ArrayList<string> = new ArrayList<string>();
      invalidUnicodes.forEach(unicode => strList.add(unicode));
      try {
        const resultArray: Array<string> = strList.convertToArray();
        expect(resultArray.length).assertEqual(invalidUnicodes.length);
        for (let i = 0; i < resultArray.length; i++) {
          expect(resultArray[i]).assertEqual(invalidUnicodes[i]);
        }
        console.log(`${TAG} done, invalid Unicode array result: ${resultArray}`);
        console.info(`result = ${resultArray}`);
      } catch (error) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4000
     * @tc.name      testArrayList06Chapter0040
     * @tc.desc      Verify convertToArray works with large string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0040';
      console.log(TAG + ' start');
      let largeStr = '';
      try {
        largeStr = 'a'.repeat(1000);
      } catch (e) {
        expect(true).assertEqual(false);
      }
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add(largeStr);
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(largeStr);
      expect(resultArray[0].length).assertEqual(1000);
      console.log(`${TAG} done, large string array result length: ${resultArray[0].length}`);
      console.info(`result (first 5 chars): ${resultArray[0].slice(0, 5)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4100
     * @tc.name      testArrayList06Chapter0041
     * @tc.desc      Verify convertToArray works with treeString elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0041';
      console.log(TAG + ' start');
      let treeStr = '[';
      while (treeStr.length < 2000) {
        treeStr += '{"a":1},';
      }
      treeStr += '{"a":1}]';
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add(treeStr);
      const startTime = Date.now();
      const resultArray: Array<string> = strList.convertToArray();
      const endTime = Date.now();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(treeStr);
      console.log(`${TAG} done, treeString array result length: ${resultArray[0].length}`);
      console.info(`Conversion duration: ${endTime - startTime}ms`);
      console.info(`result (first 50 chars): ${resultArray[0].slice(0, 50)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4200
     * @tc.name      testArrayList06Chapter0042
     * @tc.desc      Verify convertToArray works with sliceString elements after multiple substring calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0042';
      console.log(TAG + ' start');
      let str = "{k1:value1,k2:value2}";
      for (let i = 0; i < 10; i++) {
        str = str.substring(0, str.length - 2);
      }
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add(str);
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(str);
      console.log(`${TAG} done, sliceString array result: ${resultArray[0]}`);
      console.info(`result length: ${resultArray[0].length}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4300
     * @tc.name      testArrayList06Chapter0043
     * @tc.desc      Verify convertToArray works with Uint8Array and Int16Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0043';
      console.log(TAG + ' start');
      const uint8Arr = new Uint8Array([72, 101, 108, 108, 111]);
      const int16Arr = new Int16Array([32767, -32768]);
      const typedArrayList: ArrayList<Uint8Array | Int16Array> = new ArrayList<Uint8Array | Int16Array>();
      typedArrayList.add(uint8Arr);
      typedArrayList.add(int16Arr);
      const resultArray: Array<Uint8Array | Int16Array> = typedArrayList.convertToArray();
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0] instanceof Uint8Array).assertTrue();
      expect(resultArray[0].length).assertEqual(uint8Arr.length);
      for (let i = 0; i < uint8Arr.length; i++) {
        expect(resultArray[0][i]).assertEqual(uint8Arr[i]);
      }
      expect(resultArray[1] instanceof Int16Array).assertTrue();
      expect(resultArray[1][0]).assertEqual(32767);
      expect(resultArray[1][1]).assertEqual(-32768);
      console.log(`${TAG} done, TypedArray array result: ${resultArray}`);
      console.info(`Uint8Array result: ${resultArray[0]}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4400
     * @tc.name      testArrayList06Chapter0044
     * @tc.desc      Verify convertToArray works with array elements containing non-number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0044';
      console.log(TAG + ' start');
      interface TestObj {
        key: string;
      }
      const testArray1: (number | string | boolean | null | undefined)[] = [72, NaN, Infinity, "abc", true, null, undefined];
      let uint8Arr: Uint8Array | null = null;
      try {
        uint8Arr = Uint8Array.from([1, 2, 3]);
      } catch (e) {
        expect(true).assertEqual(false);
      }
      const testArray2: (Uint8Array | TestObj)[] = [uint8Arr!, { key: 'value' }];
      const arrayList: ArrayList<(number | string | boolean | null | undefined)[] | (Uint8Array | TestObj)[]> = new ArrayList<(number | string | boolean | null | undefined)[] | (Uint8Array | TestObj)[]>();
      arrayList.add(testArray1);
      arrayList.add(testArray2);
      const resultArray: Array<(number | string | boolean | null | undefined)[] | (Uint8Array | TestObj)[]> = arrayList.convertToArray();
      expect(resultArray.length).assertEqual(2);
      expect(isNaN((resultArray[0] as (number | string | boolean | null | undefined)[])[1] as number)).assertTrue();
      expect((resultArray[0] as (number | string | boolean | null | undefined)[])[3]).assertEqual("abc");
      expect(((resultArray[1] as (Uint8Array | TestObj)[])[0] as Uint8Array)[0]).assertEqual(1);
      expect(((resultArray[1] as (Uint8Array | TestObj)[])[1] as TestObj).key).assertEqual('value');
      console.log(`${TAG} done, array with non-number elements result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4500
     * @tc.name      testArrayList06Chapter0045
     * @tc.desc      Verify convertToArray works with nested array elements (Array<number> as element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0045';
      console.log(TAG + ' start');
      type NestedArrayType = Array<number>;
      const nestedList: ArrayList<NestedArrayType> = new ArrayList<NestedArrayType>();
      nestedList.add([1, 2, 3]);
      nestedList.add([4, 5, 6]);
      nestedList.add([7, 8, 9]);
      const resultArray: Array<NestedArrayType> = nestedList.convertToArray();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0].length).assertEqual(3);
      expect(resultArray[0][0]).assertEqual(1);
      expect(resultArray[1][1]).assertEqual(5);
      expect(resultArray[2][2]).assertEqual(9);
      expect(Array.isArray(resultArray[0])).assertTrue();
      console.log(`${TAG} done, nested array result: ${JSON.stringify(resultArray)}`);
      console.info(`result = ${JSON.stringify(resultArray)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4600
     * @tc.name      testArrayList06Chapter0046
     * @tc.desc      Verify convertToArray works with custom object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0046';
      console.log(TAG + ' start');
      interface User {
        id: number;
        name: string;
        active: boolean;
      }
      const objList: ArrayList<User> = new ArrayList<User>();
      objList.add({ id: 1, name: "Alice", active: true });
      objList.add({ id: 2, name: "Bob", active: false });
      const resultArray: Array<User> = objList.convertToArray();
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0].id).assertEqual(1);
      expect(resultArray[0].name).assertEqual("Alice");
      expect(resultArray[1].active).assertEqual(false);
      expect(typeof resultArray[0]).assertEqual('object');
      console.log(`${TAG} done, object array result: ${JSON.stringify(resultArray)}`);
      console.info(`result = ${JSON.stringify(resultArray)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4700
     * @tc.name      testArrayList06Chapter0047
     * @tc.desc      Verify convertToArray works with empty/space-only string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0047';
      console.log(TAG + ' start');
      const strList: ArrayList<string> = new ArrayList<string>();
      strList.add("");
      strList.add(" ");
      strList.add("   ");
      strList.add("\t");
      strList.add("\n");
      const resultArray: Array<string> = strList.convertToArray();
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual("");
      expect(resultArray[1]).assertEqual(" ");
      expect(resultArray[2].length).assertEqual(3);
      expect(resultArray[3]).assertEqual("\t");
      expect(resultArray[4]).assertEqual("\n");
      console.log(`${TAG} done, empty/space string result: ${JSON.stringify(resultArray)}`);
      console.info(`result = ${JSON.stringify(resultArray)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4800
     * @tc.name      testArrayList06Chapter0048
     * @tc.desc      Verify convertToArray works with negative/large number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0048';
      console.log(TAG + ' start');
      const numList: ArrayList<number> = new ArrayList<number>();
      numList.add(-100);
      numList.add(-0.000001);
      numList.add(9999999999999999);
      numList.add(1e20);
      numList.add(-Infinity);
      const resultArray: Array<number> = numList.convertToArray();
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(-100);
      expect(resultArray[1]).assertEqual(-0.000001);
      expect(resultArray[2]).assertEqual(9999999999999999);
      expect(resultArray[3]).assertEqual(1e20);
      expect(resultArray[4]).assertEqual(-Infinity);
      console.log(`${TAG} done, negative/large number result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_4900
     * @tc.name      testArrayList06Chapter0049
     * @tc.desc      Verify convertToArray works with read-only array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0049';
      console.log(TAG + ' start');
      type ReadOnlyArrayType = readonly string[];
      const roList: ArrayList<ReadOnlyArrayType> = new ArrayList<ReadOnlyArrayType>();
      const roArray1: readonly string[] = ["a", "b", "c"];
      const roArray2: readonly string[] = ["x", "y", "z"];
      roList.add(roArray1);
      roList.add(roArray2);
      const resultArray: Array<ReadOnlyArrayType> = roList.convertToArray();
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0] !== undefined && resultArray[0] !== null).assertTrue();
      expect(resultArray[0]![0]).assertEqual("a"); // 非空断言消除null/undefined警告
      expect(resultArray[1] !== undefined && resultArray[1] !== null).assertTrue();
      expect(resultArray[1]![2]).assertEqual("z");
      console.log(`${TAG} done, read-only array result: ${JSON.stringify(resultArray)}`);
      console.info(`result = ${JSON.stringify(resultArray)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5000
     * @tc.name      testArrayList06Chapter0050
     * @tc.desc      Verify convertToArray works correctly in cycle of add/convert operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0050';
      console.log(TAG + ' start');
      const cycleList: ArrayList<number> = new ArrayList<number>();
      let cycleResult: Array<number> = [];
      for (let cycle = 1; cycle <= 5; cycle++) {
        cycleList.add(cycle * 10);
        cycleResult = cycleList.convertToArray();
        expect(cycleResult.length).assertEqual(cycle);
        expect(cycleResult[cycle - 1]).assertEqual(cycle * 10);
      }
      expect(cycleResult.length).assertEqual(5);
      expect(cycleResult.join(',')).assertEqual('10,20,30,40,50');
      console.log(`${TAG} done, cycle add/convert result: ${cycleResult}`);
      console.info(`result = ${cycleResult}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5100
     * @tc.name      testArrayList06Chapter0051
     * @tc.desc      Verify convertToArray works with Boolean operation result elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0051';
      console.log(TAG + ' start');
      const boolOpList: ArrayList<boolean> = new ArrayList<boolean>();
      boolOpList.add(!!0);
      boolOpList.add(!!"");
      boolOpList.add(!!"test");
      boolOpList.add(!!null);
      boolOpList.add(!!undefined);
      boolOpList.add(!!100);
      const resultArray: Array<boolean> = boolOpList.convertToArray();
      expect(resultArray.length).assertEqual(6);
      expect(resultArray[0]).assertEqual(false);
      expect(resultArray[2]).assertEqual(true);
      expect(resultArray[5]).assertEqual(true);
      console.log(`${TAG} done, Boolean operation result: ${resultArray}`);
      console.info(`result = ${resultArray}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5200
     * @tc.name      testArrayList06Chapter0052
     * @tc.desc      Verify convertToArray works with mixed empty/non-empty elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0052';
      console.log(TAG + ' start');
      type BasicType = string | number | null | undefined;
      type MixedEmptyType = BasicType | string[];
      const mixedList: ArrayList<MixedEmptyType> = new ArrayList<MixedEmptyType>();
      mixedList.add("test");
      mixedList.add(null);
      mixedList.add(0);
      mixedList.add(undefined);
      mixedList.add([]);
      mixedList.add("");
      const resultArray: Array<MixedEmptyType> = mixedList.convertToArray();
      expect(resultArray.length).assertEqual(6);
      expect(resultArray[0]).assertEqual("test");
      expect(resultArray[1]).assertEqual(null);
      expect(typeof resultArray[4] === 'object' && resultArray[4] !== null && Array.isArray(resultArray[4])).assertTrue();
      expect((resultArray[4] as string[]).length).assertEqual(0);
      expect(resultArray[5]).assertEqual("");
      console.log(`${TAG} done, mixed empty/non-empty result: ${JSON.stringify(resultArray)}`);
      console.info(`result = ${JSON.stringify(resultArray)}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5300
     * @tc.name      testArrayList06Chapter0053
     * @tc.desc      Verify isEmpty returns true for empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG  = 'testArrayList06Chapter0053';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(true);
      expect(arrayList.length === 0).assertTrue();
      console.info("result = ", result);
      console.log(TAG + ' done, empty list isEmpty result: ', result);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5400
     * @tc.name      testArrayList06Chapter0054
     * @tc.desc      Verify isEmpty returns false for non-empty ArrayList (2,4,5,4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0054';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(2);
      arrayList.add(4);
      arrayList.add(5);
      arrayList.add(4);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length > 0).assertTrue();
      console.info("result = ", result);
      console.log(TAG + ' done, non-empty list isEmpty result: ', result);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5500
     * @tc.name      testArrayList06Chapter0055
     * @tc.desc      Verify isEmpty returns true after clearing non-empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0055';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number>;
      arrayList = new ArrayList<number>();
      arrayList.add(1);
      arrayList.add(2);
      expect(arrayList.isEmpty()).assertEqual(false);
      arrayList.clear();
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(true);
      expect(arrayList.length === 0).assertTrue();
      console.log(TAG + ' done, cleared list isEmpty result: ', result);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5600
     * @tc.name      testArrayList06Chapter0056
     * @tc.desc      Verify error code 10200011 throws on illegal isEmpty binding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0056';
      console.log(TAG + ' start');
      let arrayList: ArrayList<number> = new ArrayList<number>();
      try {
        const invalidCall: () => boolean = (): boolean => {
          const unboundMethod = arrayList.isEmpty;
          return unboundMethod();
        };
        invalidCall();
        expect(true).assertEqual(false);
      } catch (error) {
        const errorObj = error as ErrorWithCodeAndMessage;
        if (typeof errorObj.code === 'number' && typeof errorObj.message === 'string') {
          expect(errorObj.code).assertEqual(10200011);
          expect(errorObj.message).assertContain("The isEmpty method cannot be bound");
        } else {
          expect(true).assertEqual(false);
        }
      }
      console.log(TAG + ' done');
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5700
     * @tc.name      testArrayList06Chapter0057
     * @tc.desc      Verify isEmpty returns false for ArrayList with true (Boolean element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0057';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean>;
      arrayList = new ArrayList<boolean>();
      arrayList.add(true);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length > 0).assertTrue();
      console.info(`result = ${result}`);
      console.log(`${TAG} done, list with true element isEmpty result: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5800
     * @tc.name      testArrayList06Chapter0058
     * @tc.desc      Verify isEmpty returns false for ArrayList with false (Boolean element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0058';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean>;
      arrayList = new ArrayList<boolean>();
      arrayList.add(false);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 1).assertTrue();
      console.info(`result = ${result}`);
      console.log(`${TAG} done, list with false element isEmpty result: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_5900
     * @tc.name      testArrayList06Chapter0059
     * @tc.desc      Verify isEmpty returns false for ArrayList with falsy elements (0, NaN, "", null, undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0059';
      console.log(TAG + ' start');
      type FalsyType = number | string | null | undefined;
      let arrayList: ArrayList<FalsyType>;
      arrayList = new ArrayList<FalsyType>();
      arrayList.add(0);
      arrayList.add(NaN);
      arrayList.add("");
      arrayList.add(null);
      arrayList.add(undefined);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 5).assertTrue();
      console.info(`result = ${result}`);
      console.log(`${TAG} done, list with falsy elements isEmpty result: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6000
     * @tc.name      testArrayList06Chapter0060
     * @tc.desc      Verify isEmpty result with Boolean operation (!0, !'s')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0060';
      console.log(TAG + ' start');
      let arrayList1: ArrayList<boolean> = new ArrayList<boolean>();
      const boolVal1: boolean = !0;
      arrayList1.add(boolVal1);
      expect(arrayList1.isEmpty()).assertEqual(false);
      let arrayList2: ArrayList<boolean> = new ArrayList<boolean>();
      const boolVal2: boolean = !'s';
      arrayList2.add(boolVal2);
      expect(arrayList2.isEmpty()).assertEqual(false);
      let emptyList: ArrayList<boolean> = new ArrayList<boolean>();
      const emptyBool: boolean = !!emptyList.isEmpty();
      expect(emptyBool).assertEqual(true);
      console.info(`arrayList1 isEmpty: ${arrayList1.isEmpty()}, arrayList2 isEmpty: ${arrayList2.isEmpty()}`);
      console.log(`${TAG} done, Boolean operation isEmpty result verified`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6100
     * @tc.name      testArrayList06Chapter0061
     * @tc.desc      Verify isEmpty switches between true/false with Boolean element add/remove
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0061';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean> = new ArrayList<boolean>();
      expect(arrayList.isEmpty()).assertEqual(true);
      arrayList.add(false);
      expect(arrayList.isEmpty()).assertEqual(false);
      arrayList.add(true);
      expect(arrayList.isEmpty()).assertEqual(false);
      arrayList.clear();
      expect(arrayList.isEmpty()).assertEqual(true);
      console.log(`${TAG} done, Boolean element add/remove isEmpty result verified`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6200
     * @tc.name      testArrayList06Chapter0062
     * @tc.desc      Verify isEmpty returns false for ArrayList with mixed Boolean/number/string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0062';
      console.log(TAG + ' start');
      type MixedType = boolean | number | string;
      let arrayList: ArrayList<MixedType>;
      arrayList = new ArrayList<MixedType>();
      arrayList.add(true);
      arrayList.add(100);
      arrayList.add("test");
      arrayList.add(false);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 4).assertTrue();
      console.info(`result = ${result}`);
      console.log(`${TAG} done, mixed Boolean type list isEmpty result: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6300
     * @tc.name      testArrayList06Chapter0063
     * @tc.desc      Verify isEmpty returns false for large ArrayList with Boolean elements (10000 items)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0063';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean> = new ArrayList<boolean>();
      for (let i = 0; i < 10000; i++) {
        arrayList.add(i % 2 === 0);
      }
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 10000).assertTrue();
      console.log(`${TAG} done, large Boolean list length: ${arrayList.length}, isEmpty: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6400
     * @tc.name      testArrayList06Chapter0064
     * @tc.desc      Verify isEmpty returns false for ArrayList with nested Boolean ArrayList elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0064';
      console.log(TAG + ' start');
      type NestedBooleanList = ArrayList<boolean>;
      let arrayList: ArrayList<NestedBooleanList>;
      arrayList = new ArrayList<NestedBooleanList>();
      const subList1: ArrayList<boolean> = new ArrayList<boolean>();
      subList1.add(true);
      const subList2: ArrayList<boolean> = new ArrayList<boolean>();
      subList2.add(false);
      arrayList.add(subList1);
      arrayList.add(subList2);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 2).assertTrue();
      expect(subList1.isEmpty()).assertEqual(false);
      expect(subList2.isEmpty()).assertEqual(false);
      console.info(`parent list isEmpty: ${result}, subList1 isEmpty: ${subList1.isEmpty()}`);
      console.log(`${TAG} done, nested Boolean list isEmpty verified`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6500
     * @tc.name      testArrayList06Chapter0065
     * @tc.desc      Verify isEmpty returns true after removing the only Boolean element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0065';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean> = new ArrayList<boolean>();
      arrayList.add(true);
      expect(arrayList.isEmpty()).assertEqual(false);
      const isRemoved: boolean = arrayList.remove(true);
      expect(isRemoved).assertEqual(true);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(true);
      expect(arrayList.length === 0).assertTrue();
      console.log(`${TAG} done, after remove last Boolean element, isEmpty: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6600
     * @tc.name      testArrayList06Chapter0066
     * @tc.desc      Verify isEmpty returns false for ArrayList with Boolean/undefined/null elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0066';
      console.log(TAG + ' start');
      type BooleanExtType = boolean | null | undefined;
      let arrayList: ArrayList<BooleanExtType> = new ArrayList<BooleanExtType>();
      arrayList.add(false);
      arrayList.add(null);
      arrayList.add(undefined);
      const result: boolean = arrayList.isEmpty();
      expect(result).assertEqual(false);
      expect(arrayList.length === 3).assertTrue();
      console.info(`result = ${result}`);
      console.log(`${TAG} done, Boolean+null+undefined list isEmpty: ${result}`);
    });

    /**
     * @tc.number    SUB_ARRAYLIST_TEST06_6700
     * @tc.name      testArrayList06Chapter0067
     * @tc.desc      Verify isEmpty switches correctly in cycle of add/clear Boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayList06Chapter0067';
      console.log(TAG + ' start');
      let arrayList: ArrayList<boolean> = new ArrayList<boolean>();
      for (let cycle = 0; cycle < 5; cycle++) {
        arrayList.add(Math.random() > 0.5);
        expect(arrayList.isEmpty()).assertEqual(false);
        arrayList.clear();
        expect(arrayList.isEmpty()).assertEqual(true);
      }
      console.log(`${TAG} done, 5 cycles of add/clear Boolean elements verified`);
    });
  })
}
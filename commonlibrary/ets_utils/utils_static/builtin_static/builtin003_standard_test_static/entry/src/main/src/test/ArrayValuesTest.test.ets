import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function Array_Values_Test_static() {
  describe('Array_Values_Test_static', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0100
     * @tc.name Array_Values_Test_static_0100
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0200
     * @tc.name Array_Values_Test_static_0200
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0300
     * @tc.name Array_Values_Test_static_0300
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0400
     * @tc.name Array_Values_Test_static_0400
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0500
     * @tc.name Array_Values_Test_static_0500
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0600
     * @tc.name Array_Values_Test_static_0600
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0700
     * @tc.name Array_Values_Test_static_0700
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0800
     * @tc.name Array_Values_Test_static_0800
     * @tc.desc test values(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertTrue();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertFalse();
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_0900
     * @tc.name Array_Values_Test_static_0900
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1000
     * @tc.name Array_Values_Test_static_1000
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1100
     * @tc.name Array_Values_Test_static_1100
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 127];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-128);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(127);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1200
     * @tc.name Array_Values_Test_static_1200
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [20, 20];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(20);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(20);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1300
     * @tc.name Array_Values_Test_static_1300
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-100, -90];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-100);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-90);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1400
     * @tc.name Array_Values_Test_static_1400
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [80, 70, 60];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(80);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(70);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(60);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1500
     * @tc.name Array_Values_Test_static_1500
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-1, 1, 0];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1600
     * @tc.name Array_Values_Test_static_1600
     * @tc.desc test values(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1700
     * @tc.name Array_Values_Test_static_1700
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x30.toChar(), 0x32.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x36);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x30);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x32);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1800
     * @tc.name Array_Values_Test_static_1800
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_1900
     * @tc.name Array_Values_Test_static_1900
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x36.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x36);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x36);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2000
     * @tc.name Array_Values_Test_static_2000
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x4E);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x4D);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x4C);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2100
     * @tc.name Array_Values_Test_static_2100
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x72.toChar(), 0x73.toChar(), 0x74.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x72);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x73);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x74);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2200
     * @tc.name Array_Values_Test_static_2200
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x77.toChar(), 0x77.toChar(), 0x77.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x77);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x77);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x77);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2300
     * @tc.name Array_Values_Test_static_2300
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x61.toChar(), 0x41.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x61);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x41);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2400
     * @tc.name Array_Values_Test_static_2400
     * @tc.desc test values(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x35.toChar(), 0x49.toChar(), 0x6E.toChar()];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0x35);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x49);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0x6E);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2500
     * @tc.name Array_Values_Test_static_2500
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2.2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(3.3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2600
     * @tc.name Array_Values_Test_static_2600
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-2.2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-3.3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2700
     * @tc.name Array_Values_Test_static_2700
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2800
     * @tc.name Array_Values_Test_static_2800
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_2900
     * @tc.name Array_Values_Test_static_2900
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3000
     * @tc.name Array_Values_Test_static_3000
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.2e-3, 0.00026];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.2e-3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0.00026);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3100
     * @tc.name Array_Values_Test_static_3100
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 0.0, -1.1];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0.0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-1.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3200
     * @tc.name Array_Values_Test_static_3200
     * @tc.desc test values(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [100.1, 110.1, 120.1];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(100.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(110.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(120.1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3300
     * @tc.name Array_Values_Test_static_3300
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2.2 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(3.3 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3400
     * @tc.name Array_Values_Test_static_3400
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-2.2 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-3.3 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3500
     * @tc.name Array_Values_Test_static_3500
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3600
     * @tc.name Array_Values_Test_static_3600
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3700
     * @tc.name Array_Values_Test_static_3700
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3800
     * @tc.name Array_Values_Test_static_3800
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.2e-3 as float, 0.00026 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.2e-3 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0.00026 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_3900
     * @tc.name Array_Values_Test_static_3900
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 0.0 as float, -1.1 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0.0 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-1.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4000
     * @tc.name Array_Values_Test_static_4000
     * @tc.desc test values(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [100.1 as float, 110.1 as float, 120.1 as float];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(100.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(110.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(120.1 as float);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4100
     * @tc.name Array_Values_Test_static_4100
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4200
     * @tc.name Array_Values_Test_static_4200
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, -2, -3];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-3);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4300
     * @tc.name Array_Values_Test_static_4300
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4400
     * @tc.name Array_Values_Test_static_4400
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4500
     * @tc.name Array_Values_Test_static_4500
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 0, 1];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(1);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4600
     * @tc.name Array_Values_Test_static_4600
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 2, 2];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4700
     * @tc.name Array_Values_Test_static_4700
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [Int.MIN_VALUE, Int.MAX_VALUE];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-2147483648);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2147483647);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4800
     * @tc.name Array_Values_Test_static_4800
     * @tc.desc test values(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(10);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(20);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_4900
     * @tc.name Array_Values_Test_static_4900
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(100);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(200);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(300);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5000
     * @tc.name Array_Values_Test_static_5000
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-100, -200, -300];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-100);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-200);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-300);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5100
     * @tc.name Array_Values_Test_static_5100
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-300, -200, -100];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-300);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-200);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-100);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5200
     * @tc.name Array_Values_Test_static_5200
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5300
     * @tc.name Array_Values_Test_static_5300
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5400
     * @tc.name Array_Values_Test_static_5400
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, -10];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(10);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-10);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5500
     * @tc.name Array_Values_Test_static_5500
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [99, 99, 99];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(99);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(99);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(99);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5600
     * @tc.name Array_Values_Test_static_5600
     * @tc.desc test values(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [Long.MIN_VALUE, Long.MAX_VALUE];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-9223372036854775808);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(9223372036854775807);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5700
     * @tc.name Array_Values_Test_static_5700
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [Short.MIN_VALUE, Short.MAX_VALUE];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-32768);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(32767);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5800
     * @tc.name Array_Values_Test_static_5800
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(1 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(2 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(3 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_5900
     * @tc.name Array_Values_Test_static_5900
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-1 as short, -2 as short, -3 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-2 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-3 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_6000
     * @tc.name Array_Values_Test_static_6000
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-1 as short, -2 as short, -3 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(-1 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-2 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-3 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_6100
     * @tc.name Array_Values_Test_static_6100
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_6200
     * @tc.name Array_Values_Test_static_6200
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [100 as short, 100 as short, 100 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(100 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(100 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(100 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_6300
     * @tc.name Array_Values_Test_static_6300
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 5 as short, -5 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(5 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(-5 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_VALUES_TEST_6400
     * @tc.name Array_Values_Test_static_6400
     * @tc.desc test values(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Values_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_Test_static_6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short];
        const iterator = values(arr);
        let result = iterator.next();
        expect(result.value).assertEqual(0 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertEqual(0 as short);
        expect(result.done).assertFalse();
        result = iterator.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
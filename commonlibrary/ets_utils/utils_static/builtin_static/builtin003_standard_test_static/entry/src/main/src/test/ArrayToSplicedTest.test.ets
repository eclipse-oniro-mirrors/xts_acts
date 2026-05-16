import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSplicedTest() {
  describe('ArrayToSplicedTest', ():void => {
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
     * @tc.number ARRAY_TO_SPLICED_TEST_0100
     * @tc.name ArrayToSplicedTest0100
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0200
     * @tc.name ArrayToSplicedTest0200
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0300
     * @tc.name ArrayToSplicedTest0300
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<boolean> = [true, false, true, false];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0400
     * @tc.name ArrayToSplicedTest0400
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0500
     * @tc.name ArrayToSplicedTest0500
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<boolean> = [false, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0600
     * @tc.name ArrayToSplicedTest0600
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0700
     * @tc.name ArrayToSplicedTest0700
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0800
     * @tc.name ArrayToSplicedTest0800
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_0900
     * @tc.name ArrayToSplicedTest0900
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 5, true, true);
        const expected: FixedArray<boolean> = [true, true, true, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1000
     * @tc.name ArrayToSplicedTest1000
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 4, true, true);
        const expected: FixedArray<boolean> = [true, true, true, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1100
     * @tc.name ArrayToSplicedTest1100
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 3, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, false];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1200
     * @tc.name ArrayToSplicedTest1200
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 0, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, true, false, false, false];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1300
     * @tc.name ArrayToSplicedTest1300
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, -2, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, true, false, false, false];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1400
     * @tc.name ArrayToSplicedTest1400
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 1, 8, true, false);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1500
     * @tc.name ArrayToSplicedTest1500
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toSpliced(arr, 1, 2, true, false, true);
        const expected: FixedArray<boolean> = [true, true, false, true, false];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1600
     * @tc.name ArrayToSplicedTest1600
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: int, delete: int, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toSpliced(arr, 1, 3, true, false, true);
        const expected: FixedArray<boolean> = [true, true, false, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1700
     * @tc.name ArrayToSplicedTest1700
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 5, true, true);
        const expected: FixedArray<boolean> = [true, true, true, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1800
     * @tc.name ArrayToSplicedTest1800
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 4, true, true);
        const expected: FixedArray<boolean> = [true, true, true, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_1900
     * @tc.name ArrayToSplicedTest1900
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 3, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, false];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2000
     * @tc.name ArrayToSplicedTest2000
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, 0, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, true, false, false, false];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2100
     * @tc.name ArrayToSplicedTest2100
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 2, -2, true, false);
        const expected: FixedArray<boolean> = [true, true, true, false, true, false, false, false];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2200
     * @tc.name ArrayToSplicedTest2200
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false, false];
        const result = toSpliced(arr, 1, 8, true, false);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2300
     * @tc.name ArrayToSplicedTest2300
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toSpliced(arr, 1, 2, true, false, true);
        const expected: FixedArray<boolean> = [true, true, false, true, false];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2400
     * @tc.name ArrayToSplicedTest2400
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start: number, delete: number, ...items: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toSpliced(arr, 1, 3, true, false, true);
        const expected: FixedArray<boolean> = [true, true, false, true];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2500
     * @tc.name ArrayToSplicedTest2500
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toSpliced(arr);
        const expected: FixedArray<boolean> = [true, false, true, false];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2600
     * @tc.name ArrayToSplicedTest2600
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2700
     * @tc.name ArrayToSplicedTest2700
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2800
     * @tc.name ArrayToSplicedTest2800
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const s = 1;
        const d = 1;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_2900
     * @tc.name ArrayToSplicedTest2900
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true, false, true, false];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3000
     * @tc.name ArrayToSplicedTest3000
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const s = 1;
        const result = toSpliced(arr, s);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3100
     * @tc.name ArrayToSplicedTest3100
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false, true, false, true];
        const s = 2;
        const d = 4;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3200
     * @tc.name ArrayToSplicedTest3200
     * @tc.desc test toSpliced(self: FixedArray<boolean>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false, true, false, true];
        const s = 2;
        const d = 5;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3300
     * @tc.name ArrayToSplicedTest3300
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 10, 20];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3400
     * @tc.name ArrayToSplicedTest3400
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 10, 20];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<byte> = [2];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3500
     * @tc.name ArrayToSplicedTest3500
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 10, 20];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<byte> = [2, 5, 10];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3600
     * @tc.name ArrayToSplicedTest3600
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-2, -5, -10, -20];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<byte> = [-2];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3700
     * @tc.name ArrayToSplicedTest3700
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, -128, 127, 127, -128, 127];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<byte> = [-128, -128, 127];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3800
     * @tc.name ArrayToSplicedTest3800
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 10, 10, 10];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<byte> = [10, 10];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_3900
     * @tc.name ArrayToSplicedTest3900
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, -10, 10, -10];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<byte> = [10, -10];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4000
     * @tc.name ArrayToSplicedTest4000
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<byte> = [0, 100, 127, -50];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4100
     * @tc.name ArrayToSplicedTest4100
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s: int = 2;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10, -50, -10];
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4200
     * @tc.name ArrayToSplicedTest4200
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s: int = 2;
        const d: int = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4300
     * @tc.name ArrayToSplicedTest4300
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s: int = 2;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10, 127, -50, -10];
        expect(result.length).assertEqual(7);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4400
     * @tc.name ArrayToSplicedTest4400
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127, -128, 127, -128];
        const items: FixedArray<byte> = [0];
        const s: int = 2;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [127, -128, 0, -128];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4500
     * @tc.name ArrayToSplicedTest4500
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const items: FixedArray<byte> = [-128];
        const s: int = 1;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, -128, 0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4600
     * @tc.name ArrayToSplicedTest4600
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const items: FixedArray<byte> = [0];
        const s: int = 2;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 0, 0, 0];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4700
     * @tc.name ArrayToSplicedTest4700
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50];
        const items: FixedArray<byte> = [10, 20, 30, 50];
        const s: int = 0;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [10, 20, 30, 50];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4800
     * @tc.name ArrayToSplicedTest4800
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: int, delete: int, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50];
        const items: FixedArray<byte> = [10, 20, 30, 50];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [10, 20, 30, 50, 10, 20, 30, 50];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_4900
     * @tc.name ArrayToSplicedTest4900
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s = 2;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10, -50, -10];
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5000
     * @tc.name ArrayToSplicedTest5000
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s = 2;
        const d = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5100
     * @tc.name ArrayToSplicedTest5100
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 100, 127, -50, -10];
        const items: FixedArray<byte> = [10, 10];
        const s = 2;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 100, 10, 10, 127, -50, -10];
        expect(result.length).assertEqual(7);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5200
     * @tc.name ArrayToSplicedTest5200
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127, -128, 127, -128];
        const items: FixedArray<byte> = [0];
        const s = 2;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [127, -128, 0, -128];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5300
     * @tc.name ArrayToSplicedTest5300
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const items: FixedArray<byte> = [-128];
        const s = 1;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, -128, 0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5400
     * @tc.name ArrayToSplicedTest5400
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const items: FixedArray<byte> = [0];
        const s = 2;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [0, 0, 0, 0];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5500
     * @tc.name ArrayToSplicedTest5500
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50];
        const items: FixedArray<byte> = [10, 20, 30, 50];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [10, 20, 30, 50];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5600
     * @tc.name ArrayToSplicedTest5600
     * @tc.desc test toSpliced(self: FixedArray<byte>, start: number, delete: number, ...items: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50];
        const items: FixedArray<byte> = [10, 20, 30, 50];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<byte> = [10, 20, 30, 50, 10, 20, 30, 50];
        expect(result.length).assertEqual(8);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        expect(result[6]).assertEqual(expected[6]);
        expect(result[7]).assertEqual(expected[7]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5700
     * @tc.name ArrayToSplicedTest5700
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50, 60];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [10, 50, 60];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5800
     * @tc.name ArrayToSplicedTest5800
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50, 60];
        const s = 1;
        const d = 6;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [10];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_5900
     * @tc.name ArrayToSplicedTest5900
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 50, 60];
        const s = 4;
        const d = 0;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [10, 20, 30, 50, 60];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6000
     * @tc.name ArrayToSplicedTest6000
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10, -20, -30, -50, -60];
        const s = 3;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [-10, -20, -30];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6100
     * @tc.name ArrayToSplicedTest6100
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [100, 100, 100, 100];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [100, 100];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6200
     * @tc.name ArrayToSplicedTest6200
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 127, 0, 127, -128];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [127, -128];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6300
     * @tc.name ArrayToSplicedTest6300
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 5, 60, 3, 75];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [10, 75];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6400
     * @tc.name ArrayToSplicedTest6400
     * @tc.desc test toSpliced(self: FixedArray<byte>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [100, 0, 100, 0, 0, 100];
        const s = 5;
        const d = 9;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<byte> = [100, 0, 100, 0, 0, 100];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6500
     * @tc.name ArrayToSplicedTest6500
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<char> = [0x48.toChar(), 0x45.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6600
     * @tc.name ArrayToSplicedTest6600
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6700
     * @tc.name ArrayToSplicedTest6700
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6800
     * @tc.name ArrayToSplicedTest6800
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_6900
     * @tc.name ArrayToSplicedTest6900
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = toSpliced(arr, 5);
        const expected: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_7000
     * @tc.name ArrayToSplicedTest7000
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x77.toChar(), 0x6F.toChar(), 0x72.toChar(), 0x6C.toChar(), 0x64.toChar()];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<char> = [0x77.toChar(), 0x6F.toChar(), 0x72.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_7100
     * @tc.name ArrayToSplicedTest7100
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x77.toChar(), 0x6F.toChar(), 0x72.toChar(), 0x6C.toChar(), 0x64.toChar()];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<char> = [0x77.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_TEST_7200
     * @tc.name ArrayToSplicedTest7200
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar(), 0x39.toChar(), 0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
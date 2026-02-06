import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSplicedFourthTest() {
  describe('ArrayToSplicedFourthTest', ():void => {
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
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0100
     * @tc.name ArrayToSplicedFourthTest0100
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = 2;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<long> = [100, 200, 500];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0200
     * @tc.name ArrayToSplicedFourthTest0200
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = 2;
        const d = 8;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<long> = [100, 200];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0300
     * @tc.name ArrayToSplicedFourthTest0300
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = 0;
        const d = 5;
        const result = toSpliced(arr, s, d);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0400
     * @tc.name ArrayToSplicedFourthTest0400
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = -4;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<long> = [100, 400, 500];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0500
     * @tc.name ArrayToSplicedFourthTest0500
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = -4;
        const result = toSpliced(arr, s);
        const expected: FixedArray<long> = [100];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0600
     * @tc.name ArrayToSplicedFourthTest0600
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        const s = -10;
        const result = toSpliced(arr, s);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0700
     * @tc.name ArrayToSplicedFourthTest0700
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-100, -200, -300, -400, -500];
        const s = 2;
        const d = 3;
        const result = toSpliced(arr, s);
        const expected: FixedArray<long> = [-100, -200];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0800
     * @tc.name ArrayToSplicedFourthTest0800
     * @tc.desc test toSpliced(self: FixedArray<long>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-100, -200, -300, -400, -500];
        const s = 1;
        const result = toSpliced(arr, s);
        const expected: FixedArray<long> = [-100];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_0900
     * @tc.name ArrayToSplicedFourthTest0900
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<short> = [10 as short, 20 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1000
     * @tc.name ArrayToSplicedFourthTest1000
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1100
     * @tc.name ArrayToSplicedFourthTest1100
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const result = toSpliced(arr, -2);
        const expected: FixedArray<short> = [10 as short, 20 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1200
     * @tc.name ArrayToSplicedFourthTest1200
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const result = toSpliced(arr, -6);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1300
     * @tc.name ArrayToSplicedFourthTest1300
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-10 as short, -20 as short, -30 as short, -40 as short];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<short> = [-10 as short, -20 as short, -30 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1400
     * @tc.name ArrayToSplicedFourthTest1400
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-10 as short, -20 as short, -30 as short, -40 as short];
        const result = toSpliced(arr, -1);
        const expected: FixedArray<short> = [-10 as short, -20 as short, -30 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1500
     * @tc.name ArrayToSplicedFourthTest1500
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-32768 as short, 0 as short, 32767 as short, -32768 as short];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<short> = [-32768 as short, 0 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1600
     * @tc.name ArrayToSplicedFourthTest1600
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [999 as short, 999 as short, 999 as short, 999 as short];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<short> = [999 as short, 999 as short, 999 as short, 999 as short];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1700
     * @tc.name ArrayToSplicedFourthTest1700
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s: int = 0;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [20 as short, 40 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1800
     * @tc.name ArrayToSplicedFourthTest1800
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s: int = 2;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [10 as short, 20 as short, 20 as short, 40 as short];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_1900
     * @tc.name ArrayToSplicedFourthTest1900
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s: int = -3;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [10 as short, 20 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2000
     * @tc.name ArrayToSplicedFourthTest2000
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s: int = -6;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [20 as short, 40 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2100
     * @tc.name ArrayToSplicedFourthTest2100
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [90 as short, 90 as short, 90 as short, 90 as short];
        const items: FixedArray<short> = [90 as short, 90 as short];
        const s: int = 1;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [90 as short, 90 as short, 90 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2200
     * @tc.name ArrayToSplicedFourthTest2200
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [90 as short, 90 as short, 90 as short, 90 as short];
        const items: FixedArray<short> = [90 as short, 90 as short];
        const s: int = 0;
        const d: int = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [90 as short, 90 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2300
     * @tc.name ArrayToSplicedFourthTest2300
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const items: FixedArray<short> = [0 as short, 0 as short];
        const s: int = 1;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [-90 as short, 0 as short, 0 as short, 90 as short];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2400
     * @tc.name ArrayToSplicedFourthTest2400
     * @tc.desc test toSpliced(self: FixedArray<short>, start: int, delete: int, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const items: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [-90 as short, 0 as short, 90 as short, -90 as short, 0 as short, 90 as short];
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
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2500
     * @tc.name ArrayToSplicedFourthTest2500
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [20 as short, 40 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2600
     * @tc.name ArrayToSplicedFourthTest2600
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s = 2;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [10 as short, 20 as short, 20 as short, 40 as short];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2700
     * @tc.name ArrayToSplicedFourthTest2700
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s = -3;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [10 as short, 20 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2800
     * @tc.name ArrayToSplicedFourthTest2800
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const items: FixedArray<short> = [20 as short, 40 as short];
        const s = -6;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [20 as short, 40 as short, 40 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_2900
     * @tc.name ArrayToSplicedFourthTest2900
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [90 as short, 90 as short, 90 as short, 90 as short];
        const items: FixedArray<short> = [90 as short, 90 as short];
        const s = 1;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [90 as short, 90 as short, 90 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3000
     * @tc.name ArrayToSplicedFourthTest3000
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [90 as short, 90 as short, 90 as short, 90 as short];
        const items: FixedArray<short> = [90 as short, 90 as short];
        const s = 0;
        const d = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [90 as short, 90 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3100
     * @tc.name ArrayToSplicedFourthTest3100
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const items: FixedArray<short> = [0 as short, 0 as short];
        const s = 1;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [-90 as short, 0 as short, 0 as short, 90 as short];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3200
     * @tc.name ArrayToSplicedFourthTest3200
     * @tc.desc test toSpliced(self: FixedArray<short>, start: number, delete: number, ...items: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const items: FixedArray<short> = [-90 as short, 0 as short, 90 as short];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<short> = [-90 as short, 0 as short, 90 as short, -90 as short, 0 as short, 90 as short];
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
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3300
     * @tc.name ArrayToSplicedFourthTest3300
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = 2;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<short> = [10 as short, 20 as short, 90 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3400
     * @tc.name ArrayToSplicedFourthTest3400
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = 2;
        const d = 6;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<short> = [10 as short, 20 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3500
     * @tc.name ArrayToSplicedFourthTest3500
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<short> = [80 as short, 90 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3600
     * @tc.name ArrayToSplicedFourthTest3600
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = 1;
        const result = toSpliced(arr, s);
        const expected: FixedArray<short> = [10 as short];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3700
     * @tc.name ArrayToSplicedFourthTest3700
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = -2;
        const result = toSpliced(arr, s);
        const expected: FixedArray<short> = [10 as short, 20 as short, 30 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3800
     * @tc.name ArrayToSplicedFourthTest3800
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = -6;
        const result = toSpliced(arr, s);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_3900
     * @tc.name ArrayToSplicedFourthTest3900
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = -2;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<short> = [10 as short, 20 as short, 30 as short];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_FOURTH_TEST_4000
     * @tc.name ArrayToSplicedFourthTest4000
     * @tc.desc test toSpliced(self: FixedArray<short>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedFourthTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedFourthTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 80 as short, 90 as short];
        const s = -10;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<short> = [80 as short, 90 as short];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
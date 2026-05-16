import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSplicedSecondTest() {
  describe('ArrayToSplicedSecondTest', ():void => {
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0100
     * @tc.name ArrayToSplicedSecondTest0100
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x47.toChar(), 0x41.toChar(), 0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0200
     * @tc.name ArrayToSplicedSecondTest0200
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 1;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x47.toChar(), 0x41.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0300
     * @tc.name ArrayToSplicedSecondTest0300
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 1;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x47.toChar(), 0x41.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0400
     * @tc.name ArrayToSplicedSecondTest0400
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 3;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x47.toChar(), 0x41.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0500
     * @tc.name ArrayToSplicedSecondTest0500
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 2;
        const d: int = -6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x47.toChar(), 0x41.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0600
     * @tc.name ArrayToSplicedSecondTest0600
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s: int = 2;
        const d: int = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x47.toChar(), 0x41.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0700
     * @tc.name ArrayToSplicedSecondTest0700
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x33.toChar()];
        const items: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        const s: int = 2;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0800
     * @tc.name ArrayToSplicedSecondTest0800
     * @tc.desc test toSpliced(self: FixedArray<char>, start: int, delete: int, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x33.toChar()];
        const items: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        const s: int = 0;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_0900
     * @tc.name ArrayToSplicedSecondTest0900
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x47.toChar(), 0x41.toChar(), 0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1000
     * @tc.name ArrayToSplicedSecondTest1000
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 1;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x47.toChar(), 0x41.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1100
     * @tc.name ArrayToSplicedSecondTest1100
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 1;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x47.toChar(), 0x41.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1200
     * @tc.name ArrayToSplicedSecondTest1200
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 3;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x47.toChar(), 0x41.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1300
     * @tc.name ArrayToSplicedSecondTest1300
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 2;
        const d = -6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x47.toChar(), 0x41.toChar(), 0x4F.toChar(), 0x44.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1400
     * @tc.name ArrayToSplicedSecondTest1400
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x4F.toChar(), 0x44.toChar()];
        const items: FixedArray<char> = [0x47.toChar(), 0x41.toChar()];
        const s = 2;
        const d = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x50.toChar(), 0x47.toChar(), 0x41.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1500
     * @tc.name ArrayToSplicedSecondTest1500
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x33.toChar()];
        const items: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        const s = 2;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1600
     * @tc.name ArrayToSplicedSecondTest1600
     * @tc.desc test toSpliced(self: FixedArray<char>, start: number, delete: number, ...items: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x38.toChar(), 0x33.toChar()];
        const items: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x37.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1700
     * @tc.name ArrayToSplicedSecondTest1700
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar(), 0x51.toChar(), 0x52.toChar()];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x4E.toChar(), 0x51.toChar(), 0x52.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1800
     * @tc.name ArrayToSplicedSecondTest1800
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar(), 0x51.toChar(), 0x52.toChar()];
        const s = 4;
        const d = 0;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar(), 0x51.toChar(), 0x52.toChar()];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_1900
     * @tc.name ArrayToSplicedSecondTest1900
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar(), 0x51.toChar(), 0x52.toChar()];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x52.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2000
     * @tc.name ArrayToSplicedSecondTest2000
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar(), 0x4C.toChar(), 0x51.toChar(), 0x52.toChar()];
        const s = 2;
        const d = 6;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x4E.toChar(), 0x4D.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2100
     * @tc.name ArrayToSplicedSecondTest2100
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x39.toChar(), 0x38.toChar(), 0x37.toChar(), 0x36.toChar()];
        const s = 2;
        const d = 1;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x39.toChar(), 0x38.toChar(), 0x36.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2200
     * @tc.name ArrayToSplicedSecondTest2200
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x38.toChar(), 0x38.toChar(), 0x38.toChar(), 0x38.toChar()];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x38.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2300
     * @tc.name ArrayToSplicedSecondTest2300
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x38.toChar(), 0x38.toChar(), 0x38.toChar(), 0x38.toChar()];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2400
     * @tc.name ArrayToSplicedSecondTest2400
     * @tc.desc test toSpliced(self: FixedArray<char>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x38.toChar(), 0x5A.toChar(), 0x38.toChar(), 0x41.toChar()];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<char> = [0x38.toChar(), 0x41.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2500
     * @tc.name ArrayToSplicedSecondTest2500
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 1.1, 6.6];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<double> = [2.2];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2600
     * @tc.name ArrayToSplicedSecondTest2600
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 1.1, 6.6];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<double> = [2.2, 1.1, 6.6];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2700
     * @tc.name ArrayToSplicedSecondTest2700
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 1.1, 6.6];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2800
     * @tc.name ArrayToSplicedSecondTest2800
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-2.2, -1.1, -6.6, -8.8, -9.9];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<double> = [-2.2, -1.1, -6.6, -8.8];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_2900
     * @tc.name ArrayToSplicedSecondTest2900
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-2.2, -1.1, -6.6, -8.8, -9.9];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<double> = [-2.2, -1.1];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3000
     * @tc.name ArrayToSplicedSecondTest3000
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [12.1, 12.1, 12.1, 12.1, 12.1];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<double> = [12.1, 12.1, 12.1];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3100
     * @tc.name ArrayToSplicedSecondTest3100
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [12.1, 12.1, 12.1, 12.1, 12.1];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<double> = [12.1];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3200
     * @tc.name ArrayToSplicedSecondTest3200
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1000.1, 2000.2, 3000.3, 9000.9];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<double> = [1000.1, 2000.2, 3000.3];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3300
     * @tc.name ArrayToSplicedSecondTest3300
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [12.2, 18.8, 11.1, 12.2, 18.8, 20.2];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3400
     * @tc.name ArrayToSplicedSecondTest3400
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s: int = 1;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3500
     * @tc.name ArrayToSplicedSecondTest3500
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s: int = 0;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [12.2, 18.8];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3600
     * @tc.name ArrayToSplicedSecondTest3600
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s: int = 2;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3700
     * @tc.name ArrayToSplicedSecondTest3700
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s: int = 2;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9, 1998.9];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3800
     * @tc.name ArrayToSplicedSecondTest3800
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s: int = 4;
        const d: int = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9, 1998.9];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_3900
     * @tc.name ArrayToSplicedSecondTest3900
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -8.8, -6.6, -3.3];
        const items: FixedArray<double> = [5.5];
        const s: int = 2;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [-1.1, -8.8, 5.5];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4000
     * @tc.name ArrayToSplicedSecondTest4000
     * @tc.desc test toSpliced(self: FixedArray<double>, start: int, delete: int, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -8.8, -6.6, -3.3];
        const items: FixedArray<double> = [5.5];
        const s: int = 0;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [5.5, -3.3];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4100
     * @tc.name ArrayToSplicedSecondTest4100
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [12.2, 18.8, 11.1, 12.2, 18.8, 20.2];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4200
     * @tc.name ArrayToSplicedSecondTest4200
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4300
     * @tc.name ArrayToSplicedSecondTest4300
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 12.2, 18.8, 20.2];
        const items: FixedArray<double> = [12.2, 18.8];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [12.2, 18.8];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4400
     * @tc.name ArrayToSplicedSecondTest4400
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s = 2;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4500
     * @tc.name ArrayToSplicedSecondTest4500
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s = 2;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9, 1998.9];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4600
     * @tc.name ArrayToSplicedSecondTest4600
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9];
        const items: FixedArray<double> = [1998.9];
        const s = 4;
        const d = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [1998.9, 1998.9, 1998.9, 1998.9, 1998.9];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4700
     * @tc.name ArrayToSplicedSecondTest4700
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -8.8, -6.6, -3.3];
        const items: FixedArray<double> = [5.5];
        const s = 2;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [-1.1, -8.8, 5.5];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4800
     * @tc.name ArrayToSplicedSecondTest4800
     * @tc.desc test toSpliced(self: FixedArray<double>, start: number, delete: number, ...items: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -8.8, -6.6, -3.3];
        const items: FixedArray<double> = [5.5];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<double> = [5.5, -3.3];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_4900
     * @tc.name ArrayToSplicedSecondTest4900
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [1.1, 5.5];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5000
     * @tc.name ArrayToSplicedSecondTest5000
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const s = 0;
        const d = 5;
        const result = toSpliced(arr, s, d);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5100
     * @tc.name ArrayToSplicedSecondTest5100
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const s = 3;
        const d = 7;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5200
     * @tc.name ArrayToSplicedSecondTest5200
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const s = 5;
        const d = 5;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5300
     * @tc.name ArrayToSplicedSecondTest5300
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-888.8, -777.7, -666.6, -555.5, -444.4];
        const s = 4;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [-888.8, -777.7, -666.6, -555.5];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5400
     * @tc.name ArrayToSplicedSecondTest5400
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-888.8, -777.7, -666.6, -555.5, -444.4];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [-444.4];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5500
     * @tc.name ArrayToSplicedSecondTest5500
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [99.9, 0.0, -99.9, 99.9, 0.0, -99.9];
        const s = 1;
        const d = 4;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [99.9, -99.9];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5600
     * @tc.name ArrayToSplicedSecondTest5600
     * @tc.desc test toSpliced(self: FixedArray<double>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [99.9, 0.0, -99.9, 99.9, 0.0, -99.9];
        const s = 1;
        const d = -2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<double> = [99.9, 0.0, -99.9, 99.9, 0.0, -99.9];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5700
     * @tc.name ArrayToSplicedSecondTest5700
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
          15.5 as float
        ];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<double> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
        ];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5800
     * @tc.name ArrayToSplicedSecondTest5800
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
          15.5 as float
        ];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_5900
     * @tc.name ArrayToSplicedSecondTest5900
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
          15.5 as float
        ];
        const result = toSpliced(arr, 6);
        const expected: FixedArray<double> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
          15.5 as float
        ];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6000
     * @tc.name ArrayToSplicedSecondTest6000
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.1 as float,
          12.2 as float,
          13.3 as float,
          15.5 as float
        ];
        const result = toSpliced(arr, -6);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6100
     * @tc.name ArrayToSplicedSecondTest6100
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -11.1 as float,
          -12.2 as float,
          -13.3 as float,
          -15.5 as float
        ];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<double> = [
          -11.1 as float,
          -12.2 as float
        ];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6200
     * @tc.name ArrayToSplicedSecondTest6200
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          Float.MAX_VALUE as float,
          0.0 as float,
          Float.MIN_VALUE as float,
          0.0 as float
        ];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<double> = [
          Float.MAX_VALUE as float,
          0.0 as float
        ];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6300
     * @tc.name ArrayToSplicedSecondTest6300
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          Float.MAX_VALUE as float,
          0.0 as float,
          Float.MIN_VALUE as float,
          0.0 as float
        ];
        const result = toSpliced(arr, -1);
        const expected: FixedArray<double> = [
          Float.MAX_VALUE as float,
          0.0 as float,
          Float.MIN_VALUE as float
        ];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6400
     * @tc.name ArrayToSplicedSecondTest6400
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2222.2 as float,
          -1111.1 as float,
          -3333.3 as float
        ];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<float> = [
          2222.2 as float,
          -1111.1 as float
        ];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6500
     * @tc.name ArrayToSplicedSecondTest6500
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s: int = 0;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6600
     * @tc.name ArrayToSplicedSecondTest6600
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s: int = 1;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [1.1 as float, 1.1 as float, 2.2 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6700
     * @tc.name ArrayToSplicedSecondTest6700
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s: int = 3;
        const d: int = 6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 1.1 as float, 2.2 as float];
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
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6800
     * @tc.name ArrayToSplicedSecondTest6800
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const items: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const s: int = 0;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_6900
     * @tc.name ArrayToSplicedSecondTest6900
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const items: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const s: int = 0;
        const d: int = 6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_7000
     * @tc.name ArrayToSplicedSecondTest7000
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1111.1 as float, 2222.2 as float, 3333.3 as float, 4444.4 as float];
        const items: FixedArray<float> = [-2222.2 as float, -3333.3 as float];
        const s: int = 1;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [1111.1 as float, -2222.2 as float, -3333.3 as float, 4444.4 as float];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_7100
     * @tc.name ArrayToSplicedSecondTest7100
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float, Float.MAX_VALUE as float, Float.MIN_VALUE as float];
        const items: FixedArray<float> = [0.0 as float, 0.0 as float];
        const s: int = 1;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [0.0 as float, 0.0 as float, 0.0 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SPLICED_SECOND_TEST_7200
     * @tc.name ArrayToSplicedSecondTest7200
     * @tc.desc test toSpliced(self: FixedArray<float>, start: int, delete: int, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSplicedSecondTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9 as float, 9.9 as float, 9.9 as float];
        const items: FixedArray<float> = [9.9 as float];
        const s: int = 0;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [9.9 as float, 9.9 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
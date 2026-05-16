import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSplicedThirdTest() {
  describe('ArrayToSplicedThirdTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number SUB_ARRAY_TO_SPLICED_THIRD_TEST_
     * @tc.name ArrayToSplicedThirdTest0100
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0200
     * @tc.name ArrayToSplicedThirdTest0200
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s = 1;
        const d = 3;
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0300
     * @tc.name ArrayToSplicedThirdTest0300
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const items: FixedArray<float> = [1.1 as float, 2.2 as float];
        const s = 3;
        const d = 6;
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0400
     * @tc.name ArrayToSplicedThirdTest0400
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const items: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const s = 0;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0500
     * @tc.name ArrayToSplicedThirdTest0500
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const items: FixedArray<float> = [-1.1 as float, -2.2 as float];
        const s = 0;
        const d = 6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0600
     * @tc.name ArrayToSplicedThirdTest0600
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1111.1 as float, 2222.2 as float, 3333.3 as float, 4444.4 as float];
        const items: FixedArray<float> = [-2222.2 as float, -3333.3 as float];
        const s = 1;
        const d = 2;
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0700
     * @tc.name ArrayToSplicedThirdTest0700
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float, Float.MAX_VALUE as float, Float.MIN_VALUE as float];
        const items: FixedArray<float> = [0.0 as float, 0.0 as float];
        const s = 1;
        const d = 2;
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0800
     * @tc.name ArrayToSplicedThirdTest0800
     * @tc.desc test toSpliced(self: FixedArray<float>, start: number, delete: number, ...items: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9 as float, 9.9 as float, 9.9 as float];
        const items: FixedArray<float> = [9.9 as float];
        const s = 0;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<float> = [9.9 as float, 9.9 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_0900
     * @tc.name ArrayToSplicedThirdTest0900
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const s = 4;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1000
     * @tc.name ArrayToSplicedThirdTest1000
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const s = 0;
        const d = 3;
        const result = toSpliced(arr, s, d);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1100
     * @tc.name ArrayToSplicedThirdTest1100
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const s = 2;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1200
     * @tc.name ArrayToSplicedThirdTest1200
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [-1.1 as float];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1300
     * @tc.name ArrayToSplicedThirdTest1300
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const s = 2;
        const d = -2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1400
     * @tc.name ArrayToSplicedThirdTest1400
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000.1 as float, 2000.2 as float, 3000.3 as float, 5000.5 as float];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [1000.1 as float, 5000.5 as float];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1500
     * @tc.name ArrayToSplicedThirdTest1500
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000.1 as float, 2000.2 as float, 3000.3 as float, 5000.5 as float];
        const s = 1;
        const d = -5;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [1000.1 as float, 2000.2 as float, 3000.3 as float, 5000.5 as float];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1600
     * @tc.name ArrayToSplicedThirdTest1600
     * @tc.desc test toSpliced(self: FixedArray<float>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000.1 as float, 2000.2 as float, 3000.3 as float, 5000.5 as float];
        const s = 1;
        const d = -5;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<float> = [1000.1 as float, 2000.2 as float, 3000.3 as float, 5000.5 as float];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1700
     * @tc.name ArrayToSplicedThirdTest1700
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4, 5, 6];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<int> = [2, 3];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1800
     * @tc.name ArrayToSplicedThirdTest1800
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4, 5, 6];
        const result = toSpliced(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_1900
     * @tc.name ArrayToSplicedThirdTest1900
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4, 5, 6];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<int> = [2, 3, 4, 5];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2000
     * @tc.name ArrayToSplicedThirdTest2000
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4, 5, 6];
        const result = toSpliced(arr, -2);
        const expected: FixedArray<int> = [2, 3, 4];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2100
     * @tc.name ArrayToSplicedThirdTest2100
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4, 5, 6];
        const result = toSpliced(arr, -6);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2200
     * @tc.name ArrayToSplicedThirdTest2200
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-2, 0, 2, 5, 6, 7, 9];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<int> = [-2];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2300
     * @tc.name ArrayToSplicedThirdTest2300
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-2, 0, 2, 5, 6, 7, 9];
        const result = toSpliced(arr, 9);
        const expected: FixedArray<int> = [-2, 0, 2, 5, 6, 7, 9];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2400
     * @tc.name ArrayToSplicedThirdTest2400
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-2, 0, 2, 5, 6, 7, 9];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<int> = [-2, 0, 2, 5];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2500
     * @tc.name ArrayToSplicedThirdTest2500
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const items: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const s: int = 0;
        const d: int = 6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5, 6];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2600
     * @tc.name ArrayToSplicedThirdTest2600
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1, 2, 3];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 3, 1, 2, 3];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2700
     * @tc.name ArrayToSplicedThirdTest2700
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s: int = 2;
        const d: int = -1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 1, 3];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2800
     * @tc.name ArrayToSplicedThirdTest2800
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s: int = 2;
        const d: int = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 1];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_2900
     * @tc.name ArrayToSplicedThirdTest2900
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s: int = 1;
        const d: int = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 1];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3000
     * @tc.name ArrayToSplicedThirdTest3000
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s: int = 0;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [0, 0, 0, -8, -9];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3100
     * @tc.name ArrayToSplicedThirdTest3100
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s: int = 1;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [-6, 0, 0, 0];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3200
     * @tc.name ArrayToSplicedThirdTest3200
     * @tc.desc test toSpliced(self: FixedArray<int>, start: int, delete: int, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s: int = 0;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [0, 0, 0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3300
     * @tc.name ArrayToSplicedThirdTest3300
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const items: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const s = 0;
        const d = 6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5, 6];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3400
     * @tc.name ArrayToSplicedThirdTest3400
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1, 2, 3];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 3, 1, 2, 3];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3500
     * @tc.name ArrayToSplicedThirdTest3500
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s = 2;
        const d = -1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 1, 3];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3600
     * @tc.name ArrayToSplicedThirdTest3600
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s = 2;
        const d = 5;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 2, 1];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3700
     * @tc.name ArrayToSplicedThirdTest3700
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const items: FixedArray<int> = [1];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [1, 1];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3800
     * @tc.name ArrayToSplicedThirdTest3800
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s = 0;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [0, 0, 0, -8, -9];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_3900
     * @tc.name ArrayToSplicedThirdTest3900
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s = 1;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [-6, 0, 0, 0];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4000
     * @tc.name ArrayToSplicedThirdTest4000
     * @tc.desc test toSpliced(self: FixedArray<int>, start: number, delete: number, ...items: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -7, -8, -9];
        const items: FixedArray<int> = [0, 0, 0];
        const s = 0;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<int> = [0, 0, 0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4100
     * @tc.name ArrayToSplicedThirdTest4100
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const s = 2;
        const result = toSpliced(arr, s);
        const expected: FixedArray<int> = [1, 2];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4200
     * @tc.name ArrayToSplicedThirdTest4200
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const s = 5;
        const result = toSpliced(arr, s);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4300
     * @tc.name ArrayToSplicedThirdTest4300
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const s = 2;
        const d = 0;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4400
     * @tc.name ArrayToSplicedThirdTest4400
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const s = 3;
        const d = -5;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4500
     * @tc.name ArrayToSplicedThirdTest4500
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const s = 3;
        const d = 10;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<int> = [1, 2, 3];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4600
     * @tc.name ArrayToSplicedThirdTest4600
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, -100, 100, 0, -200, 200];
        const s = 3;
        const result = toSpliced(arr, s);
        const expected: FixedArray<int> = [0, -100, 100];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4700
     * @tc.name ArrayToSplicedThirdTest4700
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, -100, 100, 0, -200, 200];
        const s = 3;
        const d = 0;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<int> = [0, -100, 100, 0, -200, 200];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4800
     * @tc.name ArrayToSplicedThirdTest4800
     * @tc.desc test toSpliced(self: FixedArray<int>, start?: Number, delete?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, -100, 100, 0, -200, 200];
        const s = 1;
        const d = 3;
        const result = toSpliced(arr, s, d);
        const expected: FixedArray<int> = [0, -200, 200];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_4900
     * @tc.name ArrayToSplicedThirdTest4900
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const result = toSpliced(arr, 1);
        const expected: FixedArray<long> = [10];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5000
     * @tc.name ArrayToSplicedThirdTest5000
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const result = toSpliced(arr, -3);
        const expected: FixedArray<long> = [10, 20];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5100
     * @tc.name ArrayToSplicedThirdTest5100
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<long> = [10, 20, 30, 40];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5200
     * @tc.name ArrayToSplicedThirdTest5200
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const result = toSpliced(arr, 10);
        const expected: FixedArray<long> = [10, 20, 30, 40, 50];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5300
     * @tc.name ArrayToSplicedThirdTest5300
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999, 999, 999];
        const result = toSpliced(arr, 3);
        const expected: FixedArray<long> = [999, 999, 999];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5400
     * @tc.name ArrayToSplicedThirdTest5400
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999, 999, 999];
        const result = toSpliced(arr, -6);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5500
     * @tc.name ArrayToSplicedThirdTest5500
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 100, -200, 500];
        const result = toSpliced(arr, 2);
        const expected: FixedArray<long> = [0, 0];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5600
     * @tc.name ArrayToSplicedThirdTest5600
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 100, -200, 500];
        const result = toSpliced(arr, 4);
        const expected: FixedArray<long> = [0, 0, 100, -200];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5700
     * @tc.name ArrayToSplicedThirdTest5700
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111, 2222, 3333];
        const s: int = 0;
        const d: int = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [1111, 2222, 3333, 111, 222, 333];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5800
     * @tc.name ArrayToSplicedThirdTest5800
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111];
        const s: int = 2;
        const d: int = -6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, 222, 1111, 333];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_5900
     * @tc.name ArrayToSplicedThirdTest5900
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111];
        const s: int = 1;
        const d: int = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, 1111];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6000
     * @tc.name ArrayToSplicedThirdTest6000
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-111, -222, -333];
        const items: FixedArray<long> = [111];
        const s: int = 0;
        const d: int = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, -222, -333];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6100
     * @tc.name ArrayToSplicedThirdTest6100
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999];
        const items: FixedArray<long> = [999, 999];
        const s: int = 1;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [999, 999, 999];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6200
     * @tc.name ArrayToSplicedThirdTest6200
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999];
        const items: FixedArray<long> = [999, 999];
        const s: int = 1;
        const d: int = -10;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [999, 999, 999, 999, 999];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6300
     * @tc.name ArrayToSplicedThirdTest6300
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, 0, 10, 20, 30];
        const items: FixedArray<long> = [0, 0, 0];
        const s: int = 1;
        const d: int = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [-10, 0, 0, 0, 20, 30];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6400
     * @tc.name ArrayToSplicedThirdTest6400
     * @tc.desc test toSpliced(self: FixedArray<long>, start: int, delete: int, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, 0, 10, 20, 30];
        const items: FixedArray<long> = [0, 0, 0];
        const s: int = 2;
        const d: int = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [-10, 0, 0, 0, 0];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6500
     * @tc.name ArrayToSplicedThirdTest6500
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111, 2222, 3333];
        const s = 0;
        const d = 0;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [1111, 2222, 3333, 111, 222, 333];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6600
     * @tc.name ArrayToSplicedThirdTest6600
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111];
        const s = 2;
        const d = -6;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, 222, 1111, 333];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6700
     * @tc.name ArrayToSplicedThirdTest6700
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [111, 222, 333];
        const items: FixedArray<long> = [1111];
        const s = 1;
        const d = 4;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, 1111];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6800
     * @tc.name ArrayToSplicedThirdTest6800
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-111, -222, -333];
        const items: FixedArray<long> = [111];
        const s = 0;
        const d = 1;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [111, -222, -333];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_6900
     * @tc.name ArrayToSplicedThirdTest6900
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999];
        const items: FixedArray<long> = [999, 999];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [999, 999, 999];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_7000
     * @tc.name ArrayToSplicedThirdTest7000
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999, 999, 999];
        const items: FixedArray<long> = [999, 999];
        const s = 1;
        const d = -10;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [999, 999, 999, 999, 999];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_7100
     * @tc.name ArrayToSplicedThirdTest7100
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, 0, 10, 20, 30];
        const items: FixedArray<long> = [0, 0, 0];
        const s = 1;
        const d = 2;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [-10, 0, 0, 0, 20, 30];
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
     * @tc.number  SUB_ARRAY_TO_SPLICED_THIRD_TEST_7200
     * @tc.name ArrayToSplicedThirdTest7200
     * @tc.desc test toSpliced(self: FixedArray<long>, start: number, delete: number, ...items: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSplicedThirdTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayToSplicedThirdTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, 0, 10, 20, 30];
        const items: FixedArray<long> = [0, 0, 0];
        const s = 2;
        const d = 8;
        const result = toSpliced(arr, s, d, ...items);
        const expected: FixedArray<long> = [-10, 0, 0, 0, 0];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
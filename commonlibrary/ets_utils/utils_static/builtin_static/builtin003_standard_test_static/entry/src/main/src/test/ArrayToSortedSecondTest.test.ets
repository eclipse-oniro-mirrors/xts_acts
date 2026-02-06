import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSortedSecondTest() {
  describe('ArrayToSortedSecondTest', ():void => {
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
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0100
     * @tc.name ArrayToSortedSecondTest0100
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          222.2 as float,
          999.9 as float,
          111.1 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          111.1 as float,
          222.2 as float,
          999.9 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0200
     * @tc.name ArrayToSortedSecondTest0200
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          222.2 as float,
          999.9 as float,
          111.1 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          999.9 as float,
          222.2 as float,
          111.1 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0300
     * @tc.name ArrayToSortedSecondTest0300
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -222.2 as float,
          -999.9 as float,
          -111.1 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          -999.9 as float,
          -222.2 as float,
          -111.1 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0400
     * @tc.name ArrayToSortedSecondTest0400
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -222.2 as float,
          -999.9 as float,
          -111.1 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          -111.1 as float,
          -222.2 as float,
          -999.9 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0500
     * @tc.name ArrayToSortedSecondTest0500
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2222.8 as float,
          1111.9 as float,
          -3333.7 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          -3333.7 as float,
          1111.9 as float,
          2222.8 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0600
     * @tc.name ArrayToSortedSecondTest0600
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2222.8 as float,
          1111.9 as float,
          -3333.7 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          2222.8 as float,
          1111.9 as float,
          -3333.7 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0700
     * @tc.name ArrayToSortedSecondTest0700
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2.2 as float,
          0.0 as float,
          -2.2 as float,
          0.0 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          -2.2 as float,
          0.0 as float,
          0.0 as float,
          2.2 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0800
     * @tc.name ArrayToSortedSecondTest0800
     * @tc.desc test toSorted(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2.2 as float,
          0.0 as float,
          -2.2 as float,
          0.0 as float
        ];
        const comparator = (a: float, b: float): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<float> = [
          2.2 as float,
          0.0 as float,
          0.0 as float,
          -2.2 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_0900
     * @tc.name ArrayToSortedSecondTest0900
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 4, 1];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [1, 2, 3, 4];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1000
     * @tc.name ArrayToSortedSecondTest1000
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-3, -2, -4, -1];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [-4, -3, -2, -1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1100
     * @tc.name ArrayToSortedSecondTest1100
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-3, 2, 4, -1];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [-3, -1, 2, 4];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1200
     * @tc.name ArrayToSortedSecondTest1200
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2000, 1000, 3000];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [1000, 2000, 3000];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1300
     * @tc.name ArrayToSortedSecondTest1300
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2147483647, -2147483648];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [-2147483648, 2147483647];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1400
     * @tc.name ArrayToSortedSecondTest1400
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, 99, 0, 0];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [0, 0, 99, 99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1500
     * @tc.name ArrayToSortedSecondTest1500
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, -99, 0, 0];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [-99, 0, 0, 99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1600
     * @tc.name ArrayToSortedSecondTest1600
     * @tc.desc test toSorted(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-101, -101, -101];
        const result = toSorted(arr);
        const expected: FixedArray<int> = [-101, -101, -101];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1700
     * @tc.name ArrayToSortedSecondTest1700
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [30, 10, 20];
        const comparator = (a: int, b: int): int => {
          return a - b;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [10, 20, 30];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1800
     * @tc.name ArrayToSortedSecondTest1800
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [30, 10, 20];
        const comparator = (a: int, b: int): int => {
          return b - a;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [30, 20, 10];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_1900
     * @tc.name ArrayToSortedSecondTest1900
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-30, -10, -20];
        const comparator = (a: int, b: int): int => {
          return a - b;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [-30, -20, -10];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2000
     * @tc.name ArrayToSortedSecondTest2000
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-30, -10, -20];
        const comparator = (a: int, b: int): int => {
          return b - a;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [-10, -20, -30];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2100
     * @tc.name ArrayToSortedSecondTest2100
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 2147483647, -2147483648];
        const comparator = (a: int, b: int): int => {
          return a - b;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [-2147483648, 0, 2147483647];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2200
     * @tc.name ArrayToSortedSecondTest2200
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, -10000000, 10000000];
        const comparator = (a: int, b: int): int => {
          return b - a;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [10000000, 0, -10000000];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2300
     * @tc.name ArrayToSortedSecondTest2300
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, 0, -99, 0];
        const comparator = (a: int, b: int): int => {
          return a - b;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [-99, 0, 0, 99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2400
     * @tc.name ArrayToSortedSecondTest2400
     * @tc.desc test toSorted(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, 0, -99, 0];
        const comparator = (a: int, b: int): int => {
          return b - a;
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<int> = [99, 0, 0, -99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2500
     * @tc.name ArrayToSortedSecondTest2500
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 2, 6, 7, 1];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [1, 2, 3, 6, 7];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2600
     * @tc.name ArrayToSortedSecondTest2600
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-3, -2, -6, -7, -1];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [-7, -6, -3, -2, -1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2700
     * @tc.name ArrayToSortedSecondTest2700
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, -2, 6, -7, 1];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [-7, -2, 1, 3, 6];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2800
     * @tc.name ArrayToSortedSecondTest2800
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [8, 7, 6, 5];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [5, 6, 7, 8];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_2900
     * @tc.name ArrayToSortedSecondTest2900
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5, 6, 7, 8];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [5, 6, 7, 8];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3000
     * @tc.name ArrayToSortedSecondTest3000
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [10];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3100
     * @tc.name ArrayToSortedSecondTest3100
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [0, 0, 0, 0];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3200
     * @tc.name ArrayToSortedSecondTest3200
     * @tc.desc test toSorted(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [2000, 1000, -1000];
        const result = toSorted(arr);
        const expected: FixedArray<long> = [-1000, 1000, 2000];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3300
     * @tc.name ArrayToSortedSecondTest3300
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 9, 7, 1];
        const comparator = (a: long, b: long): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [1, 3, 7, 9];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3400
     * @tc.name ArrayToSortedSecondTest3400
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 9, 7, 1];
        const comparator = (a: long, b: long): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [9, 7, 3, 1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3500
     * @tc.name ArrayToSortedSecondTest3500
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-3, -9, -7, -1];
        const comparator = (a: long, b: long): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [-9, -7, -3, -1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3600
     * @tc.name ArrayToSortedSecondTest3600
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-3, -9, -7, -1];
        const comparator = (a: long, b: long): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [-1, -3, -7, -9];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3700
     * @tc.name ArrayToSortedSecondTest3700
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-3, 9, -7, 1];
        const comparator = (a: long, b: long): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [-7, -3, 1, 9];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3800
     * @tc.name ArrayToSortedSecondTest3800
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-3, 9, -7, 1];
        const comparator = (a: long, b: long): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [9, 1, -3, -7];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_3900
     * @tc.name ArrayToSortedSecondTest3900
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [9, 8, 7];
        const comparator = (a: long, b: long): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [7, 8, 9];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4000
     * @tc.name ArrayToSortedSecondTest4000
     * @tc.desc test toSorted(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [9, 8, 7];
        const comparator = (a: long, b: long): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<long> = [9, 8, 7];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4100
     * @tc.name ArrayToSortedSecondTest4100
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          10 as short,
          90 as short,
          80 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          10 as short,
          80 as short,
          90 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4200
     * @tc.name ArrayToSortedSecondTest4200
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -10 as short,
          -90 as short,
          -80 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          -90 as short,
          -80 as short,
          -10 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4300
     * @tc.name ArrayToSortedSecondTest4300
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          999 as short,
          998 as short,
          997 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          997 as short,
          998 as short,
          999 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4400
     * @tc.name ArrayToSortedSecondTest4400
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          500 as short,
          501 as short,
          502 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          500 as short,
          501 as short,
          502 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4500
     * @tc.name ArrayToSortedSecondTest4500
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [100 as short];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [100 as short];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4600
     * @tc.name ArrayToSortedSecondTest4600
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          500 as short,
          100 as short,
          200 as short,
          100 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          100 as short,
          100 as short,
          200 as short,
          500 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4700
     * @tc.name ArrayToSortedSecondTest4700
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          32767 as short,
          -32768 as short,
          0 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          -32768 as short,
          0 as short,
          32767 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4800
     * @tc.name ArrayToSortedSecondTest4800
     * @tc.desc test toSorted(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          100 as short
        ];
        const result = toSorted(arr);
        const expected: FixedArray<short> = [
          100 as short,
          100 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_4900
     * @tc.name ArrayToSortedSecondTest4900
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          800 as short,
          300 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          100 as short,
          300 as short,
          800 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5000
     * @tc.name ArrayToSortedSecondTest5000
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          800 as short,
          300 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          800 as short,
          300 as short,
          100 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5100
     * @tc.name ArrayToSortedSecondTest5100
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -100 as short,
          -800 as short,
          -300 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          -800 as short,
          -300 as short,
          -100 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5200
     * @tc.name ArrayToSortedSecondTest5200
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -100 as short,
          -800 as short,
          -300 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          -100 as short,
          -300 as short,
          -800 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5300
     * @tc.name ArrayToSortedSecondTest5300
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          90 as short,
          90 as short,
          90 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          90 as short,
          90 as short,
          90 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5400
     * @tc.name ArrayToSortedSecondTest5400
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          99 as short,
          98 as short,
          97 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          97 as short,
          98 as short,
          99 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5500
     * @tc.name ArrayToSortedSecondTest5500
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          97 as short,
          98 as short,
          99 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          99 as short,
          98 as short,
          97 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_SECOND_TEST_5600
     * @tc.name ArrayToSortedSecondTest5600
     * @tc.desc test toSorted(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedSecondTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          0 as short,
          1000 as short
        ];
        const comparator = (a: short, b: short): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<short> = [
          1000 as short,
          0 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
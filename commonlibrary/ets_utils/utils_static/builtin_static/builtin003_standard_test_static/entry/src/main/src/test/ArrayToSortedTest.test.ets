import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToSortedTest() {
  describe('ArrayToSortedTest', ():void => {
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
     * @tc.number ARRAY_TO_SORTED_TEST_0100
     * @tc.name ArrayToSortedTest0100
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [false, true, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0200
     * @tc.name ArrayToSortedTest0200
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0300
     * @tc.name ArrayToSortedTest0300
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [false, false, false, false];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0400
     * @tc.name ArrayToSortedTest0400
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [true];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0500
     * @tc.name ArrayToSortedTest0500
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [false];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0600
     * @tc.name ArrayToSortedTest0600
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = toSorted(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0700
     * @tc.name ArrayToSortedTest0700
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false, false];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [false, false, false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0800
     * @tc.name ArrayToSortedTest0800
     * @tc.desc test toSorted(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const result = toSorted(arr);
        const expected: FixedArray<boolean> = [false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_0900
     * @tc.name ArrayToSortedTest0900
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const comparator = (a: boolean, b: boolean): int => {
          return (a ? 1 : 0) - (b ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1000
     * @tc.name ArrayToSortedTest1000
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false];
        const comparator = (a: boolean, b: boolean): int => {
          return (b ? 1 : 0) - (a ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [true, false];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1100
     * @tc.name ArrayToSortedTest1100
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, true, false];
        const comparator = (a: boolean, b: boolean): int => {
          return (a ? 1 : 0) - (b ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [false, false, true, true, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1200
     * @tc.name ArrayToSortedTest1200
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, true, false];
        const comparator = (a: boolean, b: boolean): int => {
          return (b ? 1 : 0) - (a ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [true, true, true, false, false];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1300
     * @tc.name ArrayToSortedTest1300
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const comparator = (a: boolean, b: boolean): int => {
          return (a ? 1 : 0) - (b ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [true];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1400
     * @tc.name ArrayToSortedTest1400
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const comparator = (a: boolean, b: boolean): int => {
          return (b ? 1 : 0) - (a ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [true];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1500
     * @tc.name ArrayToSortedTest1500
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const comparator = (a: boolean, b: boolean): int => {
          return (a ? 1 : 0) - (b ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [false];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1600
     * @tc.name ArrayToSortedTest1600
     * @tc.desc test toSorted(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const comparator = (a: boolean, b: boolean): int => {
          return (b ? 1 : 0) - (a ? 1 : 0);
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<boolean> = [false];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1700
     * @tc.name ArrayToSortedTest1700
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 20, 40, 10];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [5, 10, 20, 40];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1800
     * @tc.name ArrayToSortedTest1800
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-5, -20, -40, -10];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [-40, -20, -10, -5];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_1900
     * @tc.name ArrayToSortedTest1900
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, -20, 40, -10];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [-20, -10, 5, 40];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2000
     * @tc.name ArrayToSortedTest2000
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-5, 20, -40, 10];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [-40, -5, 10, 20];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2100
     * @tc.name ArrayToSortedTest2100
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [100, 0];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [0, 100];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2200
     * @tc.name ArrayToSortedTest2200
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = toSorted(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2300
     * @tc.name ArrayToSortedTest2300
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127, -128, 54, -45];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [-128, -45, 54, 127];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2400
     * @tc.name ArrayToSortedTest2400
     * @tc.desc test toSorted(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [66, 0, -76];
        const result = toSorted(arr);
        const expected: FixedArray<byte> = [-76, 0, 66];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2500
     * @tc.name ArrayToSortedTest2500
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [20, 30, 10];
        const comparator = (a: byte, b: byte): int => {
          return (a - b).toInt()
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [10, 20, 30];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2600
     * @tc.name ArrayToSortedTest2600
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [20, 30, 10];
        const comparator = (a: byte, b: byte): int => {
          return (b - a).toInt()
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [30, 20, 10];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2700
     * @tc.name ArrayToSortedTest2700
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-20, -30, -10, -40];
        const comparator = (a: byte, b: byte): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [-40, -30, -20, -10];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2800
     * @tc.name ArrayToSortedTest2800
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-20, -30, -10, -40];
        const comparator = (a: byte, b: byte): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [-10, -20, -30, -40];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_2900
     * @tc.name ArrayToSortedTest2900
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-20, 30, -10, -40, 50];
        const comparator = (a: byte, b: byte): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [-40, -20, -10, 30, 50];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3000
     * @tc.name ArrayToSortedTest3000
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-20, 30, -10, -40, 50];
        const comparator = (a: byte, b: byte): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [50, 30, -10, -20, -40];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3100
     * @tc.name ArrayToSortedTest3100
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [99, 99, 99];
        const comparator = (a: byte, b: byte): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [99, 99, 99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3200
     * @tc.name ArrayToSortedTest3200
     * @tc.desc test toSorted(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, -100, 100];
        const comparator = (a: byte, b: byte): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<byte> = [100, 0, -100];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3300
     * @tc.name ArrayToSortedTest3300
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x42.toChar(), 0x41.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3400
     * @tc.name ArrayToSortedTest3400
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x41.toChar(), 0x42.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3500
     * @tc.name ArrayToSortedTest3500
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x30.toChar(), 0x32.toChar(), 0x31.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x36.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3600
     * @tc.name ArrayToSortedTest3600
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x32.toChar(), 0x36.toChar(), 0x32.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x32.toChar(), 0x32.toChar(), 0x36.toChar(), 0x36.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3700
     * @tc.name ArrayToSortedTest3700
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x38.toChar(), 0x38.toChar(), 0x38.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x38.toChar(), 0x38.toChar(), 0x38.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_3900
     * @tc.name ArrayToSortedTest3900
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x55.toChar(), 0x4F.toChar(), 0x54.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x4F.toChar(), 0x54.toChar(), 0x55.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4000
     * @tc.name ArrayToSortedTest4000
     * @tc.desc test toSorted(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6C.toChar(), 0x69.toChar(), 0x7A.toChar()];
        const result = toSorted(arr);
        const expected: FixedArray<char> = [0x69.toChar(), 0x6C.toChar(), 0x7A.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4100
     * @tc.name ArrayToSortedTest4100
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x42.toChar(), 0x41.toChar()];
        const comparator = (a: char, b: char): int => {
          return a.toInt() - b.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4200
     * @tc.name ArrayToSortedTest4200
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x41.toChar(),  0x42.toChar()];
        const comparator = (a: char, b: char): int => {
          return b.toInt() - a.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x43.toChar(), 0x42.toChar(), 0x41.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4300
     * @tc.name ArrayToSortedTest4300
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x36.toChar(), 0x32.toChar(), 0x31.toChar()];
        const comparator = (a: char, b: char): int => {
          return a.toInt() - b.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x36.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4400
     * @tc.name ArrayToSortedTest4400
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x36.toChar(), 0x32.toChar(), 0x31.toChar()];
        const comparator = (a: char, b: char): int => {
          return b.toInt() - a.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x36.toChar(), 0x32.toChar(), 0x31.toChar(), 0x30.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4500
     * @tc.name ArrayToSortedTest4500
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x36.toChar(), 0x30.toChar(), 0x36.toChar()];
        const comparator = (a: char, b: char): int => {
          return a.toInt() - b.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x30.toChar(), 0x36.toChar(), 0x36.toChar(), 0x36.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4600
     * @tc.name ArrayToSortedTest4600
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x36.toChar(), 0x30.toChar(), 0x36.toChar()];
        const comparator = (a: char, b: char): int => {
          return b.toInt() - a.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x36.toChar(), 0x36.toChar(), 0x36.toChar(), 0x30.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4700
     * @tc.name ArrayToSortedTest4700
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x55.toChar(), 0x4F.toChar(), 0x54.toChar()];
        const comparator = (a: char, b: char): int => {
          return a.toInt() - b.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x4F.toChar(), 0x54.toChar(), 0x55.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4800
     * @tc.name ArrayToSortedTest4800
     * @tc.desc test toSorted(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x55.toChar(), 0x4F.toChar(), 0x54.toChar()];
        const comparator = (a: char, b: char): int => {
          return b.toInt() - a.toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<char> = [0x55.toChar(), 0x54.toChar(), 0x4F.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_4900
     * @tc.name ArrayToSortedTest4900
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [66.6, 33.3, 88.8];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [33.3, 66.6, 88.8];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5000
     * @tc.name ArrayToSortedTest5000
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-66.6, -33.3, -88.8];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-88.8, -66.6, -33.3];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5100
     * @tc.name ArrayToSortedTest5100
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-66.6, 33.3, -88.8, 22.2];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-88.8, -66.6, 22.2, 33.3];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5200
     * @tc.name ArrayToSortedTest5200
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 1.1, -1.1];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-1.1, 0.0, 1.1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5300
     * @tc.name ArrayToSortedTest5300
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, 8.8, -1.1, 8.8];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-1.1, -1.1, 8.8, 8.8];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5400
     * @tc.name ArrayToSortedTest5400
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2222.33, 1111.22];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [1111.22, 2222.33];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5500
     * @tc.name ArrayToSortedTest5500
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1111.22, -2222.33];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-2222.33, -1111.22];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5600
     * @tc.name ArrayToSortedTest5600
     * @tc.desc test toSorted(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, -1111.1, -1111.1];
        const result = toSorted(arr);
        const expected: FixedArray<double> = [-1111.1, -1111.1, 0.0, 0.0];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5700
     * @tc.name ArrayToSortedTest5700
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [222.22, 333.33, 111.11];
        const comparator = (a: double, b: double): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [111.11, 222.22, 333.33];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5800
     * @tc.name ArrayToSortedTest5800
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [222.22, 333.33, 111.11];
        const comparator = (a: double, b: double): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [333.33, 222.22, 111.11];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_5900
     * @tc.name ArrayToSortedTest5900
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-222.22, -333.33, -111.11];
        const comparator = (a: double, b: double): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [-333.33, -222.22, -111.11];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6000
     * @tc.name ArrayToSortedTest6000
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-222.22, -333.33, -111.11];
        const comparator = (a: double, b: double): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [-111.11, -222.22, -333.33];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6100
     * @tc.name ArrayToSortedTest6100
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-222.22, 333.33, -111.11];
        const comparator = (a: double, b: double): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [-222.22, -111.11, 333.33];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6200
     * @tc.name ArrayToSortedTest6200
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-222.22, 333.33, -111.11];
        const comparator = (a: double, b: double): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [333.33, -111.11, -222.22];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6300
     * @tc.name ArrayToSortedTest6300
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 0.0, -1.1, 0.0];
        const comparator = (a: double, b: double): int => {
          return (a - b).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [-1.1, 0.0, 0.0, 1.1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6400
     * @tc.name ArrayToSortedTest6400
     * @tc.desc test toSorted(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 0.0, -1.1, 0.0];
        const comparator = (a: double, b: double): int => {
          return (b - a).toInt();
        };
        const result = toSorted(arr, comparator);
        const expected: FixedArray<double> = [1.1, 0.0, 0.0, -1.1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6500
     * @tc.name ArrayToSortedTest6500
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          123.12 as float,
          789.78 as float,
          456.45 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          123.12 as float,
          456.45 as float,
          789.78 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6600
     * @tc.name ArrayToSortedTest6600
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -123.12 as float,
          -789.78 as float,
          -456.45 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          -789.78 as float,
          -456.45 as float,
          -123.12 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6700
     * @tc.name ArrayToSortedTest6700
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          123.12 as float,
          -789.78 as float,
          456.45 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          -789.78 as float,
          123.12 as float,
          456.45 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6800
     * @tc.name ArrayToSortedTest6800
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          2000.2 as float,
          1000.1 as float,
          3000.3 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          1000.1 as float,
          2000.2 as float,
          3000.3 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_6900
     * @tc.name ArrayToSortedTest6900
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -2000.2 as float,
          -1000.1 as float,
          -3000.3 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          -3000.3 as float,
          -2000.2 as float,
          -1000.1 as float,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_7000
     * @tc.name ArrayToSortedTest7000
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          0.0 as float,
          -1000.1 as float,
          1000.1 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          -1000.1 as float,
          0.0 as float,
          1000.1 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_7100
     * @tc.name ArrayToSortedTest7100
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          99.99 as float,
          99.99 as float,
          99.99 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          99.99 as float,
          99.99 as float,
          99.99 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_SORTED_TEST_7200
     * @tc.name ArrayToSortedTest7200
     * @tc.desc test toSorted(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToSortedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToSortedTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          99.9 as float,
          0.0 as float,
          99.9 as float
        ];
        const result = toSorted(arr);
        const expected: FixedArray<float> = [
          0.0 as float,
          99.9 as float,
          99.9 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
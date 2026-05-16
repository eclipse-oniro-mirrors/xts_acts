import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayUpperBoundSearchTest() {
  describe('ArrayUpperBoundSearchTest', ():void => {
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0100
     * @tc.name ArrayUpperBoundSearchTest0100
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true];
        const result = upperBoundSearch(arr, true);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0200
     * @tc.name ArrayUpperBoundSearchTest0200
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true];
        const result = upperBoundSearch(arr, false);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0300
     * @tc.name ArrayUpperBoundSearchTest0300
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = upperBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0400
     * @tc.name ArrayUpperBoundSearchTest0400
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = upperBoundSearch(arr, false);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0500
     * @tc.name ArrayUpperBoundSearchTest0500
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true, true];
        const result = upperBoundSearch(arr, true);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0600
     * @tc.name ArrayUpperBoundSearchTest0600
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true, true];
        const result = upperBoundSearch(arr, false);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0700
     * @tc.name ArrayUpperBoundSearchTest0700
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = upperBoundSearch(arr, true);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0800
     * @tc.name ArrayUpperBoundSearchTest0800
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = upperBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_0900
     * @tc.name ArrayUpperBoundSearchTest0900
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, true, true];
        const result = upperBoundSearch(arr, false, 1, 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1000
     * @tc.name ArrayUpperBoundSearchTest1000
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [false, false, false, true, true];
          upperBoundSearch(arr, false, 2, 6);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1100
     * @tc.name ArrayUpperBoundSearchTest1100
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, true, true];
        const result = upperBoundSearch(arr, false, 0, 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1200
     * @tc.name ArrayUpperBoundSearchTest1200
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, true, true];
        const result = upperBoundSearch(arr, false, 0, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1300
     * @tc.name ArrayUpperBoundSearchTest1300
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = upperBoundSearch(arr, false, 1, 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1400
     * @tc.name ArrayUpperBoundSearchTest1400
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = upperBoundSearch(arr, true, 2, 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1500
     * @tc.name ArrayUpperBoundSearchTest1500
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, true, true, true];
        const result = upperBoundSearch(arr, true, 2, 5);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1600
     * @tc.name ArrayUpperBoundSearchTest1600
     * @tc.desc test upperBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, true, true, true];
        const result = upperBoundSearch(arr, false, 2, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1700
     * @tc.name ArrayUpperBoundSearchTest1700
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 4, 5, 6];
        const result = upperBoundSearch(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1800
     * @tc.name ArrayUpperBoundSearchTest1800
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 4, 5, 6];
        const result = upperBoundSearch(arr, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_1900
     * @tc.name ArrayUpperBoundSearchTest1900
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 4, 5, 6];
        const result = upperBoundSearch(arr, 7);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2000
     * @tc.name ArrayUpperBoundSearchTest2000
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-16, -15, -11, -9, -7];
        const result = upperBoundSearch(arr, -20);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2100
     * @tc.name ArrayUpperBoundSearchTest2100
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-16, -15, -11, -9, -7];
        const result = upperBoundSearch(arr, -3);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2200
     * @tc.name ArrayUpperBoundSearchTest2200
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-16, -15, -11, -9, -7];
        const result = upperBoundSearch(arr, -10);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2300
     * @tc.name ArrayUpperBoundSearchTest2300
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 0, 127];
        const result = upperBoundSearch(arr, -60);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2400
     * @tc.name ArrayUpperBoundSearchTest2400
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 0, 127];
        const result = upperBoundSearch(arr, 60);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2500
     * @tc.name ArrayUpperBoundSearchTest2500
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = upperBoundSearch(arr, 35, 1, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2600
     * @tc.name ArrayUpperBoundSearchTest2600
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = upperBoundSearch(arr, 35, 3, 5);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2700
     * @tc.name ArrayUpperBoundSearchTest2700
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 20, 20, 60];
        const result = upperBoundSearch(arr, 20, 1, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2800
     * @tc.name ArrayUpperBoundSearchTest2800
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 20, 20, 60];
        const result = upperBoundSearch(arr, 60, 1, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_2900
     * @tc.name ArrayUpperBoundSearchTest2900
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = upperBoundSearch(arr, 45, 3, 5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3000
     * @tc.name ArrayUpperBoundSearchTest3000
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = upperBoundSearch(arr, 15, 1, 5);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3100
     * @tc.name ArrayUpperBoundSearchTest3100
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
          upperBoundSearch(arr, 22, 2, 10);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3200
     * @tc.name ArrayUpperBoundSearchTest3200
     * @tc.desc test upperBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
          upperBoundSearch(arr, 36, 5, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3300
     * @tc.name ArrayUpperBoundSearchTest3300
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x34.toChar()];
        const result = upperBoundSearch(arr, 0X31.toChar());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3400
     * @tc.name ArrayUpperBoundSearchTest3400
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x34.toChar()];
        const result = upperBoundSearch(arr, 0x35.toChar());
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3500
     * @tc.name ArrayUpperBoundSearchTest3500
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x34.toChar()];
        const result = upperBoundSearch(arr, 0x34.toChar());
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3600
     * @tc.name ArrayUpperBoundSearchTest3600
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x34.toChar()];
        const result = upperBoundSearch(arr, 0x30.toChar());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3700
     * @tc.name ArrayUpperBoundSearchTest3700
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x34.toChar(), 0x35.toChar()];
        const result = upperBoundSearch(arr, 0x30.toChar());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3800
     * @tc.name ArrayUpperBoundSearchTest3800
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x42.toChar(), 0x43.toChar(), 0x45.toChar(), 0x46.toChar(), 0x47.toChar()];
        const result = upperBoundSearch(arr, 0x44.toChar());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_3900
     * @tc.name ArrayUpperBoundSearchTest3900
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x42.toChar(), 0x43.toChar(), 0x45.toChar(), 0x46.toChar(), 0x47.toChar()];
        const result = upperBoundSearch(arr, 0x41.toChar());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4000
     * @tc.name ArrayUpperBoundSearchTest4000
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x42.toChar(), 0x43.toChar(), 0x45.toChar(), 0x46.toChar(), 0x47.toChar()];
        const result = upperBoundSearch(arr, 0x49.toChar());
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4100
     * @tc.name ArrayUpperBoundSearchTest4100
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x34.toChar(), 0x37.toChar(), 0x38.toChar()];
        const result = upperBoundSearch(arr, 0x31.toChar(), 1, 3);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4200
     * @tc.name ArrayUpperBoundSearchTest4200
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x34.toChar(), 0x37.toChar(), 0x38.toChar()];
        const result = upperBoundSearch(arr, 0x36.toChar(), 1, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4300
     * @tc.name ArrayUpperBoundSearchTest4300
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x34.toChar(), 0x37.toChar(), 0x38.toChar()];
        const result = upperBoundSearch(arr, 0x36.toChar(), 1, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4400
     * @tc.name ArrayUpperBoundSearchTest4400
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x33.toChar(), 0x34.toChar(), 0x37.toChar(), 0x38.toChar()];
        const result = upperBoundSearch(arr, 0x39.toChar(), 1, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4500
     * @tc.name ArrayUpperBoundSearchTest4500
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar(), 0x77.toChar(), 0x78.toChar(), 0x79.toChar(), 0x7A.toChar()];
        const result = upperBoundSearch(arr, 0x75.toChar(), 2, 6);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4600
     * @tc.name ArrayUpperBoundSearchTest4600
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar(), 0x77.toChar(), 0x78.toChar(), 0x79.toChar(), 0x7A.toChar()];
        const result = upperBoundSearch(arr, 0x75.toChar(), 2, 7);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4700
     * @tc.name ArrayUpperBoundSearchTest4700
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar(), 0x77.toChar(), 0x78.toChar(), 0x79.toChar(), 0x7A.toChar()];
        const result = upperBoundSearch(arr, 0x6B.toChar(), 1, 5);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4800
     * @tc.name ArrayUpperBoundSearchTest4800
     * @tc.desc test upperBoundSearch(arr: FixedArray<char>, key: char, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar(), 0x77.toChar(), 0x78.toChar(), 0x79.toChar(), 0x7A.toChar()];
        const result = upperBoundSearch(arr, 0x7B.toChar(), 1, 5);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_4900
     * @tc.name ArrayUpperBoundSearchTest4900
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = upperBoundSearch(arr, 2.5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5000
     * @tc.name ArrayUpperBoundSearchTest5000
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = upperBoundSearch(arr, 4.5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5100
     * @tc.name ArrayUpperBoundSearchTest5100
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = upperBoundSearch(arr, 1.0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5200
     * @tc.name ArrayUpperBoundSearchTest5200
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = upperBoundSearch(arr, 6.6);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5300
     * @tc.name ArrayUpperBoundSearchTest5300
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-0.9, -0.8, -0.5, -0.3, -0.2, -0.1];
        const result = upperBoundSearch(arr, -0.6);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5400
     * @tc.name ArrayUpperBoundSearchTest5400
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-0.9, -0.8, -0.5, -0.3, -0.2, -0.1];
        const result = upperBoundSearch(arr, -0.4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5500
     * @tc.name ArrayUpperBoundSearchTest5500
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-0.9, -0.8, -0.5, -0.3, -0.2, -0.1];
        const result = upperBoundSearch(arr, -1.0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5600
     * @tc.name ArrayUpperBoundSearchTest5600
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-0.9, -0.8, -0.5, -0.3, -0.2, -0.1];
        const result = upperBoundSearch(arr, -0.2);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5700
     * @tc.name ArrayUpperBoundSearchTest5700
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6];
        const result = upperBoundSearch(arr, 2.5, 1, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5800
     * @tc.name ArrayUpperBoundSearchTest5800
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6];
        const result = upperBoundSearch(arr, 3.5, 3, 6);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_5900
     * @tc.name ArrayUpperBoundSearchTest5900
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6];
        const result = upperBoundSearch(arr, 3.5, 0, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6000
     * @tc.name ArrayUpperBoundSearchTest6000
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-6.6, -5.5, -4.4, -3.3, -2.2, -1.1];
        const result = upperBoundSearch(arr, -1.5, 1, 5);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6100
     * @tc.name ArrayUpperBoundSearchTest6100
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-6.6, -5.5, -4.4, -3.3, -2.2, -1.1];
        const result = upperBoundSearch(arr, -1.5, 1, 6);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6200
     * @tc.name ArrayUpperBoundSearchTest6200
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-6.6, -5.5, -4.4, -3.3, -2.2, -1.1];
        const result = upperBoundSearch(arr, -3.3, 1, 5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6300
     * @tc.name ArrayUpperBoundSearchTest6300
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [10.0, 20.0, 30.0, 40.0];
          upperBoundSearch(arr, 15.0, 3, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6400
     * @tc.name ArrayUpperBoundSearchTest6400
     * @tc.desc test upperBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [10.0, 20.0, 30.0, 40.0];
          upperBoundSearch(arr, 15.0, 2, 8);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6500
     * @tc.name ArrayUpperBoundSearchTest6500
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 3.3 as float);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6600
     * @tc.name ArrayUpperBoundSearchTest6600
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 1.0 as float);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6700
     * @tc.name ArrayUpperBoundSearchTest6700
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 10.0 as float);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6800
     * @tc.name ArrayUpperBoundSearchTest6800
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 5.5 as float);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_6900
     * @tc.name ArrayUpperBoundSearchTest6900
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-0.9 as float, -0.8 as float, -0.5 as float, -0.3 as float, -0.2 as float, -0.1 as float];
        const result = upperBoundSearch(arr, -9.0 as float);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7000
     * @tc.name ArrayUpperBoundSearchTest7000
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-0.9 as float, -0.8 as float, -0.5 as float, -0.3 as float, -0.2 as float, -0.1 as float];
        const result = upperBoundSearch(arr, -0.6 as float);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7100
     * @tc.name ArrayUpperBoundSearchTest7100
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-0.9 as float, -0.8 as float, -0.5 as float, -0.3 as float, -0.2 as float, -0.1 as float];
        const result = upperBoundSearch(arr, 10.0 as float);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7200
     * @tc.name ArrayUpperBoundSearchTest7200
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-0.9 as float, -0.8 as float, -0.5 as float, -0.3 as float, -0.2 as float, -0.1 as float];
        const result = upperBoundSearch(arr, -0.1 as float);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7300
     * @tc.name ArrayUpperBoundSearchTest7300
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 4.4 as float, 1, 5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7400
     * @tc.name ArrayUpperBoundSearchTest7400
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 1.5 as float, 2, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7500
     * @tc.name ArrayUpperBoundSearchTest7500
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 5.0 as float, 0, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7600
     * @tc.name ArrayUpperBoundSearchTest7600
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const result = upperBoundSearch(arr, 5.0 as float, 0, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7700
     * @tc.name ArrayUpperBoundSearchTest7700
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-9.9 as float, -7.7 as float, -5.5 as float, -3.3 as float];
        const result = upperBoundSearch(arr, 3.0 as float, 1, 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7800
     * @tc.name ArrayUpperBoundSearchTest7800
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [10.0 as float, 15.0 as float, 20.0 as float, 25.0 as float];
          upperBoundSearch(arr, 17.5 as float, 1, 10);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_7900
     * @tc.name ArrayUpperBoundSearchTest7900
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest7900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [10.0 as float, 15.0 as float, 20.0 as float, 25.0 as float];
          upperBoundSearch(arr, 17.5 as float, 4, 3);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_TEST_8000
     * @tc.name ArrayUpperBoundSearchTest8000
     * @tc.desc test upperBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchTest8000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [10.0 as float, 15.0 as float, 20.0 as float, 25.0 as float];
          upperBoundSearch(arr, 17.5 as float, -1, 3);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('upperBoundSearch: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
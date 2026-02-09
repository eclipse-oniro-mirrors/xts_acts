import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayUpperBoundSearchSecondTest() {
  describe('ArrayUpperBoundSearchSecondTest', ():void => {
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0100
     * @tc.name ArrayUpperBoundSearchSecondTest0100
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 5, 6, 7, 8, 9];
        const result = upperBoundSearch(arr, 3);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0200
     * @tc.name ArrayUpperBoundSearchSecondTest0200
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 5, 6, 7, 8, 9];
        const result = upperBoundSearch(arr, 1);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0300
     * @tc.name ArrayUpperBoundSearchSecondTest0300
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 5, 6, 7, 8, 9];
        const result = upperBoundSearch(arr, 12);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0400
     * @tc.name ArrayUpperBoundSearchSecondTest0400
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-10, -9, -8, -5, -3, -1];
        const result = upperBoundSearch(arr, -3);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0500
     * @tc.name ArrayUpperBoundSearchSecondTest0500
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-10, -9, -8, -5, -3, -1];
        const result = upperBoundSearch(arr, -11);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0600
     * @tc.name ArrayUpperBoundSearchSecondTest0600
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-10, -9, -8, -5, -3, -1];
        const result = upperBoundSearch(arr, -6);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0700
     * @tc.name ArrayUpperBoundSearchSecondTest0700
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-10, -9, -8, -5, -3, -1];
        const result = upperBoundSearch(arr, 0);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0800
     * @tc.name ArrayUpperBoundSearchSecondTest0800
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-10, -8, -5, -3, -1, 1];
        const result = upperBoundSearch(arr, 0);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_0900
     * @tc.name ArrayUpperBoundSearchSecondTest0900
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 4, 5, 7, 8];
        const result = upperBoundSearch(arr, 4, 1, 5);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1000
     * @tc.name ArrayUpperBoundSearchSecondTest1000
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 4, 5, 7, 8];
        const result = upperBoundSearch(arr, 6, 1, 5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1100
     * @tc.name ArrayUpperBoundSearchSecondTest1100
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 4, 5, 7, 8];
        const result = upperBoundSearch(arr, 1, 1, 3);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1200
     * @tc.name ArrayUpperBoundSearchSecondTest1200
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 4, 5, 7, 8];
        const result = upperBoundSearch(arr, 9, 2, 6);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1300
     * @tc.name ArrayUpperBoundSearchSecondTest1300
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 4, 5, 7, 8];
        const result = upperBoundSearch(arr, 7, 1, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1400
     * @tc.name ArrayUpperBoundSearchSecondTest1400
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3, 7, 8, 9];
          upperBoundSearch(arr, 6, 2, 10);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1500
     * @tc.name ArrayUpperBoundSearchSecondTest1500
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3, 7, 8, 9];
          upperBoundSearch(arr, 6, 6, 4);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1600
     * @tc.name ArrayUpperBoundSearchSecondTest1600
     * @tc.desc test upperBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3, 7, 8, 9];
          upperBoundSearch(arr, 6, -3, 3);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1700
     * @tc.name ArrayUpperBoundSearchSecondTest1700
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 400, 500, 900];
        const result = upperBoundSearch(arr, 600);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1800
     * @tc.name ArrayUpperBoundSearchSecondTest1800
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 400, 500, 900];
        const result = upperBoundSearch(arr, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_1900
     * @tc.name ArrayUpperBoundSearchSecondTest1900
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 400, 500, 900];
        const result = upperBoundSearch(arr, 1000);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2000
     * @tc.name ArrayUpperBoundSearchSecondTest2000
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = upperBoundSearch(arr, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2100
     * @tc.name ArrayUpperBoundSearchSecondTest2100
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        const result = upperBoundSearch(arr, 100);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2200
     * @tc.name ArrayUpperBoundSearchSecondTest2200
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        const result = upperBoundSearch(arr, 200);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2300
     * @tc.name ArrayUpperBoundSearchSecondTest2300
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        const result = upperBoundSearch(arr, 50);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2400
     * @tc.name ArrayUpperBoundSearchSecondTest2400
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 100, 100, 200, 200, 500, 500, 500];
        const result = upperBoundSearch(arr, 200);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2500
     * @tc.name ArrayUpperBoundSearchSecondTest2500
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 600, 800];
        const result = upperBoundSearch(arr, 500);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2600
     * @tc.name ArrayUpperBoundSearchSecondTest2600
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 600, 800];
        const result = upperBoundSearch(arr, 900);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2700
     * @tc.name ArrayUpperBoundSearchSecondTest2700
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 600, 800];
        const result = upperBoundSearch(arr, 50);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2800
     * @tc.name ArrayUpperBoundSearchSecondTest2800
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 10, 20, 40, 60, 60];
        const result = upperBoundSearch(arr, 50);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_2900
     * @tc.name ArrayUpperBoundSearchSecondTest2900
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 10, 20, 40, 60, 60];
        const result = upperBoundSearch(arr, 10);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3000
     * @tc.name ArrayUpperBoundSearchSecondTest3000
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10];
        const result = upperBoundSearch(arr, 10);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3100
     * @tc.name ArrayUpperBoundSearchSecondTest3100
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [10, 20, 50, 60, 70, 70, 80];
          upperBoundSearch(arr, 50, 7, 9);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3200
     * @tc.name ArrayUpperBoundSearchSecondTest3200
     * @tc.desc test upperBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [10, 20, 50, 60, 70, 70, 80];
          upperBoundSearch(arr, 50, -1, 3);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3300
     * @tc.name ArrayUpperBoundSearchSecondTest3300
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 60 as short, 70 as short];
        const result = upperBoundSearch(arr, 60 as short);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3400
     * @tc.name ArrayUpperBoundSearchSecondTest3400
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 60 as short, 70 as short];
        const result = upperBoundSearch(arr, 80 as short);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3500
     * @tc.name ArrayUpperBoundSearchSecondTest3500
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 60 as short, 70 as short];
        const result = upperBoundSearch(arr, 0 as short);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3600
     * @tc.name ArrayUpperBoundSearchSecondTest3600
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = upperBoundSearch(arr, 0 as short);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3700
     * @tc.name ArrayUpperBoundSearchSecondTest3700
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short];
        const result = upperBoundSearch(arr, 10 as short);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3800
     * @tc.name ArrayUpperBoundSearchSecondTest3800
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short];
        const result = upperBoundSearch(arr, 15 as short);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_3900
     * @tc.name ArrayUpperBoundSearchSecondTest3900
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short];
        const result = upperBoundSearch(arr, 0 as short);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4000
     * @tc.name ArrayUpperBoundSearchSecondTest4000
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 20 as short, 30 as short, 30 as short];
        const result = upperBoundSearch(arr, 20 as short);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4100
     * @tc.name ArrayUpperBoundSearchSecondTest4100
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 50 as short, 90 as short];
        const result = upperBoundSearch(arr, 20 as short, 2, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4200
     * @tc.name ArrayUpperBoundSearchSecondTest4200
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 50 as short, 90 as short];
        const result = upperBoundSearch(arr, 35 as short, 1, 5);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4300
     * @tc.name ArrayUpperBoundSearchSecondTest4300
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 50 as short, 90 as short];
        const result = upperBoundSearch(arr, 5 as short, 2, 4);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4400
     * @tc.name ArrayUpperBoundSearchSecondTest4400
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 50 as short, 90 as short];
        const result = upperBoundSearch(arr, 85 as short, 0, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4500
     * @tc.name ArrayUpperBoundSearchSecondTest4500
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 50 as short, 90 as short];
        const result = upperBoundSearch(arr, 50 as short, 3, 4);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4600
     * @tc.name ArrayUpperBoundSearchSecondTest4600
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 10 as short, 10 as short, 10 as short, 30 as short];
        const result = upperBoundSearch(arr, 20 as short, 1, 5);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4700
     * @tc.name ArrayUpperBoundSearchSecondTest4700
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short];
          upperBoundSearch(arr, 45 as short, -1, 6);
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
     * @tc.number ARRAY_UPPER_BOUND_SEARCH_SECOND_TEST_4800
     * @tc.name ArrayUpperBoundSearchSecondTest4800
     * @tc.desc test upperBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayUpperBoundSearchSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayUpperBoundSearchSecondTest4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short];
          upperBoundSearch(arr, 45 as short, 5, 4);
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
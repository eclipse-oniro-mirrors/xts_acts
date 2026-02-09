import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function Array_With_Second_Test_static() {
  describe('Array_With_Second_Test_static', ():void => {
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0100
     * @tc.name Array_With_Second_Test_static_0100
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const index = 1;
        const result = with(arr, index, -2);
        const expected: FixedArray<float> = [1.1 as float, -2.0 as float, 3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0200
     * @tc.name Array_With_Second_Test_static_0200
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const index = -3;
        const result = with(arr, index, 1);
        const expected: FixedArray<float> = [1.0 as float, 2.2 as float, 3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0300
     * @tc.name Array_With_Second_Test_static_0300
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const index = -1;
        const result = with(arr, index, 5);
        const expected: FixedArray<float> = [1.1 as float, 2.2 as float, 5.0 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0400
     * @tc.name Array_With_Second_Test_static_0400
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const index = -1;
        const result = with(arr, index, 33);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float, 33.0 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0500
     * @tc.name Array_With_Second_Test_static_0500
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const index = 0;
        const result = with(arr, index, 11);
        const expected: FixedArray<float> = [11.0 as float, -2.2 as float, -3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0600
     * @tc.name Array_With_Second_Test_static_0600
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [100.0 as float, 90.0 as float, 80.0 as float, 70.0 as float];
        const index = 0;
        const result = with(arr, index, 60);
        const expected: FixedArray<float> = [60.0 as float, 90.0 as float, 80.0 as float, 70.0 as float];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0700
     * @tc.name Array_With_Second_Test_static_0700
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [1.1 as float, 11.1 as float, 111.1 as float];
          const index = 3;
          with(arr, index, 1);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0800
     * @tc.name Array_With_Second_Test_static_0800
     * @tc.desc test with(self: FixedArray<float>, index: number, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [1.1 as float, 11.1 as float, 111.1 as float];
          const index = 6;
          with(arr, index, 0);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_0900
     * @tc.name Array_With_Second_Test_static_0900
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index: int = 2;
        const result = with(arr, index, 10);
        const expected: FixedArray<int> = [1, 2, 10, 4, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1000
     * @tc.name Array_With_Second_Test_static_1000
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index: int = -5;
        const result = with(arr, index, 0);
        const expected: FixedArray<int> = [0, 2, 3, 4, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1100
     * @tc.name Array_With_Second_Test_static_1100
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index: int = -2;
        const result = with(arr, index, 6);
        const expected: FixedArray<int> = [1, 2, 3, 6, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1200
     * @tc.name Array_With_Second_Test_static_1200
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [100];
        const index: int = 0;
        const result = with(arr, index, 1);
        const expected: FixedArray<int> = [1];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1300
     * @tc.name Array_With_Second_Test_static_1300
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 5, 6, 3, -2];
        const index: int = 1;
        const result = with(arr, index, -7);
        const expected: FixedArray<int> = [-1, -7, 6, 3, -2];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1400
     * @tc.name Array_With_Second_Test_static_1400
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 5, 6, 3, -2];
        const index: int = -1;
        const result = with(arr, index, 0);
        const expected: FixedArray<int> = [-1, 5, 6, 3, 0];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1500
     * @tc.name Array_With_Second_Test_static_1500
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3];
          const index: int = 3;
          with(arr, index, 5);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1600
     * @tc.name Array_With_Second_Test_static_1600
     * @tc.desc test with(self: FixedArray<int>, index: int, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3];
          const index: int = 4;
          with(arr, index, 5);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1700
     * @tc.name Array_With_Second_Test_static_1700
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index = 2;
        const result = with(arr, index, 10);
        const expected: FixedArray<int> = [1, 2, 10, 4, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1800
     * @tc.name Array_With_Second_Test_static_1800
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index = 3;
        const result = with(arr, index, 0);
        const expected: FixedArray<int> = [1, 2, 3, 0, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_1900
     * @tc.name Array_With_Second_Test_static_1900
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const index = -5;
        const result = with(arr, index, 6);
        const expected: FixedArray<int> = [6, 2, 3, 4, 5];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2000
     * @tc.name Array_With_Second_Test_static_2000
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10];
        const index = 0;
        const result = with(arr, index, 100);
        const expected: FixedArray<int> = [100];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2100
     * @tc.name Array_With_Second_Test_static_2100
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 5, 6, 3, -2];
        const index = 4;
        const result = with(arr, index, -7);
        const expected: FixedArray<int> = [-1, 5, 6, 3, -7];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2200
     * @tc.name Array_With_Second_Test_static_2200
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 5, 6, 3, -2];
        const index = -3;
        const result = with(arr, index, 0);
        const expected: FixedArray<int> = [-1, 5, 0, 3, -2];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2300
     * @tc.name Array_With_Second_Test_static_2300
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3];
          const index = 3;
          with(arr, index, 6);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2400
     * @tc.name Array_With_Second_Test_static_2400
     * @tc.desc test with(self: FixedArray<int>, index: number, value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [1, 2, 3];
          const index = 10;
          with(arr, index, 4);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2500
     * @tc.name Array_With_Second_Test_static_2500
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30];
        const index: int = 2;
        const result = with(arr, index, 10);
        const expected: FixedArray<long> = [10, 20, 10];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2600
     * @tc.name Array_With_Second_Test_static_2600
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30];
        const index: int = 0;
        const result = with(arr, index, 0);
        const expected: FixedArray<long> = [0, 20, 30];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2700
     * @tc.name Array_With_Second_Test_static_2700
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, -20, -30, -40, -50];
        const index: int = 1;
        const result = with(arr, index, 100);
        const expected: FixedArray<long> = [-10, 100, -30, -40, -50];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2800
     * @tc.name Array_With_Second_Test_static_2800
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 10, 10, 20];
        const index: int = 2;
        const result = with(arr, index, 20);
        const expected: FixedArray<long> = [0, 10, 20, 20];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_2900
     * @tc.name Array_With_Second_Test_static_2900
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [500];
        const index: int = 0;
        const result = with(arr, index, 300);
        const expected: FixedArray<long> = [300];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3000
     * @tc.name Array_With_Second_Test_static_3000
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [200, 500, -300, 500];
        const index: int = -3;
        const result = with(arr, index, 400);
        const expected: FixedArray<long> = [200, 400, -300, 500];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3100
     * @tc.name Array_With_Second_Test_static_3100
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [100, 200, 300];
          const index: int = 3;
          with(arr, index, 700);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3200
     * @tc.name Array_With_Second_Test_static_3200
     * @tc.desc test with(self: FixedArray<long>, index: int, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [100, 200, 300];
          const index: int = 7;
          with(arr, index, 400);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3300
     * @tc.name Array_With_Second_Test_static_3300
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30];
        const index = 1;
        const result = with(arr, index, 15);
        const expected: FixedArray<long> = [10, 15, 30];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3400
     * @tc.name Array_With_Second_Test_static_3400
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30];
        const index = 0;
        const result = with(arr, index, 10);
        const expected: FixedArray<long> = [10, 20, 30];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3500
     * @tc.name Array_With_Second_Test_static_3500
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10, -20, -30, -40, -50];
        const index = 1;
        const result = with(arr, index, 100);
        const expected: FixedArray<long> = [-10, 100, -30, -40, -50];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3600
     * @tc.name Array_With_Second_Test_static_3600
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 10, 10, 20];
        const index = 2;
        const result = with(arr, index, 20);
        const expected: FixedArray<long> = [0, 10, 20, 20];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3700
     * @tc.name Array_With_Second_Test_static_3700
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [500];
        const index = 0;
        const result = with(arr, index, 300);
        const expected: FixedArray<long> = [300];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3800
     * @tc.name Array_With_Second_Test_static_3800
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 50, -40, 20];
        const index = -2;
        const result = with(arr, index, 40);
        const expected: FixedArray<long> = [10, 50, 40, 20];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_3900
     * @tc.name Array_With_Second_Test_static_3900
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_3900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [100, 100, 100, 100, 100, 100, 100];
          const index = 7;
          with(arr, index, 100);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4000
     * @tc.name Array_With_Second_Test_static_4000
     * @tc.desc test with(self: FixedArray<long>, index: number, value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [100, 100, 100, 100, 100, 100, 100];
          const index = 8;
          with(arr, index, 700);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4100
     * @tc.name Array_With_Second_Test_static_4100
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index: int = -2;
        const result = with(arr, index, 7);
        const expected: FixedArray<short> = [2, 4, 7, 8];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4200
     * @tc.name Array_With_Second_Test_static_4200
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index: int = 3;
        const result = with(arr, index, 10);
        const expected: FixedArray<short> = [2, 4, 6, 10];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4300
     * @tc.name Array_With_Second_Test_static_4300
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index: int = 0;
        const result = with(arr, index, 0);
        const expected: FixedArray<short> = [0, 4, 6, 8];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4400
     * @tc.name Array_With_Second_Test_static_4400
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-18, -17, -35, -12, -17];
        const index: int = 1;
        const result = with(arr, index, 17);
        const expected: FixedArray<short> = [-18, 17, -35, -12, -17];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4500
     * @tc.name Array_With_Second_Test_static_4500
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-18, -17, -35, -12, -17];
        const index: int = -4;
        const result = with(arr, index, 17);
        const expected: FixedArray<short> = [-18, 17, -35, -12, -17];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4600
     * @tc.name Array_With_Second_Test_static_4600
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 2, 2];
        const index: int = 1;
        const result = with(arr, index, 6);
        const expected: FixedArray<short> = [2, 6, 2];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4700
     * @tc.name Array_With_Second_Test_static_4700
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [1, 3, 6, 8, 4, 3];
          const index: int = 6;
          with(arr, index, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4800
     * @tc.name Array_With_Second_Test_static_4800
     * @tc.desc test with(self: FixedArray<short>, index: int, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [1, 3, 6, 8, 4, 3];
          const index: int = 9;
          with(arr, index, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_4900
     * @tc.name Array_With_Second_Test_static_4900
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index = -2;
        const result = with(arr, index, 7);
        const expected: FixedArray<short> = [2, 4, 7, 8];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5000
     * @tc.name Array_With_Second_Test_static_5000
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index = 3;
        const result = with(arr, index, 10);
        const expected: FixedArray<short> = [2, 4, 6, 10];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5100
     * @tc.name Array_With_Second_Test_static_5100
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 4, 6, 8];
        const index = 0;
        const result = with(arr, index, 0);
        const expected: FixedArray<short> = [0, 4, 6, 8];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5200
     * @tc.name Array_With_Second_Test_static_5200
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-18, -17, -35, -12, -17];
        const index = 1;
        const result = with(arr, index, 17);
        const expected: FixedArray<short> = [-18, 17, -35, -12, -17];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5300
     * @tc.name Array_With_Second_Test_static_5300
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-18, -17, -35, -12, -17];
        const index = -4;
        const result = with(arr, index, 17);
        const expected: FixedArray<short> = [-18, 17, -35, -12, -17];
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
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5400
     * @tc.name Array_With_Second_Test_static_5400
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 2, 2];
        const index = 1;
        const result = with(arr, index, 6);
        const expected: FixedArray<short> = [2, 6, 2];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5500
     * @tc.name Array_With_Second_Test_static_5500
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [1, 3, 6, 8, 4, 3];
          const index = 6;
          with(arr, index, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_SECOND_TEST_5600
     * @tc.name Array_With_Second_Test_static_5600
     * @tc.desc test with(self: FixedArray<short>, index: number, value: short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Second_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_With_Second_Test_static_5600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [1, 3, 6, 8, 4, 3];
          const index = 9;
          with(arr, index, 2);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Invalid index');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
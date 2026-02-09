import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function Array_With_Test_static() {
  describe('Array_With_Test_static', ():void => {
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
     * @tc.number SUB_ARRAY_WITH_TEST_0100
     * @tc.name Array_With_Test_static_0100
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const index: int = 0;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0200
     * @tc.name Array_With_Test_static_0200
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const index: int = 1;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [false, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0300
     * @tc.name Array_With_Test_static_0300
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const index: int = 0;
        const result = with(arr, index, false);
        const expected: FixedArray<boolean> = [false];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0400
     * @tc.name Array_With_Test_static_0400
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const index: int = 0;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0500
     * @tc.name Array_With_Test_static_0500
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [true, false, true, false];
          const index: int = 10;
          with(arr, index, false);
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
     * @tc.number SUB_ARRAY_WITH_TEST_0600
     * @tc.name Array_With_Test_static_0600
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [true, false, true, false];
          const index: int = 4;
          with(arr, index, true);
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
     * @tc.number SUB_ARRAY_WITH_TEST_0700
     * @tc.name Array_With_Test_static_0700
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const index: int = -1;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0800
     * @tc.name Array_With_Test_static_0800
     * @tc.desc test with(self: FixedArray<boolean>, index: int, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const index: int = -3;
        const result = with(arr, index, false);
        const expected: FixedArray<boolean> = [false, false, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_0900
     * @tc.name Array_With_Test_static_0900
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false, false];
        const index = 2;
        const result = with(arr, index, true);
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
     * @tc.number SUB_ARRAY_WITH_TEST_1000
     * @tc.name Array_With_Test_static_1000
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const index = 0;
        const result = with(arr, index, true);
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
     * @tc.number SUB_ARRAY_WITH_TEST_1100
     * @tc.name Array_With_Test_static_1100
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const index = 0;
        const result = with(arr, index, false);
        const expected: FixedArray<boolean> = [false];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1200
     * @tc.name Array_With_Test_static_1200
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const index = 0;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1300
     * @tc.name Array_With_Test_static_1300
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [true, false, true, false];
          const index = 4;
          with(arr, index, true);
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
     * @tc.number SUB_ARRAY_WITH_TEST_1400
     * @tc.name Array_With_Test_static_1400
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [true, false, true, false];
          const index = 8;
          with(arr, index, true);
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
     * @tc.number SUB_ARRAY_WITH_TEST_1500
     * @tc.name Array_With_Test_static_1500
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const index = -2;
        const result = with(arr, index, true);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1600
     * @tc.name Array_With_Test_static_1600
     * @tc.desc test with(self: FixedArray<boolean>, index: number, value: boolean) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const index = -3;
        const result = with(arr, index, false);
        const expected: FixedArray<boolean> = [false, false, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1700
     * @tc.name Array_With_Test_static_1700
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const index: int = 0;
        const result = with(arr, index, 3);
        const expected: FixedArray<byte> = [3, 2, 3];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1800
     * @tc.name Array_With_Test_static_1800
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const index: int = 2;
        const result = with(arr, index, 5);
        const expected: FixedArray<byte> = [1, 2, 5];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_1900
     * @tc.name Array_With_Test_static_1900
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1];
        const index: int = 0;
        const result = with(arr, index, 3);
        const expected: FixedArray<byte> = [3];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_2000
     * @tc.name Array_With_Test_static_2000
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-1];
        const index: int = 0;
        const result = with(arr, index, 1);
        const expected: FixedArray<byte> = [1];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_2100
     * @tc.name Array_With_Test_static_2100
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-2, 1, 0, -1, 2];
        const index: int = 2;
        const result = with(arr, index, 5);
        const expected: FixedArray<byte> = [-2, 1, 5, -1, 2];
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
     * @tc.number SUB_ARRAY_WITH_TEST_2200
     * @tc.name Array_With_Test_static_2200
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [1, 2, 5, 7, 9];
          const index: int = 10;
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
     * @tc.number SUB_ARRAY_WITH_TEST_2300
     * @tc.name Array_With_Test_static_2300
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [1, 2, 5, 7, 9];
          const index: int = 5;
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
     * @tc.number SUB_ARRAY_WITH_TEST_2400
     * @tc.name Array_With_Test_static_2400
     * @tc.desc test with(self: FixedArray<byte>, index: int, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 5, 7, 9];
        const index = -1;
        const result = with(arr, index, 12);
        const expected: FixedArray<byte> = [1, 2, 5, 7, 12];
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
     * @tc.number SUB_ARRAY_WITH_TEST_2500
     * @tc.name Array_With_Test_static_2500
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 2, 4, 5, 7];
        const index = 3;
        const result = with(arr, index, 6);
        const expected: FixedArray<byte> = [0, 2, 4, 6, 7];
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
     * @tc.number SUB_ARRAY_WITH_TEST_2600
     * @tc.name Array_With_Test_static_2600
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 2, 4, 5, 7];
        const index = 4;
        const result = with(arr, index, 10);
        const expected: FixedArray<byte> = [0, 2, 4, 5, 10];
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
     * @tc.number SUB_ARRAY_WITH_TEST_2700
     * @tc.name Array_With_Test_static_2700
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [6, 6, 6, 6];
        const index = 2;
        const result = with(arr, index, 3);
        const expected: FixedArray<byte> = [6, 6, 3, 6];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_2800
     * @tc.name Array_With_Test_static_2800
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10, -2, -3, -4, -6];
        const index = 1;
        const result = with(arr, index, 2);
        const expected: FixedArray<byte> = [-10, 2, -3, -4, -6];
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
     * @tc.number SUB_ARRAY_WITH_TEST_2900
     * @tc.name Array_With_Test_static_2900
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10, -2, -3, -4, -6];
        const index = 3;
        const result = with(arr, index, -2);
        const expected: FixedArray<byte> = [-10, -2, -3, -2, -6];
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
     * @tc.number SUB_ARRAY_WITH_TEST_3000
     * @tc.name Array_With_Test_static_3000
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10, -2, -3, -4, -6];
        const index = -4;
        const result = with(arr, index, 1);
        const expected: FixedArray<byte> = [-10, 1, -3, -4, -6];
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
     * @tc.number SUB_ARRAY_WITH_TEST_3100
     * @tc.name Array_With_Test_static_3100
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [1, 2, 3, 5, 8, 13];
          const index = 8;
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
     * @tc.number SUB_ARRAY_WITH_TEST_3200
     * @tc.name Array_With_Test_static_3200
     * @tc.desc test with(self: FixedArray<byte>, index: number, value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [1, 2, 3, 5, 8, 13];
          const index = 6;
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
     * @tc.number SUB_ARRAY_WITH_TEST_3300
     * @tc.name Array_With_Test_static_3300
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const index: int = 0;
        const result = with(arr, index, 0x39.toChar());
        const expected: FixedArray<char> = [0x39.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_3400
     * @tc.name Array_With_Test_static_3400
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const index: int = 2;
        const result = with(arr, index, 0x33.toChar());
        const expected: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x33.toChar(), 0x33.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_3500
     * @tc.name Array_With_Test_static_3500
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
        const index: int = 4;
        const result = with(arr, index, 0x41.toChar());
        const expected: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x41.toChar()];
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
     * @tc.number SUB_ARRAY_WITH_TEST_3600
     * @tc.name Array_With_Test_static_3600
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
        const index: int = -3;
        const result = with(arr, index, 0x41.toChar());
        const expected: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x41.toChar(), 0x4E.toChar(), 0x4F.toChar()];
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
     * @tc.number SUB_ARRAY_WITH_TEST_3700
     * @tc.name Array_With_Test_static_3700
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x68.toChar(), 0x69.toChar(), 0x6A.toChar(), 0x6B.toChar()];
        const index: int = 1;
        const result = with(arr, index, 0x6A.toChar());
        const expected: FixedArray<char> = [0x68.toChar(), 0x6A.toChar(), 0x6A.toChar(), 0x6B.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_3800
     * @tc.name Array_With_Test_static_3800
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x68.toChar(), 0x69.toChar(), 0x6A.toChar(), 0x6B.toChar()];
        const index: int = -4;
        const result = with(arr, index, 0x6A.toChar());
        const expected: FixedArray<char> = [0x6A.toChar(), 0x69.toChar(), 0x6A.toChar(), 0x6B.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_3900
     * @tc.name Array_With_Test_static_3900
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_3900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x31.toChar(), 0x61.toChar(), 0x32.toChar(), 0x62.toChar(), 0x33.toChar(), 0x63.toChar()];
          const index: int = 6;
          with(arr, index, 0x36.toChar());
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
     * @tc.number SUB_ARRAY_WITH_TEST_4000
     * @tc.name Array_With_Test_static_4000
     * @tc.desc test with(self: FixedArray<char>, index: int, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x31.toChar(), 0x61.toChar(), 0x32.toChar(), 0x62.toChar(), 0x33.toChar(), 0x63.toChar()];
          const index: int = 10;
          with(arr, index, 0x30.toChar());
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
     * @tc.number SUB_ARRAY_WITH_TEST_4100
     * @tc.name Array_With_Test_static_4100
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const index: int = 0;
        const result = with(arr, index, 0x39.toChar());
        const expected: FixedArray<char> = [0x39.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_4200
     * @tc.name Array_With_Test_static_4200
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const index: int = 2;
        const result = with(arr, index, 0x33.toChar());
        const expected: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x33.toChar(), 0x33.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_4300
     * @tc.name Array_With_Test_static_4300
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
        const index = 1;
        const result = with(arr, index, 0x5A.toChar());
        const expected: FixedArray<char> = [0x4B.toChar(), 0x5A.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
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
     * @tc.number SUB_ARRAY_WITH_TEST_4400
     * @tc.name Array_With_Test_static_4400
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4B.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
        const index = -5;
        const result = with(arr, index, 0x41.toChar());
        const expected: FixedArray<char> = [0x41.toChar(), 0x4C.toChar(), 0x4D.toChar(), 0x4E.toChar(), 0x4F.toChar()];
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
     * @tc.number SUB_ARRAY_WITH_TEST_4500
     * @tc.name Array_With_Test_static_4500
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x76.toChar(), 0x77.toChar()];
        const index = 1;
        const result = with(arr, index, 0x79.toChar());
        const expected: FixedArray<char> = [0x75.toChar(), 0x79.toChar(), 0x77.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_4600
     * @tc.name Array_With_Test_static_4600
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x76.toChar(), 0x77.toChar()];
        const index = -2;
        const result = with(arr, index, 0x30.toChar());
        const expected: FixedArray<char> = [0x75.toChar(), 0x30.toChar(), 0x77.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_4700
     * @tc.name Array_With_Test_static_4700
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x31.toChar(), 0x61.toChar(), 0x31.toChar(), 0x61.toChar()];
          const index = 5;
          with(arr, index, 0x31.toChar());
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
     * @tc.number SUB_ARRAY_WITH_TEST_4800
     * @tc.name Array_With_Test_static_4800
     * @tc.desc test with(self: FixedArray<char>, index: number, value: char) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x31.toChar(), 0x61.toChar(), 0x31.toChar(), 0x61.toChar()];
          const index = 4;
          with(arr, index, 0x30.toChar());
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
     * @tc.number SUB_ARRAY_WITH_TEST_4900
     * @tc.name Array_With_Test_static_4900
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const index: int = 1;
        const result = with(arr, index, 1);
        const expected: FixedArray<double> = [1.1, 1.0, 3.3, 4.4, 5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5000
     * @tc.name Array_With_Test_static_5000
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const index: int = 4;
        const result = with(arr, index, 6);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 6.0];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5100
     * @tc.name Array_With_Test_static_5100
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4, -5.5];
        const index: int = 2;
        const result = with(arr, index, 3);
        const expected: FixedArray<double> = [-1.1, -2.2, 3.0, -4.4, -5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5200
     * @tc.name Array_With_Test_static_5200
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4, -5.5];
        const index: int = -4;
        const result = with(arr, index, 2);
        const expected: FixedArray<double> = [-1.1, 2.0, -3.3, -4.4, -5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5300
     * @tc.name Array_With_Test_static_5300
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [10.1];
        const index: int = 0;
        const result = with(arr, index, 101);
        const expected: FixedArray<double> = [101.0];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_5400
     * @tc.name Array_With_Test_static_5400
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0];
        const index: int = 1;
        const result = with(arr, index, 10);
        const expected: FixedArray<double> = [0.0, 10.0, 0.0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_5500
     * @tc.name Array_With_Test_static_5500
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [10.1, 20.2, 30.3, 40.4, 50.5];
          const index: int = 5;
          with(arr, index, 60);
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
     * @tc.number SUB_ARRAY_WITH_TEST_5600
     * @tc.name Array_With_Test_static_5600
     * @tc.desc test with(self: FixedArray<double>, index: int, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [10.1, 20.2, 30.3, 40.4, 50.5];
          const index: int = 10;
          with(arr, index, 60);
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
     * @tc.number SUB_ARRAY_WITH_TEST_5700
     * @tc.name Array_With_Test_static_5700
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const index = 3;
        const result = with(arr, index, 1);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 1.0, 5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5800
     * @tc.name Array_With_Test_static_5800
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const index = 4;
        const result = with(arr, index, 1);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 1.0];
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
     * @tc.number SUB_ARRAY_WITH_TEST_5900
     * @tc.name Array_With_Test_static_5900
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4, -5.5];
        const index = 0;
        const result = with(arr, index, 0);
        const expected: FixedArray<double> = [0.0, -2.2, -3.3, -4.4, -5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_6000
     * @tc.name Array_With_Test_static_6000
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4, -5.5];
        const index = -2;
        const result = with(arr, index, 4);
        const expected: FixedArray<double> = [-1.1, -2.2, -3.3, 4.0, -5.5];
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
     * @tc.number SUB_ARRAY_WITH_TEST_6100
     * @tc.name Array_With_Test_static_6100
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9];
        const index = 0;
        const result = with(arr, index, -9);
        const expected: FixedArray<double> = [-9.0];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_6200
     * @tc.name Array_With_Test_static_6200
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 1.1, 0.0];
        const index = 1;
        const result = with(arr, index, 0);
        const expected: FixedArray<double> = [0.0, 0.0, 0.0];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_6300
     * @tc.name Array_With_Test_static_6300
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [1.1, -1.1, 1.1, -1.1];
          const index = 4;
          with(arr, index, 1.1);
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
     * @tc.number SUB_ARRAY_WITH_TEST_6400
     * @tc.name Array_With_Test_static_6400
     * @tc.desc test with(self: FixedArray<double>, index: number, value: double) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [1.1, -1.1, 1.1, -1.1];
          const index = 5;
          with(arr, index, -1);
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
     * @tc.number SUB_ARRAY_WITH_TEST_6500
     * @tc.name Array_With_Test_static_6500
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const index: int = 2;
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
     * @tc.number SUB_ARRAY_WITH_TEST_6600
     * @tc.name Array_With_Test_static_6600
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const index: int = 0;
        const result = with(arr, index, 7);
        const expected: FixedArray<float> = [7.0 as float, 2.2 as float, 3.3 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_6700
     * @tc.name Array_With_Test_static_6700
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float, 4.4 as float];
        const index: int = -4;
        const result = with(arr, index, 1);
        const expected: FixedArray<float> = [1.0 as float, -2.2 as float, -3.3 as float, 4.4 as float];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_6800
     * @tc.name Array_With_Test_static_6800
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float, -4.4 as float, -5.5 as float];
        const index: int = -3;
        const result = with(arr, index, 10);
        const expected: FixedArray<float> = [-1.1 as float, -2.2 as float, 10.0 as float, -4.4 as float, -5.5 as float];
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
     * @tc.number SUB_ARRAY_WITH_TEST_6900
     * @tc.name Array_With_Test_static_6900
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [99.9 as float];
        const index: int = 0;
        const result = with(arr, index, -99);
        const expected: FixedArray<float> = [-99.0 as float];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_7000
     * @tc.name Array_With_Test_static_7000
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float, 0.0 as float, 0.0 as float];
        const index: int = -2;
        const result = with(arr, index, -1);
        const expected: FixedArray<float> = [0.0 as float, -1.0 as float, 0.0 as float];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_WITH_TEST_7100
     * @tc.name Array_With_Test_static_7100
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_7100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [1.1 as float, 11.1 as float, 111.1 as float];
          const index: int = 3;
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
     * @tc.number SUB_ARRAY_WITH_TEST_7200
     * @tc.name Array_With_Test_static_7200
     * @tc.desc test with(self: FixedArray<float>, index: int, value: float) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_With_Test_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Values_With_static_7200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [1.1 as float, 11.1 as float, 111.1 as float];
          const index: int = 6;
          with(arr, index, -11);
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
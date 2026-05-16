import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToStringTest() {
  describe('ArrayToStringTest', ():void => {
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
     * @tc.number ARRAY_TO_STRING_TEST_0100
     * @tc.name ArrayToStringTest0100
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = toString(arr);
        const expected: string = 'true,true,true';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0200
     * @tc.name ArrayToStringTest0200
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = toString(arr);
        const expected: string = 'false,false,false';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0300
     * @tc.name ArrayToStringTest0300
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const result = toString(arr);
        const expected: string = 'true,false,false';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0400
     * @tc.name ArrayToStringTest0400
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0500
     * @tc.name ArrayToStringTest0500
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = toString(arr);
        const expected: string = 'true';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0600
     * @tc.name ArrayToStringTest0600
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = toString(arr);
        const expected: string = 'false';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0700
     * @tc.name ArrayToStringTest0700
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        const result = toString(arr);
        const expected: string = 'false,true,false,true';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0800
     * @tc.name ArrayToStringTest0800
     * @tc.desc test toString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true];
        const result = toString(arr);
        const expected: string = 'false,true,true';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_0900
     * @tc.name ArrayToStringTest0900
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4];
        const result = toString(arr);
        const expected: string = '1,2,3,4';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1000
     * @tc.name ArrayToStringTest1000
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 127, 60];
        const result = toString(arr);
        const expected: string = '0,127,60';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1100
     * @tc.name ArrayToStringTest1100
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = toString(arr);
        const expected: string = '0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1200
     * @tc.name ArrayToStringTest1200
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [80];
        const result = toString(arr);
        const expected: string = '80';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1300
     * @tc.name ArrayToStringTest1300
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1400
     * @tc.name ArrayToStringTest1400
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [90, 90, 90];
        const result = toString(arr);
        const expected: string = '90,90,90';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1500
     * @tc.name ArrayToStringTest1500
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 127, 0, -128];
        const result = toString(arr);
        const expected: string = '0,127,0,-128';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1600
     * @tc.name ArrayToStringTest1600
     * @tc.desc test toString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0];
        const result = toString(arr);
        const expected: string = '0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1700
     * @tc.name ArrayToStringTest1700
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
        const result = toString(arr);
        const expected: string = 'A,B,C';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1800
     * @tc.name ArrayToStringTest1800
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x35.toChar(), 0x36.toChar(), 0x37.toChar()];
        const result = toString(arr);
        const expected: string = '5,6,7';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_1900
     * @tc.name ArrayToStringTest1900
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar()];
        const result = toString(arr);
        const expected: string = 'm,n,o';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2000
     * @tc.name ArrayToStringTest2000
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x53.toChar(), 0x32.toChar(), 0x32.toChar()];
        const result = toString(arr);
        const expected: string = 'S,2,2';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2100
     * @tc.name ArrayToStringTest2100
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x39.toChar(), 0x38.toChar(), 0x37.toChar()];
        const result = toString(arr);
        const expected: string = '9,8,7';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2200
     * @tc.name ArrayToStringTest2200
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x5A.toChar(), 0x59.toChar(), 0x58.toChar()];
        const result = toString(arr);
        const expected: string = 'Z,Y,X';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2300
     * @tc.name ArrayToStringTest2300
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x30.toChar(), 0x30.toChar(), 0x30.toChar()];
        const result = toString(arr);
        const expected: string = '0,0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2400
     * @tc.name ArrayToStringTest2400
     * @tc.desc test toString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x68.toChar(), 0x48.toChar(), 0x68.toChar(), 0x48.toChar()];
        const result = toString(arr);
        const expected: string = 'h,H,h,H';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2500
     * @tc.name ArrayToStringTest2500
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = toString(arr);
        const expected: string = '1.1,2.2,3.3,4.4';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2600
     * @tc.name ArrayToStringTest2600
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4];
        const result = toString(arr);
        const expected: string = '-1.1,-2.2,-3.3,-4.4';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2700
     * @tc.name ArrayToStringTest2700
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0];
        const result = toString(arr);
        const expected: string = '0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2800
     * @tc.name ArrayToStringTest2800
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1e3, 2.2e-3];
        const result = toString(arr);
        const expected: string = '1000,0.0022';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_2900
     * @tc.name ArrayToStringTest2900
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3000
     * @tc.name ArrayToStringTest3000
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.1415926];
        const result = toString(arr);
        const expected: string = '3.1415926';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3100
     * @tc.name ArrayToStringTest3100
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, -11.1, 11.1, -11.1];
        const result = toString(arr);
        const expected: string = '11.1,-11.1,11.1,-11.1';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3200
     * @tc.name ArrayToStringTest3200
     * @tc.desc test toString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-0.5, 0.0, 0.5];
        const result = toString(arr);
        const expected: string = '-0.5,0,0.5';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3300
     * @tc.name ArrayToStringTest3300
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float];
        const result = toString(arr);
        const expected: string = '1.1,2.2,3.3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3400
     * @tc.name ArrayToStringTest3400
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, -2.2 as float, -3.3 as float];
        const result = toString(arr);
        const expected: string = '-1.1,-2.2,-3.3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3500
     * @tc.name ArrayToStringTest3500
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-1.1 as float, 2.2 as float, -3.3 as float];
        const result = toString(arr);
        const expected: string = '-1.1,2.2,-3.3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3600
     * @tc.name ArrayToStringTest3600
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3700
     * @tc.name ArrayToStringTest3700
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [99.9 as float];
        const result = toString(arr);
        const expected: string = '99.9';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3800
     * @tc.name ArrayToStringTest3800
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float, 0.0 as float, 0.0 as float];
        const result = toString(arr);
        const expected: string = '0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_3900
     * @tc.name ArrayToStringTest3900
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.2e4 as float, 2.6e-4 as float];
        const result = toString(arr);
        const expected: string = '12000,0.00026';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4000
     * @tc.name ArrayToStringTest4000
     * @tc.desc test toString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1111.1 as float, 2222.2 as float, 3333.3 as float];
        const result = toString(arr);
        const expected: string = '1111.1,2222.2,3333.3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4100
     * @tc.name ArrayToStringTest4100
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = toString(arr);
        const expected: string = '1,2,3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4200
     * @tc.name ArrayToStringTest4200
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-9, -8, -7];
        const result = toString(arr);
        const expected: string = '-9,-8,-7';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4300
     * @tc.name ArrayToStringTest4300
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0];
        const result = toString(arr);
        const expected: string = '0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4400
     * @tc.name ArrayToStringTest4400
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4500
     * @tc.name ArrayToStringTest4500
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, 99, 99, 99];
        const result = toString(arr);
        const expected: string = '99,99,99,99';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4600
     * @tc.name ArrayToStringTest4600
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [Int.MIN_VALUE, Int.MAX_VALUE];
        const result = toString(arr);
        const expected: string = '-2147483648,2147483647';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4700
     * @tc.name ArrayToStringTest4700
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1000, 2000, 3000];
        const result = toString(arr);
        const expected: string = '1000,2000,3000';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4800
     * @tc.name ArrayToStringTest4800
     * @tc.desc test toString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-42, 42, -42, 42];
        const result = toString(arr);
        const expected: string = '-42,42,-42,42';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_4900
     * @tc.name ArrayToStringTest4900
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10 as long, 20 as long, 30 as long, 40 as long];
        const result = toString(arr);
        const expected: string = '10,20,30,40';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5000
     * @tc.name ArrayToStringTest5000
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-10 as long, -20 as long, -30 as long, -40 as long];
        const result = toString(arr);
        const expected: string = '-10,-20,-30,-40';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5100
     * @tc.name ArrayToStringTest5100
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long, 0 as long, 0 as long];
        const result = toString(arr);
        const expected: string = '0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5200
     * @tc.name ArrayToStringTest5200
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5300
     * @tc.name ArrayToStringTest5300
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [Long.MIN_VALUE, Long.MAX_VALUE];
        const result = toString(arr);
        const expected: string = '-9223372036854775808,9223372036854775807';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5400
     * @tc.name ArrayToStringTest5400
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-99 as long, -99 as long, -99 as long, -99 as long];
        const result = toString(arr);
        const expected: string = '-99,-99,-99,-99';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5500
     * @tc.name ArrayToStringTest5500
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [80 as long, 81 as long, 82 as long];
        const result = toString(arr);
        const expected: string = '80,81,82';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5600
     * @tc.name ArrayToStringTest5600
     * @tc.desc test toString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [80 as long, -80 as long, 80 as long, -80 as long];
        const result = toString(arr);
        const expected: string = '80,-80,80,-80';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5700
     * @tc.name ArrayToStringTest5700
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short];
        const result = toString(arr);
        const expected: string = '10,20,30,40';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5800
     * @tc.name ArrayToStringTest5800
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-10 as short, -20 as short, -30 as short, -40 as short];
        const result = toString(arr);
        const expected: string = '-10,-20,-30,-40';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_5900
     * @tc.name ArrayToStringTest5900
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short];
        const result = toString(arr);
        const expected: string = '0,0,0';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_6000
     * @tc.name ArrayToStringTest6000
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = toString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_6100
     * @tc.name ArrayToStringTest6100
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [Short.MIN_VALUE, Short.MAX_VALUE];
        const result = toString(arr);
        const expected: string = '-32768,32767';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_6200
     * @tc.name ArrayToStringTest6200
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-100 as short];
        const result = toString(arr);
        const expected: string = '-100';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_6300
     * @tc.name ArrayToStringTest6300
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [100 as short, -100 as short, 32767 as short];
        const result = toString(arr);
        const expected: string = '100,-100,32767';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_STRING_TEST_6400
     * @tc.name ArrayToStringTest6400
     * @tc.desc test toString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToStringTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToStringTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [200 as short, -200 as short, 200 as short, -200 as short];
        const result = toString(arr);
        const expected: string = '200,-200,200,-200';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
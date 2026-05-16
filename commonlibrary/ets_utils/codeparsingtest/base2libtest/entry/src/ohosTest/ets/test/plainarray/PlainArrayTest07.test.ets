import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function PlainArray07Test() {
  describe('PlainArray07Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0100
     * @tc.name      testPlainArray07Chapter0001
     * @tc.desc      Remove element at Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0001';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(Number.MAX_VALUE);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0200
     * @tc.name      testPlainArray07Chapter0002
     * @tc.desc      Remove element at Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0002';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value1");
        plainArray.add(2, "value2");
        let result = plainArray.removeAt(Number.MIN_VALUE);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0300
     * @tc.name      testPlainArray07Chapter0003
     * @tc.desc      Remove element at Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0003';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value1");
        plainArray.add(2, "value2");
        let result = plainArray.removeAt(Number.EPSILON);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0400
     * @tc.name      testPlainArray07Chapter0004
     * @tc.desc      Remove element at Number.MAX_SAFE_INTEGER index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0004';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(Number.MAX_SAFE_INTEGER);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0500
     * @tc.name      testPlainArray07Chapter0005
     * @tc.desc      Remove element at Number.MIN_SAFE_INTEGER index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0005';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(Number.MIN_SAFE_INTEGER);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0600
     * @tc.name      testPlainArray07Chapter0006
     * @tc.desc      Remove element at byte boundary values (-128, 127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0006';
      console.log(TAG + ' start');
      let plainArray1 = new PlainArray<string>();
      plainArray1.add(1, "value");
      let oldLength1 = plainArray1.length;
      let result1 = plainArray1.removeAt(-128);
      expect(result1).assertUndefined();
      expect(plainArray1.length).assertEqual(oldLength1);
      let plainArray2 = new PlainArray<string>();
      for (let i = 0; i <= 127; i++) {
        plainArray2.add(i, `value${i}`);
      }
      let result2 = plainArray2.removeAt(127);
      expect(result2).assertEqual("value127");
      expect(plainArray2.length).assertEqual(127);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0700
     * @tc.name      testPlainArray07Chapter0007
     * @tc.desc      Remove element at short boundary values (-32768, 32767)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0007';
      console.log(TAG + ' start');
      let plainArray1 = new PlainArray<string>();
      plainArray1.add(1, "value");
      let oldLength1 = plainArray1.length;
      let result1 = plainArray1.removeAt(-32768);
      expect(result1).assertUndefined();
      expect(plainArray1.length).assertEqual(oldLength1);
      let plainArray2 = new PlainArray<string>();
      plainArray2.add(0, "value0");
      plainArray2.add(1, "value1");
      let oldLength2 = plainArray2.length;
      let result2 = plainArray2.removeAt(32767);
      expect(result2).assertUndefined();
      expect(plainArray2.length).assertEqual(oldLength2);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0800
     * @tc.name      testPlainArray07Chapter0008
     * @tc.desc      Remove element at long boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0008';
      console.log(TAG + ' start');
      try {
        let plainArray1 = new PlainArray<string>();
        plainArray1.add(1, "value");
        let result1 = plainArray1.removeAt(-9223372036854775808);

        expect(result1).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      try {
        let plainArray2 = new PlainArray<string>();
        plainArray2.add(0, "value0");
        let result2 = plainArray2.removeAt(9223372036854775807);

        expect(result2).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_0900
     * @tc.name      testPlainArray07Chapter0009
     * @tc.desc      Remove element at float boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0009';
      console.log(TAG + ' start');
      try {
        let plainArray1 = new PlainArray<string>();
        plainArray1.add(1, "value");
        let result1 = plainArray1.removeAt(3.40282346638528860e+38);

        expect(result1).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      try {
        let plainArray2 = new PlainArray<string>();
        plainArray2.add(1, "value");
        let result2 = plainArray2.removeAt(1.40129846432481707e-45);
        let result = plainArray2.removeAt(1.40129846432481707e-45);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1000
     * @tc.name      testPlainArray07Chapter0010
     * @tc.desc      Remove element at double boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0010';
      console.log(TAG + ' start');
      try {
        let plainArray1 = new PlainArray<string>();
        plainArray1.add(1, "value");
        let result1 = plainArray1.removeAt(1.79769313486231570e+308);

        expect(result1).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      try {
        let plainArray2 = new PlainArray<string>();
        plainArray2.add(1, "value");
        let result2 = plainArray2.removeAt(4.94065645841246544e-324);
        let result = plainArray2.removeAt(4.94065645841246544e-324);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1100
     * @tc.name      testPlainArray07Chapter0011
     * @tc.desc      Remove element at char boundary values (0~65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0011';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "value0");
      let oldLength = plainArray.length;
      let result = plainArray.removeAt(65535);
      expect(result).assertUndefined();
      expect(plainArray.length).assertEqual(oldLength);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1200
     * @tc.name      testPlainArray07Chapter0012
     * @tc.desc      Remove element at hex number index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0012';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i <= 258; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(0x0102);
      expect(result).assertEqual("value258");
      expect(plainArray.length).assertEqual(258);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1300
     * @tc.name      testPlainArray07Chapter0013
     * @tc.desc      Remove element at 32-bit hex number index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0013';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "value0");
      let oldLength = plainArray.length;
      let result = plainArray.removeAt(0x01020304);
      expect(result).assertUndefined();
      expect(plainArray.length).assertEqual(oldLength);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1400
     * @tc.name      testPlainArray07Chapter0014
     * @tc.desc      Remove element at octal number index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0014';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i <= 3; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(0o3);
      expect(result).assertEqual("value3");
      expect(plainArray.length).assertEqual(3);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1500
     * @tc.name      testPlainArray07Chapter0015
     * @tc.desc      Remove element at binary number index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0015';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i <= 10; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(0b1010);
      expect(result).assertEqual("value10");
      expect(plainArray.length).assertEqual(10);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1600
     * @tc.name      testPlainArray07Chapter0016
     * @tc.desc      Remove element at index using exponentiation operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0016';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i <= 8; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(2**3);
      expect(result).assertEqual("value8");
      expect(plainArray.length).assertEqual(8);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1700
     * @tc.name      testPlainArray07Chapter0017
     * @tc.desc      Remove element at index using scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0017';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i <= 1000; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(1e3);
      expect(result).assertEqual("value1000");
      expect(plainArray.length).assertEqual(1000);
      try {
        let plainArray2 = new PlainArray<string>();
        plainArray2.add(0, "value0");
        plainArray2.add(1, "value1");
        let result2 = plainArray2.removeAt(2.5e-2);

        expect(result2).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1800
     * @tc.name      testPlainArray07Chapter0018
     * @tc.desc      Remove element at index from BigInt conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0018';
      console.log(TAG + ' start');
      let bigIntVal = BigInt("9007199254740991");
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "value0");
      try {
        let result = plainArray.removeAt(Number(bigIntVal));

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_1900
     * @tc.name      testPlainArray07Chapter0019
     * @tc.desc      Remove element at double precision value index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0019';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(0, "value0");
        plainArray.add(1, "value1");
        plainArray.add(2, "value2");
        let result = plainArray.removeAt(123.456);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2000
     * @tc.name      testPlainArray07Chapter0020
     * @tc.desc      Remove element at float hex representation index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0020';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(0, "value0");
        let result = plainArray.removeAt(0xcafebabe);

        expect(result).assertUndefined();
      } catch (err) {
        expect(err == undefined).assertFalse();
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2100
     * @tc.name      testPlainArray07Chapter0021
     * @tc.desc      Remove element at index from arithmetic operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0021';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i < 100; i++) {
        plainArray.add(i, `value${i}`);
      }
      let index1 = 10 + 20;
      let result1 = plainArray.removeAt(index1);
      expect(result1).assertEqual("value30");
      let index2 = 50 / 2;
      let result2 = plainArray.removeAt(index2);
      expect(result2).assertEqual("value25");
      let index3 = 99 % 10;
      let result3 = plainArray.removeAt(index3);
      expect(result3).assertEqual("value9");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2200
     * @tc.name      testPlainArray07Chapter0022
     * @tc.desc      Remove element at index from function return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0022';
      console.log(TAG + ' start');
      let plainArray1 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray1.add(i, `value${i}`);
      }
      let index1 = Math.floor(1.5);
      let result1 = plainArray1.removeAt(index1);
      expect(result1).assertEqual("value1");
      let plainArray2 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray2.add(i, `value${i}`);
      }
      let index2 = Math.ceil(4.1);
      let result2 = plainArray2.removeAt(index2);
      expect(result2).assertEqual("value5");
      let plainArray3 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray3.add(i, `value${i}`);
      }
      let index3 = Math.round(6.7);
      let result3 = plainArray3.removeAt(index3);
      expect(result3).assertEqual("value7");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2300
     * @tc.name      testPlainArray07Chapter0023
     * @tc.desc      Remove element at index from type conversions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0023';
      console.log(TAG + ' start');
      let plainArray1 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray1.add(i, `value${i}`);
      }
      let index1 = parseInt("3", 10);
      let result1 = plainArray1.removeAt(index1);
      expect(result1).assertEqual("value3");
      let plainArray2 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray2.add(i, `value${i}`);
      }
      let index2 = Number("5");
      let result2 = plainArray2.removeAt(index2);
      expect(result2).assertEqual("value5");
      let plainArray3 = new PlainArray<string>();
      for (let i = 0; i < 10; i++) {
        plainArray3.add(i, `value${i}`);
      }
      let index3 = parseFloat("7.0");
      let result3 = plainArray3.removeAt(index3);
      expect(result3).assertEqual("value7");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2400
     * @tc.name      testPlainArray07Chapter0024
     * @tc.desc      Normal scenario: remove range from middle of PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0024';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      plainArray.add(0, "zero");
      plainArray.add(1, "one");
      plainArray.add(2, "two");
      plainArray.add(3, "three");
      plainArray.add(4, "four");

      let result = plainArray.removeRangeFrom(1, 2);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(3);

      expect(plainArray.get(0)).assertEqual("zero");
      expect(plainArray.get(3)).assertEqual("three");
      expect(plainArray.get(4)).assertEqual("four");

      expect(plainArray.get(1)).assertUndefined();
      expect(plainArray.get(2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2500
     * @tc.name      testPlainArray07Chapter0025
     * @tc.desc      Normal scenario: remove from index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0025';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 100);
      plainArray.add(1, 200);
      plainArray.add(2, 300);

      let result = plainArray.removeRangeFrom(0, 2);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(1);
      expect(plainArray.get(2)).assertEqual(300);
      expect(plainArray.get(0)).assertUndefined();
      expect(plainArray.get(1)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2600
     * @tc.name      testPlainArray07Chapter0026
     * @tc.desc      Normal scenario: remove to end of array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0026';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 10);
      plainArray.add(1, 20);
      plainArray.add(2, 30);
      plainArray.add(3, 40);

      let result = plainArray.removeRangeFrom(2, 5);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(2);
      expect(plainArray.get(0)).assertEqual(10);
      expect(plainArray.get(1)).assertEqual(20);
      expect(plainArray.get(2)).assertUndefined();
      expect(plainArray.get(3)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2700
     * @tc.name      testPlainArray07Chapter0027
     * @tc.desc      Boundary: index at last position with size 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0027';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      plainArray.add(0, "first");
      plainArray.add(1, "second");
      plainArray.add(2, "third");

      let result = plainArray.removeRangeFrom(2, 1);
      expect(result).assertEqual(1);
      expect(plainArray.length).assertEqual(2);
      expect(plainArray.get(0)).assertEqual("first");
      expect(plainArray.get(1)).assertEqual("second");
      expect(plainArray.get(2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2800
     * @tc.name      testPlainArray07Chapter0028
     * @tc.desc      Negative case: size is 0 (must be > 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0028';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 1);
        plainArray.add(1, 2);
        plainArray.add(2, 3);
        plainArray.removeRangeFrom(1, 0);

        expect(plainArray.length).assertEqual(3);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_2900
     * @tc.name      testPlainArray07Chapter0029
     * @tc.desc      Boundary: index 0 with size equal to array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0029';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 100);
      plainArray.add(1, 200);
      plainArray.add(2, 300);

      let result = plainArray.removeRangeFrom(0, 3);
      expect(result).assertEqual(3);
      expect(plainArray.length).assertEqual(0);
      expect(plainArray.get(0)).assertUndefined();
      expect(plainArray.get(1)).assertUndefined();
      expect(plainArray.get(2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3000
     * @tc.name      testPlainArray07Chapter0030
     * @tc.desc      Boundary: index at max int32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0030';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.removeRangeFrom(2147483647, 0);

        expect(plainArray.length).assertEqual(0);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3100
     * @tc.name      testPlainArray07Chapter0031
     * @tc.desc      Boundary: size at max int32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0031';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 1);
      plainArray.add(1, 2);

      let result = plainArray.removeRangeFrom(0, 2147483647);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(0);
      expect(plainArray.get(0)).assertUndefined();
      expect(plainArray.get(1)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3200
     * @tc.name      testPlainArray07Chapter0032
     * @tc.desc      Negative case: index out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0032';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(0, "test");
        plainArray.removeRangeFrom(5, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3300
     * @tc.name      testPlainArray07Chapter0033
     * @tc.desc      Negative case: negative index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0033';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(-1, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3400
     * @tc.name      testPlainArray07Chapter0034
     * @tc.desc      Negative case: negative size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0034';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(0, -1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3500
     * @tc.name      testPlainArray07Chapter0035
     * @tc.desc      Negative case: index exceeds int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0035';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(2147483648, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3600
     * @tc.name      testPlainArray07Chapter0036
     * @tc.desc      Negative case: size exceeds int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0036';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(0, 2147483648);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3700
     * @tc.name      testPlainArray07Chapter0037
     * @tc.desc      Special value: index is NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0037';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(NaN, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3800
     * @tc.name      testPlainArray07Chapter0038
     * @tc.desc      Special value: size is NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0038';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(0, NaN);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_3900
     * @tc.name      testPlainArray07Chapter0039
     * @tc.desc      Special value: index is Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0039';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(Infinity, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4000
     * @tc.name      testPlainArray07Chapter0040
     * @tc.desc      Special value: size is Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0040';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(0, Infinity);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4100
     * @tc.name      testPlainArray07Chapter0041
     * @tc.desc      Special value: index is -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0041';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(-Infinity, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4200
     * @tc.name      testPlainArray07Chapter0042
     * @tc.desc      Negative case: size is 0 in empty PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0042';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.removeRangeFrom(0, 0);

        expect(plainArray.length).assertEqual(0);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4300
     * @tc.name      testPlainArray07Chapter0043
     * @tc.desc      Negative case: index is floating point number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0043';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(0, "a");
        plainArray.add(1, "b");
        plainArray.add(2, "c");
        plainArray.removeRangeFrom(1.7, 1);

        expect(plainArray.length).assertEqual(3);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4400
     * @tc.name      testPlainArray07Chapter0044
     * @tc.desc      Negative case: size is floating point number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0044';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 10);
        plainArray.add(1, 20);
        plainArray.add(2, 30);
        plainArray.add(3, 40);
        plainArray.removeRangeFrom(1, 2.3);

        expect(plainArray.length).assertEqual(4);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4500
     * @tc.name      testPlainArray07Chapter0045
     * @tc.desc      Boundary: index at Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0045';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(Number.MAX_SAFE_INTEGER, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4600
     * @tc.name      testPlainArray07Chapter0046
     * @tc.desc      Boundary: size at Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0046';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.removeRangeFrom(0, Number.MAX_VALUE);

        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4700
     * @tc.name      testPlainArray07Chapter0047
     * @tc.desc      Special value: index is -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0047';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 100);
      plainArray.add(1, 200);

      let result = plainArray.removeRangeFrom(-0, 1);
      expect(result).assertEqual(1);
      expect(plainArray.length).assertEqual(1);
      expect(plainArray.get(0)).assertUndefined();
      expect(plainArray.get(1)).assertEqual(200);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4800
     * @tc.name      testPlainArray07Chapter0048
     * @tc.desc      Negative case: size is Number.EPSILON (floating point)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0048';
      console.log(TAG + ' start');

      try {
        let plainArray = new PlainArray<number>();
        plainArray.add(0, 100);
        plainArray.add(1, 200);
        plainArray.removeRangeFrom(0, Number.EPSILON);

        expect(plainArray.length).assertEqual(2);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_4900
     * @tc.name      testPlainArray07Chapter0049
     * @tc.desc      Special scenario: remove from non-existent key in populated array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0049';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      plainArray.add(0, "a");
      plainArray.add(2, "b");
      plainArray.add(4, "c");

      let result = plainArray.removeRangeFrom(1, 1);
      expect(result).assertEqual(1);
      expect(plainArray.length).assertEqual(2);
      expect(plainArray.get(0)).assertEqual("a");
      expect(plainArray.get(2)).assertUndefined();
      expect(plainArray.get(4)).assertEqual("c");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5000
     * @tc.name      testPlainArray07Chapter0050
     * @tc.desc      Simple scenario: remove range from existing keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0050';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 10; i++) {
        plainArray.add(i, i * 10);
      }

      let result = plainArray.removeRangeFrom(2, 3);
      expect(result).assertEqual(3);
      expect(plainArray.length).assertEqual(7);

      expect(plainArray.get(0)).assertEqual(0);
      expect(plainArray.get(1)).assertEqual(10);
      expect(plainArray.get(2)).assertUndefined();
      expect(plainArray.get(3)).assertUndefined();
      expect(plainArray.get(4)).assertUndefined();
      expect(plainArray.get(5)).assertEqual(50);
      expect(plainArray.get(6)).assertEqual(60);
      expect(plainArray.get(7)).assertEqual(70);
      expect(plainArray.get(8)).assertEqual(80);
      expect(plainArray.get(9)).assertEqual(90);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5100
     * @tc.name      testPlainArray07Chapter0051
     * @tc.desc      Remove range from PlainArray with valid index and size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0051';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "value1");
      plainArray.add(2, "value2");
      plainArray.add(3, "value3");
      let result: number = plainArray.removeRangeFrom(1, 2);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(1);
      expect(plainArray.getValueAt(0)).assertEqual("value1");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5200
     * @tc.name      testPlainArray07Chapter0052
     * @tc.desc      Remove range from PlainArray with index 0 and size equals length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0052';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 10);
      plainArray.add(2, 20);
      plainArray.add(3, 30);
      let result: number = plainArray.removeRangeFrom(0, 3);
      expect(result).assertEqual(3);
      expect(plainArray.length).assertEqual(0);
    });


    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5300
     * @tc.name      testPlainArray07Chapter0053
     * @tc.desc      Remove range from PlainArray with size 0 should throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0053';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, true);
      plainArray.add(2, false);
      try {
        plainArray.removeRangeFrom(1, 0);

        expect(plainArray.length).assertEqual(2);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    }); /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5400
     * @tc.name      testPlainArray07Chapter0054
     * @tc.desc      Remove range from PlainArray with size larger than remaining elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0054';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result: number = plainArray.removeRangeFrom(1, 5);
      expect(result).assertEqual(2);
      expect(plainArray.length).assertEqual(1);
      expect(plainArray.getValueAt(0)).assertEqual("a");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5500
     * @tc.name      testPlainArray07Chapter0055
     * @tc.desc      Remove range from empty PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0055';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      try {
        plainArray.removeRangeFrom(0, 1);

        expect(plainArray.length).assertEqual(0);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5600
     * @tc.name      testPlainArray07Chapter0056
     * @tc.desc      Remove range with index at int32 max boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0056';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      try {
        plainArray.removeRangeFrom(2147483647, 1);

        expect(plainArray.length).assertEqual(0);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5700
     * @tc.name      testPlainArray07Chapter0057
     * @tc.desc      Remove range with negative index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0057';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      try {
        plainArray.removeRangeFrom(-1, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5800
     * @tc.name      testPlainArray07Chapter0058
     * @tc.desc      Remove range with negative size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0058';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, true);
      try {
        plainArray.removeRangeFrom(0, -1);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_5900
     * @tc.name      testPlainArray07Chapter0059
     * @tc.desc      Remove range with size exceeding int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0059';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      try {
        plainArray.removeRangeFrom(0, 2147483648);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6000
     * @tc.name      testPlainArray07Chapter0060
     * @tc.desc      Remove range with index exceeding int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0060';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 50);
      try {
        plainArray.removeRangeFrom(2147483648, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6100
     * @tc.name      testPlainArray07Chapter0061
     * @tc.desc      Remove range with NaN index parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0061';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "data");
      try {
        plainArray.removeRangeFrom(NaN, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6200
     * @tc.name      testPlainArray07Chapter0062
     * @tc.desc      Remove range with Infinity size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0062';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, false);
      try {
        plainArray.removeRangeFrom(0, Infinity);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6300
     * @tc.name      testPlainArray07Chapter0063
     * @tc.desc      Remove range with index as undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0063';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 999);
      try {
        plainArray.removeRangeFrom(undefined, 1);

        expect(plainArray.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6400
     * @tc.name      testPlainArray07Chapter0064
     * @tc.desc      Set value at valid index with string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0064';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "initial");
      plainArray.setValueAt(0, "updated");
      expect(plainArray.getValueAt(0)).assertEqual("updated");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6500
     * @tc.name      testPlainArray07Chapter0065
     * @tc.desc      Set value at index 0 with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0065';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      plainArray.setValueAt(0, 200);
      expect(plainArray.getValueAt(0)).assertEqual(200);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6600
     * @tc.name      testPlainArray07Chapter0066
     * @tc.desc      Set value at last index with boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0066';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, false);
      plainArray.add(2, true);
      plainArray.setValueAt(1, false);
      expect(plainArray.getValueAt(1)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6700
     * @tc.name      testPlainArray07Chapter0067
     * @tc.desc      Set value at valid index with object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0067';
      console.log(TAG + ' start');

      interface TestObject {
        a?: number;
        b?: number;
        c?: string;
      }

      let plainArray: PlainArray<TestObject> = new PlainArray();
      let initialObj: TestObject = { a: 1 };
      plainArray.add(1, initialObj);
      let newObj: TestObject = { b: 2, c: "test" };
      plainArray.setValueAt(0, newObj);
      expect(plainArray.getValueAt(0)).assertDeepEquals(newObj);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6800
     * @tc.name      testPlainArray07Chapter0068
     * @tc.desc      Set value at valid index with array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0068';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      let initialArr: Array<number> = [1, 2, 3];
      plainArray.add(1, initialArr);
      let newArr: Array<number> = [4, 5, 6];
      plainArray.setValueAt(0, newArr);
      expect(plainArray.getValueAt(0)).assertDeepEquals(newArr);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_6900
     * @tc.name      testPlainArray07Chapter0069
     * @tc.desc      Set value at out of range index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0069';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "data");
      try {
        plainArray.setValueAt(5, "invalid");

        expect(plainArray.getValueAt(0)).assertEqual("data");
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7000
     * @tc.name      testPlainArray07Chapter0070
     * @tc.desc      Set value at negative index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0070';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      try {
        plainArray.setValueAt(-1, 200);

        expect(plainArray.getValueAt(0)).assertEqual(100);
      } catch (error) {
        expect(error.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7100
     * @tc.name      testPlainArray07Chapter0071
     * @tc.desc      Set value with index as undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0071';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, true);
      try {
        plainArray.setValueAt(undefined, false);

        expect(plainArray.getValueAt(0)).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7200
     * @tc.name      testPlainArray07Chapter0072
     * @tc.desc      Set value with value as undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0072';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string | undefined> = new PlainArray();
      plainArray.add(1, "defined");
      plainArray.setValueAt(0, undefined);
      expect(plainArray.getValueAt(0)).assertUndefined();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7300
     * @tc.name      testPlainArray07Chapter0073
     * @tc.desc      Set value with value as null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0073';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string | null> = new PlainArray();
      plainArray.add(1, "not null");
      plainArray.setValueAt(0, null);
      expect(plainArray.getValueAt(0)).assertNull();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7400
     * @tc.name      testPlainArray07Chapter0074
     * @tc.desc      Set value with index exceeding int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0074';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      try {
        plainArray.setValueAt(2147483648, "overflow");

        expect(plainArray.getValueAt(0)).assertEqual("test");
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7500
     * @tc.name      testPlainArray07Chapter0075
     * @tc.desc      Set value with index as NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0075';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 10);
      try {
        plainArray.setValueAt(NaN, 20);

        expect(plainArray.getValueAt(0)).assertEqual(10);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7600
     * @tc.name      testPlainArray07Chapter0076
     * @tc.desc      Set value with value as NaN for number type PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0076';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      plainArray.setValueAt(0, NaN);
      expect(isNaN(plainArray.getValueAt(0) as number)).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7700
     * @tc.name      testPlainArray07Chapter0077
     * @tc.desc      Set value with value as Infinity for number type PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0077';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 50);
      plainArray.setValueAt(0, Infinity);
      expect(plainArray.getValueAt(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7800
     * @tc.name      testPlainArray07Chapter0078
     * @tc.desc      Set value with value as -Infinity for number type PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0078';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 75);
      plainArray.setValueAt(0, -Infinity);
      expect(plainArray.getValueAt(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_7900
     * @tc.name      testPlainArray07Chapter0079
     * @tc.desc      Set value with value as TypedArray for object type PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0079';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Int8Array> = new PlainArray();
      let initialArray: Int8Array = new Int8Array([0, 0, 0]);
      plainArray.add(1, initialArray);
      let typedArray: Int8Array = new Int8Array([-128, 0, 127]);
      plainArray.setValueAt(0, typedArray);
      expect(plainArray.getValueAt(0)).assertDeepEquals(typedArray);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_8000
     * @tc.name      testPlainArray07Chapter0080
     * @tc.desc      Set value with value as bigint for bigint type PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0080';
      console.log(TAG + ' start');
      let plainArray: PlainArray<bigint> = new PlainArray();
      plainArray.add(1, BigInt(0));
      let bigIntVal: bigint = BigInt(9007199254740991);
      plainArray.setValueAt(0, bigIntVal);
      expect(plainArray.getValueAt(0)).assertEqual(bigIntVal);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_8100
     * @tc.name      testPlainArray07Chapter0081
     * @tc.desc      Set value with value as string containing all special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0081';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "initial");
      let specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      plainArray.setValueAt(0, specialChars);
      expect(plainArray.getValueAt(0)).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_8200
     * @tc.name      testPlainArray07Chapter0082
     * @tc.desc      Set value with value as string containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0082';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let asciiStr: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      plainArray.setValueAt(0, asciiStr);
      expect(plainArray.getValueAt(0)).assertEqual(asciiStr);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_8300
     * @tc.name      testPlainArray07Chapter0083
     * @tc.desc      Set value with value as string containing special escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0083';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let escapeStr: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41";
      plainArray.setValueAt(0, escapeStr);
      expect(plainArray.getValueAt(0)).assertEqual(escapeStr);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST07_8400
     * @tc.name      testPlainArray07Chapter0084
     * @tc.desc      Set value with value as string containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray07Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray07Chapter0084';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let emojiStr: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      plainArray.setValueAt(0, emojiStr);
      expect(plainArray.getValueAt(0)).assertEqual(emojiStr);
    });
  })
}
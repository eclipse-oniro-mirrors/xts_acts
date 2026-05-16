import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { PlainArray } from '@kit.ArkTS';

interface GeneratedTypeLiteralInterface_2 {
  e: number;
}

interface GeneratedTypeLiteralInterface_1 {
  c: number;
  d: GeneratedTypeLiteralInterface_2;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function PlainArray08Test() {
  describe('PlainArray08Test', () => {
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
     * @tc.number    SUB_PLAINARRAY_TEST08_0100
     * @tc.name      testPlainArray08Chapter0001
     * @tc.desc      Set value with value as string containing invalid unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0001';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let invalidUnicode: string = "\udc04\ud83d\udff4";
      plainArray.setValueAt(0, invalidUnicode);
      expect(plainArray.getValueAt(0)).assertEqual(invalidUnicode);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0200
     * @tc.name      testPlainArray08Chapter0002
     * @tc.desc      Set value with value as string containing keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0002';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let keywordStr: string = "0 NaN ";
      plainArray.setValueAt(0, keywordStr);
      expect(plainArray.getValueAt(0)).assertEqual(keywordStr);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0300
     * @tc.name      testPlainArray08Chapter0003
     * @tc.desc      Set value with value as empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0003';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "non-empty");
      plainArray.setValueAt(0, "");
      expect(plainArray.getValueAt(0)).assertEqual("");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0400
     * @tc.name      testPlainArray08Chapter0004
     * @tc.desc      Set value with value as number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0004';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      plainArray.setValueAt(0, 0);
      expect(plainArray.getValueAt(0)).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0500
     * @tc.name      testPlainArray08Chapter0005
     * @tc.desc      Set value with value as negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0005';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 100);
      plainArray.setValueAt(0, -0);
      expect(1 / plainArray.getValueAt(0) as number).assertEqual(-Infinity);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0600
     * @tc.name      testPlainArray08Chapter0006
     * @tc.desc      Set value with value as Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0006';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, Number.MAX_VALUE);
      expect(plainArray.getValueAt(0)).assertEqual(Number.MAX_VALUE);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0700
     * @tc.name      testPlainArray08Chapter0007
     * @tc.desc      Set value with value as Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0007';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, Number.MIN_VALUE);
      expect(plainArray.getValueAt(0)).assertEqual(Number.MIN_VALUE);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0800
     * @tc.name      testPlainArray08Chapter0008
     * @tc.desc      Set value with value as Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0008';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, Number.EPSILON);
      expect(plainArray.getValueAt(0)).assertEqual(Number.EPSILON);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_0900
     * @tc.name      testPlainArray08Chapter0009
     * @tc.desc      Set value with value as Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0009';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, Number.MAX_SAFE_INTEGER);
      expect(plainArray.getValueAt(0)).assertEqual(Number.MAX_SAFE_INTEGER);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1000
     * @tc.name      testPlainArray08Chapter0010
     * @tc.desc      Set value with value as -128 (byte boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0010';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, -128);
      expect(plainArray.getValueAt(0)).assertEqual(-128);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1100
     * @tc.name      testPlainArray08Chapter0011
     * @tc.desc      Set value with value as 127 (byte boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0011';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 127);
      expect(plainArray.getValueAt(0)).assertEqual(127);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1200
     * @tc.name      testPlainArray08Chapter0012
     * @tc.desc      Set value with value as -32768 (short boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0012';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, -32768);
      expect(plainArray.getValueAt(0)).assertEqual(-32768);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1300
     * @tc.name      testPlainArray08Chapter0013
     * @tc.desc      Set value with value as 32767 (short boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0013';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 32767);
      expect(plainArray.getValueAt(0)).assertEqual(32767);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1400
     * @tc.name      testPlainArray08Chapter0014
     * @tc.desc      Set value with value as -2147483648 (int boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0014';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, -2147483648);
      expect(plainArray.getValueAt(0)).assertEqual(-2147483648);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1500
     * @tc.name      testPlainArray08Chapter0015
     * @tc.desc      Set value with value as 2147483647 (int boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0015';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 2147483647);
      expect(plainArray.getValueAt(0)).assertEqual(2147483647);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1600
     * @tc.name      testPlainArray08Chapter0016
     * @tc.desc      Set value with value as -9223372036854775808 (long boundary string representation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0016';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let longMin: string = "-9223372036854775808";
      plainArray.setValueAt(0, longMin);
      expect(plainArray.getValueAt(0)).assertEqual(longMin);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1700
     * @tc.name      testPlainArray08Chapter0017
     * @tc.desc      Set value with value as 9223372036854775807 (long boundary string representation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0017';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let longMax: string = "9223372036854775807";
      plainArray.setValueAt(0, longMax);
      expect(plainArray.getValueAt(0)).assertEqual(longMax);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1800
     * @tc.name      testPlainArray08Chapter0018
     * @tc.desc      Set value with value as 65535 (char boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0018';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 65535);
      expect(plainArray.getValueAt(0)).assertEqual(65535);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_1900
     * @tc.name      testPlainArray08Chapter0019
     * @tc.desc      Set value with value as Hexadecimal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0019';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 0x0102);
      expect(plainArray.getValueAt(0)).assertEqual(0x0102);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2000
     * @tc.name      testPlainArray08Chapter0020
     * @tc.desc      Set value with value as Octal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0020';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 0o3);
      expect(plainArray.getValueAt(0)).assertEqual(3);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2100
     * @tc.name      testPlainArray08Chapter0021
     * @tc.desc      Set value with value as scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0021';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      plainArray.setValueAt(0, 1e3);
      expect(plainArray.getValueAt(0)).assertEqual(1000);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2200
     * @tc.name      testPlainArray08Chapter0022
     * @tc.desc      Set value with value as array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0022';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      plainArray.add(1, [1, 2, 3]);
      let specialArray: Array<number> = [NaN, Infinity, -Infinity];
      plainArray.setValueAt(0, specialArray);
      let result: Array<number> = plainArray.getValueAt(0) as Array<number>;
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(Infinity);
      expect(result[2]).assertEqual(-Infinity);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2300
     * @tc.name      testPlainArray08Chapter0023
     * @tc.desc      Set value with value as array containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0023';
      console.log(TAG + ' start');
      type MixedArray = Array<number | string | boolean | null | undefined>;
      let plainArray: PlainArray<MixedArray> = new PlainArray();
      plainArray.add(1, [1]);
      let mixedArray: MixedArray = [72, "abc", true, null, undefined];
      plainArray.setValueAt(0, mixedArray);
      expect(plainArray.getValueAt(0)).assertDeepEquals(mixedArray);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2400
     * @tc.name      testPlainArray08Chapter0024
     * @tc.desc      Set value with value as empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0024';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      plainArray.add(1, [1, 2]);
      plainArray.setValueAt(0, []);
      expect(plainArray.getValueAt(0)).assertDeepEquals([]);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2500
     * @tc.name      testPlainArray08Chapter0025
     * @tc.desc      Set value with value as TypedArray Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0025';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Uint8Array> = new PlainArray();
      plainArray.add(1, new Uint8Array([0]));
      let uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      plainArray.setValueAt(0, uint8Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(uint8Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2600
     * @tc.name      testPlainArray08Chapter0026
     * @tc.desc      Set value with value as TypedArray Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0026';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Float32Array> = new PlainArray();
      plainArray.add(1, new Float32Array([0]));
      let float32Array: Float32Array = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
      plainArray.setValueAt(0, float32Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(float32Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2700
     * @tc.name      testPlainArray08Chapter0027
     * @tc.desc      Set value with value as Int16Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0027';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Int16Array> = new PlainArray();
      plainArray.add(1, new Int16Array([0]));
      let int16Array: Int16Array = new Int16Array([-32768, 0, 32767]);
      plainArray.setValueAt(0, int16Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(int16Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2800
     * @tc.name      testPlainArray08Chapter0028
     * @tc.desc      Set value with value as Uint16Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0028';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Uint16Array> = new PlainArray();
      plainArray.add(1, new Uint16Array([0]));
      let uint16Array: Uint16Array = new Uint16Array([0, 32768, 65535]);
      plainArray.setValueAt(0, uint16Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(uint16Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_2900
     * @tc.name      testPlainArray08Chapter0029
     * @tc.desc      Set value with value as Int32Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0029';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Int32Array> = new PlainArray();
      plainArray.add(1, new Int32Array([0]));
      let int32Array: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      plainArray.setValueAt(0, int32Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(int32Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3000
     * @tc.name      testPlainArray08Chapter0030
     * @tc.desc      Set value with value as Uint32Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0030';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Uint32Array> = new PlainArray();
      plainArray.add(1, new Uint32Array([0]));
      let uint32Array: Uint32Array = new Uint32Array([0, 2147483648, 4294967295]);
      plainArray.setValueAt(0, uint32Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(uint32Array);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3100
     * @tc.name      testPlainArray08Chapter0031
     * @tc.desc      Set value with value as Float64Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0031';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Float64Array> = new PlainArray();
      plainArray.add(1, new Float64Array([0]));
      let float64Array: Float64Array = new Float64Array([-1.7976931348623157e308, 0, 1.7976931348623157e308]);
      plainArray.setValueAt(0, float64Array);
      expect(plainArray.getValueAt(0)).assertDeepEquals(float64Array);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3200
     * @tc.name      testPlainArray08Chapter0032
     * @tc.desc      Set value with value as Int8Array containing Infinity and NaN (should convert to 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0032';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Int8Array> = new PlainArray();
      plainArray.add(1, new Int8Array([0, 0, 0]));
      let int8Array: Int8Array = new Int8Array([Infinity, -Infinity, NaN]);
      plainArray.setValueAt(0, int8Array);
      let result: Int8Array = plainArray.getValueAt(0) as Int8Array;
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3300
     * @tc.name      testPlainArray08Chapter0033
     * @tc.desc      Set value with value as Uint8ClampedArray containing out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0033';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Uint8ClampedArray> = new PlainArray();
      plainArray.add(1, new Uint8ClampedArray([0]));
      let clampedArray: Uint8ClampedArray = new Uint8ClampedArray([-1, 128, 256, 300]);
      plainArray.setValueAt(0, clampedArray);
      let result: Uint8ClampedArray = plainArray.getValueAt(0) as Uint8ClampedArray;
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(255);
      expect(result[3]).assertEqual(255);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3400
     * @tc.name      testPlainArray08Chapter0034
     * @tc.desc      Set value with value as string containing repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0034';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "test");
      let repeatedSpecial: string = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      plainArray.setValueAt(0, repeatedSpecial);
      expect(plainArray.getValueAt(0)).assertEqual(repeatedSpecial);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3500
     * @tc.name      testPlainArray08Chapter0035
     * @tc.desc      Set value with value as treeString (large JSON-like string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0035';
      console.log(TAG + ' start');
      let initTreeString: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "initial");
      let treeString: string = initTreeString(100);
      plainArray.setValueAt(0, treeString);
      expect(plainArray.getValueAt(0)).assertEqual(treeString);
      expect(plainArray.getValueAt(0).length).assertEqual(treeString.length);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3600
     * @tc.name      testPlainArray08Chapter0036
     * @tc.desc      Set value with value as sliceString (substring result)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0036';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "initial");
      let originalStr: string = "{k1:value1,k2:value2}";
      let sliceStr: string = originalStr.substring(0, originalStr.length - 2);
      plainArray.setValueAt(0, sliceStr);
      expect(plainArray.getValueAt(0)).assertEqual(sliceStr);
      expect(plainArray.getValueAt(0).length).assertEqual(originalStr.length - 2);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3700
     * @tc.name      testPlainArray08Chapter0037
     * @tc.desc      Set value with boolean type and test falsy values conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0037';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, true);
      plainArray.setValueAt(0, false);
      expect(plainArray.getValueAt(0)).assertEqual(false);

      plainArray.setValueAt(0, true);
      expect(plainArray.getValueAt(0)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3800
     * @tc.name      testPlainArray08Chapter0038
     * @tc.desc      Set value with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0038';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      plainArray.add(1, [1]);
      let zeroArray: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      plainArray.setValueAt(0, zeroArray);
      let result: Array<number> = plainArray.getValueAt(0) as Array<number>;
      expect(result.length).assertEqual(zeroArray.length);
      expect(result).assertDeepEquals(zeroArray);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_3900
     * @tc.name      testPlainArray08Chapter0039
     * @tc.desc      Set value with array containing negative numbers for conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0039';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      plainArray.add(1, [1]);
      let negativeArray: Array<number> = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      plainArray.setValueAt(0, negativeArray);
      let result: Array<number> = plainArray.getValueAt(0) as Array<number>;
      expect(result).assertDeepEquals(negativeArray);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4000
     * @tc.name      testPlainArray08Chapter0040
     * @tc.desc      Set value with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0040';
      console.log(TAG + ' start');
      let plainArray: PlainArray<Array<number>> = new PlainArray();
      plainArray.add(1, [1]);
      let overflowArray: Array<number> = [256, 65536, 32768];
      plainArray.setValueAt(0, overflowArray);
      let result: Array<number> = plainArray.getValueAt(0) as Array<number>;
      expect(result).assertDeepEquals(overflowArray);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4100
     * @tc.name      testPlainArray08Chapter0041
     * @tc.desc      Set value with object containing nested structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0041';
      console.log(TAG + ' start');

      interface NestedObject {
        a: number;
        b: GeneratedTypeLiteralInterface_1;
      }

      let plainArray: PlainArray<NestedObject> = new PlainArray();
      plainArray.add(1, { a: 1, b: { c: 2, d: { e: 3 } } });
      let nestedObj: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      plainArray.setValueAt(0, nestedObj);
      expect(plainArray.getValueAt(0)).assertDeepEquals(nestedObj);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4200
     * @tc.name      testPlainArray08Chapter0042
     * @tc.desc      Set value with object containing undefined properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0042';
      console.log(TAG + ' start');

      interface ObjectWithUndefined {
        a?: number;
        b: number;
      }

      let plainArray: PlainArray<ObjectWithUndefined> = new PlainArray();
      plainArray.add(1, { b: 1 });
      let objWithUndefined: ObjectWithUndefined = { a: undefined, b: 1 };
      plainArray.setValueAt(0, objWithUndefined);
      let result: ObjectWithUndefined = plainArray.getValueAt(0) as ObjectWithUndefined;
      expect(result.a).assertUndefined();
      expect(result.b).assertEqual(1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4300
     * @tc.name      testPlainArray08Chapter0043
     * @tc.desc      Set value with object containing null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0043';
      console.log(TAG + ' start');

      interface ObjectWithNull {
        a: number | null;
        b: number;
      }

      let plainArray: PlainArray<ObjectWithNull> = new PlainArray();
      plainArray.add(1, { a: 1, b: 1 });
      let objWithNull: ObjectWithNull = { a: null, b: 1 };
      plainArray.setValueAt(0, objWithNull);
      let result: ObjectWithNull = plainArray.getValueAt(0) as ObjectWithNull;
      expect(result.a).assertNull();
      expect(result.b).assertEqual(1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4400
     * @tc.name      testPlainArray08Chapter0044
     * @tc.desc      Set value with object containing NaN and Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0044';
      console.log(TAG + ' start');

      interface ObjectWithSpecial {
        a: number;
        b: number;
        c: number;
        d: number;
      }

      let plainArray: PlainArray<ObjectWithSpecial> = new PlainArray();
      plainArray.add(1, {
        a: 0,
        b: 0,
        c: 0,
        d: 1
      });
      let objWithSpecial: ObjectWithSpecial = {
        a: NaN,
        b: Infinity,
        c: -Infinity,
        d: 1
      };
      plainArray.setValueAt(0, objWithSpecial);
      let result: ObjectWithSpecial = plainArray.getValueAt(0) as ObjectWithSpecial;
      expect(isNaN(result.a)).assertTrue();
      expect(result.b).assertEqual(Infinity);
      expect(result.c).assertEqual(-Infinity);
      expect(result.d).assertEqual(1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4500
     * @tc.name      testPlainArray08Chapter0045
     * @tc.desc      Set value with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0045';
      console.log(TAG + ' start');

      interface ObjectWithBuffer {
        buffer: ArrayBuffer;
      }

      let plainArray: PlainArray<ObjectWithBuffer> = new PlainArray();
      plainArray.add(1, { buffer: new ArrayBuffer(1) });
      let objWithBuffer: ObjectWithBuffer = { buffer: new ArrayBuffer(16) };
      plainArray.setValueAt(0, objWithBuffer);
      let result: ObjectWithBuffer = plainArray.getValueAt(0) as ObjectWithBuffer;
      expect(result.buffer instanceof ArrayBuffer).assertTrue();
      expect(result.buffer.byteLength).assertEqual(16);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4600
     * @tc.name      testPlainArray08Chapter0046
     * @tc.desc      Set value with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0046';
      console.log(TAG + ' start');

      interface EmptyObject {}

      let plainArray: PlainArray<EmptyObject> = new PlainArray();
      plainArray.add(1, {} as EmptyObject);
      let emptyObj: EmptyObject = {} as EmptyObject;
      plainArray.setValueAt(0, emptyObj);
      let result: EmptyObject = plainArray.getValueAt(0) as EmptyObject;
      expect(Object.keys(result).length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4700
     * @tc.name      testPlainArray08Chapter0047
     * @tc.desc      Set value with object containing TypedArray properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0047';
      console.log(TAG + ' start');

      interface ObjectWithTypedArray {
        buffer: Uint8Array;
      }

      let plainArray: PlainArray<ObjectWithTypedArray> = new PlainArray();
      plainArray.add(1, { buffer: new Uint8Array([0]) });
      let objWithTypedArray: ObjectWithTypedArray = {
        buffer: new Uint8Array([72, 101, 108, 108, 111])
      };
      plainArray.setValueAt(0, objWithTypedArray);
      let result: ObjectWithTypedArray = plainArray.getValueAt(0) as ObjectWithTypedArray;
      expect(result.buffer instanceof Uint8Array).assertTrue();
      expect(result.buffer.length).assertEqual(5);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4800
     * @tc.name      testPlainArray08Chapter0048
     * @tc.desc      Test number type with exponent operator (2**3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0048';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      let exponentValue: number = Math.pow(2, 3);
      plainArray.setValueAt(0, exponentValue);
      expect(plainArray.getValueAt(0)).assertEqual(8);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_4900
     * @tc.name      testPlainArray08Chapter0049
     * @tc.desc      Test number type with 32-bit hex value (0x01020304)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0049';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(1, 0);
      let hex32Value: number = 0x01020304;
      plainArray.setValueAt(0, hex32Value);
      expect(plainArray.getValueAt(0)).assertEqual(0x01020304);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5000
     * @tc.name      testPlainArray08Chapter0050
     * @tc.desc      Test array with string keys (non-numeric indices)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0050';
      console.log(TAG + ' start');

      interface ArrayLikeObject {
        abc: number;
        aaa: number;
        __0: number;
      }

      let plainArray: PlainArray<ArrayLikeObject> = new PlainArray();
      plainArray.add(1, { abc: 0, aaa: 0, __0: 0 });
      let arrayLike: ArrayLikeObject = {
        abc: 111,
        aaa: 222,
        __0: 333
      };
      plainArray.setValueAt(0, arrayLike);
      let result: ArrayLikeObject = plainArray.getValueAt(0) as ArrayLikeObject;
      expect(result.abc).assertEqual(111);
      expect(result.aaa).assertEqual(222);
      expect(result.__0).assertEqual(333);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5100
     * @tc.name      testPlainArray08Chapter0051
     * @tc.desc      Test object created with Object.create (prototype chain)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0051';
      console.log(TAG + ' start');

      interface TestObject {
        prop1: number;
        prop2: string;
        prop3: boolean;
      }

      let plainArray: PlainArray<TestObject> = new PlainArray();
      plainArray.add(1, { prop1: 0, prop2: "", prop3: false });

      let testObject: TestObject = {
        prop1: 100,
        prop2: "test",
        prop3: true
      };
      plainArray.setValueAt(0, testObject);
      let result: TestObject = plainArray.getValueAt(0) as TestObject;
      expect(result.prop1).assertEqual(100);
      expect(result.prop2).assertEqual("test");
      expect(result.prop3).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5200
     * @tc.name      testPlainArray08Chapter0052
     * @tc.desc      Get string representation of empty PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0052';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      let result = plainArray.toString();
      expect(result).assertEqual("");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5300
     * @tc.name      testPlainArray08Chapter0053
     * @tc.desc      Get string representation of PlainArray with single key-value pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0053';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "squirrel");
      let result = plainArray.toString();
      expect(result).assertEqual("1:squirrel");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5400
     * @tc.name      testPlainArray08Chapter0054
     * @tc.desc      Get string representation of PlainArray with multiple key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0054';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "squirrel");
      plainArray.add(2, "sparrow");
      plainArray.add(3, "eagle");
      let result = plainArray.toString();
      expect(result).assertEqual("1:squirrel,2:sparrow,3:eagle");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5500
     * @tc.name      testPlainArray08Chapter0055
     * @tc.desc      Get string representation of PlainArray with number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0055';
      console.log(TAG + ' start');
      let plainArray: PlainArray<number> = new PlainArray();
      plainArray.add(10, 100);
      plainArray.add(20, 200);
      plainArray.add(30, 300);
      let result = plainArray.toString();
      expect(result).assertEqual("10:100,20:200,30:300");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5600
     * @tc.name      testPlainArray08Chapter0056
     * @tc.desc      Get string representation of PlainArray with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0056';
      console.log(TAG + ' start');
      let plainArray: PlainArray<boolean> = new PlainArray();
      plainArray.add(1, true);
      plainArray.add(2, false);
      plainArray.add(3, true);
      let result = plainArray.toString();
      expect(result).assertEqual("1:true,2:false,3:true");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5700
     * @tc.name      testPlainArray08Chapter0057
     * @tc.desc      Get string representation of PlainArray with empty string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0057';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "");
      plainArray.add(2, "");
      plainArray.add(3, "test");
      let result = plainArray.toString();
      expect(result).assertEqual("1:,2:,3:test");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5800
     * @tc.name      testPlainArray08Chapter0058
     * @tc.desc      Get string representation of PlainArray with special characters in values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0058';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "value:with:colon");
      plainArray.add(2, "value,with,comma");
      plainArray.add(3, "value with space");
      let result = plainArray.toString();
      expect(result).assertEqual("1:value:with:colon,2:value,with,comma,3:value with space");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_5900
     * @tc.name      testPlainArray08Chapter0059
     * @tc.desc      Get string representation of PlainArray with negative keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0059';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(-1, "negative one");
      plainArray.add(0, "zero");
      plainArray.add(1, "positive one");
      let result = plainArray.toString();
      expect(result).assertEqual("-1:negative one,0:zero,1:positive one");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6000
     * @tc.name      testPlainArray08Chapter0060
     * @tc.desc      Get string representation of PlainArray with large keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0060';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(2147483647, "max int");
      plainArray.add(-2147483648, "min int");
      let result = plainArray.toString();
      expect(result).assertEqual("-2147483648:min int,2147483647:max int");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6100
     * @tc.name      testPlainArray08Chapter0061
     * @tc.desc      Get string representation of PlainArray after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0061';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "first");
      plainArray.add(2, "second");
      plainArray.add(3, "third");
      plainArray.remove(2);
      let result = plainArray.toString();
      expect(result).assertEqual("1:first,3:third");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6200
     * @tc.name      testPlainArray08Chapter0062
     * @tc.desc      Get string representation of PlainArray after clearing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0062';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "item1");
      plainArray.add(2, "item2");
      plainArray.clear();
      let result = plainArray.toString();
      expect(result).assertEqual("");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6300
     * @tc.name      testPlainArray08Chapter0063
     * @tc.desc      Get string representation of PlainArray with mixed value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0063';
      console.log(TAG + ' start');
      type MixedValue = string | number | boolean;
      let plainArray: PlainArray<MixedValue> = new PlainArray();
      plainArray.add(1, "string");
      plainArray.add(2, 123);
      plainArray.add(3, true);
      let result = plainArray.toString();
      expect(result).assertEqual("1:string,2:123,3:true");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6400
     * @tc.name      testPlainArray08Chapter0064
     * @tc.desc      Get string representation of PlainArray after modifying values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0064';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "initial");
      plainArray.add(2, "values");
      plainArray.setValueAt(0, "updated");
      plainArray.setValueAt(1, "modified");
      let result = plainArray.toString();
      expect(result).assertEqual("1:updated,2:modified");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6500
     * @tc.name      testPlainArray08Chapter0065
     * @tc.desc      Get string representation of PlainArray with single large string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0065';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      let largeString = "a".repeat(100);
      plainArray.add(1, largeString);
      let result = plainArray.toString();
      expect(result).assertEqual("1:" + largeString);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6600
     * @tc.name      testPlainArray08Chapter0066
     * @tc.desc      Get string representation of PlainArray with emoji characters in values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0066';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "👆");
      plainArray.add(2, "😼");
      plainArray.add(3, "🎅");
      let result = plainArray.toString();
      expect(result).assertEqual("1:👆,2:😼,3:🎅");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6700
     * @tc.name      testPlainArray08Chapter0067
     * @tc.desc      Get string representation of PlainArray with escape characters in values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0067';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(1, "line1\nline2");
      plainArray.add(2, "tab\tcharacter");
      plainArray.add(3, "back\\slash");
      let result = plainArray.toString();
      expect(result).assertEqual("1:line1\nline2,2:tab\tcharacter,3:back\\slash");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6800
     * @tc.name      testPlainArray08Chapter0068
     * @tc.desc      Get string representation of PlainArray with keys in random order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0068';
      console.log(TAG + ' start');
      let plainArray: PlainArray<string> = new PlainArray();
      plainArray.add(100, "hundred");
      plainArray.add(50, "fifty");
      plainArray.add(75, "seventy-five");
      let result = plainArray.toString();
      expect(result).assertEqual("50:fifty,75:seventy-five,100:hundred");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_6900
     * @tc.name      testPlainArray08Chapter0069
     * @tc.desc      Test toString method binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0069';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray();
      let toStringFunc = plainArray.toString;

      let methodExecuted = false;
      let errorCaught = false;
      let errorCode: number | undefined;

      try {
        let result = toStringFunc();
        methodExecuted = true;
      } catch (error) {
        errorCaught = true;
        errorCode = error.code;
      }

      expect(methodExecuted).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorCode).assertEqual(10200011);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7000
     * @tc.name      testPlainArray08Chapter0070
     * @tc.desc      Clear a PlainArray with elements and verify it becomes empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0070';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "squirrel");
      plainArray.add(2, "sparrow");
      plainArray.clear();
      let isEmpty = plainArray.isEmpty();
      expect(isEmpty).assertEqual(true);
      let length = plainArray.length;
      expect(length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7100
     * @tc.name      testPlainArray08Chapter0071
     * @tc.desc      Clear an empty PlainArray and verify length remains zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0071';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.clear();
      let isEmpty = plainArray.isEmpty();
      expect(isEmpty).assertEqual(true);
      let length = plainArray.length;
      expect(length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7200
     * @tc.name      testPlainArray08Chapter0072
     * @tc.desc      Clear PlainArray with multiple data types after adding elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0072';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-128, "minInt8");
      plainArray.add(127, "maxInt8");
      plainArray.add(0, "zero");
      plainArray.add(100, "hundred");
      plainArray.add(255, "maxUint8");
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7300
     * @tc.name      testPlainArray08Chapter0073
     * @tc.desc      Clear PlainArray and verify can add new elements after clearing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0073';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 100);
      plainArray.add(2, 200);
      plainArray.add(3, 300);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
      plainArray.add(4, 400);
      plainArray.add(5, 500);
      expect(plainArray.isEmpty()).assertEqual(false);
      expect(plainArray.length).assertEqual(2);
      expect(plainArray.get(4)).assertEqual(400);
      expect(plainArray.get(5)).assertEqual(500);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7400
     * @tc.name      testPlainArray08Chapter0074
     * @tc.desc      Clear PlainArray with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0074';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i < 1000; i++) {
        plainArray.add(i, "value" + i);
      }
      expect(plainArray.length).assertEqual(1000);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7500
     * @tc.name      testPlainArray08Chapter0075
     * @tc.desc      Clear PlainArray multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0075';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<boolean>();
      plainArray.add(1, true);
      plainArray.add(2, false);
      plainArray.clear();
      plainArray.clear();
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7600
     * @tc.name      testPlainArray08Chapter0076
     * @tc.desc      Clear PlainArray with negative keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0076';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-1, "negativeOne");
      plainArray.add(-100, "negativeHundred");
      plainArray.add(-32768, "minInt16");
      expect(plainArray.length).assertEqual(3);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7700
     * @tc.name      testPlainArray08Chapter0077
     * @tc.desc      Clear PlainArray with special number keys within small integer range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0077';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(0, 0);
      plainArray.add(2147483647, 2147483647);
      plainArray.add(-2147483648, -2147483648);
      plainArray.add(100, 100);
      expect(plainArray.length).assertEqual(4);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7800
     * @tc.name      testPlainArray08Chapter0078
     * @tc.desc      Clear PlainArray with integer keys (floating point keys converted to integers)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0078';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      plainArray.add(3, "three");
      plainArray.add(0, "zero");
      plainArray.add(1000000, "oneMillion");
      expect(plainArray.length).assertEqual(4);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_7900
     * @tc.name      testPlainArray08Chapter0079
     * @tc.desc      Verify isEmpty returns true after clearing PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0079';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "test1");
      plainArray.add(2, "test2");
      plainArray.add(3, "test3");
      expect(plainArray.isEmpty()).assertEqual(false);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8000
     * @tc.name      testPlainArray08Chapter0080
     * @tc.desc      Verify length is zero after clearing PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0080';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 50; i++) {
        plainArray.add(i, i * 10);
      }
      expect(plainArray.length).assertEqual(50);
      plainArray.clear();
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8100
     * @tc.name      testPlainArray08Chapter0081
     * @tc.desc      Clear PlainArray and verify get returns undefined for previously existing keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0081';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(10, "ten");
      plainArray.add(20, "twenty");
      plainArray.add(30, "thirty");
      expect(plainArray.get(10)).assertEqual("ten");
      expect(plainArray.get(20)).assertEqual("twenty");
      plainArray.clear();
      expect(plainArray.get(10)).assertUndefined();
      expect(plainArray.get(20)).assertUndefined();
      expect(plainArray.get(30)).assertUndefined();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8200
     * @tc.name      testPlainArray08Chapter0082
     * @tc.desc      Clear PlainArray with string values of various types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0082';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "");
      plainArray.add(2, "null");
      plainArray.add(3, "undefined");
      plainArray.add(4, "NaN");
      plainArray.add(5, "Infinity");
      plainArray.add(6, "Hello\tWorld\n");
      plainArray.add(7, "Special: !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(plainArray.length).assertEqual(7);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8300
     * @tc.name      testPlainArray08Chapter0083
     * @tc.desc      Clear PlainArray with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0083';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<boolean>();
      plainArray.add(1, true);
      plainArray.add(2, false);
      plainArray.add(3, true);
      plainArray.add(4, false);
      expect(plainArray.length).assertEqual(4);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8400
     * @tc.name      testPlainArray08Chapter0084
     * @tc.desc      Clear PlainArray with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0084';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<object>();
      plainArray.add(1, { name: "object1", value: 100 });
      plainArray.add(2, { name: "object2", value: 200 });
      plainArray.add(3, { name: "object3", value: 300 });
      expect(plainArray.length).assertEqual(3);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8500
     * @tc.name      testPlainArray08Chapter0085
     * @tc.desc      Clear PlainArray and verify iteration returns no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0085';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 100);
      plainArray.add(2, 200);
      plainArray.add(3, 300);
      plainArray.clear();
      let count = 0;
      for (let i = 0; i < plainArray.length; i++) {
        count++;
      }
      expect(count).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8600
     * @tc.name      testPlainArray08Chapter0086
     * @tc.desc      Clear PlainArray and verify has returns false for all keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0086';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(100, "hundred");
      plainArray.add(200, "twoHundred");
      plainArray.add(300, "threeHundred");
      expect(plainArray.has(100)).assertEqual(true);
      expect(plainArray.has(200)).assertEqual(true);
      plainArray.clear();
      expect(plainArray.has(100)).assertEqual(false);
      expect(plainArray.has(200)).assertEqual(false);
      expect(plainArray.has(300)).assertEqual(false);
      expect(plainArray.has(999)).assertEqual(false);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8700
     * @tc.name      testPlainArray08Chapter0087
     * @tc.desc      Clear PlainArray and verify clone creates empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0087';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      plainArray.add(2, "two");
      plainArray.add(3, "three");
      plainArray.clear();
      let clonedArray = plainArray.clone();
      expect(clonedArray.isEmpty()).assertEqual(true);
      expect(clonedArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8800
     * @tc.name      testPlainArray08Chapter0088
     * @tc.desc      Clear PlainArray with duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0088';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "duplicate");
      plainArray.add(2, "duplicate");
      plainArray.add(3, "duplicate");
      plainArray.add(4, "duplicate");
      expect(plainArray.length).assertEqual(4);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_8900
     * @tc.name      testPlainArray08Chapter0089
     * @tc.desc      Clear PlainArray with values from typed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0089';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      let int8Array = new Int8Array([-128, 0, 127]);
      let uint8Array = new Uint8Array([0, 128, 255]);
      plainArray.add(1, int8Array[0]);
      plainArray.add(2, int8Array[1]);
      plainArray.add(3, int8Array[2]);
      plainArray.add(4, uint8Array[0]);
      plainArray.add(5, uint8Array[1]);
      plainArray.add(6, uint8Array[2]);
      expect(plainArray.length).assertEqual(6);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9000
     * @tc.name      testPlainArray08Chapter0090
     * @tc.desc      Clear PlainArray after removing some elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0090';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      plainArray.add(2, "two");
      plainArray.add(3, "three");
      plainArray.add(4, "four");
      plainArray.add(5, "five");
      plainArray.remove(2);
      plainArray.remove(4);
      expect(plainArray.length).assertEqual(3);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9100
     * @tc.name      testPlainArray08Chapter0091
     * @tc.desc      Clear PlainArray and verify getIndexOfKey returns -1 for all keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0091';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(10, 100);
      plainArray.add(20, 200);
      plainArray.add(30, 300);
      expect(plainArray.getIndexOfKey(10)).assertEqual(0);
      expect(plainArray.getIndexOfKey(20)).assertEqual(1);
      plainArray.clear();
      expect(plainArray.getIndexOfKey(10)).assertEqual(-1);
      expect(plainArray.getIndexOfKey(20)).assertEqual(-1);
      expect(plainArray.getIndexOfKey(30)).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9200
     * @tc.name      testPlainArray08Chapter0092
     * @tc.desc      Clear PlainArray and verify getIndexOfValue returns -1 for all values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0092';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "apple");
      plainArray.add(2, "banana");
      plainArray.add(3, "cherry");
      expect(plainArray.getIndexOfValue("apple")).assertEqual(0);
      expect(plainArray.getIndexOfValue("banana")).assertEqual(1);
      plainArray.clear();
      expect(plainArray.getIndexOfValue("apple")).assertEqual(-1);
      expect(plainArray.getIndexOfValue("banana")).assertEqual(-1);
      expect(plainArray.getIndexOfValue("cherry")).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9300
     * @tc.name      testPlainArray08Chapter0093
     * @tc.desc      Clear PlainArray and verify getKeyAt returns undefined for all indices when container is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0093';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(5, 50);
      plainArray.add(10, 100);
      plainArray.add(15, 150);
      expect(plainArray.getKeyAt(0)).assertEqual(5);
      expect(plainArray.getKeyAt(1)).assertEqual(10);
      plainArray.clear();
      expect(plainArray.getKeyAt(0)).assertUndefined();
      expect(plainArray.getKeyAt(1)).assertUndefined();
      expect(plainArray.getKeyAt(2)).assertUndefined();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9400
     * @tc.name      testPlainArray08Chapter0094
     * @tc.desc      Clear PlainArray and verify getValueAt throws error when container is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0094';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "first");
      plainArray.add(2, "second");
      plainArray.add(3, "third");
      expect(plainArray.getValueAt(0)).assertEqual("first");
      expect(plainArray.getValueAt(1)).assertEqual("second");
      plainArray.clear();
      let hasError = false;
      try {
        plainArray.getValueAt(0);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST08_9500
     * @tc.name      testPlainArray08Chapter0095
     * @tc.desc      Clear PlainArray and verify removeAt does nothing when container is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray08Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray08Chapter0095';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 100);
      plainArray.add(2, 200);
      plainArray.clear();
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
      plainArray.removeAt(0);
      expect(plainArray.isEmpty()).assertEqual(true);
      expect(plainArray.length).assertEqual(0);
    });
  })
}
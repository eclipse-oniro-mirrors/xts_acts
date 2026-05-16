import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest09() {
  describe('VectorTest09', () => {
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
     * @tc.number    SUB_VECTOR_TEST09_0100
     * @tc.name      testVector09Chapter0001
     * @tc.desc      [Symbol.iterator] Uint16Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0001';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([NaN]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(0); // Uint16Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0200
     * @tc.name      testVector09Chapter0002
     * @tc.desc      [Symbol.iterator] Int32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0002';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([Infinity]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(0); // Int32Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0300
     * @tc.name      testVector09Chapter0003
     * @tc.desc      [Symbol.iterator] Int32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0003';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([-Infinity]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(0); // Int32Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0400
     * @tc.name      testVector09Chapter0004
     * @tc.desc      [Symbol.iterator] Int32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0004';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([NaN]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(0); // Int32Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0500
     * @tc.name      testVector09Chapter0005
     * @tc.desc      [Symbol.iterator] Uint32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0005';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([Infinity]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(0); // Uint32Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0600
     * @tc.name      testVector09Chapter0006
     * @tc.desc      [Symbol.iterator] Uint32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0006';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([-Infinity]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(0); // Uint32Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0700
     * @tc.name      testVector09Chapter0007
     * @tc.desc      [Symbol.iterator] Uint32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0007';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([NaN]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(0); // Uint32Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0800
     * @tc.name      testVector09Chapter0008
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0008';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([Infinity]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(255); // Uint8ClampedArray Infinity钳位：Infinity → 255
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_0900
     * @tc.name      testVector09Chapter0009
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0009';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([-Infinity]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(0); // Uint8ClampedArray -Infinity钳位：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1000
     * @tc.name      testVector09Chapter0010
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0010';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([NaN]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(0); // Uint8ClampedArray NaN钳位：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1100
     * @tc.name      testVector09Chapter0011
     * @tc.desc      [Symbol.iterator] string(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0011';
      let vector = new Vector<string | undefined>();
      let strVal = undefined;
      vector.add(strVal);
      const result: (string | undefined)[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1200
     * @tc.name      testVector09Chapter0012
     * @tc.desc      [Symbol.iterator] string(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0012';
      let vector = new Vector<string | null>();
      let strVal = null;
      vector.add(strVal);
      const result: (string | null)[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1300
     * @tc.name      testVector09Chapter0013
     * @tc.desc      [Symbol.iterator] string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0013';
      let vector = new Vector<string>();
      let strVal = "";
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1400
     * @tc.name      testVector09Chapter0014
     * @tc.desc      [Symbol.iterator] string("!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0014';
      let vector = new Vector<string>();
      let strVal = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1500
     * @tc.name      testVector09Chapter0015
     * @tc.desc      [Symbol.iterator] string("!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0015';
      let vector = new Vector<string>();
      let strVal = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1600
     * @tc.name      testVector09Chapter0016
     * @tc.desc      [Symbol.iterator] string(!!""##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0016';
      let vector = new Vector<string>();
      let strVal = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1700
     * @tc.name      testVector09Chapter0017
     * @tc.desc      [Symbol.iterator] string(\a) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0017';
      let vector = new Vector<string>();
      let strVal = '\u0007';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1800
     * @tc.name      testVector09Chapter0018
     * @tc.desc      [Symbol.iterator] string(\b) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0018';
      let vector = new Vector<string>();
      let strVal = '\u0008';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_1900
     * @tc.name      testVector09Chapter0019
     * @tc.desc      [Symbol.iterator] number(\ddd) test (0o47)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0019';
      let vector = new Vector<number>();
      let numVal = 0o47;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2000
     * @tc.name      testVector09Chapter0020
     * @tc.desc      [Symbol.iterator] string(\xhh) test (\x07)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0020';
      let vector = new Vector<string>();
      let strVal = '\x07';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2100
     * @tc.name      testVector09Chapter0021
     * @tc.desc      [Symbol.iterator] string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0021';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2200
     * @tc.name      testVector09Chapter0022
     * @tc.desc      [Symbol.iterator] string('\ud83d\udc7f') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0022';
      let vector = new Vector<string>();
      let strVal = '\ud83d\udc7f';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2300
     * @tc.name      testVector09Chapter0023
     * @tc.desc      [Symbol.iterator] string('\udc04 \ud83d') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0023';
      let vector = new Vector<string>();
      let strVal = '\udc04 \ud83d';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2400
     * @tc.name      testVector09Chapter0024
     * @tc.desc      [Symbol.iterator] string('0') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0024';
      let vector = new Vector<string>();
      let strVal = '0';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2500
     * @tc.name      testVector09Chapter0025
     * @tc.desc      [Symbol.iterator] string('NaN') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0025';
      let vector = new Vector<string>();
      let strVal = 'NaN';
      vector.add(strVal);
      const result: string[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(strVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2600
     * @tc.name      testVector09Chapter0026
     * @tc.desc      [Symbol.iterator] number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0026';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2700
     * @tc.name      testVector09Chapter0027
     * @tc.desc      [Symbol.iterator] number(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0027';
      let vector = new Vector<number | undefined>();
      let numVal = undefined;
      vector.add(numVal);
      const result: (number | undefined)[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2800
     * @tc.name      testVector09Chapter0028
     * @tc.desc      [Symbol.iterator] number(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0028';
      let vector = new Vector<number>();
      let numVal = NaN;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(isNaN(result[0])).assertTrue();
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_2900
     * @tc.name      testVector09Chapter0029
     * @tc.desc      [Symbol.iterator] number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0029';
      let vector = new Vector<number>();
      let numVal = -0;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3000
     * @tc.name      testVector09Chapter0030
     * @tc.desc      [Symbol.iterator] number(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0030';
      let vector = new Vector<number>();
      let numVal = Infinity;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3100
     * @tc.name      testVector09Chapter0031
     * @tc.desc      [Symbol.iterator] number(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0031';
      let vector = new Vector<number>();
      let numVal = -Infinity;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3200
     * @tc.name      testVector09Chapter0032
     * @tc.desc      [Symbol.iterator] number(1.7976931348623157e+308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0032';
      let vector = new Vector<number>();
      let numVal = 1.7976931348623157e+308;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3300
     * @tc.name      testVector09Chapter0033
     * @tc.desc      [Symbol.iterator] number(5e-324) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0033';
      let vector = new Vector<number>();
      let numVal = 5e-324;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3400
     * @tc.name      testVector09Chapter0034
     * @tc.desc      [Symbol.iterator] number(2.220446049250313e-16) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0034';
      let vector = new Vector<number>();
      let numVal = 2.220446049250313e-16;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3500
     * @tc.name      testVector09Chapter0035
     * @tc.desc      [Symbol.iterator] number(2**53-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0035';
      let vector = new Vector<number>();
      let numVal = 2**53 - 1;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3600
     * @tc.name      testVector09Chapter0036
     * @tc.desc      [Symbol.iterator] number(1e3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0036';
      let vector = new Vector<number>();
      let numVal = 1e3;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3700
     * @tc.name      testVector09Chapter0037
     * @tc.desc      [Symbol.iterator] number(2**3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0037';
      let vector = new Vector<number>();
      let numVal = 2**3;
      vector.add(numVal);
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(numVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3800
     * @tc.name      testVector09Chapter0038
     * @tc.desc      [Symbol.iterator] BigInt(9007199254740991n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0038';
      let vector = new Vector<BigInt>();
      let bigIntVal = 9007199254740991n;
      vector.add(bigIntVal);
      const result: BigInt[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigIntVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_3900
     * @tc.name      testVector09Chapter0039
     * @tc.desc      [Symbol.iterator] boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0039';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      const result: boolean[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4000
     * @tc.name      testVector09Chapter0040
     * @tc.desc      [Symbol.iterator] boolean(false) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0040';
      let vector = new Vector<boolean>();
      let boolVal = false;
      vector.add(boolVal);
      const result: boolean[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4100
     * @tc.name      testVector09Chapter0041
     * @tc.desc      [Symbol.iterator] boolean(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0041';
      let vector = new Vector<boolean | null>();
      let boolVal = null;
      vector.add(boolVal);
      const result: (boolean | null)[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4200
     * @tc.name      testVector09Chapter0042
     * @tc.desc      [Symbol.iterator] boolean(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0042';
      let vector = new Vector<boolean | undefined>();
      let boolVal = undefined;
      vector.add(boolVal);
      const result: (boolean | undefined)[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4300
     * @tc.name      testVector09Chapter0043
     * @tc.desc      [Symbol.iterator] boolean(!'s') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0043';
      let vector = new Vector<boolean>();
      let boolVal = !'s';
      vector.add(boolVal);
      const result: boolean[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4400
     * @tc.name      testVector09Chapter0044
     * @tc.desc      [Symbol.iterator] boolean(!0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0044';
      let vector = new Vector<boolean>();
      let boolVal = !0;
      vector.add(boolVal);
      const result: boolean[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(boolVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4500
     * @tc.name      testVector09Chapter0045
     * @tc.desc      [Symbol.iterator] Uint8Array([72,101,108,108,111,87,111,114,108,100,49,50,51,63]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0045';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(72);
      expect(result[0][13]).assertEqual(63);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4600
     * @tc.name      testVector09Chapter0046
     * @tc.desc      [Symbol.iterator] Array(more zero) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0046';
      let vector = new Vector<Array<number>>();
      let arrVal = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      vector.add(arrVal);
      const result: Array<number>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(result[0][9]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4700
     * @tc.name      testVector09Chapter0047
     * @tc.desc      [Symbol.iterator] Array(negative number) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0047';
      let vector = new Vector<Array<number>>();
      let arrVal = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      vector.add(arrVal);
      const result: Array<number>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(result[0][6]).assertEqual(-111);
      expect(result[0][13]).assertEqual(-63);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4800
     * @tc.name      testVector09Chapter0048
     * @tc.desc      [Symbol.iterator] Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0048';
      let vector = new Vector<Array<number>>();
      let arrVal: Array<number> = [];
      arrVal["abc"] = 111;
      arrVal["aaa"] = 72;
      vector.add(arrVal);
      const result: Array<number>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(result[0]["abc"]).assertEqual(111);
      expect(result[0]["aaa"]).assertEqual(72);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_4900
     * @tc.name      testVector09Chapter0049
     * @tc.desc      [Symbol.iterator] Array(has NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0049';
      let vector = new Vector<Array<number>>();
      let arrVal = [72, 101, NaN, Infinity, 108, 111];
      vector.add(arrVal);
      const result: Array<number>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(isNaN(result[0][2])).assertTrue();
      expect(result[0][3]).assertEqual(Infinity);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5000
     * @tc.name      testVector09Chapter0050
     * @tc.desc      [Symbol.iterator] Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0050';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add(arrVal);
      const result: Array<string | number | undefined | boolean | null>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(result[0][1]).assertEqual("abc");
      expect(result[0][2]).assertEqual(true);
      expect(result[0][3]).assertEqual(null);
      expect(result[0][4]).assertEqual(undefined);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5100
     * @tc.name      testVector09Chapter0051
     * @tc.desc      [Symbol.iterator] Array([]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0051';
      let vector = new Vector<Array<number>>();
      let arrVal: Array<number> = [];
      vector.add(arrVal);
      const result: Array<number>[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(arrVal);
      expect(result[0].length).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5200
     * @tc.name      testVector09Chapter0052
     * @tc.desc      [Symbol.iterator] object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0052';
      let vector = new Vector<object>();
      let numArr= [1,2,3];
      class C1{
        a: number=1;
        b: string="test";
        c: number[]=numArr;
      }
      let objVal =new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(1);
      expect((result[0] as C1).b).assertEqual("test");
      expect((result[0] as C1).c).assertEqual(numArr);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5300
     * @tc.name      testVector09Chapter0053
     * @tc.desc      [Symbol.iterator] object({a:1, b:{c:2, d:{e:3}}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0053';
      let vector = new Vector<object>();
      class C3 { e: number = 3; }
      class C2 { c: number = 2; d: C3 = new C3(); }
      class C1 { a: number = 1; b: C2 = new C2(); }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(1);
      expect((result[0] as C1).b.c).assertEqual(2);
      expect((result[0] as C1).b.d.e).assertEqual(3);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5400
     * @tc.name      testVector09Chapter0054
     * @tc.desc      [Symbol.iterator] object({a:1, b:()=>{}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0054';
      let vector = new Vector<object>();
      class C1 {
        a: number = 1;
        b:()=>void= () => {};
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(1);
      expect(typeof (result[0] as C1).b).assertEqual("function");
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5500
     * @tc.name      testVector09Chapter0055
     * @tc.desc      [Symbol.iterator] object.create({parentProp:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0055';
      let vector = new Vector<object>();
      class C1 {
        parentProp: number = 1;
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).parentProp).assertEqual(1);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5600
     * @tc.name      testVector09Chapter0056
     * @tc.desc      [Symbol.iterator] object.defineProperty(obj, 'a', {enumerable:false, value:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0056';
      let vector = new Vector<object>();
      class StaticClass {
        private internalProp: number = 1;
        public publicProp: number = 2
      }
      let objVal =  new StaticClass();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5700
     * @tc.name      testVector09Chapter0057
     * @tc.desc      [Symbol.iterator] object({buffer: new ArrayBuffer(16)}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0057';
      let vector = new Vector<object>();
      class C1 {
        buffer: ArrayBuffer = new ArrayBuffer(16);
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).buffer.byteLength).assertEqual(16);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5800
     * @tc.name      testVector09Chapter0058
     * @tc.desc      [Symbol.iterator] object({view: new DataView(new ArrayBuffer(16))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0058';
      let vector = new Vector<object>();
      class C1 {
        view: DataView = new DataView(new ArrayBuffer(16));
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).view.byteLength).assertEqual(16);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_5900
     * @tc.name      testVector09Chapter0059
     * @tc.desc      [Symbol.iterator] object({}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0059';
      let vector = new Vector<object>();
      class C1 {
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6000
     * @tc.name      testVector09Chapter0060
     * @tc.desc      [Symbol.iterator] object({a:undefined, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0060';
      let vector = new Vector<object>();
      class C1 {
        a: undefined= undefined;
        b: number= 1;
      }
      let objVal =  new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(undefined);
      expect((result[0] as C1).b).assertEqual(1);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6100
     * @tc.name      testVector09Chapter0061
     * @tc.desc      [Symbol.iterator] object({a:null, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0061';
      let vector = new Vector<object>();
      class C1 {
        a: null= null;
        b: number= 1;
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(null);
      expect((result[0] as C1).b).assertEqual(1);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6200
     * @tc.name      testVector09Chapter0062
     * @tc.desc      [Symbol.iterator] object({a:NaN, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0062';
      let vector = new Vector<object>();
      class C1 {
        a: number= NaN;
        b: number= 1;
      }
      let objVal =  new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect(isNaN((result[0] as C1).a)).assertTrue();
      expect((result[0] as C1).b).assertEqual(1);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6300
     * @tc.name      testVector09Chapter0063
     * @tc.desc      [Symbol.iterator] object({a:Infinity, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0063';
      let vector = new Vector<object>();
      class C1 {
        a: number= Infinity;
        b: number= 1;
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).a).assertEqual(Infinity);
      expect((result[0] as C1).b).assertEqual(1);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6400
     * @tc.name      testVector09Chapter0064
     * @tc.desc      [Symbol.iterator] object({buffer: new Uint8Array([72,101,108,108,111])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0064';
      let vector = new Vector<object>();
      class C1 {
        buffer: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).buffer[0]).assertEqual(72);
      expect((result[0] as C1).buffer[4]).assertEqual(111);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6500
     * @tc.name      testVector09Chapter0065
     * @tc.desc      [Symbol.iterator] object({map: new Map([['key1', 'value1'], ['key2', {a:1}]]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0065';
      let vector = new Vector<object>();
      class C2{
        a: number= 1;
      }
      class C1 {
        map: Map<string, string|C2> = new Map<string, string|C2>([['key1', 'value1'], ['key2', { a: 1 }]]);
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).map.get('key1')).assertEqual('value1');
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6600
     * @tc.name      testVector09Chapter0066
     * @tc.desc      [Symbol.iterator] object({set: new Set([1,2,3])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0066';
      let vector = new Vector<object>();
      class C1 {
        set: Set<number> = new Set([1, 2, 3]);
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).set.has(1)).assertTrue();
      expect((result[0] as C1).set.has(3)).assertTrue();
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6700
     * @tc.name      testVector09Chapter0067
     * @tc.desc      [Symbol.iterator] object({promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0067';
      let vector = new Vector<object>();
      class C1 {
        promise: Promise<string> = new Promise(res => setTimeout(() => res('done'), 100));
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect(typeof (result[0] as C1).promise).assertEqual("object");
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST09_6800
     * @tc.name      testVector09Chapter0068
     * @tc.desc      [Symbol.iterator] object({regex: /abc/gi, flags: /def/m}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector09Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector09Chapter0068';
      let vector = new Vector<object>();
      class C1 {
        regex: RegExp = /abc/gi;
        flags: RegExp = /def/m;
      }
      let objVal = new C1();
      vector.add(objVal);
      const result: object[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(objVal);
      expect((result[0] as C1).regex.source).assertEqual("abc");
      expect((result[0] as C1).flags.flags).assertEqual("m");
      expect(result.length).assertEqual(vector.length);
    })

  })
}

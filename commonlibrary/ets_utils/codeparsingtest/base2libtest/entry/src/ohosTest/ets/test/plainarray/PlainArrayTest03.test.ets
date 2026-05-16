import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function PlainArray03Test() {
  describe('PlainArray03Test', () => {
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
     * @tc.number    SUB_PLAINARRAY_TEST03_0100
     * @tc.name      testPlainArray03Chapter0001
     * @tc.desc      Test PlainArray getValueAt with index 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     **/
    it("testPlainArray03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0001';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(0xcafebabe);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0200
     * @tc.name      testPlainArray03Chapter0002
     * @tc.desc      Test PlainArray getValueAt with index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0002';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(0);
      expect(result).assertEqual("a");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0300
     * @tc.name      testPlainArray03Chapter0003
     * @tc.desc      Test PlainArray getValueAt with index -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0003';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(-0);
      expect(result).assertEqual("a");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0400
     * @tc.name      testPlainArray03Chapter0004
     * @tc.desc      Test PlainArray getValueAt with index 1.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0004';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(1.0);
      expect(result).assertEqual("b");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0500
     * @tc.name      testPlainArray03Chapter0005
     * @tc.desc      Test PlainArray getValueAt with index Math.floor(1.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0005';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(Math.floor(1.5));
      expect(result).assertEqual("b");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0600
     * @tc.name      testPlainArray03Chapter0006
     * @tc.desc      Test PlainArray getValueAt with index 2 ** 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0006';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(2**1);
      expect(result).assertEqual("c");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0700
     * @tc.name      testPlainArray03Chapter0007
     * @tc.desc      Test PlainArray getValueAt with index 1e0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0007';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(1e0);
      expect(result).assertEqual("b");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0800
     * @tc.name      testPlainArray03Chapter0008
     * @tc.desc      Test PlainArray getValueAt with index 0x2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0008';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let result = plainArray.getValueAt(0x2);
      expect(result).assertEqual("c");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_0900
     * @tc.name      testPlainArray03Chapter0009
     * @tc.desc      Test PlainArray getValueAt with empty array index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0009';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(0);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1000
     * @tc.name      testPlainArray03Chapter0010
     * @tc.desc      Test PlainArray getValueAt with index 3 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0010';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(3);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1100
     * @tc.name      testPlainArray03Chapter0011
     * @tc.desc      Test PlainArray getValueAt with index 0o3 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0011';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(0o3);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1200
     * @tc.name      testPlainArray03Chapter0012
     * @tc.desc      Test PlainArray getValueAt with index 2 ** 3 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0012';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(2**3);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1300
     * @tc.name      testPlainArray03Chapter0013
     * @tc.desc      Test PlainArray getValueAt with index 1e3 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0013';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(1e3);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1400
     * @tc.name      testPlainArray03Chapter0014
     * @tc.desc      Test PlainArray getValueAt with index 0x0102 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0014';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(0x0102);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1500
     * @tc.name      testPlainArray03Chapter0015
     * @tc.desc      Test PlainArray getValueAt with index 0x01020304 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0015';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(0x01020304);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1600
     * @tc.name      testPlainArray03Chapter0016
     * @tc.desc      Test PlainArray getValueAt with index 127 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0016';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(127);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1700
     * @tc.name      testPlainArray03Chapter0017
     * @tc.desc      Test PlainArray getValueAt with index 32767 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0017';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(32767);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1800
     * @tc.name      testPlainArray03Chapter0018
     * @tc.desc      Test PlainArray getValueAt with index 65535 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0018';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(65535);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_1900
     * @tc.name      testPlainArray03Chapter0019
     * @tc.desc      Test PlainArray getValueAt with index 2147483647 out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0019';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        let result = plainArray.getValueAt(2147483647);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2000
     * @tc.name      testPlainArray03Chapter0020
     * @tc.desc      Test PlainArray getValueAt with index NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0020';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(NaN);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2100
     * @tc.name      testPlainArray03Chapter0021
     * @tc.desc      Test PlainArray getValueAt with index Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0021';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(Infinity);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2200
     * @tc.name      testPlainArray03Chapter0022
     * @tc.desc      Test PlainArray getValueAt with index -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0022';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-Infinity);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2300
     * @tc.name      testPlainArray03Chapter0023
     * @tc.desc      Test PlainArray getValueAt with index Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0023';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(Number.MAX_VALUE);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2400
     * @tc.name      testPlainArray03Chapter0024
     * @tc.desc      Test PlainArray getValueAt with index Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0024';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(Number.MIN_VALUE);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2500
     * @tc.name      testPlainArray03Chapter0025
     * @tc.desc      Test PlainArray getValueAt with index Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0025';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(Number.EPSILON);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2600
     * @tc.name      testPlainArray03Chapter0026
     * @tc.desc      Test PlainArray getValueAt with index Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0026';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(Number.MAX_SAFE_INTEGER);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2700
     * @tc.name      testPlainArray03Chapter0027
     * @tc.desc      Test PlainArray getValueAt with index -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0027';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-1);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(10200001);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2800
     * @tc.name      testPlainArray03Chapter0028
     * @tc.desc      Test PlainArray getValueAt with index -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0028';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-128);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(10200001);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_2900
     * @tc.name      testPlainArray03Chapter0029
     * @tc.desc      Test PlainArray getValueAt with index -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0029';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-32768);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(10200001);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3000
     * @tc.name      testPlainArray03Chapter0030
     * @tc.desc      Test PlainArray getValueAt with index -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0030';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-2147483648);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(10200001);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3100
     * @tc.name      testPlainArray03Chapter0031
     * @tc.desc      Test PlainArray getValueAt with index -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0031';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-9223372036854775808);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3200
     * @tc.name      testPlainArray03Chapter0032
     * @tc.desc      Test PlainArray getValueAt with index 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0032';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(2147483648);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3300
     * @tc.name      testPlainArray03Chapter0033
     * @tc.desc      Test PlainArray getValueAt with index 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0033';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(9223372036854775807);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3400
     * @tc.name      testPlainArray03Chapter0034
     * @tc.desc      Test PlainArray getValueAt with index 1.401298464324817e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0034';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(1.401298464324817e-45);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3500
     * @tc.name      testPlainArray03Chapter0035
     * @tc.desc      Test PlainArray getValueAt with index 3.4028234663852886e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0035';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(3.4028234663852886e+38);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3600
     * @tc.name      testPlainArray03Chapter0036
     * @tc.desc      Test PlainArray getValueAt with index -1.401298464324817e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0036';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-1.401298464324817e-45);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST03_3700
     * @tc.name      testPlainArray03Chapter0037
     * @tc.desc      Test PlainArray getValueAt with index -3.4028234663852886e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0037';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-3.4028234663852886e+38);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_3800
     @tc.name      testPlainArray03Chapter0038
     @tc.desc      Test PlainArray getValueAt with index 4.9406564584124654e-324
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0038';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(4.9406564584124654e-324);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_3900
     @tc.name      testPlainArray03Chapter0039
     @tc.desc      Test PlainArray getValueAt with index 1.7976931348623157e+308
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0039';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(1.7976931348623157e+308);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_4000
     @tc.name      testPlainArray03Chapter0040
     @tc.desc      Test PlainArray getValueAt with index -4.9406564584124654e-324
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0040';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-4.9406564584124654e-324);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_4100
     @tc.name      testPlainArray03Chapter0041
     @tc.desc      Test PlainArray getValueAt with index -1.7976931348623157e+308
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0041';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(-1.7976931348623157e+308);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_4200
     @tc.name      testPlainArray03Chapter0042
     @tc.desc      Test PlainArray getValueAt with index 123.456
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0042';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(123.456);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
    /**
     @tc.number    SUB_PLAINARRAY_TEST03_4300
     @tc.name      testPlainArray03Chapter0043
     @tc.desc      Test PlainArray getValueAt with index 2.5e-2
     @tc.size      MediumTest
     @tc.type      Function
     @tc.level     Level 2
     */
    it("testPlainArray03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray03Chapter0043';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "a");
      plainArray.add(2, "b");
      plainArray.add(3, "c");
      let errorCaught: boolean = false;
      try {
        plainArray.getValueAt(2.5e-2);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });
  })
}
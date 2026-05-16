import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest02() {
  describe('VectorTest02', () => {
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
     * @tc.number    SUB_VECTOR_TEST02_0100
     * @tc.name      testVector02Chapter0001
     * @tc.desc      add string("0") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0001'
      let vector = new Vector<string>();
      let result = vector.add("0")
      expect(result).assertTrue();
      expect(vector[0]).assertEqual("0");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0200
     * @tc.name      testVector02Chapter0002
     * @tc.desc      add string("NAN") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0002'
      let vector = new Vector<string>();
      let result = vector.add("NAN")
      expect(result).assertTrue();
      expect(vector[0]).assertEqual("NAN");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0300
     * @tc.name      testVector02Chapter0003
     * @tc.desc      add treeString() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0003'
      let vector = new Vector<string>();
      const testSize = 50;
      let ans = '[';
      while (ans.length < testSize) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}]';
      vector.add(ans)
      expect(vector[0].length >= testSize).assertTrue();
      expect(vector[0].startsWith("[")).assertTrue();
      expect(vector[0].endsWith("{\"a\":1}]")).assertTrue();
      expect(vector[0].includes("{\"a\":1},")).assertTrue();
    });

    /**
     * @tc.number    SUB_VECTOR_TEST02_0400
     * @tc.name      testVector02Chapter0004
     * @tc.desc      add sliceString() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0004'
      let vector = new Vector<string>();
      const str = "{k1:value1,k2:value2}"
      const loopCount = 100
      let firstResult = ""
      for (let index = 0; index < loopCount; index++) {
        const result = str.substring(0, str.length - 2)
        vector.add(result)
        if (index === 0) {
          firstResult = result
        }
        expect(result).assertEqual(firstResult)
        expect(vector[index]).assertEqual(firstResult)
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0500
     * @tc.name      testVector02Chapter0005
     * @tc.desc      add repeat() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0005'
      let vector = new Vector<string>();
      let str = "a".repeat(1000)
      let result = vector.add(str)
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0700
     * @tc.name      testVector02Chapter0007
     * @tc.desc      add number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0007'
      let vector = new Vector<number>();
      let result = vector.add(0)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0800
     * @tc.name      testVector02Chapter0008
     * @tc.desc      add number(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0008'
      let vector = new Vector<number>();
      let result = vector.add(undefined)
      expect(result).assertTrue();
      expect(vector[0]).assertUndefined();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_0900
     * @tc.name      testVector02Chapter0009
     * @tc.desc      add number(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0009'
      let vector = new Vector<number>();
      let result = vector.add(NaN)
      expect(result).assertTrue();
      expect(vector[0]).assertNaN();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1000
     * @tc.name      testVector02Chapter0010
     * @tc.desc      add number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0010'
      let vector = new Vector<number>();
      let result = vector.add(-0)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1100
     * @tc.name      testVector02Chapter0011
     * @tc.desc      add number(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0011'
      let vector = new Vector<number>();
      let result = vector.add(Infinity)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1200
     * @tc.name      testVector02Chapter0012
     * @tc.desc      add number(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0012'
      let vector = new Vector<number>();
      let result = vector.add(-Infinity)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1300
     * @tc.name      testVector02Chapter0013
     * @tc.desc      add number(double) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0013'
      let vector = new Vector<number>();
      let result = vector.add(Math.floor(1.5))
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1400
     * @tc.name      testVector02Chapter0014
     * @tc.desc      add number(Number.MAX_VALUE) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0014'
      let vector = new Vector<number>();
      let result = vector.add(Number.MAX_VALUE)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(1.7976931348623157E+308);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1500
     * @tc.name      testVector02Chapter0015
     * @tc.desc      add number(Number.MIN_VALUE) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0015'
      let vector = new Vector<number>();
      let result = vector.add(Number.MIN_VALUE)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(5e-324);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1600
     * @tc.name      testVector02Chapter0016
     * @tc.desc      add number(Number.EPSILON) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0016'
      let vector = new Vector<number>();
      let result = vector.add(Number.EPSILON)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(2.220446049250313E-16);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1700
     * @tc.name      testVector02Chapter0017
     * @tc.desc      add number(Number.MAX_SAFE_INTEGER) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0017'
      let vector = new Vector<number>();
      let result = vector.add(Number.MAX_SAFE_INTEGER)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual((2**53) - 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1800
     * @tc.name      testVector02Chapter0018
     * @tc.desc      add number(float) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0018'
      let vector = new Vector<number>();
      let floatMin = 1.40129846432481707e-45
      let result = vector.add(floatMin)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(floatMin);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_1900
     * @tc.name      testVector02Chapter0019
     * @tc.desc      add number(float) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0019'
      let vector = new Vector<number>();
      let floatMax = 3.40282346638528860e+38
      let result = vector.add(floatMax)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(floatMax);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2000
     * @tc.name      testVector02Chapter0020
     * @tc.desc      add number(byte) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0020'
      let vector = new Vector<number>();
      let result = vector.add(-128)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-128);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2100
     * @tc.name      testVector02Chapter0021
     * @tc.desc      add number(byte) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0021'
      let vector = new Vector<number>();
      let result = vector.add(127)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(127);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2200
     * @tc.name      testVector02Chapter0022
     * @tc.desc      add number(short) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0022'
      let vector = new Vector<number>();
      let result = vector.add(-32768)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-32768);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2300
     * @tc.name      testVector02Chapter0023
     * @tc.desc      add number(short) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0023'
      let vector = new Vector<number>();
      let result = vector.add(32767)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(32767);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2400
     * @tc.name      testVector02Chapter0024
     * @tc.desc      add number(int) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0024'
      let vector = new Vector<number>();
      let result = vector.add(-2147483648)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-2147483648);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2500
     * @tc.name      testVector02Chapter0025
     * @tc.desc      add number(int) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0025'
      let vector = new Vector<number>();
      let result = vector.add(2147483647)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2600
     * @tc.name      testVector02Chapter0026
     * @tc.desc      add number(long) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0026'
      let vector = new Vector<number>();
      let result = vector.add(-9223372036854775808)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2700
     * @tc.name      testVector02Chapter0027
     * @tc.desc      add number(long) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0027'
      let vector = new Vector<number>();
      let result = vector.add(9223372036854775807)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2800
     * @tc.name      testVector02Chapter0028
     * @tc.desc      add number(double) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0028'
      let vector = new Vector<number>();
      let result = vector.add(1.7976931348623157e+308)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(1.7976931348623157e+308);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_2900
     * @tc.name      testVector02Chapter0029
     * @tc.desc      add number(double) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0029'
      let vector = new Vector<number>();
      let result = vector.add(-1.7976931348623157e+308)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-1.7976931348623157e+308);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3000
     * @tc.name      testVector02Chapter0030
     * @tc.desc      add number(float) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0030'
      let vector = new Vector<number>();
      let result = vector.add(3.40282346638528860e+38)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(3.40282346638528860e+38);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3100
     * @tc.name      testVector02Chapter0031
     * @tc.desc      add number(float) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0031'
      let vector = new Vector<number>();
      let result = vector.add(-3.40282346638528860e+38)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(-3.40282346638528860e+38);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3200
     * @tc.name      testVector02Chapter0032
     * @tc.desc      add number(char) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0032'
      let vector = new Vector<number>();
      let result = vector.add(0)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3300
     * @tc.name      testVector02Chapter0033
     * @tc.desc      add number(char) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0033'
      let vector = new Vector<number>();
      let result = vector.add(65535)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(65535);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3400
     * @tc.name      testVector02Chapter0034
     * @tc.desc      add BigInt() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0034'
      let vector = new Vector<BigInt>();
      let result = vector.add(BigInt(0xdecafafecacefade))
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(BigInt(0xdecafafecacefade));
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3500
     * @tc.name      testVector02Chapter0035
     * @tc.desc      add Number() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0035'
      let vector = new Vector<number>();
      let result = vector.add(123.456)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(123.456);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3600
     * @tc.name      testVector02Chapter0036
     * @tc.desc      add Number(ox0102) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0036'
      let vector = new Vector<number>();
      let result = vector.add(0x0102)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0x0102);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3700
     * @tc.name      testVector02Chapter0037
     * @tc.desc      add Number(0x01020304) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0037'
      let vector = new Vector<number>();
      let result = vector.add(0x01020304)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0x01020304);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3800
     * @tc.name      testVector02Chapter0038
     * @tc.desc      add Number(0x3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0038'
      let vector = new Vector<number>();
      let result = vector.add(0x3)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0x3);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_3900
     * @tc.name      testVector02Chapter0039
     * @tc.desc      add Number(2**3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0039'
      let vector = new Vector<number>();
      let result = vector.add(2**3)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(8);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4000
     * @tc.name      testVector02Chapter0040
     * @tc.desc      add Number(1E3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0040'
      let vector = new Vector<number>();
      let result = vector.add(1E3)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(1000);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4100
     * @tc.name      testVector02Chapter0041
     * @tc.desc      add Number(2.5E-2) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0041'
      let vector = new Vector<number>();
      let result = vector.add(2.5E-2)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(0.025);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4200
     * @tc.name      testVector02Chapter0042
     * @tc.desc      add BigInt(9007199254740991n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0042'
      let vector = new Vector<BigInt>();
      let result = vector.add(9007199254740991n)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(9007199254740991n);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4300
     * @tc.name      testVector02Chapter0043
     * @tc.desc      add Boolean(True) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0043'
      let vector = new Vector<boolean>();
      let result = vector.add(true)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(true);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4400
     * @tc.name      testVector02Chapter0044
     * @tc.desc      add Boolean(False) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0044'
      let vector = new Vector<boolean>();
      let result = vector.add(false)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(false);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4500
     * @tc.name      testVector02Chapter0045
     * @tc.desc      add Array(unit8Array) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0045'
      let vector = new Vector<number>();
      const asciiArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      for (let i = 0; i < asciiArray.length; i++) {
        vector.add(asciiArray[i])
      }
      const expectedStr = "HelloWorld123?";
      let convertedStr = "";
      for (let i = 0; i < vector.length; i++) {
        convertedStr += String.fromCharCode(vector[i]);
      }
      expect(convertedStr).assertEqual(expectedStr);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4600
     * @tc.name      testVector02Chapter0046
     * @tc.desc      add Array.length test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0046'
      let vector = new Vector<number>();
      let array = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]
      for (let i = 0; i < array.length; i++) {
        vector.add(array[i])
      }
      expect(vector.length).assertEqual(array.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4700
     * @tc.name      testVector02Chapter0047
     * @tc.desc      add Array(±numberArray) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0047'
      let vector = new Vector<number>();
      const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const expectedStr = "HelloWorld123?";
      for (let i = 0; i < negativeArray.length; i++) {
        vector.add(negativeArray[i])
      }
      let convertedStr = "";
      for (let i = 0; i < vector.length; i++) {
        convertedStr += String.fromCharCode(vector[i]);
      }
      expect(convertedStr.slice(0, 6)).assertEqual(expectedStr.slice(0, 6));
      expect(convertedStr.slice(7, 10)).assertEqual(expectedStr.slice(7, 10));
      expect(convertedStr.slice(11, 13)).assertEqual(expectedStr.slice(11, 13));
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4800
     * @tc.name      testVector02Chapter0048
     * @tc.desc      add Array() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0048'
      let vector = new Vector<Array<never[]>>();
      const arr = []
      arr["abc"] = 111
      arr["aaa"] = 222
      vector.add(arr)
      expect(vector[0]).assertEqual(arr);
      expect(vector[0]["abc"]).assertEqual(111);
      expect(vector[0]["aaa"]).assertEqual(222);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_4900
     * @tc.name      testVector02Chapter0049
     * @tc.desc      add Array(number as typedArray) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0049'
      let vector = new Vector<number>();
      let typedArray = new Int8Array([1, 2, 3, 4, 5]);
      for (let i = 0; i < typedArray.length; i++) {
        vector.add(typedArray[i])
      }
	  expect(vector[0]).assertEqual(1);
      expect(vector[4]).assertEqual(5);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5000
     * @tc.name      testVector02Chapter0050
     * @tc.desc      add Array(NaN,Infinity,number) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0050'
      let vector = new Vector<number>();
      let arr = [72, 101, NaN, Infinity, 108, 111]
      for (let i = 0; i < arr.length; i++) {
        vector.add(arr[i])
      }
      expect(vector[0]).assertEqual(72);
      expect(vector[2]).assertNaN();
      expect(vector[3]).assertEqual(Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5100
     * @tc.name      testVector02Chapter0051
     * @tc.desc      add Array() test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0051'
      let vector = new Vector<Array<number>>();
      let arr = []
      vector.add(arr)
      expect(vector[0]).assertEqual(arr);
      expect(vector[0].length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5200
     * @tc.name      testVector02Chapter0052
     * @tc.desc      add Object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C1 {
        a: number = 1
        b: string = "test"
        c: number[] = [1, 2, 3]
      }

      const TAG = 'testVector02Chapter0052'
      let vector = new Vector<C1>();
      let obj = new C1()
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5300
     * @tc.name      testVector02Chapter0053
     * @tc.desc      add Object({a:1, b:{c:2, d:{e:3}}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0053'

      class C1 {
        e: number = 3
      }

      class C2 {
        c: number = 2
        d: C1 = new C1()
      }

      class C3 {
        a: number = 1
        b: C2 = new C2()
      }

      let vector = new Vector<C3>();
      let obj = new C3()
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].a).assertEqual(1);
      expect(vector[0].b.c).assertEqual(2);
      expect(vector[0].b.d.e).assertEqual(3);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5400
     * @tc.name      testVector02Chapter0054
     * @tc.desc      add Object({a:1, b:()=>{}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0054'
      let str = ""

      class C1 {
        a: number = 1
        b: () => void = () => {
          str = "Hello World"
        }
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      vector.add(obj)
      obj.b()
      expect(vector[0]).assertEqual(obj);
      expect(str).assertEqual("Hello World");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5500
     * @tc.name      testVector02Chapter0055
     * @tc.desc      add Object.create({parentProp:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0055'

      class C1 {
        parentProp: number = 1

        constructor() {
          this.parentProp = 2
        }
      }

      let vector = new Vector<C1>();

      class C2 extends C1 {
        childProp: number = 3
      }

      let obj = new C2()
      obj.childProp = 4
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
      expect(obj.parentProp).assertEqual(2);
      expect(obj.childProp).assertEqual(4);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5600
     * @tc.name      testVector02Chapter0056
     * @tc.desc      add Object({buffer: new ArrayBuffer(16)}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0056'

      class C1 {
        buffer: ArrayBuffer = new ArrayBuffer(16)
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].buffer.byteLength).assertEqual(16);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5700
     * @tc.name      testVector02Chapter0057
     * @tc.desc      add Object({view: new DataView(new ArrayBuffer(16))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
	 */
    it("testVector02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0057'

      class C1 {
        view: DataView = new DataView(new ArrayBuffer(16))
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].view.byteLength).assertEqual(16);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5800
     * @tc.name      testVector02Chapter0058
     * @tc.desc      add Object({}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0058'

      class C1 {
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      vector.add(obj)
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].constructor).assertEqual(C1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_5900
     * @tc.name      testVector02Chapter0059
     * @tc.desc      add Object.fromEntries([...Array(10000).keys()].map(i=>[i,i])) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0059'

      let mapToObj: (map: Map<string, string | number | object>) => object = (map) => {
        if (map.size === 0) {
          return [];
        }
        let obj: object = new Object;
        map.forEach((value, key) => {
          obj[key] = value;
        })
        return obj;
      }
      let OBJECT_SIZE = 10000
      let mapTemp = new Map<string, number>()
      for (let i = 0; i < OBJECT_SIZE; i++) {
        mapTemp.set(i.toString(), i)
      }
      let recordTemp = mapToObj(mapTemp) as Record<string, Object>;
      let vector = new Vector<Record<string, Object>>();
      let result = vector.add(recordTemp)
      expect(result).assertEqual(true);
      expect(vector[0]).assertEqual(recordTemp);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6000
     * @tc.name      testVector02Chapter0060
     * @tc.desc      add Object({a:undefined, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0060'

      class C1 {
        a: undefined = undefined
        b: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6100
     * @tc.name      testVector02Chapter0061
     * @tc.desc      add Object({a:null, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0061'

      class C1 {
        a: null = null
        b: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].a).assertNull();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6200
     * @tc.name      testVector02Chapter0062
     * @tc.desc      add Object({a:NaN, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0062'

      class C1 {
        a: number = NaN
        b: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].a).assertNaN();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6300
     * @tc.name      testVector02Chapter0063
     * @tc.desc      add Object({a:Infinity, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0063'

      class C1 {
        a: number = Infinity
        b: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].a).assertEqual(Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6400
     * @tc.name      testVector02Chapter0064
     * @tc.desc      add Object({a:-Infinity, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0064'

      class C1 {
        a: number = -Infinity
        b: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].a).assertEqual(-Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6500
     * @tc.name      testVector02Chapter0065
     * @tc.desc      add Object({buffer: new Uint8Array([72,101,108,108,111])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0065'

      class C1 {
        buffer: Uint8Array = new Uint8Array([72, 101, 108, 108, 111])
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].buffer).assertEqual(obj.buffer);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6600
     * @tc.name      testVector02Chapter0066
     * @tc.desc      add Object({map: new Map([['key1', 'value1'], ['key2', {a:1}]])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0066'

      class C1 {
        map: Map<string, string | object> = new Map()
      }

      class C2 {
        a: number = 1
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      obj.map.set('key1', 'value1')
      obj.map.set('key2', new C2())
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].map.get('key1')).assertEqual('value1');
      expect(vector[0].map.get('key2').a).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6700
     * @tc.name      testVector02Chapter0067
     * @tc.desc      add Object({set: new Set([1,2,3,2,1])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0067'

      class C1 {
        set: Set<number> = new Set([1, 2, 3, 2, 1])
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].set.size).assertEqual(3);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6800
     * @tc.name      testVector02Chapter0068
     * @tc.desc      add Object({promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0068'

      class C1 {
        promise: Promise<string> = new Promise((resolve) => setTimeout(() => resolve('done'), 100))
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      obj.promise.then((value) => {
        expect(value).assertEqual('done');
      })
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_6900
     * @tc.name      testVector02Chapter0069
     * @tc.desc      add Object({regex: /abc/gi, flags: /def/m}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0069'

      class C1 {
        regex: RegExp = /abc/gi
        flags: RegExp = /def/m
      }

      let vector = new Vector<C1>();
      let obj = new C1()
      let result = vector.add(obj)
      expect(result).assertTrue();
      expect(vector[0]).assertEqual(obj);
      expect(vector[0].regex.flags).assertEqual('gi');
      expect(vector[0].flags.flags).assertEqual('m');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7000
     * @tc.name      testVector02Chapter0070
     * @tc.desc      insert Int8Array(-128) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0070'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length
      let number = new Int8Array([-128])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-128)
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7100
     * @tc.name      testVector02Chapter0071
     * @tc.desc      insert Int8Array(127) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0071'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length
      let number = new Int8Array([127])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(127);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7200
     * @tc.name      testVector02Chapter0072
     * @tc.desc      insert Int8Array(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0072'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length
      let number = new Int8Array([0])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7300
     * @tc.name      testVector02Chapter0073
     * @tc.desc      insert Int8Array(-129) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0073'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length
      let number = new Int8Array([-129])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(127);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7400
     * @tc.name      testVector02Chapter0074
     * @tc.desc      insert Int8Array(128) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0074'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length
      let number = new Int8Array([128])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-128);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7500
     * @tc.name      testVector02Chapter0075
     * @tc.desc      insert Uint8Array(255) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0075'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length
      let number = new Uint8Array([255])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(255);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7600
     * @tc.name      testVector02Chapter0076
     * @tc.desc      insert Uint8Array(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0076'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length
      let number = new Uint8Array([0])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7700
     * @tc.name      testVector02Chapter0077
     * @tc.desc      insert Uint8Array(256) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0077'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length;
      let number = new Uint8Array([256])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7800
     * @tc.name      testVector02Chapter0078
     * @tc.desc      insert Uint8Array(-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0078'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length;
      let number = new Uint8Array([-1])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(255);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_7900
     * @tc.name      testVector02Chapter0079
     * @tc.desc      insert Uint8ClampedArray(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0079'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([0])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8000
     * @tc.name      testVector02Chapter0080
     * @tc.desc      insert Uint8ClampedArray(255) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0080'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([255])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(255);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8100
     * @tc.name      testVector02Chapter0081
     * @tc.desc      insert Uint8ClampedArray(256) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0081'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([256])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(255);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8200
     * @tc.name      testVector02Chapter0082
     * @tc.desc      insert Uint8ClampedArray(-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0082'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([-1])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8300
     * @tc.name      testVector02Chapter0083
     * @tc.desc      insert Int16Array(-32768) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0083'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([-32768])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-32768);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8400
     * @tc.name      testVector02Chapter0084
     * @tc.desc      insert Int16Array(32767) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0084'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([32767])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(32767);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8500
     * @tc.name      testVector02Chapter0085
     * @tc.desc      insert Int16Array(32768) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0085'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([32768])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-32768);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8600
     * @tc.name      testVector02Chapter0086
     * @tc.desc      insert Int16Array(-32769) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0086'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([-32769])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(32767);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8700
     * @tc.name      testVector02Chapter0087
     * @tc.desc      insert Uint16Array(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0087'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([0])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8800
     * @tc.name      testVector02Chapter0088
     * @tc.desc      insert Uint16Array(65535) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0088'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([65535])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(65535);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_8900
     * @tc.name      testVector02Chapter0089
     * @tc.desc      insert Uint16Array(65536) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0089'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([65536])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_9000
     * @tc.name      testVector02Chapter0090
     * @tc.desc      insert Uint16Array(-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0090'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([-1])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(65535);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_9100
     * @tc.name      testVector02Chapter0091
     * @tc.desc      insert Int32Array(-2147483648) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0091'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([-2147483648])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-2147483648);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_9200
     * @tc.name      testVector02Chapter0092
     * @tc.desc      insert Int32Array(2147483647) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0092'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([2147483647])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(2147483647);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_9300
     * @tc.name      testVector02Chapter0093
     * @tc.desc      insert Int32Array(-2147483649) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0093'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([-2147483649])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(2147483647);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST02_9400
     * @tc.name      testVector02Chapter0094
     * @tc.desc      insert Int32Array(2147483648) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector02Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector02Chapter0094'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([2147483648])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-2147483648);
      expect(vector.length).assertEqual(length + 1);
    })

  })
}
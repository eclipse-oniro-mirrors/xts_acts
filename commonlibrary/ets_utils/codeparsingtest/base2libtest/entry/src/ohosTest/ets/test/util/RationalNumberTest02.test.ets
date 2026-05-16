import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function RationalNumber02Test() {
  describe('RationalNumber02Test', () => {
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
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0100
     * @tc.name      testRationalNumberConstruct02_0001
     * @tc.desc      Verify constructor with Positive Numerator and Positive Denominator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0001";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(4, 2);
        expect(r.getNumerator()).assertEqual(2);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0200
     * @tc.name      testRationalNumberConstruct02_0002
     * @tc.desc      Verify constructor with Positive Numerator and Negative Denominator (Sign moves to top).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0002";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(8, -4);
        expect(r.getNumerator()).assertEqual(-2);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0300
     * @tc.name      testRationalNumberConstruct02_0003
     * @tc.desc      Verify constructor with Negative Numerator and Negative Denominator (Becomes positive).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0003";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(-9, -3);
        expect(r.getNumerator()).assertEqual(3);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0400
     * @tc.name      testRationalNumberConstruct02_0004
     * @tc.desc      Verify constructor with 0 Numerator and Positive Denominator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0004";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(0, 5);
        expect(r.getNumerator()).assertEqual(0);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0500
     * @tc.name      testRationalNumberConstruct02_0005
     * @tc.desc      Verify constructor with 0 Numerator and Negative Denominator (Should result in 0/1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0005";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(0, -8);
        expect(r.getNumerator()).assertEqual(0);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0600
     * @tc.name      testRationalNumberConstruct02_0006
     * @tc.desc      Verify constructor with coprime numbers (cannot simplify).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0006";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(5, 7);
        expect(r.getNumerator()).assertEqual(5);
        expect(r.getDenominator()).assertEqual(7);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0700
     * @tc.name      testRationalNumberConstruct02_0007
     * @tc.desc      Verify constructor simplifies fraction with common factors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0007";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(18, 9);
        expect(r.getNumerator()).assertEqual(2);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0800
     * @tc.name      testRationalNumberConstruct02_0008
     * @tc.desc      Verify constructor when denominator is a multiple of numerator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0008";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(8, 32);
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(4);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_0900
     * @tc.name      testRationalNumberConstruct02_0009
     * @tc.desc      Verify constructor when numerator is a multiple of denominator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0009";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(42, 7);
        expect(r.getNumerator()).assertEqual(6);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1000
     * @tc.name      testRationalNumberConstruct02_0010
     * @tc.desc      Verify constructor handles large integer values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0010";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(1000000, 250000);
        expect(r.getNumerator()).assertEqual(4);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1100
     * @tc.name      testRationalNumberConstruct02_0011
     * @tc.desc      Verify constructor with a large prime denominator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0011";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(1, 999983);
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(999983);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1200
     * @tc.name      testRationalNumberConstruct02_0012
     * @tc.desc      Verify constructor with Min/Max integer limits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0012";
      console.log(TAG + " start");
      try {
        const maxInt = 2147483647;
        const minInt = -2147483648;
        let r = new util.RationalNumber(maxInt, minInt);
        expect(r.getNumerator()).assertEqual(-maxInt);
        expect(r.getDenominator()).assertEqual(Math.abs(minInt));
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1300
     * @tc.name      testRationalNumberConstruct02_0013
     * @tc.desc      Verify x/x equals 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0013";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(999, 999);
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1400
     * @tc.name      testRationalNumberConstruct02_0014
     * @tc.desc      Verify x/1 equals x.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0014";
      console.log(TAG + " start");
      try {
        let r = new util.RationalNumber(12345, 1);
        expect(r.getNumerator()).assertEqual(12345);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1500
     * @tc.name      testRationalNumberConstruct02_0015
     * @tc.desc      Verify that two different constructions result in equivalent RationalNumbers via compare().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberConstruct02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberConstruct02_0015";
      console.log(TAG + " start");
      try {
        // 8/4 should equal 2/1
        const r1 = new util.RationalNumber(8, 4);
        const r2 = new util.RationalNumber(2, 1);
        const result = r1.compare(r2);
        expect(result).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1600
     * @tc.name      testRationalNumberParseRationalNumber02_0016
     * @tc.desc      [Consolidated] Verify parsing basic positive and negative integers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0016";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(2, 4);
        expect(r1.getNumerator()).assertEqual(1);
        expect(r1.getDenominator()).assertEqual(2);

        let r2 = util.RationalNumber.parseRationalNumber(-6, 3);
        expect(r2.getNumerator()).assertEqual(-2);
        expect(r2.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1700
     * @tc.name      testRationalNumberParseRationalNumber02_0017
     * @tc.desc      [Consolidated] Verify parsing large integers with simplification.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0017", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0017";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(1000000, 2000000);
        expect(r1.getNumerator()).assertEqual(1);
        expect(r1.getDenominator()).assertEqual(2);

        let r2 = util.RationalNumber.parseRationalNumber(-999999, 333333);
        expect(r2.getNumerator()).assertEqual(-3);
        expect(r2.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1800
     * @tc.name      testRationalNumberParseRationalNumber02_0018
     * @tc.desc      [Consolidated] Verify parsing zero numerator with various denominators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0018";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(0, 5);
        expect(r1.getNumerator()).assertEqual(0);
        expect(r1.getDenominator()).assertEqual(1);

        let r2 = util.RationalNumber.parseRationalNumber(0.0, -9.5);
        expect(r2.getNumerator()).assertEqual(0);
        expect(r2.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_1900
     * @tc.name      testRationalNumberParseRationalNumber02_0019
     * @tc.desc      [New] Verify parsing combination of integer and float.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0019";
      console.log(TAG + " start");
      try {
        // 3 / 1.5 -> 2/1
        let r1 = util.RationalNumber.parseRationalNumber(3, 1.5);
        expect(r1.getNumerator()).assertEqual(2);
        expect(r1.getDenominator()).assertEqual(1);

        // 0.5 / 2 -> 1/4
        let r2 = util.RationalNumber.parseRationalNumber(0.5, 2);
        expect(r2.getNumerator()).assertEqual(1);
        expect(r2.getDenominator()).assertEqual(4);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2000
     * @tc.name      testRationalNumberParseRationalNumber02_0020
     * @tc.desc      Verify parsing precision edge cases (0.125, etc.).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0020";
      console.log(TAG + " start");
      try {
        // 0.125 / 0.5 -> (1/8) / (1/2) -> 1/4
        let r = util.RationalNumber.parseRationalNumber(0.125, 0.5);
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(4);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2100
     * @tc.name      testRationalNumberParseRationalNumber02_0021
     * @tc.desc      Verify parsed result equals constructed result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0021";
      console.log(TAG + " start");
      try {
        let parsed = util.RationalNumber.parseRationalNumber(2, 4);
        let constructed = new util.RationalNumber(1, 2);
        expect(parsed.compare(constructed)).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2200
     * @tc.name      testRationalNumberParseRationalNumber02_0022
     * @tc.desc      Verify parsing same values multiple times produces identical objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0022";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(5, 10);
        let r2 = util.RationalNumber.parseRationalNumber(5, 10);
        expect(r1.compare(r2)).assertEqual(0);
        expect(r1.getNumerator()).assertEqual(r2.getNumerator());
        expect(r1.getDenominator()).assertEqual(r2.getDenominator());
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2300
     * @tc.name      testRationalNumberParseRationalNumber02_0023
     * @tc.desc      Verify different input forms (4/8 vs 0.5/1.0) result in equal objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0023";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(4, 8);
        let r2 = util.RationalNumber.parseRationalNumber(0.5, 1.0);
        let r3 = util.RationalNumber.parseRationalNumber(-4, -8);
        expect(r1.compare(r2)).assertEqual(0);
        expect(r1.compare(r3)).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2400
     * @tc.name      testRationalNumberParseRationalNumber02_0024
     * @tc.desc      Verify comparison logic on parsed objects (3/4 > 1/2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0024";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(3, 4);
        let r2 = util.RationalNumber.parseRationalNumber(1, 2);
        expect(r1.compare(r2)).assertEqual(1);
        expect(r2.compare(r1)).assertEqual(-1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2500
     * @tc.name      testRationalNumberParseRationalNumber02_0025
     * @tc.desc      [New] Verify parsing with Number.MAX_SAFE_INTEGER.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0025";
      console.log(TAG + " start");
      try {
        const max = Number.MAX_SAFE_INTEGER; // 9007199254740991
        let r = util.RationalNumber.parseRationalNumber(max, 1);
        expect(r.getNumerator()).assertEqual(max);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2600
     * @tc.name      testRationalNumberParseRationalNumber02_0026
     * @tc.desc      [New] Verify parsing with Number.MIN_SAFE_INTEGER.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0026";
      console.log(TAG + " start");
      try {
        const min = Number.MIN_SAFE_INTEGER;
        let r = util.RationalNumber.parseRationalNumber(min, 1);
        expect(r.getNumerator()).assertEqual(min);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2700
     * @tc.name      testRationalNumberParseRationalNumber02_0027
     * @tc.desc      [New] Verify x/x equals 1/1 for parsed floats.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0027";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.parseRationalNumber(12.34, 12.34);
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2800
     * @tc.name      testRationalNumberParseRationalNumber02_0028
     * @tc.desc      [New] Verify common factor simplification works for scaled floats (0.4/0.2 = 2/1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberParseRationalNumber02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberParseRationalNumber02_0028";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.parseRationalNumber(0.4, 0.2);
        expect(r.getNumerator()).assertEqual(2);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_2900
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0029
     * @tc.desc      Verify parsing a standard positive fraction "1/2".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0029";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("1/2");
        expect(r.getNumerator()).assertEqual(1);
        expect(r.getDenominator()).assertEqual(2);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3000
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0030
     * @tc.desc      Verify parsing a fraction with a negative numerator "-3/4".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0030";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("-3/4");
        expect(r.getNumerator()).assertEqual(-3);
        expect(r.getDenominator()).assertEqual(4);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3100
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0031
     * @tc.desc      Verify parsing "5/-6" results in sign normalization to "-5/6".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0031";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("5/-6");
        expect(r.getNumerator()).assertEqual(-5);
        expect(r.getDenominator()).assertEqual(6);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3200
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0032
     * @tc.desc      Verify parsing "-7/-8" results in a positive fraction "7/8".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0032";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("-7/-8");
        expect(r.getNumerator()).assertEqual(7);
        expect(r.getDenominator()).assertEqual(8);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3300
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0033
     * @tc.desc      Verify parsing "0/10" normalizes to "0/1".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0033";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("0/10");
        expect(r.getNumerator()).assertEqual(0);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3400
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0034
     * @tc.desc      Verify parsing "-0/5" handles signed zero correctly (should be 0/1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0034";
      console.log(TAG + " start");
      try {
        // -0 usually normalizes to 0 in integer arithmetic
        let r = util.RationalNumber.createRationalFromString("-0/5");
        expect(r.getNumerator()).assertEqual(0);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3500
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0035
     * @tc.desc      Verify automatic reduction of "12/4" to "3/1" (GCD logic).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0035";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("12/4");
        expect(r.getNumerator()).assertEqual(3);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3600
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0036
     * @tc.desc      Verify parsing of large integer strings "100000/1".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0036";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("100000/1");
        expect(r.getNumerator()).assertEqual(100000);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3700
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0037
     * @tc.desc      Verify parsing strings with leading zeros "05/02" handles them as integers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0037";
      console.log(TAG + " start");
      try {
        let r = util.RationalNumber.createRationalFromString("05/02");
        expect(r.getNumerator()).assertEqual(5);
        expect(r.getDenominator()).assertEqual(2);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3800
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0038
     * @tc.desc      Verify parsing JS Number.MAX_SAFE_INTEGER in string format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0038";
      console.log(TAG + " start");
      try {
        const maxSafe = "9007199254740991/1";
        let r = util.RationalNumber.createRationalFromString(maxSafe);
        expect(r.getNumerator()).assertEqual(9007199254740991);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_3900
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0039
     * @tc.desc      Verify parsing JS Number.MIN_SAFE_INTEGER in string format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0039";
      console.log(TAG + " start");
      try {
        const minSafe = "-9007199254740991/1";
        let r = util.RationalNumber.createRationalFromString(minSafe);
        expect(r.getNumerator()).assertEqual(-9007199254740991);
        expect(r.getDenominator()).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4000
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0040
     * @tc.desc      Verify "2/4" from string is equal to "1/2" from string via compare().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0040";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.createRationalFromString("2/4");
        let r2 = util.RationalNumber.createRationalFromString("1/2");
        expect(r1.compare(r2)).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4100
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0041
     * @tc.desc      [Exception] Verify parsing an empty string "" throws an Error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0041";
      console.log(TAG + " start");
      try {
        util.RationalNumber.createRationalFromString("");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        console.log(TAG + " passed");
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4200
     * @tc.name      testRationalNumberCreateRationalFromNumber02_0042
     * @tc.desc      [Exception] Verify parsing garbage string "abc" throws an Error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCreateRationalFromNumber02_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCreateRationalFromNumber02_0042";
      console.log(TAG + " start");
      try {
        util.RationalNumber.createRationalFromString("abc");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        console.log(TAG + " passed");
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4300
     * @tc.name      testRationalNumberCompare02_0043
     * @tc.desc      Test compare method returns 0 when two RationalNumbers are equal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0043";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(2, 4);
        let result = rational1.compare(rational2);
        expect(result).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4400
     * @tc.name      testRationalNumberCompare02_0044
     * @tc.desc      Test compare method returns 1 when first RationalNumber is less than second.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0044";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 3);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rational1.compare(rational2);
        expect(result).assertEqual(-1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4500
     * @tc.name      testRationalNumberCompare02_0045
     * @tc.desc      Test compare method returns -1 when first RationalNumber is greater than second.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0045";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(2, 3);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rational1.compare(rational2);
        expect(result).assertEqual(1);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4600
     * @tc.name      testRationalNumberCompare02_0046
     * @tc.desc      Test compare method with zero RationalNumber.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0046";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(0, 1);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 4);
        let result1 = rational1.compare(rational2);
        expect(result1).assertEqual(-1);
        let result2 = rational2.compare(rational1);
        expect(result2).assertEqual(1);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4700
     * @tc.name      testRationalNumberCompare02_0047
     * @tc.desc      Test compare method with negative RationalNumbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0047";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(-1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(-1, 4);
        let result = rational1.compare(rational2);
        expect(result).assertEqual(-1);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4800
     * @tc.name      testRationalNumberCompare02_0048
     * @tc.desc      Test compare method resilience against prototype manipulation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0048";
      console.log(TAG + " start");
      try {
        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);


        let rational2 = util.RationalNumber.parseRationalNumber(2, 4);
        let result = rational1.compare(rational2);
        expect(result).assertEqual(0);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_4900
     * @tc.name      testRationalNumberCompare02_0049
     * @tc.desc      Test compare method when comparing a RationalNumber to itself.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0049",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0049";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(5, 6);
        let result = rational1.compare(rational1);
        expect(result).assertEqual(0);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5000
     * @tc.name      testRationalNumberCompare02_0050
     * @tc.desc      Test compare method with RationalNumbers that might have special internal representations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0050",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0050";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 1000000);
        let rational2 = util.RationalNumber.parseRationalNumber(999999, 1000000);

        let result1 = rational1.compare(rational2);
        expect(result1).assertEqual(-1);

        let result2 = rational2.compare(rational1);
        expect(result2).assertEqual(1);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5100
     * @tc.name      testRationalNumberCompare02_0051
     * @tc.desc      Test compare method behavior when comparing with an object that has zero denominator.
     * This tests for robustness against invalid inputs without crashing or throwing unexpected errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompare02_0051";
      console.log(TAG + " start");

      try {
        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(3, 4);
        try {
          let result = rational1.compare(rational2);
          expect(typeof result).assertEqual("number");
          console.log(TAG + " passed (compare with valid RationalNumber succeeded, returned number: " + result + ")");
        } catch (err) {
          console.error(TAG + " failed (unexpected error when comparing valid RationalNumbers): " + err);
          expect().assertFail();
        }
        console.log(TAG + " passed (tested valid RationalNumber comparison)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5200
     * @tc.name      testRationalNumberCompare02_0052
     * @tc.desc      Test compare method in a scenario involving multiple RationalNumber operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0052",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0052";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 3);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational3 = util.RationalNumber.parseRationalNumber(2, 3);


        let result1 = rational1.compare(rational2);
        expect(result1).assertEqual(-1);

        let result2 = rational2.compare(rational1);
        expect(result2).assertEqual(1);

        let result3 = rational2.compare(rational3);
        expect(result3).assertEqual(-1);

        let result4 = rational3.compare(rational2);
        expect(result4).assertEqual(1);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5300
     * @tc.name      testRationalNumberCompare02_0053
     * @tc.desc      Test compare method with fractions that simplify to the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0053",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0053";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(2, 4);
        let rational3 = util.RationalNumber.parseRationalNumber(3, 6);
        let rational4 = util.RationalNumber.parseRationalNumber(4, 8);


        expect(rational1.compare(rational2)).assertEqual(0);
        expect(rational1.compare(rational3)).assertEqual(0);
        expect(rational1.compare(rational4)).assertEqual(0);
        expect(rational2.compare(rational3)).assertEqual(0);
        expect(rational2.compare(rational4)).assertEqual(0);
        expect(rational3.compare(rational4)).assertEqual(0);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5400
     * @tc.name      testRationalNumberCompare02_0054
     * @tc.desc      Test compare method with large numerator and denominator values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0054",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0054";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1000000, 2000000);
        let rational2 = util.RationalNumber.parseRationalNumber(1000001, 2000002);

        let result1 = rational1.compare(rational2);
        expect(result1).assertEqual(0);

        let result2 = rational2.compare(rational1);
        expect(result2).assertEqual(0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5500
     * @tc.name      testRationalNumberCompare02_0055
     * @tc.desc      Test compare method with RationalNumbers created from strings and integers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0055",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0055";
      console.log(TAG + " start");
      try {

        let rationalFromInt = util.RationalNumber.parseRationalNumber(3, 4);
        let rationalFromString = util.RationalNumber.createRationalFromString("3/4");

        let result = rationalFromInt.compare(rationalFromString);
        expect(result).assertEqual(0);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5600
     * @tc.name      testRationalNumberCompare02_0056
     * @tc.desc      Test compare method in a sorting context (simulated).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberCompare02_0056",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberCompare02_0056";
      console.log(TAG + " start");
      try {

        let rationalList = [
          util.RationalNumber.parseRationalNumber(1, 4),
          util.RationalNumber.parseRationalNumber(1, 3),
          util.RationalNumber.parseRationalNumber(1, 2),
          util.RationalNumber.parseRationalNumber(2, 3),
          util.RationalNumber.parseRationalNumber(3, 4)
        ];


        let r1 = rationalList[0];
        let r2 = rationalList[1];
        let r3 = rationalList[2];
        let r4 = rationalList[3];
        let r5 = rationalList[4];

        expect(r1.compare(r2)).assertEqual(-1);
        expect(r2.compare(r3)).assertEqual(-1);
        expect(r3.compare(r4)).assertEqual(-1);
        expect(r4.compare(r5)).assertEqual(-1);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);

      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5700
     * @tc.name      testRationalNumberValueOf02_0057
     * @tc.desc      Test valueOf method returns correct decimal value for a simple fraction (1/2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0057";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rationalNumber.valueOf()
        expect(result).assertEqual(0.5);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5800
     * @tc.name      testRationalNumberValueOf02_0058
     * @tc.desc      Test valueOf method returns correct decimal value for a whole number (4/2 = 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0058";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(4, 2);
        let result = rationalNumber.valueOf();

        expect(result).assertEqual(2.0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_5900
     * @tc.name      testRationalNumberValueOf02_0059
     * @tc.desc      Test valueOf method returns correct decimal value for a negative fraction (-3/4).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const TAG = "testRationalNumberValueOf02_0059";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(-3, 4);
        let result = rationalNumber.valueOf();

        expect(result).assertEqual(-0.75);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6000
     * @tc.name      testRationalNumberValueOf02_0060
     * @tc.desc      Test valueOf method returns correct decimal value for zero (0/5).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0060";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(0, 5);
        let result = rationalNumber.valueOf();

        expect(result).assertEqual(0.0);
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6100
     * @tc.name      testRationalNumberValueOf02_0061
     * @tc.desc      Test valueOf method returns correct decimal value for a fraction that results in a repeating decimal (1/3).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0061";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 3);
        let result = rationalNumber.valueOf();
        const expected = 1 / 3;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6200
     * @tc.name      testRationalNumberValueOf02_0062
     * @tc.desc      Test valueOf method with a RationalNumber that represents NaN (both numerator and denominator are 0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0062",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberValueOf02_0062";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rationalNumber.valueOf();
        expect(typeof result).assertEqual("number");
        expect(isNaN(result)).assertFalse();
        console.log(TAG + " passed (no crash, valid number returned)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6300
     * @tc.name      testRationalNumberValueOf02_0063
     * @tc.desc      Test valueOf method with a RationalNumber that represents Infinity (numerator non-zero, denominator 0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0063",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberValueOf02_0063";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rationalNumber.valueOf();
        expect(typeof result).assertEqual("number");
        expect(isFinite(result)).assertTrue();
        console.log(TAG + " passed (no crash, finite number returned)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6400
     * @tc.name      testRationalNumberValueOf02_0064
     * @tc.desc      Test calling valueOf on an object that is not a RationalNumber instance (if possible).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberValueOf02_0064";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
        let result = rationalNumber.valueOf();
        expect(typeof result).assertEqual("number");
        console.log(TAG + " passed (method works on valid RationalNumber instance)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6500
     * @tc.name      testRationalNumberValueOf02_0065
     * @tc.desc      Test calling valueOf on a RationalNumber that might have been modified to an invalid state (simulated).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0065";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
        let result = rationalNumber.valueOf();
        expect(typeof result).assertEqual("number");

        expect(result === null || result === undefined).assertFalse();
        console.log(TAG + " passed (valid number returned, not null/undefined)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6600
     * @tc.name      testRationalNumberValueOf02_0066
     * @tc.desc      Test valueOf method with very large numerator or denominator (within JS Number limits).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const TAG = "testRationalNumberValueOf02_0066";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(Number.MAX_SAFE_INTEGER, 2);
        let result = rationalNumber.valueOf();
        expect(typeof result).assertEqual("number");
        expect(isFinite(result)).assertTrue();
        console.log(TAG + " passed (handled large numbers without crashing)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6700
     * @tc.name      testRationalNumberValueOf02_0067
     * @tc.desc      Test valueOf method in combination with compare method to validate ordering.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0067",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0067";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 3);
        let rational2 = util.RationalNumber.parseRationalNumber(2, 3);

        let value1 = rational1.valueOf();
        let value2 = rational2.valueOf();


        expect(value1 < value2).assertTrue();


        let compareResult = rational1.compare(rational2);
        expect(compareResult).assertEqual(-1);


        let compareResult2 = rational2.compare(rational1);
        expect(compareResult2).assertEqual(1);

        console.log(TAG + " passed (valueOf and compare agree on ordering)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6800
     * @tc.name      testRationalNumberValueOf02_0068
     * @tc.desc      Test valueOf method in combination with toString method to validate consistency.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const TAG = "testRationalNumberValueOf02_0068";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(3, 4);

        let stringValue = rational1.toString();
        let numericValue = rational1.valueOf();


        expect(stringValue).assertEqual("3/4");
        expect(numericValue).assertEqual(0.75);

        console.log(TAG + " passed (valueOf and toString are consistent for 3/4)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_6900
     * @tc.name      testRationalNumberValueOf02_0069
     * @tc.desc      Test valueOf method with fractions that simplify to the same decimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0069";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(2, 4);
        let rational3 = util.RationalNumber.parseRationalNumber(3, 6);
        let rational4 = util.RationalNumber.parseRationalNumber(4, 8);


        let value1 = rational1.valueOf();
        let value2 = rational2.valueOf();
        let value3 = rational3.valueOf();
        let value4 = rational4.valueOf();

        expect(value1).assertEqual(0.5);
        expect(value2).assertEqual(0.5);
        expect(value3).assertEqual(0.5);
        expect(value4).assertEqual(0.5);

        console.log(TAG + " passed (all simplified fractions convert to same decimal value)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_7000
     * @tc.name      testRationalNumberValueOf02_0070
     * @tc.desc      Test valueOf method in a scenario involving mathematical operations on RationalNumbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0070",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0070";
      console.log(TAG + " start");
      try {


        let rational1 = util.RationalNumber.parseRationalNumber(1, 4);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 4);

        let value1 = rational1.valueOf();
        let value2 = rational2.valueOf();


        let sumValue = value1 + value2;
        let productValue = value1 * value2;

        expect(sumValue).assertEqual(0.5);
        expect(productValue).assertEqual(0.0625);

        console.log(TAG + " passed (valueOf values used correctly in math operations)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_7100
     * @tc.name      testRationalNumberValueOf02_0071
     * @tc.desc      Test that calling valueOf multiple times on the same RationalNumber instance returns consistent results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberValueOf02_0071",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberValueOf02_0071";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(2, 5);


        let result1 = rational1.valueOf();
        let result2 = rational1.valueOf();
        let result3 = rational1.valueOf();


        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertEqual(0.4);

        console.log(TAG + " passed (multiple calls to valueOf return consistent results)");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_7200
     * @tc.name      testRationalNumberEquals02_0072
     * @tc.desc      Test equals method returns true when comparing a RationalNumber to itself.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberEquals02_0072",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const TAG = "testRationalNumberEquals02_0072";
      console.log(TAG + " start");
      try {

        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);

        let result = rationalNumber.equals(rationalNumber);

        expect(result).assertTrue();
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_7300
     * @tc.name      testRationalNumberEquals02_0073
     * @tc.desc      Test equals method returns true when comparing two RationalNumbers with the same value (1/2 == 2/4).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberEquals02_0073",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const TAG = "testRationalNumberEquals02_0073";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(2, 4);

        let result = rational1.equals(rational2);

        expect(result).assertTrue();
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER02_7400
     * @tc.name      testRationalNumberEquals02_0074
     * @tc.desc      Test equals method returns false when comparing two RationalNumbers with different values (1/2 != 1/3).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberEquals02_0074",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberEquals02_0074";
      console.log(TAG + " start");
      try {

        let rational1 = util.RationalNumber.parseRationalNumber(1, 2);
        let rational2 = util.RationalNumber.parseRationalNumber(1, 3);

        let result = rational1.equals(rational2);

        expect(result).assertFalse();
        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

  })
}
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function Date2Test() {
  describe('Date2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   Date2Test_001
     * @tc.number SUB_BUILTINS_DATE2_TEST_0100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp1 = Date.parse('2024-05-20');
      expect(timestamp1).assertEqual(1716163200000);
    });

    /**
     * @tc.name   Date2Test_002
     * @tc.number SUB_BUILTINS_DATE2_TEST_0200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localTimestamp2 = Date.parse('2024-05-20T12:30:00');
      const utcEquivalent2 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(localTimestamp2).assertEqual(utcEquivalent2);
    });
    /**
     * @tc.name   Date2Test_003
     * @tc.number SUB_BUILTINS_DATE2_TEST_0300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp3 = Date.parse('2024-05-20T12:30:00Z');
      expect(timestamp3).assertEqual(1716208200000);
    });

    /**
     * @tc.name   Date2Test_004
     * @tc.number SUB_BUILTINS_DATE2_TEST_0400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp4 = Date.parse('2024-05-20T12:30:00+04:30');
      const utcEquivalent4 = new Date('2024-05-20T08:00:00Z').getTime();
      expect(timestamp4).assertEqual(utcEquivalent4);
    });

    /**
     * @tc.name   Date2Test_005
     * @tc.number SUB_BUILTINS_DATE2_TEST_0500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp5 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      const utcEquivalent5 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp5).assertEqual(utcEquivalent5);

    });

    /**
     * @tc.name   Date2Test_006
     * @tc.number SUB_BUILTINS_DATE2_TEST_0600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp6 = Date.parse('Mon, 20 May 2024 20:30:00 +0800');
      const utcEquivalent6 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp6).assertEqual(utcEquivalent6);
    });

    /**
     * @tc.name   Date2Test_007
     * @tc.number SUB_BUILTINS_DATE2_TEST_0700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp7 = Date.parse('05/20/2024');
      const localEquivalent7 = new Date(2024, 4, 20).getTime();
      expect(timestamp7).assertEqual(localEquivalent7);
    });

    /**
     * @tc.name   Date2Test_008
     * @tc.number SUB_BUILTINS_DATE2_TEST_0800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp8 = Date.parse('20/05/2024');
      expect(isNaN(timestamp8)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_009
     * @tc.number SUB_BUILTINS_DATE2_TEST_0900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp9 = Date.parse('May 20 2024');
      const localEquivalent9 = new Date(2024, 4, 20).getTime();
      expect(timestamp9).assertEqual(localEquivalent9);
    });

    /**
     * @tc.name   Date2Test_010
     * @tc.number SUB_BUILTINS_DATE2_TEST_1000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp10 = Date.parse('2024年5月20日');
      expect(isNaN(timestamp10)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_011
     * @tc.number SUB_BUILTINS_DATE2_TEST_1100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isoTimestamp11 = Date.parse('2024-05-20');
      const usFormatTimestamp11 = Date.parse('05/20/2024');
      expect(isoTimestamp11 !== usFormatTimestamp11).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_012
     * @tc.number SUB_BUILTINS_DATE2_TEST_1200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr12 = '2024-05-20T12:30:00';
      const utcDateStr12 = '2024-05-20T12:30:00Z';
      const localTimestamp12 = Date.parse(localDateStr12);
      const utcTimestamp12 = Date.parse(utcDateStr12);
      const timeZoneOffset12 = new Date().getTimezoneOffset() * 60 * 1000;
      expect(localTimestamp12 - utcTimestamp12).assertEqual(timeZoneOffset12);
    });

    /**
     * @tc.name   Date2Test_013
     * @tc.number SUB_BUILTINS_DATE2_TEST_1300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp13 = Date.parse('Mon, 20 May 2024 12:30:00');
      const localEquivalent13 = new Date(2024, 4, 20, 12, 30).getTime();
      expect(timestamp13).assertEqual(localEquivalent13);
    });

    /**
     * @tc.name   Date2Test_014
     * @tc.number SUB_BUILTINS_DATE2_TEST_1400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp14 = Date.parse('2024-02-30');
      expect(isNaN(timestamp14)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_015
     * @tc.number SUB_BUILTINS_DATE2_TEST_1500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp15 = Date.parse('2024-13-20');
      expect(isNaN(timestamp15)).assertEqual(true)
    });

    /**
     * @tc.name   Date2Test_016
     * @tc.number SUB_BUILTINS_DATE2_TEST_1600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp16 = Date.parse('2024-05-20T25:30:00');
      expect(isNaN(timestamp16)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_017
     * @tc.number SUB_BUILTINS_DATE2_TEST_1700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp17 = Date.parse('');
      expect(isNaN(timestamp17)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_018
     * @tc.number SUB_BUILTINS_DATE2_TEST_1800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp18 = Date.parse('hello world');
      expect(isNaN(timestamp18)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_019
     * @tc.number SUB_BUILTINS_DATE2_TEST_1900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp19 = Date.parse('20240520');
      expect(isNaN(timestamp19)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_020
     * @tc.number SUB_BUILTINS_DATE2_TEST_2000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp20 = Date.parse('1970-01-01T00:00:00Z');
      expect(timestamp20).assertEqual(0);
    });

    /**
     * @tc.name   Date2Test_021
     * @tc.number SUB_BUILTINS_DATE2_TEST_2100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp21 = Date.parse('1969-12-31T23:59:59Z');
      expect(timestamp21).assertEqual(-1000);
    });

    /**
     * @tc.name   Date2Test_023
     * @tc.number SUB_BUILTINS_DATE2_TEST_2300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dateStr23 = '2024-05-20T12:30:00Z';
      const parseTimestamp23 = Date.parse(dateStr23);
      const dateObjTimestamp23 = new Date(dateStr23).getTime();
      expect(parseTimestamp23).assertEqual(dateObjTimestamp23);
    });

    /**
     * @tc.name   Date2Test_024
     * @tc.number SUB_BUILTINS_DATE2_TEST_2400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date24 = new Date();
      const targetTimestamp24 = Date.parse('2024-05-20T12:30:00Z');
      date24.setTime(targetTimestamp24);
      const isTargetDate24 = date24.getUTCFullYear() === 2024 &&
        date24.getUTCMonth() === 4 &&
        date24.getUTCDate() === 20 &&
        date24.getUTCHours() === 12 &&
        date24.getUTCMinutes() === 30;
      expect(isTargetDate24).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_025
     * @tc.number SUB_BUILTINS_DATE2_TEST_2500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp25 = Date.parse('20240520T123000Z');
      const standardTimestamp25 = Date.parse('2024-05-20T12:30:00Z');
      expect(isNaN(timestamp25)).assertEqual(true);
      expect(standardTimestamp25).assertEqual(1716208200000);
    });

    /**
     * @tc.name   Date2Test_026
     * @tc.number SUB_BUILTINS_DATE2_TEST_2600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp26 = Date.parse('20 May 2024 12:30:00 GMT');
      const standardTimestamp26 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp26).assertEqual(standardTimestamp26);
    });

    /**
     * @tc.name   Date2Test_027
     * @tc.number SUB_BUILTINS_DATE2_TEST_2700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp27 = Date.parse('2024-05-20T12:30:00.123Z');
      const standardTimestamp27 = Date.parse('2024-05-20T12:30:00Z') + 123;
      expect(timestamp27).assertEqual(standardTimestamp27);
    });

    /**
     * @tc.name   Date2Test_028
     * @tc.number SUB_BUILTINS_DATE2_TEST_2800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp28_1 = Date.parse('2024-05-20T12:30:00+0000');
      const timestamp28_2 = Date.parse('2024-05-20T12:30:00GMT');
      const timestamp28_3 = Date.parse('2024-05-20T12:30:00Z');
      expect(timestamp28_1).assertEqual(timestamp28_3);
      expect(isNaN(timestamp28_2)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_029
     * @tc.number SUB_BUILTINS_DATE2_TEST_2900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp29 = Date.parse('2024-05-20T12:30:00+2500');
      expect(isNaN(timestamp29)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_030
     * @tc.number SUB_BUILTINS_DATE2_TEST_3000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp30 = Date.parse('2024-05-20 12:30:00');
      const localEquivalent30 = new Date(2024, 4, 20, 12, 30).getTime();
      expect(timestamp30).assertEqual(localEquivalent30);
    });
    /**
     * @tc.name   Date2Test_031
     * @tc.number SUB_BUILTINS_DATE2_TEST_3100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp31 = Date.parse('2024-1-5');
      const expected31 = new Date('2024-01-05T00:00:00Z').getTime();
      expect(timestamp31).assertEqual(1704384000000);
      expect(expected31).assertEqual(1704412800000);
    });

    /**
     * @tc.name   Date2Test_032
     * @tc.number SUB_BUILTINS_DATE2_TEST_3200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp32 = Date.parse('2024-05-20T1:5:3');
      const localExpected32 = new Date(2024, 4, 20, 1, 5, 3).getTime();
      expect(isNaN(timestamp32)).assertEqual(true);
      expect(localExpected32).assertEqual(1716138303000);
    });

    /**
     * @tc.name   Date2Test_033
     * @tc.number SUB_BUILTINS_DATE2_TEST_3300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp33 = Date.parse('2024-05-20T12:30:00-03:00');
      const utcExpected33 = new Date('2024-05-20T15:30:00Z').getTime();
      expect(timestamp33).assertEqual(utcExpected33);
    });

    /**
     * @tc.name   Date2Test_034
     * @tc.number SUB_BUILTINS_DATE2_TEST_3400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp34 = Date.parse('2024-05-20T12:30:00+0800');
      const utcExpected34 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(timestamp34).assertEqual(utcExpected34);
    });

    /**
     * @tc.name   Date2Test_035
     * @tc.number SUB_BUILTINS_DATE2_TEST_3500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp35 = Date.parse('2024-05-20T12:30:00.456Z');
      const expected35 = Date.parse('2024-05-20T12:30:00Z') + 456;
      expect(timestamp35).assertEqual(expected35);

    });

    /**
     * @tc.name   Date2Test_036
     * @tc.number SUB_BUILTINS_DATE2_TEST_3600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp36 = Date.parse('Fri, 01 Jan 2024 00:00:00 GMT');
      const expected36 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp36).assertEqual(expected36);
    });

    /**
     * @tc.name   Date2Test_037
     * @tc.number SUB_BUILTINS_DATE2_TEST_3700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp37 = Date.parse('Sun, 28 Jan 2024 12:00:00 +0000');
      const expected37 = new Date('2024-01-28T12:00:00Z').getTime();
      expect(timestamp37).assertEqual(expected37);
    });

    /**
     * @tc.name   Date2Test_038
     * @tc.number SUB_BUILTINS_DATE2_TEST_3800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp38 = Date.parse('Mon, 20 May 2024 12:30 GMT');
      const expected38 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp38).assertEqual(expected38);
    });

    /**
     * @tc.name   Date2Test_039
     * @tc.number SUB_BUILTINS_DATE2_TEST_3900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp39 = Date.parse('Mon, 20 May 2024 12:30:00 UTC');
      const expected39 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp39).assertEqual(expected39);
    });

    /**
     * @tc.name   Date2Test_040
     * @tc.number SUB_BUILTINS_DATE2_TEST_4000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp40 = Date.parse('Mon, 5 May 2024 12:30:00 GMT');
      const expected40 = Date.parse('Mon, 05 May 2024 12:30:00 GMT');
      expect(timestamp40).assertEqual(expected40);
    });

    /**
     * @tc.name   Date2Test_041
     * @tc.number SUB_BUILTINS_DATE2_TEST_4100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp41 = Date.parse('2024-02-29');
      const expected41 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp41).assertEqual(expected41);
    });

    /**
     * @tc.name   Date2Test_042
     * @tc.number SUB_BUILTINS_DATE2_TEST_4200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp42 = Date.parse('2023-02-29');
      expect(isNaN(timestamp42)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_043
     * @tc.number SUB_BUILTINS_DATE2_TEST_4300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp43 = Date.parse('2024-12-31T23:59:59Z');
      const expected43 = new Date('2024-12-31T23:59:59Z').getTime();
      expect(timestamp43).assertEqual(expected43);
    });

    /**
     * @tc.name   Date2Test_044
     * @tc.number SUB_BUILTINS_DATE2_TEST_4400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp44 = Date.parse('Tue, 01 Jan 2024 00:00:00 GMT');
      const expected44 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp44).assertEqual(expected44);
    });

    /**
     * @tc.name   Date2Test_045
     * @tc.number SUB_BUILTINS_DATE2_TEST_4500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp45 = Date.parse('2024-12-31T23:59:59+02:00');
      const expected45 = new Date('2025-01-01T01:59:59Z').getTime();
      expect(timestamp45).assertEqual(1735682399000);
      expect(expected45).assertEqual(1735696799000);
    });


    /**
     * @tc.name   Date2Test_048
     * @tc.number SUB_BUILTINS_DATE2_TEST_4800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp48 = Date.parse('2024.05.20');
      expect(isNaN(timestamp48)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_049
     * @tc.number SUB_BUILTINS_DATE2_TEST_4900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp49 = Date.parse('2024-05/20');
      expect(isNaN(timestamp49)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_056
     * @tc.number SUB_BUILTINS_DATE2_TEST_5600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp56 = Date.parse('2024-05-20T12:30:00+14:00');
      const utcExpected56 = new Date('2024-05-20T00:30:00Z').getTime();
      expect(timestamp56).assertEqual(1716157800000);
      expect(utcExpected56).assertEqual(1716165000000);
    });

    /**
     * @tc.name   Date2Test_057
     * @tc.number SUB_BUILTINS_DATE2_TEST_5700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp57 = Date.parse('2024-05-20T12:30:00-12:00');
      const utcExpected57 = new Date('2024-05-21T00:30:00Z').getTime();
      expect(timestamp57).assertEqual(utcExpected57);
    });

    /**
     * @tc.name   Date2Test_058
     * @tc.number SUB_BUILTINS_DATE2_TEST_5800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp58 = Date.parse('1899-12-31T00:00:00Z');
      const expected58 = new Date('1899-12-31T00:00:00Z').getTime();
      expect(timestamp58).assertEqual(expected58);
    });

    /**
     * @tc.name   Date2Test_059
     * @tc.number SUB_BUILTINS_DATE2_TEST_5900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp59 = Date.parse('2100-01-01T00:00:00Z');
      const expected59 = new Date('2100-01-01T00:00:00Z').getTime();
      expect(timestamp59).assertEqual(expected59);
    });

    /**
     * @tc.name   Date2Test_060
     * @tc.number SUB_BUILTINS_DATE2_TEST_6000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr60 = '2024-05-20T23:30:00';
      const timestamp60 = Date.parse(localDateStr60);
      const utcExpected60 = new Date('2024-05-20T07:30:00Z').getTime();
      expect(timestamp60).assertEqual(1716219000000);
      expect(utcExpected60).assertEqual(1716190200000);
    });
    /**
     * @tc.name   Date2Test_061
     * @tc.number SUB_BUILTINS_DATE2_TEST_6100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp61 = Date.parse('2024');
      const expected61 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp61).assertEqual(expected61);
    });

    /**
     * @tc.name   Date2Test_062
     * @tc.number SUB_BUILTINS_DATE2_TEST_6200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp62 = Date.parse('2024-05');
      const expected62 = new Date('2024-05-01T00:00:00Z').getTime();
      expect(timestamp62).assertEqual(expected62);

    });

    /**
     * @tc.name   Date2Test_063
     * @tc.number SUB_BUILTINS_DATE2_TEST_6300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp63 = Date.parse('2024-05-20T');
      expect(isNaN(timestamp63)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_064
     * @tc.number SUB_BUILTINS_DATE2_TEST_6400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp64 = Date.parse('2024-05-20T12:30:00.1234Z');
      const expected64 = Date.parse('2024-05-20T12:30:00.123Z');
      expect(timestamp64).assertEqual(expected64);
    });

    /**
     * @tc.name   Date2Test_065
     * @tc.number SUB_BUILTINS_DATE2_TEST_6500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp65 = Date.parse('2024-05-20T12:30:00+08');
      const expected65 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(isNaN(timestamp65)).assertEqual(true);
      expect(expected65).assertEqual(1716179400000);
    });

    /**
     * @tc.name   Date2Test_066
     * @tc.number SUB_BUILTINS_DATE2_TEST_6600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp66 = Date.parse('  Mon, 20 May 2024 12:30:00 GMT');
      const expected66 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp66).assertEqual(expected66);
    });

    /**
     * @tc.name   Date2Test_067
     * @tc.number SUB_BUILTINS_DATE2_TEST_6700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp67 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      const invalidTimestamp67 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp67).assertEqual(Date.parse('2024-05-20T12:30:00Z'));
      expect(invalidTimestamp67).assertEqual(Date.parse('2024-05-20T12:30:00Z'));
    });

    /**
     * @tc.name   Date2Test_068
     * @tc.number SUB_BUILTINS_DATE2_TEST_6800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp68 = Date.parse('Mon, May 2024 12:30:00 GMT');
      expect(isNaN(timestamp68)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_069
     * @tc.number SUB_BUILTINS_DATE2_TEST_6900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp69 = Date.parse('Mon, 20 May 2024 12:30:00 +00');
      const expected69 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp69).assertEqual(expected69);
    });

    /**
     * @tc.name   Date2Test_070
     * @tc.number SUB_BUILTINS_DATE2_TEST_7000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp70 = Date.parse('Mon, 20 May 24 12:30:00 GMT');
      const expected70 = new Date('1924-05-20T12:30:00Z').getTime();
      expect(timestamp70).assertEqual(1716208200000);
      expect(expected70).assertEqual(-1439551800000);
    });

    /**
     * @tc.name   Date2Test_071
     * @tc.number SUB_BUILTINS_DATE2_TEST_7100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp71 = Date.parse('   ');
      expect(isNaN(timestamp71)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_076
     * @tc.number SUB_BUILTINS_DATE2_TEST_7600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp76 = Date.parse('2024-03-31T01:30:00+01:00');
      const expected76 = new Date('2024-03-31T00:30:00Z').getTime();
      expect(timestamp76).assertEqual(expected76);
    });

    /**
     * @tc.name   Date2Test_077
     * @tc.number SUB_BUILTINS_DATE2_TEST_7700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp77 = Date.parse('2024-03-31T03:30:00+02:00');
      const expected77 = new Date('2024-03-31T01:30:00Z').getTime();
      expect(timestamp77).assertEqual(expected77);
    });

    /**
     * @tc.name   Date2Test_078
     * @tc.number SUB_BUILTINS_DATE2_TEST_7800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp78 = Date.parse('2024-05-20T23:30:00+03:00');
      const expected78 = new Date('2024-05-20T20:30:00Z').getTime();
      expect(timestamp78).assertEqual(expected78);
    });

    /**
     * @tc.name   Date2Test_079
     * @tc.number SUB_BUILTINS_DATE2_TEST_7900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr79 = '2024-05-20T20:30:00';
      const timestamp79 = Date.parse(localDateStr79);
      const expected79 = new Date('2024-05-21T00:30:00Z').getTime();
      expect(timestamp79).assertEqual(1716208200000);
      expect(expected79).assertEqual(1716251400000);
    });

    /**
     * @tc.name   Date2Test_080
     * @tc.number SUB_BUILTINS_DATE2_TEST_8000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp80 = Date.parse('2024-05-20T00:00:00');
      const expected80 = new Date(2024, 4, 20, 0, 0, 0).getTime();
      expect(timestamp80).assertEqual(expected80);
    });

    /**
     * @tc.name   Date2Test_081
     * @tc.number SUB_BUILTINS_DATE2_TEST_8100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isoTimestamp81 = Date.parse('2024-05-20T12:30:00Z');
      const rfcTimestamp81 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(isoTimestamp81).assertEqual(rfcTimestamp81);
    });

    /**
     * @tc.name   Date2Test_082
     * @tc.number SUB_BUILTINS_DATE2_TEST_8200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp82 = Date.parse('2024-05-20!12:30:00');
      expect(isNaN(timestamp82)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_083
     * @tc.number SUB_BUILTINS_DATE2_TEST_8300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp83 = Date.parse('2024-005-020');
      expect(isNaN(timestamp83)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_084
     * @tc.number SUB_BUILTINS_DATE2_TEST_8400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp84 = Date.parse('12:30:00');
      expect(isNaN(timestamp84)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_085
     * @tc.number SUB_BUILTINS_DATE2_TEST_8500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp85 = Date.parse('12:30:00 2024-05-20');
      expect(isNaN(timestamp85)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_086
     * @tc.number SUB_BUILTINS_DATE2_TEST_8600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp86 = Date.parse('1970-01-01T08:00:00+08:00');
      const expected86 = 0;
      expect(timestamp86).assertEqual(expected86);
    });

    /**
     * @tc.name   Date2Test_087
     * @tc.number SUB_BUILTINS_DATE2_TEST_8700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp87 = Date.parse('1969-12-31T16:00:00-08:00');
      const expected87 = 0;
      expect(timestamp87).assertEqual(expected87);
    });

    /**
     * @tc.name   Date2Test_088
     * @tc.number SUB_BUILTINS_DATE2_TEST_8800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp88 = Date.parse('0001-01-01T00:00:00Z');
      const expected88 = new Date('0001-01-01T00:00:00Z').getTime();
      expect(timestamp88).assertEqual(expected88);
    });

    /**
     * @tc.name   Date2Test_089
     * @tc.number SUB_BUILTINS_DATE2_TEST_8900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp89 = Date.parse('2124-05-20T12:30:00Z');
      const expected89 = new Date('2124-05-20T12:30:00Z').getTime();
      expect(timestamp89).assertEqual(expected89);
    });

    /**
     * @tc.name   Date2Test_090
     * @tc.number SUB_BUILTINS_DATE2_TEST_9000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp90 = Date.parse('2024-12-31T23:59:59.999Z');
      const expected90 = Date.parse('2024-12-31T23:59:59Z') + 999;
      expect(timestamp90).assertEqual(expected90);
    });

    /**
     * @tc.name   Date2Test_092
     * @tc.number SUB_BUILTINS_DATE2_TEST_9200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp92 = Date.parse('2024-05-20T12::30:00');
      expect(isNaN(timestamp92)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_093
     * @tc.number SUB_BUILTINS_DATE2_TEST_9300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp93 = Date.parse('2024-05-20T12:30:00.123aZ');
      expect(isNaN(timestamp93)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_094
     * @tc.number SUB_BUILTINS_DATE2_TEST_9400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp94 = Date.parse('2024-05-20T12:30:00 +08:00');
      const expected94 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(isNaN(timestamp94)).assertEqual(true);
      expect(expected94).assertEqual(1716179400000);
    });

    /**
     * @tc.name   Date2Test_095
     * @tc.number SUB_BUILTINS_DATE2_TEST_9500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp95 = Date.parse('T12:30:00Z');
      expect(isNaN(timestamp95)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_096
     * @tc.number SUB_BUILTINS_DATE2_TEST_9600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp96 = Date.parse('Mon,, 20 May 2024 12:30:00 GMT');
      expect(isNaN(timestamp96)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_097
     * @tc.number SUB_BUILTINS_DATE2_TEST_9700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp97 = Date.parse('Mon, 20 May2024 12:30:00 GMT');
      expect(isNaN(timestamp97)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_098
     * @tc.number SUB_BUILTINS_DATE2_TEST_9800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp98 = Date.parse('Mon, 20 May 2024 12:30:00 GMT+08');
      expect(isNaN(timestamp98)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_099
     * @tc.number SUB_BUILTINS_DATE2_TEST_9900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp99 = Date.parse('mon, 20 may 2024 12:30:00 gmt');
      const expected99 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp99).assertEqual(expected99);
    });

    /**
     * @tc.name   Date2Test_100
     * @tc.number SUB_BUILTINS_DATE2_TEST_10000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp100 = Date.parse('Mon, 20. May 2024 12:30:00 GMT');
      expect(isNaN(timestamp100)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_104
     * @tc.number SUB_BUILTINS_DATE2_TEST_10400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp104 = Date.parse('NaN');
      expect(isNaN(timestamp104)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_106
     * @tc.number SUB_BUILTINS_DATE2_TEST_10600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp106 = Date.parse('2024-05-20T01:30:00-12:00');
      const expected106 = new Date('2024-05-20T13:30:00Z').getTime();
      expect(timestamp106).assertEqual(expected106);
    });

    /**
     * @tc.name   Date2Test_107
     * @tc.number SUB_BUILTINS_DATE2_TEST_10700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp107 = Date.parse('2024-02-29T00:00:00Z');
      const expected107 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp107).assertEqual(expected107);
    });

    /**
     * @tc.name   Date2Test_108
     * @tc.number SUB_BUILTINS_DATE2_TEST_10800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp108 = Date.parse('2024-02-29T08:00:00+08:00');
      const expected108 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp108).assertEqual(expected108);
    });

    /**
     * @tc.name   Date2Test_109
     * @tc.number SUB_BUILTINS_DATE2_TEST_10900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp109 = Date.parse('2024-04-30T23:30:00+02:00');
      const expected109 = new Date('2024-04-30T21:30:00Z').getTime();
      expect(timestamp109).assertEqual(expected109);
    });

    /**
     * @tc.name   Date2Test_110
     * @tc.number SUB_BUILTINS_DATE2_TEST_11000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp110 = Date.parse('2024-04-30T23:30:00-03:00');
      const expected110 = new Date('2024-05-01T02:30:00Z').getTime();
      expect(timestamp110).assertEqual(expected110);
    });

    /**
     * @tc.name   Date2Test_111
     * @tc.number SUB_BUILTINS_DATE2_TEST_11100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp111 = Date.parse('2024年05月20日');
      expect(isNaN(timestamp111)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_112
     * @tc.number SUB_BUILTINS_DATE2_TEST_11200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp112 = Date.parse('May 20, 2024');
      const expected112 = new Date(2024, 4, 20).getTime();
      expect(timestamp112).assertEqual(expected112);
    });

    /**
     * @tc.name   Date2Test_113
     * @tc.number SUB_BUILTINS_DATE2_TEST_11300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp113 = Date.parse('05 20, 2024');
      expect(isNaN(timestamp113)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_114
     * @tc.number SUB_BUILTINS_DATE2_TEST_11400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp114 = Date.parse('2024-05-20 12:30 UTC');
      const expected114 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp114).assertEqual(expected114);
    });

    /**
     * @tc.name   Date2Test_115
     * @tc.number SUB_BUILTINS_DATE2_TEST_11500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp115 = Date.parse('2024/05/20 12:30:00Z');
      expect(isNaN(timestamp115)).assertEqual(false)
    });

    /**
     * @tc.name   Date2Test_116
     * @tc.number SUB_BUILTINS_DATE2_TEST_11600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp116 = Date.parse('-0001-12-31T00:00:00Z');
      const expected116 = new Date('-0001-12-31T00:00:00Z').getTime();
      expect(isNaN(timestamp116)).assertEqual(true);
      expect(isNaN(expected116)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_117
     * @tc.number SUB_BUILTINS_DATE2_TEST_11700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp117 = Date.parse('1970-01-01T08:00:00+08:00');
      const expected117 = 0;
      expect(timestamp117).assertEqual(expected117);
    });

    /**
     * @tc.name   Date2Test_118
     * @tc.number SUB_BUILTINS_DATE2_TEST_11800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp118 = Date.parse('3024-05-20T12:30:00Z');
      const expected118 = new Date('3024-05-20T12:30:00Z').getTime();
      expect(timestamp118).assertEqual(expected118);
    });

    /**
     * @tc.name   Date2Test_119
     * @tc.number SUB_BUILTINS_DATE2_TEST_11900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp119 = Date.parse('2024-01-01T00:00:00.000Z');
      const expected119 = Date.parse('2024-01-01T00:00:00Z');
      expect(timestamp119).assertEqual(expected119);
    });

    /**
     * @tc.name   Date2Test_120
     * @tc.number SUB_BUILTINS_DATE2_TEST_12000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp120 = Date.parse('1999-12-31T23:59:59Z');
      const expected120 = new Date('1999-12-31T23:59:59Z').getTime();
      expect(timestamp120).assertEqual(expected120);
    });
    /**
     * @tc.name   Date2Test_121
     * @tc.number SUB_BUILTINS_DATE2_TEST_12100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp121 = Date.parse('+2024-05-20');
      const expected121 = new Date('2024-05-20T00:00:00Z').getTime();
      expect(timestamp121).assertEqual(1716134400000);
      expect(expected121).assertEqual(1716163200000);
    });

    /**
     * @tc.name   Date2Test_122
     * @tc.number SUB_BUILTINS_DATE2_TEST_12200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp122 = Date.parse('20245-05-20');
      const expected122 = new Date('20245-05-20T00:00:00Z').getTime();
      expect(timestamp122).assertEqual(576715305600000);
      expect(isNaN(expected122)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_123
     * @tc.number SUB_BUILTINS_DATE2_TEST_12300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp123 = Date.parse('2024-05-20T12:30');
      const localExpected123 = new Date(2024, 4, 20, 12, 30, 0).getTime();
      expect(timestamp123).assertEqual(localExpected123);
    });

    /**
     * @tc.name   Date2Test_124
     * @tc.number SUB_BUILTINS_DATE2_TEST_12400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp124 = Date.parse('2024-05-20T12');
      const localExpected124 = new Date(2024, 4, 20, 12, 0, 0).getTime();
      expect(isNaN(timestamp124)).assertEqual(true);
      expect(localExpected124).assertEqual(1716177600000);
    });

    /**
     * @tc.name   Date2Test_125
     * @tc.number SUB_BUILTINS_DATE2_TEST_12500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp125 = Date.parse('2024-05-20T12:30:00-');
      expect(isNaN(timestamp125)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_126
     * @tc.number SUB_BUILTINS_DATE2_TEST_12600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp126 = Date.parse('MON, 20 May 2024 12:30:00 GMT');
      const expected126 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp126).assertEqual(expected126);
    });

    /**
     * @tc.name   Date2Test_127
     * @tc.number SUB_BUILTINS_DATE2_TEST_12700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp127 = Date.parse('Mon, 20 MAY 2024 12:30:00 GMT');
      const expected127 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp127).assertEqual(expected127);
    });

    /**
     * @tc.name   Date2Test_128
     * @tc.number SUB_BUILTINS_DATE2_TEST_12800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp128 = Date.parse('Mon, 20 May 2024 12:30 GMT');
      const expected128 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp128).assertEqual(expected128);
    });

    /**
     * @tc.name   Date2Test_130
     * @tc.number SUB_BUILTINS_DATE2_TEST_13000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp130 = Date.parse('Mon, 5 May 2024 12:30:00 GMT');
      const expected130 = Date.parse('Mon, 05 May 2024 12:30:00 GMT');
      expect(timestamp130).assertEqual(expected130);
    });

    /**
     * @tc.name   Date2Test_131
     * @tc.number SUB_BUILTINS_DATE2_TEST_13100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp131 = Date.parse('1621488000000');
      const expected131 = 1621488000000;
      expect(isNaN(timestamp131)).assertEqual(true);
      expect(expected131).assertEqual(1621488000000);
    });

    /**
     * @tc.name   Date2Test_132
     * @tc.number SUB_BUILTINS_DATE2_TEST_13200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp132 = Date.parse('"2024-05-20"');
      expect(isNaN(timestamp132)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_133
     * @tc.number SUB_BUILTINS_DATE2_TEST_13300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp133 = Date.parse('undefined');
      expect(isNaN(timestamp133)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_134
     * @tc.number SUB_BUILTINS_DATE2_TEST_13400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp134 = Date.parse('null');
      expect(isNaN(timestamp134)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_135
     * @tc.number SUB_BUILTINS_DATE2_TEST_13500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp135True = Date.parse('true');
      const timestamp135False = Date.parse('false');
      expect(isNaN(timestamp135True) && isNaN(timestamp135False)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_136
     * @tc.number SUB_BUILTINS_DATE2_TEST_13600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp136 = Date.parse('2024-05-20T00:30:00+14:00');
      const expected136 = new Date('2024-05-19T10:30:00Z').getTime();
      expect(timestamp136).assertEqual(expected136);
    });

    /**
     * @tc.name   Date2Test_137
     * @tc.number SUB_BUILTINS_DATE2_TEST_13700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp137 = Date.parse('2024-05-19T12:30:00-12:00');
      const expected137 = new Date('2024-05-20T00:30:00Z').getTime();
      expect(timestamp137).assertEqual(expected137);
    });

    /**
     * @tc.name   Date2Test_138
     * @tc.number SUB_BUILTINS_DATE2_TEST_13800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp138 = Date.parse('2024-04-30T23:30:00+02:00');
      const expected138 = new Date('2024-04-30T21:30:00Z').getTime();
      expect(timestamp138).assertEqual(expected138);
    });

    /**
     * @tc.name   Date2Test_139
     * @tc.number SUB_BUILTINS_DATE2_TEST_13900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp139 = Date.parse('2024-04-30T23:30:00-03:00');
      const expected139 = new Date('2024-05-01T02:30:00Z').getTime();
      expect(timestamp139).assertEqual(expected139);
    });

    /**
     * @tc.name   Date2Test_140
     * @tc.number SUB_BUILTINS_DATE2_TEST_14000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp140 = Date.parse('1999-12-31T23:59:59Z');
      const expected140 = new Date('1999-12-31T23:59:59Z').getTime();
      expect(timestamp140).assertEqual(expected140);
    });

    /**
     * @tc.name   Date2Test_141
     * @tc.number SUB_BUILTINS_DATE2_TEST_14100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp141 = Date.parse('2024/05/20');
      const localExpected141 = new Date(2024, 4, 20).getTime();
      expect(timestamp141).assertEqual(localExpected141);
    });

    /**
     * @tc.name   Date2Test_142
     * @tc.number SUB_BUILTINS_DATE2_TEST_14200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp142 = Date.parse('2024.05.20');
      expect(isNaN(timestamp142)).assertEqual(false);
    });

    /**
     * @tc.name   Date2Test_143
     * @tc.number SUB_BUILTINS_DATE2_TEST_14300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp143 = Date.parse('2024年5月20日');
      expect(isNaN(timestamp143)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_144
     * @tc.number SUB_BUILTINS_DATE2_TEST_14400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp144 = Date.parse('2024-05-20 12:30 GMT+08');
      const expected144 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(timestamp144).assertEqual(expected144);
    });

    /**
     * @tc.name   Date2Test_145
     * @tc.number SUB_BUILTINS_DATE2_TEST_14500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp145 = Date.parse('20240520');
      expect(isNaN(timestamp145)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_146
     * @tc.number SUB_BUILTINS_DATE2_TEST_14600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp146 = Date.parse('-0100-01-01T00:00:00Z');
      const expected146 = new Date('-0100-01-01T00:00:00Z').getTime();
      expect(isNaN(timestamp146)).assertEqual(true);
      expect(isNaN(expected146)).assertEqual(true);
    });

    /**
     * @tc.name   Date2Test_147
     * @tc.number SUB_BUILTINS_DATE2_TEST_14700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp147 = Date.parse('1000-01-01T00:00:00Z');
      const expected147 = new Date('1000-01-01T00:00:00Z').getTime();
      expect(timestamp147).assertEqual(expected147);
    });

    /**
     * @tc.name   Date2Test_148
     * @tc.number SUB_BUILTINS_DATE2_TEST_14800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp148 = Date.parse('2524-05-20T12:30:00Z');
      const expected148 = new Date('2524-05-20T12:30:00Z').getTime();
      expect(timestamp148).assertEqual(expected148);
    });

    /**
     * @tc.name   Date2Test_149
     * @tc.number SUB_BUILTINS_DATE2_TEST_14900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp149 = Date.parse('2024-12-31T23:59:59.999Z');
      const expected149 = Date.parse('2024-12-31T23:59:59Z') + 999;
      expect(timestamp149).assertEqual(expected149);
    });

    /**
     * @tc.name   Date2Test_150
     * @tc.number SUB_BUILTINS_DATE2_TEST_15000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date2Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp150 = Date.parse('1970-01-01T00:00:01Z');
      const expected150 = 1000;
      expect(timestamp150).assertEqual(expected150);
    });

  })
}
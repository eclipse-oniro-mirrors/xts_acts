import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function Date1Test() {
  describe('Date1Test', () => {
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
     * @tc.name   Date1Test_001
     * @tc.number SUB_BUILTINS_DATE1_TEST_0100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new Date() instanceof Date).assertEqual(true);
      expect(isNaN(new Date().getTime())).assertEqual(false);
      expect(typeof Date()).assertEqual("string");
      const currentYear = new Date().getFullYear().toString();
      expect(Date().includes(currentYear)).assertEqual(true);
      const d1 = new Date().getTime();
      const d2 = new Date().getTime();
      expect(d2 - d1).assertLess(100);
      expect(new Date(0).getUTCFullYear()).assertEqual(1970);
      expect(new Date(0).getUTCMonth()).assertEqual(0);
      expect(new Date(0).getUTCDate()).assertEqual(1);
      expect(new Date(1620000000000).getFullYear()).assertEqual(2021);
      expect(new Date(-86400000).getUTCFullYear()).assertEqual(1969);
      expect(new Date(-86400000).getUTCMonth()).assertEqual(11);
      expect(isNaN(new Date(8.64e15).getTime())).assertEqual(false);
      expect(new Date(8.64e15 + 1).toString()).assertEqual("Invalid Date");
      expect(isNaN(new Date(-8.64e15).getTime())).assertEqual(false);
      expect(new Date(-8.64e15 - 1).toString()).assertEqual("Invalid Date");
    });

    /**
     * @tc.name   Date1Test_002
     * @tc.number SUB_BUILTINS_DATE1_TEST_0200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new Date(0).getUTCFullYear()).assertEqual(1970);
      expect(new Date(0).getUTCMonth()).assertEqual(0);
      expect(new Date(0).getUTCDate()).assertEqual(1);
      expect(new Date(1620000000000).getFullYear()).assertEqual(2021);
      expect(new Date(-86400000).getUTCFullYear()).assertEqual(1969);
      expect(new Date(-86400000).getUTCMonth()).assertEqual(11);
      expect(isNaN(new Date(8.64e15).getTime())).assertEqual(false);
      expect(new Date(8.64e15 + 1).toString()).assertEqual("Invalid Date");
      expect(isNaN(new Date(-8.64e15).getTime())).assertEqual(false);
      expect(new Date(-8.64e15 - 1).toString()).assertEqual("Invalid Date");
    });

    /**
     * @tc.name   Date1Test_003
     * @tc.number SUB_BUILTINS_DATE1_TEST_0300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new Date("2024-05-20").getUTCDate()).assertEqual(20);
      expect(new Date("2024-05-20").getUTCMonth()).assertEqual(4);
      expect(new Date("2024-05-20T14:30:00+08:00").getHours()).assertEqual(14);
      expect(new Date("2024-05-20T14:30:00Z").getUTCHours()).assertEqual(14);
      expect(new Date("Mon, 20 May 2024 14:30:00 GMT").getUTCHours()).assertEqual(14);
      expect(new Date("Sun, 19 May 2024 12:00:00 +0200").getUTCHours()).assertEqual(10);
      expect(new Date("2024/05/20").getFullYear()).assertEqual(2024);
      expect(new Date("abc").toString()).assertEqual("Invalid Date");
      expect(new Date("").toString()).assertEqual("Invalid Date");
      expect(new Date("2024").getUTCMonth()).assertEqual(0);
      expect(new Date("2024-05").getUTCDate()).assertEqual(1);
      expect(new Date("2024-05-20T14:30:00.123").getMilliseconds()).assertEqual(123);
      expect(new Date("2024-13-01").toString()).assertEqual("Invalid Date");
      expect(isNaN(new Date("2024-02-29").getTime())).assertEqual(false);
      expect(new Date("2024-02-30").toString()).assertEqual("Fri Mar 01 2024 08:00:00 GMT+0800");

    });

    /**
     * @tc.name   Date1Test_004
     * @tc.number SUB_BUILTINS_DATE1_TEST_0400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDate = new Date(2024, 4, 20, 14, 30, 45, 123);
      expect(new Date(baseDate).getFullYear()).assertEqual(baseDate.getFullYear());
      expect(new Date(baseDate).getMinutes()).assertEqual(baseDate.getMinutes());
      expect(new Date(baseDate).getMilliseconds()).assertEqual(baseDate.getMilliseconds());
    });
    /**
     * @tc.name   Date1Test_005
     * @tc.number SUB_BUILTINS_DATE1_TEST_0500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date1 = new Date(1620000000000.5);
      expect(date1.getMilliseconds()).assertEqual(0);
      const date2 = new Date(1);
      expect(isNaN(date2.getTime())).assertEqual(false);
      expect(date2.getMilliseconds()).assertEqual(1);
      const date3 = new Date(-1);
      expect(isNaN(date3.getTime())).assertEqual(false);
      expect(date3.getMilliseconds()).assertEqual(999);
      const date4 = new Date("1620000000000");
      expect(isNaN(date4.getTime())).assertEqual(true);
      expect(isNaN(date4.getFullYear())).assertEqual(true);
      const date5 = new Date(1.62e12);
      const date6 = new Date(1620000000000);
      expect(date5.getTime()).assertEqual(date6.getTime());
      const date7 = new Date(9e20);
      expect(date7.toString()).assertEqual("Invalid Date");

    });
    /**
     * @tc.name   Date1Test_006
     * @tc.number SUB_BUILTINS_DATE1_TEST_0600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("20240520");
      expect(isNaN(date.getUTCFullYear())).assertEqual(true);
      expect(isNaN(date.getUTCMonth())).assertEqual(true);
      expect(isNaN(date.getUTCDate())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_007
     * @tc.number SUB_BUILTINS_DATE1_TEST_0700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("2024-05-20T14:30+08:30");
      expect(date.getHours()).assertEqual(14);
    });
    /**
     * @tc.name   Date1Test_008
     * @tc.number SUB_BUILTINS_DATE1_TEST_0800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("2024-05-20T14:30-05:00");
      expect(date.getUTCHours()).assertEqual(19);
    });
    /**
     * @tc.name   Date1Test_009
     * @tc.number SUB_BUILTINS_DATE1_TEST_0900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("Sun 19 May 2024 12:00:00 GMT");
      expect(isNaN(date.getTime())).assertEqual(false);
      expect(date.getUTCHours()).assertEqual(12);
    });
    /**
     * @tc.name   Date1Test_010
     * @tc.number SUB_BUILTINS_DATE1_TEST_1000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("2024年05月20日");
      expect(isNaN(date.getFullYear())).assertEqual(true);
      expect(isNaN(date.getMonth())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_011
     * @tc.number SUB_BUILTINS_DATE1_TEST_1100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("2024-05-20T14:30+25:00");
      expect(date.toString()).assertEqual("Invalid Date");
    });
    /**
     * @tc.name   Date1Test_012
     * @tc.number SUB_BUILTINS_DATE1_TEST_1200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("2024-05-20T23:30+08:00");
      expect(date.getUTCDate()).assertEqual(20);
    });
    /**
     * @tc.name   Date1Test_013
     * @tc.number SUB_BUILTINS_DATE1_TEST_1300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date("null");
      expect(date.toString()).assertEqual("Invalid Date");
    });
    /**
     * @tc.name   Date1Test_014
     * @tc.number SUB_BUILTINS_DATE1_TEST_1400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 4, 20, 14, 30, 0, 1500);
      expect(date.getSeconds()).assertEqual(1);
      expect(date.getMilliseconds()).assertEqual(500);
    });
    /**
     * @tc.name   Date1Test_015
     * @tc.number SUB_BUILTINS_DATE1_TEST_1500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 4, 20, 14, 30, 70);
      expect(date.getMinutes()).assertEqual(31);
      expect(date.getSeconds()).assertEqual(10);
    });
    /**
     * @tc.name   Date1Test_016
     * @tc.number SUB_BUILTINS_DATE1_TEST_1600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 4, 20, 14, 65);
      expect(date.getHours()).assertEqual(15);
      expect(date.getMinutes()).assertEqual(5);
    });
    /**
     * @tc.name   Date1Test_017
     * @tc.number SUB_BUILTINS_DATE1_TEST_1700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 3, 31);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(1);
    });
    /**
     * @tc.name   Date1Test_018
     * @tc.number SUB_BUILTINS_DATE1_TEST_1800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 11, 31); // 11 代表 12 月
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getDate()).assertEqual(31);
    });
    /**
     * @tc.name   Date1Test_019
     * @tc.number SUB_BUILTINS_DATE1_TEST_1900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(100, 0, 1);
      expect(date.getFullYear()).assertEqual(100);
    });
    /**
     * @tc.name   Date1Test_020
     * @tc.number SUB_BUILTINS_DATE1_TEST_2000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(-1, 0, 1);
      expect(isNaN(date.getTime())).assertEqual(false);
      expect(date.getFullYear()).assertEqual(-1);
    });
    /**
     * @tc.name   Date1Test_021
     * @tc.number SUB_BUILTINS_DATE1_TEST_2100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date = new Date(2024, 4);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
    });
    /**
     * @tc.name   Date1Test_022
     * @tc.number SUB_BUILTINS_DATE1_TEST_2200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date1 = new Date();
      expect(date1 instanceof Date).assertEqual(true);
      expect(!isNaN(date1.getTime())).assertEqual(true);
    });

    /**
     * @tc.name   Date1Test_024
     * @tc.number SUB_BUILTINS_DATE1_TEST_2400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj3 = new Date();
      const str3 = Date();
      expect(typeof obj3 === 'object' && obj3 instanceof Date).assertEqual(true);
      expect(typeof str3 === 'string').assertEqual(true);

    });
    /**
     * @tc.name   Date1Test_025
     * @tc.number SUB_BUILTINS_DATE1_TEST_2500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp4 = 1622505600000;
      const date4 = new Date(timestamp4);
      expect(date4.toISOString()).assertEqual('2021-06-01T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_026
     * @tc.number SUB_BUILTINS_DATE1_TEST_2600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date5 = new Date(0);
      expect(date5.toISOString()).assertEqual('1970-01-01T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_027
     * @tc.number SUB_BUILTINS_DATE1_TEST_2700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp6 = -86400000; // 1969-12-31 00:00:00 UTC
      const date6 = new Date(timestamp6);
      expect(date6.toISOString()).assertEqual('1969-12-31T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_028
     * @tc.number SUB_BUILTINS_DATE1_TEST_2800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp7 = 1622505600123.456; // 2021-06-01 00:00:00.123 UTC
      const date7 = new Date(timestamp7);
      expect(date7.toISOString()).assertEqual('2021-06-01T00:00:00.123Z');
    });
    /**
     * @tc.name   Date1Test_029
     * @tc.number SUB_BUILTINS_DATE1_TEST_2900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp8 = 8.64e15 + 1;
      const date8 = new Date(timestamp8);
      expect(date8.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_030
     * @tc.number SUB_BUILTINS_DATE1_TEST_3000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp9 = -8.64e15 - 1;
      const date9 = new Date(timestamp9);
      expect(date9.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_031
     * @tc.number SUB_BUILTINS_DATE1_TEST_3100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const date11 = new Date("1622505600000");
        expect(date11.toISOString()).assertEqual('2021-06-01T00:00:00.000Z');
      } catch (e) {
        expect(e.message).assertEqual("range error")
      }
    });
    /**
     * @tc.name   Date1Test_032
     * @tc.number SUB_BUILTINS_DATE1_TEST_3200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date12 = new Date("2023-10-01");
      expect(date12.toISOString()).assertEqual('2023-10-01T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_033
     * @tc.number SUB_BUILTINS_DATE1_TEST_3300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localOffset13 = new Date().getTimezoneOffset() * 60000;
      const targetTime13 = new Date("2023-10-01T12:00").getTime() + localOffset13;
      const date13 = new Date("2023-10-01T12:00");
      expect(new Date(targetTime13).toISOString()).assertEqual("2023-09-30T20:00:00.000Z");
      expect(date13.toISOString()).assertEqual("2023-10-01T04:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_034
     * @tc.number SUB_BUILTINS_DATE1_TEST_3400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date14 = new Date("2023-10-01T12:00+08:00");
      expect(date14.toISOString()).assertEqual('2023-10-01T04:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_035
     * @tc.number SUB_BUILTINS_DATE1_TEST_3500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date15 = new Date("Sun, 01 Oct 2023 12:00:00 GMT");
      expect(date15.toISOString()).assertEqual('2023-10-01T12:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_036
     * @tc.number SUB_BUILTINS_DATE1_TEST_3600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date16 = new Date("2023/10/01");
      expect(isNaN(date16.getTime())).assertEqual(false);
    });
    /**
     * @tc.name   Date1Test_037
     * @tc.number SUB_BUILTINS_DATE1_TEST_3700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date17 = new Date("");
      expect(date17.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_038
     * @tc.number SUB_BUILTINS_DATE1_TEST_3800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date18 = new Date("abc123");
      expect(date18.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_039
     * @tc.number SUB_BUILTINS_DATE1_TEST_3900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date20 = new Date("2024-02-29");
      expect(date20.toISOString()).assertEqual('2024-02-29T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_040
     * @tc.number SUB_BUILTINS_DATE1_TEST_4000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date21 = new Date("2023-02-29");
      expect(date21.toString()).assertEqual('Wed Mar 01 2023 08:00:00 GMT+0800');
    });
    /**
     * @tc.name   Date1Test_041
     * @tc.number SUB_BUILTINS_DATE1_TEST_4100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date22 = new Date("2023-9-5");
      expect(date22.toISOString()).assertEqual("2023-09-04T16:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_042
     * @tc.number SUB_BUILTINS_DATE1_TEST_4200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date23 = new Date("2023-10-01T12:34:56.789");
      expect(date23.toISOString()).assertEqual("2023-10-01T04:34:56.789Z");
    });
    /**
     * @tc.name   Date1Test_043
     * @tc.number SUB_BUILTINS_DATE1_TEST_4300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original24 = new Date("2023-10-01");
      const copy24 = new Date(original24);
      expect(copy24.getTime()).assertEqual(original24.getTime());
    });
    /**
     * @tc.name   Date1Test_044
     * @tc.number SUB_BUILTINS_DATE1_TEST_4400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const invalid25 = new Date("invalid");
      const copy25 = new Date(invalid25);
      expect(copy25.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_045
     * @tc.number SUB_BUILTINS_DATE1_TEST_4500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const now27 = new Date();
      const copy27 = new Date(now27);
      expect(Math.abs(copy27.getTime() - now27.getTime()) < 10).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_046
     * @tc.number SUB_BUILTINS_DATE1_TEST_4600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const level128 = new Date("2023-10-01");
      const level228 = new Date(level128);
      const level328 = new Date(level228);
      expect(level328.getTime()).assertEqual(level128.getTime());
    });


    /**
     * @tc.name   Date1Test_059
     * @tc.number SUB_BUILTINS_DATE1_TEST_5900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date41 = new Date(-1, 9, 1);
      expect(date41.getFullYear()).assertEqual(-1)
    });

    /**
     * @tc.name   Date1Test_063
     * @tc.number SUB_BUILTINS_DATE1_TEST_6300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date46 = new Date(NaN, 9, 1);
      expect(date46.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.name   Date1Test_065
     * @tc.number SUB_BUILTINS_DATE1_TEST_6500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date52 = new Date("Sun, 01 Oct 2023 12:00:00 +0900");
      expect(date52.toISOString()).assertEqual('2023-10-01T03:00:00.000Z');

    });
    /**
     * @tc.name   Date1Test_066
     * @tc.number SUB_BUILTINS_DATE1_TEST_6600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date53 = new Date("2023-10-01T12:00:00+05:30");
      expect(date53.getUTCHours()).assertEqual(6);
      expect(date53.getUTCMinutes()).assertEqual(30);
    });
    /**
     * @tc.name   Date1Test_067
     * @tc.number SUB_BUILTINS_DATE1_TEST_6700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str54 = Date();
      expect(str54.includes("GMT+0800") || str54.includes("GMT+08:00")).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_068
     * @tc.number SUB_BUILTINS_DATE1_TEST_6800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date55 = new Date("2023-10-01T12:00:00Z");
      expect(date55.getUTCHours()).assertEqual(12);
      expect(date55.getHours()).assertEqual(20);
    });
    /**
     * @tc.name   Date1Test_069
     * @tc.number SUB_BUILTINS_DATE1_TEST_6900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date57 = new Date(" 2023-10-01 ");
      expect(date57.toISOString()).assertEqual("2023-09-30T16:00:00.000Z");
    });

    /**
     * @tc.name   Date1Test_074
     * @tc.number SUB_BUILTINS_DATE1_TEST_7400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date66_1 = new Date("9999-12-31");
      const date66_2 = new Date("10000-01-01");
      expect(date66_1.toISOString()).assertEqual('9999-12-31T00:00:00.000Z');
      expect(date66_2.toString()).assertEqual('Sat Jan 01 10000 00:00:00 GMT+0800');
    });

    /**
     * @tc.name   Date1Test_077
     * @tc.number SUB_BUILTINS_DATE1_TEST_7700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const date73 = new Date("2023-10-01T12");
        expect(date73.toISOString()).assertEqual('2023-10-01T12:00:00.000Z');
      } catch (e) {
        expect(e.message).assertEqual("range error");
      }
    });
    /**
     * @tc.name   Date1Test_078
     * @tc.number SUB_BUILTINS_DATE1_TEST_7800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date74 = new Date("2023-10");
      expect(date74.toISOString()).assertEqual('2023-10-01T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_079
     * @tc.number SUB_BUILTINS_DATE1_TEST_7900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date75 = new Date("2023.10.01");
      expect(isNaN(date75.getTime())).assertEqual(false);
    });
    /**
     * @tc.name   Date1Test_080
     * @tc.number SUB_BUILTINS_DATE1_TEST_8000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date76 = new Date(1000, 9, 1);
      expect(date76.getFullYear()).assertEqual(1000);
    });
    /**
     * @tc.name   Date1Test_081
     * @tc.number SUB_BUILTINS_DATE1_TEST_8100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date77 = new Date(9999, 11, 31);
      expect(date77.getFullYear()).assertEqual(9999)
    });
    /**
     * @tc.name   Date1Test_082
     * @tc.number SUB_BUILTINS_DATE1_TEST_8200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp78 = 8.64e15;
      const date78 = new Date(timestamp78);
      expect(!isNaN(date78.getTime())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_083
     * @tc.number SUB_BUILTINS_DATE1_TEST_8300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp79 = -8.64e15;
      const date79 = new Date(timestamp79);
      expect(!isNaN(date79.getTime())).assertEqual(true);
    });

    /**
     * @tc.name   Date1Test_088
     * @tc.number SUB_BUILTINS_DATE1_TEST_8800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date94 = new Date("2023-10-01T12:34:56");
      expect(date94.toISOString()).assertEqual("2023-10-01T04:34:56.000Z");
    });
    /**
     * @tc.name   Date1Test_089
     * @tc.number SUB_BUILTINS_DATE1_TEST_8900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date95 = new Date("2023-10-01t12:34:56");
      expect(isNaN(date95.getTime())).assertEqual(false);
    });
    /**
     * @tc.name   Date1Test_090
     * @tc.number SUB_BUILTINS_DATE1_TEST_9000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date96 = new Date("2023-10-01T12:34");
      expect(date96.getUTCSeconds()).assertEqual(0);
      expect(date96.toISOString()).assertEqual("2023-10-01T04:34:00.000Z");
    });
    /**
     * @tc.name   Date1Test_091
     * @tc.number SUB_BUILTINS_DATE1_TEST_9100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date97_1 = new Date("2023-10-01T12:00:00Z");
      const date97_2 = new Date("2023-10-01T12:00:00+00:00");
      expect(date97_1.getTime()).assertEqual(date97_2.getTime());
    });
    /**
     * @tc.name   Date1Test_092
     * @tc.number SUB_BUILTINS_DATE1_TEST_9200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date98 = new Date("2023-10-01T12:00:00-05:30");
      expect(date98.getUTCHours()).assertEqual(17);
      expect(date98.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.name   Date1Test_095
     * @tc.number SUB_BUILTINS_DATE1_TEST_9500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp102 = 8.64e15 - 1;
      const date102 = new Date(timestamp102);
      expect(!isNaN(date102.getTime())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_096
     * @tc.number SUB_BUILTINS_DATE1_TEST_9600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp102 = 8.64e15 - 1;
      const date102 = new Date(timestamp102);
      expect(!isNaN(date102.getTime())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_097
     * @tc.number SUB_BUILTINS_DATE1_TEST_9700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp103 = -8.64e15 + 1;
      const date103 = new Date(timestamp103);
      expect(!isNaN(date103.getTime())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_098
     * @tc.number SUB_BUILTINS_DATE1_TEST_9800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pastDate104 = new Date("1970-01-02");
      const copy104 = new Date(pastDate104);
      expect(copy104.toISOString()).assertEqual('1970-01-02T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_099
     * @tc.number SUB_BUILTINS_DATE1_TEST_9900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date105 = new Date(Infinity, 9, 1);
      expect(date105.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_100
     * @tc.number SUB_BUILTINS_DATE1_TEST_10000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date106 = new Date(2023, -Infinity, 1);
      expect(date106.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_101
     * @tc.number SUB_BUILTINS_DATE1_TEST_10100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date107 = new Date("0000-00-00");
      expect(date107.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_102
     * @tc.number SUB_BUILTINS_DATE1_TEST_10200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date108 = new Date("10000-00-01");
      expect(date108.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.name   Date1Test_104
     * @tc.number SUB_BUILTINS_DATE1_TEST_10400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date111 = new Date("2023-10-01T12:34.567");
      expect(isNaN(date111.getUTCSeconds())).assertEqual(true);
      expect(isNaN(date111.getUTCMilliseconds())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_105
     * @tc.number SUB_BUILTINS_DATE1_TEST_10500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date112 = new Date("2023-10-01T12:00:00+0800");
      expect(date112.toISOString()).assertEqual('2023-10-01T04:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_106
     * @tc.number SUB_BUILTINS_DATE1_TEST_10600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date113 = new Date("1000-10-01");
      expect(date113.getFullYear()).assertEqual(1000);
      expect(date113.toISOString()).assertEqual("1000-10-01T00:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_107
     * @tc.number SUB_BUILTINS_DATE1_TEST_10700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date114 = new Date("2023-10-01T12:00:00z");
      expect(isNaN(date114.getTime())).assertEqual(false);
    });
    /**
     * @tc.name   Date1Test_108
     * @tc.number SUB_BUILTINS_DATE1_TEST_10800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date115 = new Date("2023-1-5");
      expect(date115.toISOString()).assertEqual('2023-01-04T16:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_109
     * @tc.number SUB_BUILTINS_DATE1_TEST_10900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const date116 = new Date("2023-10-01T9:5");
        expect(date116.toISOString()).assertEqual('2023-10-01T09:05:00.000Z');
      } catch (e) {
        expect(e.message).assertEqual("range error");
      }
    });
    /**
     * @tc.name   Date1Test_110
     * @tc.number SUB_BUILTINS_DATE1_TEST_11000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date122 = new Date(Infinity);
      expect(date122.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_111
     * @tc.number SUB_BUILTINS_DATE1_TEST_11100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date123 = new Date(-Infinity);
      expect(date123.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.name   Date1Test_115
     * @tc.number SUB_BUILTINS_DATE1_TEST_11500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date127 = new Date("2023-03-12T02:00:00+08:00");
      expect(date127.getHours()).assertEqual(2);
    });

    /**
     * @tc.name   Date1Test_117
     * @tc.number SUB_BUILTINS_DATE1_TEST_11700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date129 = new Date(2100, 0, 1);
      expect(date129.getFullYear()).assertEqual(2100);
    });
    /**
     * @tc.name   Date1Test_118
     * @tc.number SUB_BUILTINS_DATE1_TEST_11800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date130 = new Date("Oct 1, 2023");
      expect(date130.toISOString()).assertEqual("2023-09-30T16:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_119
     * @tc.number SUB_BUILTINS_DATE1_TEST_11900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date132 = new Date(9999, 11, 31);
      expect(date132.toISOString()).assertEqual("9999-12-30T16:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_120
     * @tc.number SUB_BUILTINS_DATE1_TEST_12000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date133 = new Date(-9999, 9, 1);
      expect(date133.getFullYear()).assertEqual(-9999);
    });
    /**
     * @tc.name   Date1Test_121
     * @tc.number SUB_BUILTINS_DATE1_TEST_12100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const invalid134 = new Date("invalid");
      const copy134 = new Date(invalid134);
      copy134.setFullYear(2023);
      expect(copy134.toString()).assertEqual('Sun Jan 01 2023 00:00:00 GMT+0800');
    });
    /**
     * @tc.name   Date1Test_122
     * @tc.number SUB_BUILTINS_DATE1_TEST_12200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original135 = new Date("2023-10-01");
      const timestamp135 = original135.getTime();
      const newDate135 = new Date(timestamp135);
      expect(newDate135.getTime()).assertEqual(original135.getTime());
    });
    /**
     * @tc.name   Date1Test_123
     * @tc.number SUB_BUILTINS_DATE1_TEST_12300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str136 = "2023-10-01T12:34:56.789Z";
      const date136 = new Date(str136);
      expect(date136.toISOString()).assertEqual(str136);
    });
    /**
     * @tc.name   Date1Test_124
     * @tc.number SUB_BUILTINS_DATE1_TEST_12400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localStr137 = "2023/10/1 12:00:00";
      const date137 = new Date(localStr137);
      expect(date137.getUTCHours()).assertEqual(4);
    });
    /**
     * @tc.name   Date1Test_125
     * @tc.number SUB_BUILTINS_DATE1_TEST_12500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date138 = new Date(1);
      expect(date138.toISOString()).assertEqual('1970-01-01T00:00:00.001Z');
    });
    /**
     * @tc.name   Date1Test_126
     * @tc.number SUB_BUILTINS_DATE1_TEST_12600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date139 = new Date(-1); // 1969-12-31T23:59:59.999Z
      expect(date139.toISOString()).assertEqual('1969-12-31T23:59:59.999Z');

    });
    /**
     * @tc.name   Date1Test_127
     * @tc.number SUB_BUILTINS_DATE1_TEST_12700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str140 = Date();
      const date140 = new Date(str140);
      const now140 = new Date();
      expect(Math.abs(date140.getTime() - now140.getTime()) < 1000).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_128
     * @tc.number SUB_BUILTINS_DATE1_TEST_12800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date141 = new Date("2023-10-01T12");
      expect(isNaN(date141.getUTCMinutes())).assertEqual(true);
      expect(isNaN(date141.getUTCSeconds())).assertEqual(true);
      expect(isNaN(date141.getUTCMilliseconds())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_129
     * @tc.number SUB_BUILTINS_DATE1_TEST_12900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date142 = new Date("2023-10-01T12:34:56.123456");
      expect(date142.getUTCMilliseconds()).assertEqual(123);
    });
    /**
     * @tc.name   Date1Test_130
     * @tc.number SUB_BUILTINS_DATE1_TEST_13000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date143 = new Date("2023-10-01T12:00:00+14:00");
      expect(date143.toISOString()).assertContain('2023-09-30T22:00:00');
    });
    /**
     * @tc.name   Date1Test_131
     * @tc.number SUB_BUILTINS_DATE1_TEST_13100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date144 = new Date("2023-10-01T12:00:00-12:00");
      expect(date144.toISOString()).assertContain('2023-10-02T00:00:00');
    });
    /**
     * @tc.name   Date1Test_132
     * @tc.number SUB_BUILTINS_DATE1_TEST_13200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date145 = new Date("0001-01-01");
      expect(date145.getFullYear()).assertEqual(1);
      expect(date145.toISOString()).assertContain('0001-01-01T');
    });
    /**
     * @tc.name   Date1Test_133
     * @tc.number SUB_BUILTINS_DATE1_TEST_13300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date146 = new Date("9999-12-32");
      expect(date146.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_134
     * @tc.number SUB_BUILTINS_DATE1_TEST_13400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const date152 = new Date("0x1717F880000");
        expect(date152.toISOString()).assertEqual('2021-06-01T00:00:00.000Z');
      } catch (e) {
        expect(e.message).assertEqual("range error");
      }
    });
    /**
     * @tc.name   Date1Test_135
     * @tc.number SUB_BUILTINS_DATE1_TEST_13500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const date153 = new Date("0151777000000000");
        expect(date153.toISOString()).assertEqual('2021-06-01T00:00:00.000Z');
      } catch (e) {
        expect(e.message).assertEqual("range error");
      }
    });

    /**
     * @tc.name   Date1Test_141
     * @tc.number SUB_BUILTINS_DATE1_TEST_14100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date159 = new Date(1970, 0, 1);
      expect(date159.getTime()).assertEqual(-28800000);
    });
    /**
     * @tc.name   Date1Test_142
     * @tc.number SUB_BUILTINS_DATE1_TEST_14200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date161 = new Date(1969, 11, 31);
      expect(date161.getTime() < 0).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_143
     * @tc.number SUB_BUILTINS_DATE1_TEST_14300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date162 = new Date(1970, 0, 2); // 1970-01-02，时间戳>0
      expect(date162.getTime() > 0).assertEqual(true);
    });

    /**
     * @tc.name   Date1Test_145
     * @tc.number SUB_BUILTINS_DATE1_TEST_14500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDate165 = new Date(2023, 9, 1, 12);
      expect(localDate165.toISOString()).assertContain('2023-10-01T04:00:00');
    });

    /**
     * @tc.name   Date1Test_147
     * @tc.number SUB_BUILTINS_DATE1_TEST_14700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date167 = new Date(86400000);
      expect(date167.toISOString()).assertEqual('1970-01-02T00:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_148
     * @tc.number SUB_BUILTINS_DATE1_TEST_14800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date168 = new Date(-86400000);
      expect(date168.toISOString()).assertEqual("1969-12-31T00:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_149
     * @tc.number SUB_BUILTINS_DATE1_TEST_14900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date169_1 = new Date("2023-10-01T12:00:00-00:00");
      const date169_2 = new Date("2023-10-01T12:00:00Z");
      expect(date169_1.getTime()).assertEqual(date169_2.getTime());
    });
    /**
     * @tc.name   Date1Test_150
     * @tc.number SUB_BUILTINS_DATE1_TEST_15000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str170 = Date();
      const date170Str = new Date().toString();
      expect(str170.split(' ').length).assertEqual(date170Str.split(' ').length);
      expect(str170.slice(0, 3)).assertEqual(date170Str.slice(0, 3));
    });
    /**
     * @tc.name   Date1Test_151
     * @tc.number SUB_BUILTINS_DATE1_TEST_15100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date171 = new Date("2023-10-01T12:34:56:");
      expect(date171.toString()).assertEqual('Invalid Date');
    });
    /**
     * @tc.name   Date1Test_152
     * @tc.number SUB_BUILTINS_DATE1_TEST_15200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date172 = new Date("2023.10.01");
      expect(isNaN(date172.getTime())).assertEqual(false);
    });
    /**
     * @tc.name   Date1Test_153
     * @tc.number SUB_BUILTINS_DATE1_TEST_15300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date173_1 = new Date("2023-10-01T12:00:00+00:00");
      const date173_2 = new Date("2023-10-01T12:00:00");
      expect(date173_1.getTime() !== date173_2.getTime()).assertEqual(true);
    });

    /**
     * @tc.name   Date1Test_155
     * @tc.number SUB_BUILTINS_DATE1_TEST_15500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date175 = new Date("2023-10-01T:34");
      expect(date175.toString()).assertEqual('Invalid Date')
    });
    /**
     * @tc.name   Date1Test_156
     * @tc.number SUB_BUILTINS_DATE1_TEST_15600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date176 = new Date("2023-10-01T12:34:56.789+08:00");
      expect(date176.toISOString()).assertEqual('2023-10-01T04:34:56.789Z');
    });

    /**
     * @tc.name   Date1Test_158
     * @tc.number SUB_BUILTINS_DATE1_TEST_15800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date183 = new Date(2023, NaN, 1);
      expect(date183.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.name   Date1Test_163
     * @tc.number SUB_BUILTINS_DATE1_TEST_16300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date188 = new Date(2023, 9, 1, 12, 34, 56, 999);
      date188.setMilliseconds(date188.getMilliseconds() + 2);
      expect(date188.getSeconds()).assertEqual(57);
      expect(date188.getMilliseconds()).assertEqual(1);
    });
    /**
     * @tc.name   Date1Test_164
     * @tc.number SUB_BUILTINS_DATE1_TEST_16400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date189 = new Date(2023, 9, 1);
      expect(date189.getDate()).assertEqual(1);
      expect(date189.getMonth()).assertEqual(9);
    });

    /**
     * @tc.name   Date1Test_167
     * @tc.number SUB_BUILTINS_DATE1_TEST_16700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date194 = new Date(Number.MAX_SAFE_INTEGER);
      expect(isNaN(date194.getTime())).assertEqual(true);
    });
    /**
     * @tc.name   Date1Test_168
     * @tc.number SUB_BUILTINS_DATE1_TEST_16800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcTime195 = Date.UTC(2023, 9, 1, 12);
      const date195 = new Date(utcTime195);
      expect(date195.toISOString()).assertEqual('2023-10-01T12:00:00.000Z');
    });
    /**
     * @tc.name   Date1Test_169
     * @tc.number SUB_BUILTINS_DATE1_TEST_16900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDate196 = new Date(2023, 9, 1, 12);
      expect(localDate196.getUTCHours()).assertEqual(4);
    });
    /**
     * @tc.name   Date1Test_170
     * @tc.number SUB_BUILTINS_DATE1_TEST_17000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date197 = new Date(31536000000);
      expect(date197.toISOString()).assertContain('1971-01-01T00:00:00');
    });
    /**
     * @tc.name   Date1Test_171
     * @tc.number SUB_BUILTINS_DATE1_TEST_17100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date198 = new Date(-31536000000);
      expect(date198.toISOString()).assertContain("1969-01-01T00:00:00.000Z");
    });
    /**
     * @tc.name   Date1Test_172
     * @tc.number SUB_BUILTINS_DATE1_TEST_17200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isoStr199 = "2023-10-01T12:34:56.123Z";
      const date199 = new Date(isoStr199);
      expect(date199.toISOString()).assertEqual(isoStr199);
    });
    /**
     * @tc.name   Date1Test_173
     * @tc.number SUB_BUILTINS_DATE1_TEST_17300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date1Test_173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str200 = Date();
      const date200 = new Date(str200);
      const now200 = new Date();
      expect(Math.abs(date200.getTime() - now200.getTime()) < 1000).assertEqual(true);
    });

  })
}
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}
export default function Date4Test() {
  describe('Date4Test', () => {
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
     * @tc.name   Date4Test_001
     * @tc.number SUB_BUILTINS_Date4_TEST_0100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate1 = new Date(2024, 5, 15, 14, 30, 45, 123);
      const expectedTimestamp1 = 1718433045123;
      expect(testDate1.getDate()).assertEqual(15);
      expect(testDate1.getDay()).assertEqual(6);
      expect(testDate1.getFullYear()).assertEqual(2024);
      expect(testDate1.getHours()).assertEqual(14);
      expect(testDate1.getMilliseconds()).assertEqual(123);
      expect(testDate1.getMinutes()).assertEqual(30);
      expect(testDate1.getMonth()).assertEqual(5);
      expect(testDate1.getSeconds()).assertEqual(45);
      expect(testDate1.getTime()).assertEqual(expectedTimestamp1);
    });

    /**
     * @tc.name   Date4Test_002
     * @tc.number SUB_BUILTINS_Date4_TEST_0200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate2 = new Date(2000, 0, 1, 0, 0, 0, 0);
      expect(testDate2.getDate()).assertEqual(1);
      expect(testDate2.getDay()).assertEqual(6);
      expect(testDate2.getFullYear()).assertEqual(2000);
      expect(testDate2.getHours()).assertEqual(0);
      expect(testDate2.getMilliseconds()).assertEqual(0);
      expect(testDate2.getMinutes()).assertEqual(0);
      expect(testDate2.getMonth()).assertEqual(0);
      expect(testDate2.getSeconds()).assertEqual(0);
      expect(testDate2.getTime()).assertEqual(946656000000);
    });
    /**
     * @tc.name   Date4Test_003
     * @tc.number SUB_BUILTINS_Date4_TEST_0300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate3 = new Date("2023-12-31T15:59:59.999Z");
      expect(testDate3.getDate()).assertEqual(31);
      expect(testDate3.getDay()).assertEqual(0);
      expect(testDate3.getFullYear()).assertEqual(2023);
      expect(testDate3.getHours()).assertEqual(23);
      expect(testDate3.getMilliseconds()).assertEqual(999);
      expect(testDate3.getMinutes()).assertEqual(59);
      expect(testDate3.getMonth()).assertEqual(11);
      expect(testDate3.getSeconds()).assertEqual(59);
      expect(testDate3.getTime()).assertEqual(1704038399999);
    });

    /**
     * @tc.name   Date4Test_004
     * @tc.number SUB_BUILTINS_Date4_TEST_0400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate4 = new Date(2024, 1, 29, 8, 15, 30, 456);
      expect(testDate4.getDate()).assertEqual(29);
      expect(testDate4.getDay()).assertEqual(4);
      expect(testDate4.getFullYear()).assertEqual(2024);
      expect(testDate4.getHours()).assertEqual(8);
      expect(testDate4.getMilliseconds()).assertEqual(456);
      expect(testDate4.getMinutes()).assertEqual(15);
      expect(testDate4.getMonth()).assertEqual(1);
      expect(testDate4.getSeconds()).assertEqual(30);
      expect(testDate4.getTime()).assertEqual(1709165730456);
    });

    /**
     * @tc.name   Date4Test_005
     * @tc.number SUB_BUILTINS_Date4_TEST_0500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate5 = new Date(2023, 7, 31, 18, 45, 12, 789);
      expect(testDate5.getDate()).assertEqual(31);
      expect(testDate5.getDay()).assertEqual(4);
      expect(testDate5.getFullYear()).assertEqual(2023);
      expect(testDate5.getHours()).assertEqual(18);
      expect(testDate5.getMilliseconds()).assertEqual(789);
      expect(testDate5.getMinutes()).assertEqual(45);
      expect(testDate5.getMonth()).assertEqual(7);
      expect(testDate5.getSeconds()).assertEqual(12);
      expect(testDate5.getTime()).assertEqual(1693478712789);
    });

    /**
     * @tc.name   Date4Test_006
     * @tc.number SUB_BUILTINS_Date4_TEST_0600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate6 = new Date(2024, 3, 30, 22, 10, 59, 100);
      expect(testDate6.getDate()).assertEqual(30);
      expect(testDate6.getDay()).assertEqual(2);
      expect(testDate6.getFullYear()).assertEqual(2024);
      expect(testDate6.getHours()).assertEqual(22);
      expect(testDate6.getMilliseconds()).assertEqual(100);
      expect(testDate6.getMinutes()).assertEqual(10);
      expect(testDate6.getMonth()).assertEqual(3);
      expect(testDate6.getSeconds()).assertEqual(59);
      expect(testDate6.getTime()).assertEqual(1714486259100);
    });

    /**
     * @tc.name   Date4Test_007
     * @tc.number SUB_BUILTINS_Date4_TEST_0700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate7 = new Date(2025, 2, 10, 12, 0, 0, 0);
      expect(testDate7.getDate()).assertEqual(10);
      expect(testDate7.getDay()).assertEqual(1);
      expect(testDate7.getFullYear()).assertEqual(2025);
      expect(testDate7.getHours()).assertEqual(12);
      expect(testDate7.getMilliseconds()).assertEqual(0);
      expect(testDate7.getMinutes()).assertEqual(0);
      expect(testDate7.getMonth()).assertEqual(2);
      expect(testDate7.getSeconds()).assertEqual(0);
      expect(testDate7.getTime()).assertEqual(1741579200000);
    });

    /**
     * @tc.name   Date4Test_008
     * @tc.number SUB_BUILTINS_Date4_TEST_0800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate8 = new Date(2023, 10, 5, 3, 20, 40, 600);
      expect(testDate8.getDate()).assertEqual(5);
      expect(testDate8.getDay()).assertEqual(0);
      expect(testDate8.getFullYear()).assertEqual(2023);
      expect(testDate8.getHours()).assertEqual(3);
      expect(testDate8.getMilliseconds()).assertEqual(600);
      expect(testDate8.getMinutes()).assertEqual(20);
      expect(testDate8.getMonth()).assertEqual(10);
      expect(testDate8.getSeconds()).assertEqual(40);
      expect(testDate8.getTime()).assertEqual(1699125640600);
    });

    /**
     * @tc.name   Date4Test_009
     * @tc.number SUB_BUILTINS_Date4_TEST_0900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate9 = new Date(2024, 8, 18, 15, 59, 59, 999);
      expect(testDate9.getDate()).assertEqual(18);
      expect(testDate9.getDay()).assertEqual(3);
      expect(testDate9.getFullYear()).assertEqual(2024);
      expect(testDate9.getHours()).assertEqual(15);
      expect(testDate9.getMilliseconds()).assertEqual(999);
      expect(testDate9.getMinutes()).assertEqual(59);
      expect(testDate9.getMonth()).assertEqual(8);
      expect(testDate9.getSeconds()).assertEqual(59);
      expect(testDate9.getTime()).assertEqual(1726646399999);
    });

    /**
     * @tc.name   Date4Test_010
     * @tc.number SUB_BUILTINS_Date4_TEST_1000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate10 = new Date(2023, 6, 22, 23, 59, 59, 500);
      expect(testDate10.getDate()).assertEqual(22);
      expect(testDate10.getDay()).assertEqual(6);
      expect(testDate10.getFullYear()).assertEqual(2023);
      expect(testDate10.getHours()).assertEqual(23);
      expect(testDate10.getMilliseconds()).assertEqual(500);
      expect(testDate10.getMinutes()).assertEqual(59);
      expect(testDate10.getMonth()).assertEqual(6);
      expect(testDate10.getSeconds()).assertEqual(59);
      expect(testDate10.getTime()).assertEqual(1690041599500);
    });

    /**
     * @tc.name   Date4Test_011
     * @tc.number SUB_BUILTINS_Date4_TEST_1100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate11 = new Date(2023, 1, 28, 10, 30, 15, 222);
      expect(testDate11.getDate()).assertEqual(28);
      expect(testDate11.getDay()).assertEqual(2);
      expect(testDate11.getFullYear()).assertEqual(2023);
      expect(testDate11.getHours()).assertEqual(10);
      expect(testDate11.getMilliseconds()).assertEqual(222);
      expect(testDate11.getMinutes()).assertEqual(30);
      expect(testDate11.getMonth()).assertEqual(1);
      expect(testDate11.getSeconds()).assertEqual(15);
      expect(testDate11.getTime()).assertEqual(1677551415222);
    });

    /**
     * @tc.name   Date4Test_012
     * @tc.number SUB_BUILTINS_Date4_TEST_1200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate12 = new Date(2024, 11, 31, 23, 59, 59, 999);
      expect(testDate12.getDate()).assertEqual(31);
      expect(testDate12.getDay()).assertEqual(2);
      expect(testDate12.getFullYear()).assertEqual(2024);
      expect(testDate12.getHours()).assertEqual(23);
      expect(testDate12.getMilliseconds()).assertEqual(999);
      expect(testDate12.getMinutes()).assertEqual(59);
      expect(testDate12.getMonth()).assertEqual(11);
      expect(testDate12.getSeconds()).assertEqual(59);
      expect(testDate12.getTime()).assertEqual(1735660799999);
    });

    /**
     * @tc.name   Date4Test_013
     * @tc.number SUB_BUILTINS_Date4_TEST_1300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate13 = new Date(2025, 4, 15, 9, 45, 30, 777);
      expect(testDate13.getDate()).assertEqual(15);
      expect(testDate13.getDay()).assertEqual(4);
      expect(testDate13.getFullYear()).assertEqual(2025);
      expect(testDate13.getHours()).assertEqual(9);
      expect(testDate13.getMilliseconds()).assertEqual(777);
      expect(testDate13.getMinutes()).assertEqual(45);
      expect(testDate13.getMonth()).assertEqual(4);
      expect(testDate13.getSeconds()).assertEqual(30);
      expect(testDate13.getTime()).assertEqual(1747273530777);
    });

    /**
     * @tc.name   Date4Test_014
     * @tc.number SUB_BUILTINS_Date4_TEST_1400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate14 = new Date(2023, 8, 10, 16, 20, 45, 333);
      expect(testDate14.getDate()).assertEqual(10);
      expect(testDate14.getDay()).assertEqual(0);
      expect(testDate14.getFullYear()).assertEqual(2023);
      expect(testDate14.getHours()).assertEqual(16);
      expect(testDate14.getMilliseconds()).assertEqual(333);
      expect(testDate14.getMinutes()).assertEqual(20);
      expect(testDate14.getMonth()).assertEqual(8);
      expect(testDate14.getSeconds()).assertEqual(45);
      expect(testDate14.getTime()).assertEqual(1694334045333);
    });

    /**
     * @tc.name   Date4Test_015
     * @tc.number SUB_BUILTINS_Date4_TEST_1500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate15 = new Date(2024, 6, 8, 14, 59, 59, 999);
      expect(testDate15.getDate()).assertEqual(8);
      expect(testDate15.getDay()).assertEqual(1);
      expect(testDate15.getFullYear()).assertEqual(2024);
      expect(testDate15.getHours()).assertEqual(14);
      expect(testDate15.getMilliseconds()).assertEqual(999);
      expect(testDate15.getMinutes()).assertEqual(59);
      expect(testDate15.getMonth()).assertEqual(6);
      expect(testDate15.getSeconds()).assertEqual(59);
      expect(testDate15.getTime()).assertEqual(1720421999999);
    });

    /**
     * @tc.name   Date4Test_016
     * @tc.number SUB_BUILTINS_Date4_TEST_1600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate16 = new Date(2025, 0, 1, 6, 10, 20, 555);
      expect(testDate16.getDate()).assertEqual(1);
      expect(testDate16.getDay()).assertEqual(3);
      expect(testDate16.getFullYear()).assertEqual(2025);
      expect(testDate16.getHours()).assertEqual(6);
      expect(testDate16.getMilliseconds()).assertEqual(555);
      expect(testDate16.getMinutes()).assertEqual(10);
      expect(testDate16.getMonth()).assertEqual(0);
      expect(testDate16.getSeconds()).assertEqual(20);
      expect(testDate16.getTime()).assertEqual(1735683020555);
    });

    /**
     * @tc.name   Date4Test_017
     * @tc.number SUB_BUILTINS_Date4_TEST_1700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate17 = new Date(2023, 5, 30, 21, 35, 50, 888);
      expect(testDate17.getDate()).assertEqual(30);
      expect(testDate17.getDay()).assertEqual(5);
      expect(testDate17.getFullYear()).assertEqual(2023);
      expect(testDate17.getHours()).assertEqual(21);
      expect(testDate17.getMilliseconds()).assertEqual(888);
      expect(testDate17.getMinutes()).assertEqual(35);
      expect(testDate17.getMonth()).assertEqual(5);
      expect(testDate17.getSeconds()).assertEqual(50);
      expect(testDate17.getTime()).assertEqual(1688132150888);
    });

    /**
     * @tc.name   Date4Test_018
     * @tc.number SUB_BUILTINS_Date4_TEST_1800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate18 = new Date(2024, 2, 20, 0, 0, 0, 1);
      expect(testDate18.getDate()).assertEqual(20);
      expect(testDate18.getDay()).assertEqual(3);
      expect(testDate18.getFullYear()).assertEqual(2024);
      expect(testDate18.getHours()).assertEqual(0);
      expect(testDate18.getMilliseconds()).assertEqual(1);
      expect(testDate18.getMinutes()).assertEqual(0);
      expect(testDate18.getMonth()).assertEqual(2);
      expect(testDate18.getSeconds()).assertEqual(0);
      expect(testDate18.getTime()).assertEqual(1710864000001);
    });

    /**
     * @tc.name   Date4Test_019
     * @tc.number SUB_BUILTINS_Date4_TEST_1900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate19 = new Date("2024-10-01T00:00:00.000Z");
      expect(testDate19.getDate()).assertEqual(1);
      expect(testDate19.getDay()).assertEqual(2);
      expect(testDate19.getFullYear()).assertEqual(2024);
      expect(testDate19.getHours()).assertEqual(8);
      expect(testDate19.getMilliseconds()).assertEqual(0);
      expect(testDate19.getMinutes()).assertEqual(0);
      expect(testDate19.getMonth()).assertEqual(9);
      expect(testDate19.getSeconds()).assertEqual(0);
      expect(testDate19.getTime()).assertEqual(1727740800000);
    });

    /**
     * @tc.name   Date4Test_020
     * @tc.number SUB_BUILTINS_Date4_TEST_2000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate20 = new Date(2025, 7, 12, 19, 40, 30, 999);
      expect(testDate20.getDate()).assertEqual(12);
      expect(testDate20.getDay()).assertEqual(2);
      expect(testDate20.getFullYear()).assertEqual(2025);
      expect(testDate20.getHours()).assertEqual(19);
      expect(testDate20.getMilliseconds()).assertEqual(999);
      expect(testDate20.getMinutes()).assertEqual(40);
      expect(testDate20.getMonth()).assertEqual(7);
      expect(testDate20.getSeconds()).assertEqual(30);
      expect(testDate20.getTime()).assertEqual(1754998830999);
    });

    /**
     * @tc.name   Date4Test_021
     * @tc.number SUB_BUILTINS_Date4_TEST_2100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate21 = new Date(2025, 1, 1, 11, 25, 40, 150);
      expect(testDate21.getDate()).assertEqual(1);
      expect(testDate21.getDay()).assertEqual(6);
      expect(testDate21.getFullYear()).assertEqual(2025);
      expect(testDate21.getHours()).assertEqual(11);
      expect(testDate21.getMilliseconds()).assertEqual(150);
      expect(testDate21.getMinutes()).assertEqual(25);
      expect(testDate21.getMonth()).assertEqual(1);
      expect(testDate21.getSeconds()).assertEqual(40);
      expect(testDate21.getTime()).assertEqual(1738380340150);
    });

    /**
     * @tc.name   Date4Test_022
     * @tc.number SUB_BUILTINS_Date4_TEST_2200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate22 = new Date(2026, 0, 1, 7, 50, 10, 600);
      expect(testDate22.getDate()).assertEqual(1);
      expect(testDate22.getDay()).assertEqual(4);
      expect(testDate22.getFullYear()).assertEqual(2026);
      expect(testDate22.getHours()).assertEqual(7);
      expect(testDate22.getMilliseconds()).assertEqual(600);
      expect(testDate22.getMinutes()).assertEqual(50);
      expect(testDate22.getMonth()).assertEqual(0);
      expect(testDate22.getSeconds()).assertEqual(10);
      expect(testDate22.getTime()).assertEqual(1767225010600);
    });

    /**
     * @tc.name   Date4Test_023
     * @tc.number SUB_BUILTINS_Date4_TEST_2300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate23 = new Date(2023, 11, 15, 19, 10, 35, 450);
      expect(testDate23.getDate()).assertEqual(15);
      expect(testDate23.getDay()).assertEqual(5);
      expect(testDate23.getFullYear()).assertEqual(2023);
      expect(testDate23.getHours()).assertEqual(19);
      expect(testDate23.getMilliseconds()).assertEqual(450);
      expect(testDate23.getMinutes()).assertEqual(10);
      expect(testDate23.getMonth()).assertEqual(11);
      expect(testDate23.getSeconds()).assertEqual(35);
      expect(testDate23.getTime()).assertEqual(1702638635450);
    });

    /**
     * @tc.name   Date4Test_024
     * @tc.number SUB_BUILTINS_Date4_TEST_2400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate24 = new Date(2024, 4, 25, 2, 40, 55, 800);
      expect(testDate24.getDate()).assertEqual(25);
      expect(testDate24.getDay()).assertEqual(6);
      expect(testDate24.getFullYear()).assertEqual(2024);
      expect(testDate24.getHours()).assertEqual(2);
      expect(testDate24.getMilliseconds()).assertEqual(800);
      expect(testDate24.getMinutes()).assertEqual(40);
      expect(testDate24.getMonth()).assertEqual(4);
      expect(testDate24.getSeconds()).assertEqual(55);
      expect(testDate24.getTime()).assertEqual(1716576055800);
    });

    /**
     * @tc.name   Date4Test_025
     * @tc.number SUB_BUILTINS_Date4_TEST_2500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate25 = new Date(2025, 6, 30, 14, 0, 0, 200);
      expect(testDate25.getDate()).assertEqual(30);
      expect(testDate25.getDay()).assertEqual(3);
      expect(testDate25.getFullYear()).assertEqual(2025);
      expect(testDate25.getHours()).assertEqual(14);
      expect(testDate25.getMilliseconds()).assertEqual(200);
      expect(testDate25.getMinutes()).assertEqual(0);
      expect(testDate25.getMonth()).assertEqual(6);
      expect(testDate25.getSeconds()).assertEqual(0);
      expect(testDate25.getTime()).assertEqual(1753855200200);
    });

    /**
     * @tc.name   Date4Test_026
     * @tc.number SUB_BUILTINS_Date4_TEST_2600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate26 = new Date(2023, 2, 15, 10, 55, 25, 750);
      expect(testDate26.getDate()).assertEqual(15);
      expect(testDate26.getDay()).assertEqual(3);
      expect(testDate26.getFullYear()).assertEqual(2023);
      expect(testDate26.getHours()).assertEqual(10);
      expect(testDate26.getMilliseconds()).assertEqual(750);
      expect(testDate26.getMinutes()).assertEqual(55);
      expect(testDate26.getMonth()).assertEqual(2);
      expect(testDate26.getSeconds()).assertEqual(25);
      expect(testDate26.getTime()).assertEqual(1678848925750);
    });

    /**
     * @tc.name   Date4Test_027
     * @tc.number SUB_BUILTINS_Date4_TEST_2700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate27 = new Date(2024, 5, 15, 16, 30, 40, 300);
      expect(testDate27.getDate()).assertEqual(15);
      expect(testDate27.getDay()).assertEqual(6);
      expect(testDate27.getFullYear()).assertEqual(2024);
      expect(testDate27.getHours()).assertEqual(16);
      expect(testDate27.getMilliseconds()).assertEqual(300);
      expect(testDate27.getMinutes()).assertEqual(30);
      expect(testDate27.getMonth()).assertEqual(5);
      expect(testDate27.getSeconds()).assertEqual(40);
      expect(testDate27.getTime()).assertEqual(1718440240300);
    });

    /**
     * @tc.name   Date4Test_028
     * @tc.number SUB_BUILTINS_Date4_TEST_2800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate28 = new Date("2025-04-01T12:00:00.000Z");
      expect(testDate28.getDate()).assertEqual(1);
      expect(testDate28.getDay()).assertEqual(2);
      expect(testDate28.getFullYear()).assertEqual(2025);
      expect(testDate28.getHours()).assertEqual(20);
      expect(testDate28.getMilliseconds()).assertEqual(0);
      expect(testDate28.getMinutes()).assertEqual(0);
      expect(testDate28.getMonth()).assertEqual(3);
      expect(testDate28.getSeconds()).assertEqual(0);
      expect(testDate28.getTime()).assertEqual(1743508800000);
    });

    /**
     * @tc.name   Date4Test_029
     * @tc.number SUB_BUILTINS_Date4_TEST_2900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate29 = new Date(2023, 7, 20, 15, 25, 50, 500);
      expect(testDate29.getDate()).assertEqual(20);
      expect(testDate29.getDay()).assertEqual(0);
      expect(testDate29.getFullYear()).assertEqual(2023);
      expect(testDate29.getHours()).assertEqual(15);
      expect(testDate29.getMilliseconds()).assertEqual(500);
      expect(testDate29.getMinutes()).assertEqual(25);
      expect(testDate29.getMonth()).assertEqual(7);
      expect(testDate29.getSeconds()).assertEqual(50);
      expect(testDate29.getTime()).assertEqual(1692516350500);
    });

    /**
     * @tc.name   Date4Test_030
     * @tc.number SUB_BUILTINS_Date4_TEST_3000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate30 = new Date(2024, 8, 30, 20, 0, 10, 900);
      expect(testDate30.getDate()).assertEqual(30);
      expect(testDate30.getDay()).assertEqual(1);
      expect(testDate30.getFullYear()).assertEqual(2024);
      expect(testDate30.getHours()).assertEqual(20);
      expect(testDate30.getMilliseconds()).assertEqual(900);
      expect(testDate30.getMinutes()).assertEqual(0);
      expect(testDate30.getMonth()).assertEqual(8);
      expect(testDate30.getSeconds()).assertEqual(10);
      expect(testDate30.getTime()).assertEqual(1727697610900);
    });
    /**
     * @tc.name   Date4Test_031
     * @tc.number SUB_BUILTINS_Date4_TEST_3100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate31 = new Date(2023, 1, 15, 8, 40, 20, 180);
      expect(testDate31.getDate()).assertEqual(15);
      expect(testDate31.getDay()).assertEqual(3);
      expect(testDate31.getFullYear()).assertEqual(2023);
      expect(testDate31.getHours()).assertEqual(8);
      expect(testDate31.getMilliseconds()).assertEqual(180);
      expect(testDate31.getMinutes()).assertEqual(40);
      expect(testDate31.getMonth()).assertEqual(1);
      expect(testDate31.getSeconds()).assertEqual(20);
      expect(testDate31.getTime()).assertEqual(1676421620180);
    });

    /**
     * @tc.name   Date4Test_032
     * @tc.number SUB_BUILTINS_Date4_TEST_3200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate32 = new Date(2024, 1, 15, 13, 15, 45, 620);
      expect(testDate32.getDate()).assertEqual(15);
      expect(testDate32.getDay()).assertEqual(4);
      expect(testDate32.getFullYear()).assertEqual(2024);
      expect(testDate32.getHours()).assertEqual(13);
      expect(testDate32.getMilliseconds()).assertEqual(620);
      expect(testDate32.getMinutes()).assertEqual(15);
      expect(testDate32.getMonth()).assertEqual(1);
      expect(testDate32.getSeconds()).assertEqual(45);
      expect(testDate32.getTime()).assertEqual(1707974145620);
    });

    /**
     * @tc.name   Date4Test_033
     * @tc.number SUB_BUILTINS_Date4_TEST_3300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate33 = new Date(2024, 11, 1, 11, 30, 55, 340);
      expect(testDate33.getDate()).assertEqual(1);
      expect(testDate33.getDay()).assertEqual(0);
      expect(testDate33.getFullYear()).assertEqual(2024);
      expect(testDate33.getHours()).assertEqual(11);
      expect(testDate33.getMilliseconds()).assertEqual(340);
      expect(testDate33.getMinutes()).assertEqual(30);
      expect(testDate33.getMonth()).assertEqual(11);
      expect(testDate33.getSeconds()).assertEqual(55);
      expect(testDate33.getTime()).assertEqual(1733023855340);
    });

    /**
     * @tc.name   Date4Test_034
     * @tc.number SUB_BUILTINS_Date4_TEST_3400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate34 = new Date(2025, 0, 20, 1, 59, 59, 999);
      expect(testDate34.getDate()).assertEqual(20);
      expect(testDate34.getDay()).assertEqual(1);
      expect(testDate34.getFullYear()).assertEqual(2025);
      expect(testDate34.getHours()).assertEqual(1);
      expect(testDate34.getMilliseconds()).assertEqual(999);
      expect(testDate34.getMinutes()).assertEqual(59);
      expect(testDate34.getMonth()).assertEqual(0);
      expect(testDate34.getSeconds()).assertEqual(59);
      expect(testDate34.getTime()).assertEqual(1737309599999);
    });

    /**
     * @tc.name   Date4Test_035
     * @tc.number SUB_BUILTINS_Date4_TEST_3500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate35 = new Date(2023, 9, 5, 15, 30, 59, 999);
      expect(testDate35.getDate()).assertEqual(5);
      expect(testDate35.getDay()).assertEqual(4);
      expect(testDate35.getFullYear()).assertEqual(2023);
      expect(testDate35.getHours()).assertEqual(15);
      expect(testDate35.getMilliseconds()).assertEqual(999);
      expect(testDate35.getMinutes()).assertEqual(30);
      expect(testDate35.getMonth()).assertEqual(9);
      expect(testDate35.getSeconds()).assertEqual(59);
      expect(testDate35.getTime()).assertEqual(1696491059999);
    });

    /**
     * @tc.name   Date4Test_036
     * @tc.number SUB_BUILTINS_Date4_TEST_3600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate36 = new Date("2024-05-01T20:00:00.000Z");
      expect(testDate36.getDate()).assertEqual(2);
      expect(testDate36.getDay()).assertEqual(4);
      expect(testDate36.getFullYear()).assertEqual(2024);
      expect(testDate36.getHours()).assertEqual(4);
      expect(testDate36.getMilliseconds()).assertEqual(0);
      expect(testDate36.getMinutes()).assertEqual(0);
      expect(testDate36.getMonth()).assertEqual(4);
      expect(testDate36.getSeconds()).assertEqual(0);
      expect(testDate36.getTime()).assertEqual(1714593600000);
    });

    /**
     * @tc.name   Date4Test_037
     * @tc.number SUB_BUILTINS_Date4_TEST_3700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate37 = new Date(2025, 2, 30, 18, 20, 30, 760);
      expect(testDate37.getDate()).assertEqual(30);
      expect(testDate37.getDay()).assertEqual(0);
      expect(testDate37.getFullYear()).assertEqual(2025);
      expect(testDate37.getHours()).assertEqual(18);
      expect(testDate37.getMilliseconds()).assertEqual(760);
      expect(testDate37.getMinutes()).assertEqual(20);
      expect(testDate37.getMonth()).assertEqual(2);
      expect(testDate37.getSeconds()).assertEqual(30);
      expect(testDate37.getTime()).assertEqual(1743330030760);
    });

    /**
     * @tc.name   Date4Test_038
     * @tc.number SUB_BUILTINS_Date4_TEST_3800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate38 = new Date(2023, 8, 29, 22, 45, 15, 280);
      expect(testDate38.getDate()).assertEqual(29);
      expect(testDate38.getDay()).assertEqual(5);
      expect(testDate38.getFullYear()).assertEqual(2023);
      expect(testDate38.getHours()).assertEqual(22);
      expect(testDate38.getMilliseconds()).assertEqual(280);
      expect(testDate38.getMinutes()).assertEqual(45);
      expect(testDate38.getMonth()).assertEqual(8);
      expect(testDate38.getSeconds()).assertEqual(15);
      expect(testDate38.getTime()).assertEqual(1695998715280);
    });

    /**
     * @tc.name   Date4Test_039
     * @tc.number SUB_BUILTINS_Date4_TEST_3900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate39 = new Date(2024, 6, 15, 9, 59, 59, 450);
      expect(testDate39.getDate()).assertEqual(15);
      expect(testDate39.getDay()).assertEqual(1);
      expect(testDate39.getFullYear()).assertEqual(2024);
      expect(testDate39.getHours()).assertEqual(9);
      expect(testDate39.getMilliseconds()).assertEqual(450);
      expect(testDate39.getMinutes()).assertEqual(59);
      expect(testDate39.getMonth()).assertEqual(6);
      expect(testDate39.getSeconds()).assertEqual(59);
      expect(testDate39.getTime()).assertEqual(1721008799450);
    });

    /**
     * @tc.name   Date4Test_040
     * @tc.number SUB_BUILTINS_Date4_TEST_4000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate40 = new Date(2025, 5, 1, 23, 59, 59, 890);
      expect(testDate40.getDate()).assertEqual(1);
      expect(testDate40.getDay()).assertEqual(0);
      expect(testDate40.getFullYear()).assertEqual(2025);
      expect(testDate40.getHours()).assertEqual(23);
      expect(testDate40.getMilliseconds()).assertEqual(890);
      expect(testDate40.getMinutes()).assertEqual(59);
      expect(testDate40.getMonth()).assertEqual(5);
      expect(testDate40.getSeconds()).assertEqual(59);
      expect(testDate40.getTime()).assertEqual(1748793599890);
    });

    /**
     * @tc.name   Date4Test_041
     * @tc.number SUB_BUILTINS_Date4_TEST_4100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate41 = new Date(2025, 1, 25, 14, 20, 35, 120);
      expect(testDate41.getDate()).assertEqual(25);
      expect(testDate41.getDay()).assertEqual(2);
      expect(testDate41.getFullYear()).assertEqual(2025);
      expect(testDate41.getHours()).assertEqual(14);
      expect(testDate41.getMilliseconds()).assertEqual(120);
      expect(testDate41.getMinutes()).assertEqual(20);
      expect(testDate41.getMonth()).assertEqual(1);
      expect(testDate41.getSeconds()).assertEqual(35);
      expect(testDate41.getTime()).assertEqual(1740464435120);
    });

    /**
     * @tc.name   Date4Test_042
     * @tc.number SUB_BUILTINS_Date4_TEST_4200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate42 = new Date(2024, 1, 28, 17, 50, 10, 650);
      expect(testDate42.getDate()).assertEqual(28);
      expect(testDate42.getDay()).assertEqual(3);
      expect(testDate42.getFullYear()).assertEqual(2024);
      expect(testDate42.getHours()).assertEqual(17);
      expect(testDate42.getMilliseconds()).assertEqual(650);
      expect(testDate42.getMinutes()).assertEqual(50);
      expect(testDate42.getMonth()).assertEqual(1);
      expect(testDate42.getSeconds()).assertEqual(10);
      expect(testDate42.getTime()).assertEqual(1709113810650);
    });

    /**
     * @tc.name   Date4Test_043
     * @tc.number SUB_BUILTINS_Date4_TEST_4300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate43 = new Date(2023, 0, 31, 5, 15, 40, 380);
      expect(testDate43.getDate()).assertEqual(31);
      expect(testDate43.getDay()).assertEqual(2);
      expect(testDate43.getFullYear()).assertEqual(2023);
      expect(testDate43.getHours()).assertEqual(5);
      expect(testDate43.getMilliseconds()).assertEqual(380);
      expect(testDate43.getMinutes()).assertEqual(15);
      expect(testDate43.getMonth()).assertEqual(0);
      expect(testDate43.getSeconds()).assertEqual(40);
      expect(testDate43.getTime()).assertEqual(1675113340380);
    });

    /**
     * @tc.name   Date4Test_044
     * @tc.number SUB_BUILTINS_Date4_TEST_4400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate44 = new Date(2024, 3, 10, 3, 45, 59, 999);
      expect(testDate44.getDate()).assertEqual(10);
      expect(testDate44.getDay()).assertEqual(3);
      expect(testDate44.getFullYear()).assertEqual(2024);
      expect(testDate44.getHours()).assertEqual(3);
      expect(testDate44.getMilliseconds()).assertEqual(999);
      expect(testDate44.getMinutes()).assertEqual(45);
      expect(testDate44.getMonth()).assertEqual(3);
      expect(testDate44.getSeconds()).assertEqual(59);
      expect(testDate44.getTime()).assertEqual(1712691959999);
    });

    /**
     * @tc.name   Date4Test_045
     * @tc.number SUB_BUILTINS_Date4_TEST_4500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate45 = new Date(2025, 7, 5, 17, 59, 59, 720);
      expect(testDate45.getDate()).assertEqual(5);
      expect(testDate45.getDay()).assertEqual(2);
      expect(testDate45.getFullYear()).assertEqual(2025);
      expect(testDate45.getHours()).assertEqual(17);
      expect(testDate45.getMilliseconds()).assertEqual(720);
      expect(testDate45.getMinutes()).assertEqual(59);
      expect(testDate45.getMonth()).assertEqual(7);
      expect(testDate45.getSeconds()).assertEqual(59);
      expect(testDate45.getTime()).assertEqual(1754387999720);
    });

    /**
     * @tc.name   Date4Test_046
     * @tc.number SUB_BUILTINS_Date4_TEST_4600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate46 = new Date("2023-12-31T18:00:00.000Z");
      expect(testDate46.getDate()).assertEqual(1);
      expect(testDate46.getDay()).assertEqual(1);
      expect(testDate46.getFullYear()).assertEqual(2024);
      expect(testDate46.getHours()).assertEqual(2);
      expect(testDate46.getMilliseconds()).assertEqual(0);
      expect(testDate46.getMinutes()).assertEqual(0);
      expect(testDate46.getMonth()).assertEqual(0);
      expect(testDate46.getSeconds()).assertEqual(0);
      expect(testDate46.getTime()).assertEqual(1704045600000);
    });

    /**
     * @tc.name   Date4Test_047
     * @tc.number SUB_BUILTINS_Date4_TEST_4700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate47 = new Date(2024, 4, 16, 10, 30, 25, 410);
      expect(testDate47.getDate()).assertEqual(16);
      expect(testDate47.getDay()).assertEqual(4);
      expect(testDate47.getFullYear()).assertEqual(2024);
      expect(testDate47.getHours()).assertEqual(10);
      expect(testDate47.getMilliseconds()).assertEqual(410);
      expect(testDate47.getMinutes()).assertEqual(30);
      expect(testDate47.getMonth()).assertEqual(4);
      expect(testDate47.getSeconds()).assertEqual(25);
      expect(testDate47.getTime()).assertEqual(1715826625410);
    });

    /**
     * @tc.name   Date4Test_048
     * @tc.number SUB_BUILTINS_Date4_TEST_4800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate48 = new Date(2023, 5, 16, 21, 15, 50, 830);
      expect(testDate48.getDate()).assertEqual(16);
      expect(testDate48.getDay()).assertEqual(5);
      expect(testDate48.getFullYear()).assertEqual(2023);
      expect(testDate48.getHours()).assertEqual(21);
      expect(testDate48.getMilliseconds()).assertEqual(830);
      expect(testDate48.getMinutes()).assertEqual(15);
      expect(testDate48.getMonth()).assertEqual(5);
      expect(testDate48.getSeconds()).assertEqual(50);
      expect(testDate48.getTime()).assertEqual(1686921350830);
    });

    /**
     * @tc.name   Date4Test_049
     * @tc.number SUB_BUILTINS_Date4_TEST_4900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate49 = new Date(2025, 8, 20, 11, 59, 59, 260);
      expect(testDate49.getDate()).assertEqual(20);
      expect(testDate49.getDay()).assertEqual(6);
      expect(testDate49.getFullYear()).assertEqual(2025);
      expect(testDate49.getHours()).assertEqual(11);
      expect(testDate49.getMilliseconds()).assertEqual(260);
      expect(testDate49.getMinutes()).assertEqual(59);
      expect(testDate49.getMonth()).assertEqual(8);
      expect(testDate49.getSeconds()).assertEqual(59);
      expect(testDate49.getTime()).assertEqual(1758340799260);
    });

    /**
     * @tc.name   Date4Test_050
     * @tc.number SUB_BUILTINS_Date4_TEST_5000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate50 = new Date(2024, 9, 31, 23, 59, 59, 999);
      expect(testDate50.getDate()).assertEqual(31);
      expect(testDate50.getDay()).assertEqual(4);
      expect(testDate50.getFullYear()).assertEqual(2024);
      expect(testDate50.getHours()).assertEqual(23);
      expect(testDate50.getMilliseconds()).assertEqual(999);
      expect(testDate50.getMinutes()).assertEqual(59);
      expect(testDate50.getMonth()).assertEqual(9);
      expect(testDate50.getSeconds()).assertEqual(59);
      expect(testDate50.getTime()).assertEqual(1730390399999);
    });

    /**
     * @tc.name   Date4Test_051
     * @tc.number SUB_BUILTINS_Date4_TEST_5100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate51 = new Date(2023, 1, 27, 9, 10, 25, 190);
      expect(testDate51.getDate()).assertEqual(27);
      expect(testDate51.getDay()).assertEqual(1);
      expect(testDate51.getFullYear()).assertEqual(2023);
      expect(testDate51.getHours()).assertEqual(9);
      expect(testDate51.getMilliseconds()).assertEqual(190);
      expect(testDate51.getMinutes()).assertEqual(10);
      expect(testDate51.getMonth()).assertEqual(1);
      expect(testDate51.getSeconds()).assertEqual(25);
      expect(testDate51.getTime()).assertEqual(1677460225190);
    });

    /**
     * @tc.name   Date4Test_052
     * @tc.number SUB_BUILTINS_Date4_TEST_5200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate52 = new Date(2024, 1, 27, 16, 40, 50, 730);
      expect(testDate52.getDate()).assertEqual(27);
      expect(testDate52.getDay()).assertEqual(2);
      expect(testDate52.getFullYear()).assertEqual(2024);
      expect(testDate52.getHours()).assertEqual(16);
      expect(testDate52.getMilliseconds()).assertEqual(730);
      expect(testDate52.getMinutes()).assertEqual(40);
      expect(testDate52.getMonth()).assertEqual(1);
      expect(testDate52.getSeconds()).assertEqual(50);
      expect(testDate52.getTime()).assertEqual(1709023250730);
    });

    /**
     * @tc.name   Date4Test_053
     * @tc.number SUB_BUILTINS_Date4_TEST_5300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate53 = new Date(2025, 0, 2, 4, 25, 15, 360);
      expect(testDate53.getDate()).assertEqual(2);
      expect(testDate53.getDay()).assertEqual(4);
      expect(testDate53.getFullYear()).assertEqual(2025);
      expect(testDate53.getHours()).assertEqual(4);
      expect(testDate53.getMilliseconds()).assertEqual(360);
      expect(testDate53.getMinutes()).assertEqual(25);
      expect(testDate53.getMonth()).assertEqual(0);
      expect(testDate53.getSeconds()).assertEqual(15);
      expect(testDate53.getTime()).assertEqual(1735763115360);
    });

    /**
     * @tc.name   Date4Test_054
     * @tc.number SUB_BUILTINS_Date4_TEST_5400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate54 = new Date(2024, 5, 10, 2, 59, 0, 510);
      expect(testDate54.getDate()).assertEqual(10);
      expect(testDate54.getDay()).assertEqual(1);
      expect(testDate54.getFullYear()).assertEqual(2024);
      expect(testDate54.getHours()).assertEqual(2);
      expect(testDate54.getMilliseconds()).assertEqual(510);
      expect(testDate54.getMinutes()).assertEqual(59);
      expect(testDate54.getMonth()).assertEqual(5);
      expect(testDate54.getSeconds()).assertEqual(0);
      expect(testDate54.getTime()).assertEqual(1717959540510);
    });

    /**
     * @tc.name   Date4Test_055
     * @tc.number SUB_BUILTINS_Date4_TEST_5500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate55 = new Date(2023, 10, 20, 15, 59, 0, 870);
      expect(testDate55.getDate()).assertEqual(20);
      expect(testDate55.getDay()).assertEqual(1);
      expect(testDate55.getFullYear()).assertEqual(2023);
      expect(testDate55.getHours()).assertEqual(15);
      expect(testDate55.getMilliseconds()).assertEqual(870);
      expect(testDate55.getMinutes()).assertEqual(59);
      expect(testDate55.getMonth()).assertEqual(10);
      expect(testDate55.getSeconds()).assertEqual(0);
      expect(testDate55.getTime()).assertEqual(1700467140870);
    });

    /**
     * @tc.name   Date4Test_056
     * @tc.number SUB_BUILTINS_Date4_TEST_5600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate56 = new Date("2025-03-15T06:00:00.000Z");
      expect(testDate56.getDate()).assertEqual(15);
      expect(testDate56.getDay()).assertEqual(6);
      expect(testDate56.getFullYear()).assertEqual(2025);
      expect(testDate56.getHours()).assertEqual(14);
      expect(testDate56.getMilliseconds()).assertEqual(0);
      expect(testDate56.getMinutes()).assertEqual(0);
      expect(testDate56.getMonth()).assertEqual(2);
      expect(testDate56.getSeconds()).assertEqual(0);
      expect(testDate56.getTime()).assertEqual(1742018400000);
    });

    /**
     * @tc.name   Date4Test_057
     * @tc.number SUB_BUILTINS_Date4_TEST_5700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate57 = new Date(2024, 7, 10, 19, 35, 40, 240);
      expect(testDate57.getDate()).assertEqual(10);
      expect(testDate57.getDay()).assertEqual(6);
      expect(testDate57.getFullYear()).assertEqual(2024);
      expect(testDate57.getHours()).assertEqual(19);
      expect(testDate57.getMilliseconds()).assertEqual(240);
      expect(testDate57.getMinutes()).assertEqual(35);
      expect(testDate57.getMonth()).assertEqual(7);
      expect(testDate57.getSeconds()).assertEqual(40);
      expect(testDate57.getTime()).assertEqual(1723289740240);
    });

    /**
     * @tc.name   Date4Test_058
     * @tc.number SUB_BUILTINS_Date4_TEST_5800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate58 = new Date(2023, 8, 10, 11, 20, 30, 690);
      expect(testDate58.getDate()).assertEqual(10);
      expect(testDate58.getDay()).assertEqual(0);
      expect(testDate58.getFullYear()).assertEqual(2023);
      expect(testDate58.getHours()).assertEqual(11);
      expect(testDate58.getMilliseconds()).assertEqual(690);
      expect(testDate58.getMinutes()).assertEqual(20);
      expect(testDate58.getMonth()).assertEqual(8);
      expect(testDate58.getSeconds()).assertEqual(30);
      expect(testDate58.getTime()).assertEqual(1694316030690);
    });

    /**
     * @tc.name   Date4Test_059
     * @tc.number SUB_BUILTINS_Date4_TEST_5900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate59 = new Date(2025, 6, 5, 11, 0, 55, 420);
      expect(testDate59.getDate()).assertEqual(5);
      expect(testDate59.getDay()).assertEqual(6);
      expect(testDate59.getFullYear()).assertEqual(2025);
      expect(testDate59.getHours()).assertEqual(11);
      expect(testDate59.getMilliseconds()).assertEqual(420);
      expect(testDate59.getMinutes()).assertEqual(0);
      expect(testDate59.getMonth()).assertEqual(6);
      expect(testDate59.getSeconds()).assertEqual(55);
      expect(testDate59.getTime()).assertEqual(1751684455420);
    });

    /**
     * @tc.name   Date4Test_060
     * @tc.number SUB_BUILTINS_Date4_TEST_6000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate60 = new Date(2024, 11, 10, 23, 0, 59, 999);
      expect(testDate60.getDate()).assertEqual(10);
      expect(testDate60.getDay()).assertEqual(2);
      expect(testDate60.getFullYear()).assertEqual(2024);
      expect(testDate60.getHours()).assertEqual(23);
      expect(testDate60.getMilliseconds()).assertEqual(999);
      expect(testDate60.getMinutes()).assertEqual(0);
      expect(testDate60.getMonth()).assertEqual(11);
      expect(testDate60.getSeconds()).assertEqual(59);
      expect(testDate60.getTime()).assertEqual(1733842859999);
    });
    /**
     * @tc.name   Date4Test_061
     * @tc.number SUB_BUILTINS_Date4_TEST_6100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate61 = new Date(2025, 1, 5, 10, 45, 15, 130);
      expect(testDate61.getDate()).assertEqual(5);
      expect(testDate61.getDay()).assertEqual(3);
      expect(testDate61.getFullYear()).assertEqual(2025);
      expect(testDate61.getHours()).assertEqual(10);
      expect(testDate61.getMilliseconds()).assertEqual(130);
      expect(testDate61.getMinutes()).assertEqual(45);
      expect(testDate61.getMonth()).assertEqual(1);
      expect(testDate61.getSeconds()).assertEqual(15);
      expect(testDate61.getTime()).assertEqual(1738723515130);
    });

    /**
     * @tc.name   Date4Test_062
     * @tc.number SUB_BUILTINS_Date4_TEST_6200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate62 = new Date(2024, 1, 5, 18, 20, 30, 670);
      expect(testDate62.getDate()).assertEqual(5);
      expect(testDate62.getDay()).assertEqual(1);
      expect(testDate62.getFullYear()).assertEqual(2024);
      expect(testDate62.getHours()).assertEqual(18);
      expect(testDate62.getMilliseconds()).assertEqual(670);
      expect(testDate62.getMinutes()).assertEqual(20);
      expect(testDate62.getMonth()).assertEqual(1);
      expect(testDate62.getSeconds()).assertEqual(30);
      expect(testDate62.getTime()).assertEqual(1707128430670);
    });

    /**
     * @tc.name   Date4Test_063
     * @tc.number SUB_BUILTINS_Date4_TEST_6300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate63 = new Date(2023, 11, 29, 6, 10, 50, 390);
      expect(testDate63.getDate()).assertEqual(29);
      expect(testDate63.getDay()).assertEqual(5);
      expect(testDate63.getFullYear()).assertEqual(2023);
      expect(testDate63.getHours()).assertEqual(6);
      expect(testDate63.getMilliseconds()).assertEqual(390);
      expect(testDate63.getMinutes()).assertEqual(10);
      expect(testDate63.getMonth()).assertEqual(11);
      expect(testDate63.getSeconds()).assertEqual(50);
      expect(testDate63.getTime()).assertEqual(1703801450390);
    });

    /**
     * @tc.name   Date4Test_064
     * @tc.number SUB_BUILTINS_Date4_TEST_6400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate64 = new Date(2024, 6, 20, 1, 30, 59, 999);
      expect(testDate64.getDate()).assertEqual(20);
      expect(testDate64.getDay()).assertEqual(6);
      expect(testDate64.getFullYear()).assertEqual(2024);
      expect(testDate64.getHours()).assertEqual(1);
      expect(testDate64.getMilliseconds()).assertEqual(999);
      expect(testDate64.getMinutes()).assertEqual(30);
      expect(testDate64.getMonth()).assertEqual(6);
      expect(testDate64.getSeconds()).assertEqual(59);
      expect(testDate64.getTime()).assertEqual(1721410259999);
    });

    /**
     * @tc.name   Date4Test_065
     * @tc.number SUB_BUILTINS_Date4_TEST_6500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate65 = new Date(2025, 8, 5, 16, 45, 59, 740);
      expect(testDate65.getDate()).assertEqual(5);
      expect(testDate65.getDay()).assertEqual(5);
      expect(testDate65.getFullYear()).assertEqual(2025);
      expect(testDate65.getHours()).assertEqual(16);
      expect(testDate65.getMilliseconds()).assertEqual(740);
      expect(testDate65.getMinutes()).assertEqual(45);
      expect(testDate65.getMonth()).assertEqual(8);
      expect(testDate65.getSeconds()).assertEqual(59);
      expect(testDate65.getTime()).assertEqual(1757061959740);
    });

    /**
     * @tc.name   Date4Test_066
     * @tc.number SUB_BUILTINS_Date4_TEST_6600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate66 = new Date("2024-04-20T10:50:00.000Z");
      expect(testDate66.getDate()).assertEqual(20);
      expect(testDate66.getDay()).assertEqual(6);
      expect(testDate66.getFullYear()).assertEqual(2024);
      expect(testDate66.getHours()).assertEqual(18);
      expect(testDate66.getMilliseconds()).assertEqual(0);
      expect(testDate66.getMinutes()).assertEqual(50);
      expect(testDate66.getMonth()).assertEqual(3);
      expect(testDate66.getSeconds()).assertEqual(0);
      expect(testDate66.getTime()).assertEqual(1713610200000);
    });

    /**
     * @tc.name   Date4Test_067
     * @tc.number SUB_BUILTINS_Date4_TEST_6700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate67 = new Date(2023, 4, 21, 14, 25, 35, 250);
      expect(testDate67.getDate()).assertEqual(21);
      expect(testDate67.getDay()).assertEqual(0);
      expect(testDate67.getFullYear()).assertEqual(2023);
      expect(testDate67.getHours()).assertEqual(14);
      expect(testDate67.getMilliseconds()).assertEqual(250);
      expect(testDate67.getMinutes()).assertEqual(25);
      expect(testDate67.getMonth()).assertEqual(4);
      expect(testDate67.getSeconds()).assertEqual(35);
      expect(testDate67.getTime()).assertEqual(1684650335250);
    });

    /**
     * @tc.name   Date4Test_068
     * @tc.number SUB_BUILTINS_Date4_TEST_6800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate68 = new Date(2024, 5, 21, 20, 50, 15, 850);
      expect(testDate68.getDate()).assertEqual(21);
      expect(testDate68.getDay()).assertEqual(5);
      expect(testDate68.getFullYear()).assertEqual(2024);
      expect(testDate68.getHours()).assertEqual(20);
      expect(testDate68.getMilliseconds()).assertEqual(850);
      expect(testDate68.getMinutes()).assertEqual(50);
      expect(testDate68.getMonth()).assertEqual(5);
      expect(testDate68.getSeconds()).assertEqual(15);
      expect(testDate68.getTime()).assertEqual(1718974215850);
    });

    /**
     * @tc.name   Date4Test_069
     * @tc.number SUB_BUILTINS_Date4_TEST_6900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate69 = new Date(2025, 9, 10, 9, 59, 0, 430);
      expect(testDate69.getDate()).assertEqual(10);
      expect(testDate69.getDay()).assertEqual(5);
      expect(testDate69.getFullYear()).assertEqual(2025);
      expect(testDate69.getHours()).assertEqual(9);
      expect(testDate69.getMilliseconds()).assertEqual(430);
      expect(testDate69.getMinutes()).assertEqual(59);
      expect(testDate69.getMonth()).assertEqual(9);
      expect(testDate69.getSeconds()).assertEqual(0);
      expect(testDate69.getTime()).assertEqual(1760061540430);
    });

    /**
     * @tc.name   Date4Test_070
     * @tc.number SUB_BUILTINS_Date4_TEST_7000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate70 = new Date(2023, 7, 30, 23, 0, 59, 999);
      expect(testDate70.getDate()).assertEqual(30);
      expect(testDate70.getDay()).assertEqual(3);
      expect(testDate70.getFullYear()).assertEqual(2023);
      expect(testDate70.getHours()).assertEqual(23);
      expect(testDate70.getMilliseconds()).assertEqual(999);
      expect(testDate70.getMinutes()).assertEqual(0);
      expect(testDate70.getMonth()).assertEqual(7);
      expect(testDate70.getSeconds()).assertEqual(59);
      expect(testDate70.getTime()).assertEqual(1693407659999);
    });

    /**
     * @tc.name   Date4Test_071
     * @tc.number SUB_BUILTINS_Date4_TEST_7100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate71 = new Date(2023, 1, 20, 11, 30, 40, 160);
      expect(testDate71.getDate()).assertEqual(20);
      expect(testDate71.getDay()).assertEqual(1);
      expect(testDate71.getFullYear()).assertEqual(2023);
      expect(testDate71.getHours()).assertEqual(11);
      expect(testDate71.getMilliseconds()).assertEqual(160);
      expect(testDate71.getMinutes()).assertEqual(30);
      expect(testDate71.getMonth()).assertEqual(1);
      expect(testDate71.getSeconds()).assertEqual(40);
      expect(testDate71.getTime()).assertEqual(1676863840160);
    });

    /**
     * @tc.name   Date4Test_072
     * @tc.number SUB_BUILTINS_Date4_TEST_7200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate72 = new Date(2024, 1, 20, 19, 15, 25, 700);
      expect(testDate72.getDate()).assertEqual(20);
      expect(testDate72.getDay()).assertEqual(2);
      expect(testDate72.getFullYear()).assertEqual(2024);
      expect(testDate72.getHours()).assertEqual(19);
      expect(testDate72.getMilliseconds()).assertEqual(700);
      expect(testDate72.getMinutes()).assertEqual(15);
      expect(testDate72.getMonth()).assertEqual(1);
      expect(testDate72.getSeconds()).assertEqual(25);
      expect(testDate72.getTime()).assertEqual(1708427725700);
    });

    /**
     * @tc.name   Date4Test_073
     * @tc.number SUB_BUILTINS_Date4_TEST_7300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate73 = new Date(2025, 0, 3, 5, 40, 10, 320);
      expect(testDate73.getDate()).assertEqual(3);
      expect(testDate73.getDay()).assertEqual(5);
      expect(testDate73.getFullYear()).assertEqual(2025);
      expect(testDate73.getHours()).assertEqual(5);
      expect(testDate73.getMilliseconds()).assertEqual(320);
      expect(testDate73.getMinutes()).assertEqual(40);
      expect(testDate73.getMonth()).assertEqual(0);
      expect(testDate73.getSeconds()).assertEqual(10);
      expect(testDate73.getTime()).assertEqual(1735854010320);
    });

    /**
     * @tc.name   Date4Test_074
     * @tc.number SUB_BUILTINS_Date4_TEST_7400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate74 = new Date(2024, 4, 15, 1, 0, 35, 540);
      expect(testDate74.getDate()).assertEqual(15);
      expect(testDate74.getDay()).assertEqual(3);
      expect(testDate74.getFullYear()).assertEqual(2024);
      expect(testDate74.getHours()).assertEqual(1);
      expect(testDate74.getMilliseconds()).assertEqual(540);
      expect(testDate74.getMinutes()).assertEqual(0);
      expect(testDate74.getMonth()).assertEqual(4);
      expect(testDate74.getSeconds()).assertEqual(35);
      expect(testDate74.getTime()).assertEqual(1715706035540);
    });

    /**
     * @tc.name   Date4Test_075
     * @tc.number SUB_BUILTINS_Date4_TEST_7500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate75 = new Date(2023, 9, 15, 16, 0, 50, 880);
      expect(testDate75.getDate()).assertEqual(15);
      expect(testDate75.getDay()).assertEqual(0);
      expect(testDate75.getFullYear()).assertEqual(2023);
      expect(testDate75.getHours()).assertEqual(16);
      expect(testDate75.getMilliseconds()).assertEqual(880);
      expect(testDate75.getMinutes()).assertEqual(0);
      expect(testDate75.getMonth()).assertEqual(9);
      expect(testDate75.getSeconds()).assertEqual(50);
      expect(testDate75.getTime()).assertEqual(1697356850880);
    });

    /**
     * @tc.name   Date4Test_076
     * @tc.number SUB_BUILTINS_Date4_TEST_7600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate76 = new Date("2025-02-10T14:30:59.000Z");
      expect(testDate76.getDate()).assertEqual(10);
      expect(testDate76.getDay()).assertEqual(1);
      expect(testDate76.getFullYear()).assertEqual(2025);
      expect(testDate76.getHours()).assertEqual(22);
      expect(testDate76.getMilliseconds()).assertEqual(0);
      expect(testDate76.getMinutes()).assertEqual(30);
      expect(testDate76.getMonth()).assertEqual(1);
      expect(testDate76.getSeconds()).assertEqual(59);
      expect(testDate76.getTime()).assertEqual(1739197859000);
    });

    /**
     * @tc.name   Date4Test_077
     * @tc.number SUB_BUILTINS_Date4_TEST_7700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate77 = new Date(2024, 6, 11, 10, 20, 45, 280);
      expect(testDate77.getDate()).assertEqual(11);
      expect(testDate77.getDay()).assertEqual(4);
      expect(testDate77.getFullYear()).assertEqual(2024);
      expect(testDate77.getHours()).assertEqual(10);
      expect(testDate77.getMilliseconds()).assertEqual(280);
      expect(testDate77.getMinutes()).assertEqual(20);
      expect(testDate77.getMonth()).assertEqual(6);
      expect(testDate77.getSeconds()).assertEqual(45);
      expect(testDate77.getTime()).assertEqual(1720664445280);
    });

    /**
     * @tc.name   Date4Test_078
     * @tc.number SUB_BUILTINS_Date4_TEST_7800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate78 = new Date(2023, 7, 11, 21, 45, 15, 820);
      expect(testDate78.getDate()).assertEqual(11);
      expect(testDate78.getDay()).assertEqual(5);
      expect(testDate78.getFullYear()).assertEqual(2023);
      expect(testDate78.getHours()).assertEqual(21);
      expect(testDate78.getMilliseconds()).assertEqual(820);
      expect(testDate78.getMinutes()).assertEqual(45);
      expect(testDate78.getMonth()).assertEqual(7);
      expect(testDate78.getSeconds()).assertEqual(15);
      expect(testDate78.getTime()).assertEqual(1691761515820);
    });

    /**
     * @tc.name   Date4Test_079
     * @tc.number SUB_BUILTINS_Date4_TEST_7900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate79 = new Date(2025, 7, 15, 8, 59, 59, 460);
      expect(testDate79.getDate()).assertEqual(15);
      expect(testDate79.getDay()).assertEqual(5);
      expect(testDate79.getFullYear()).assertEqual(2025);
      expect(testDate79.getHours()).assertEqual(8);
      expect(testDate79.getMilliseconds()).assertEqual(460);
      expect(testDate79.getMinutes()).assertEqual(59);
      expect(testDate79.getMonth()).assertEqual(7);
      expect(testDate79.getSeconds()).assertEqual(59);
      expect(testDate79.getTime()).assertEqual(1755219599460);
    });

    /**
     * @tc.name   Date4Test_080
     * @tc.number SUB_BUILTINS_Date4_TEST_8000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate80 = new Date(2024, 10, 30, 23, 59, 0, 999);
      expect(testDate80.getDate()).assertEqual(30);
      expect(testDate80.getDay()).assertEqual(6);
      expect(testDate80.getFullYear()).assertEqual(2024);
      expect(testDate80.getHours()).assertEqual(23);
      expect(testDate80.getMilliseconds()).assertEqual(999);
      expect(testDate80.getMinutes()).assertEqual(59);
      expect(testDate80.getMonth()).assertEqual(10);
      expect(testDate80.getSeconds()).assertEqual(0);
      expect(testDate80.getTime()).assertEqual(1732982340999);
    });

    /**
     * @tc.name   Date4Test_081
     * @tc.number SUB_BUILTINS_Date4_TEST_8100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate81 = new Date(2023, 1, 1, 7, 25, 30, 140);
      expect(testDate81.getDate()).assertEqual(1);
      expect(testDate81.getDay()).assertEqual(3);
      expect(testDate81.getFullYear()).assertEqual(2023);
      expect(testDate81.getHours()).assertEqual(7);
      expect(testDate81.getMilliseconds()).assertEqual(140);
      expect(testDate81.getMinutes()).assertEqual(25);
      expect(testDate81.getMonth()).assertEqual(1);
      expect(testDate81.getSeconds()).assertEqual(30);
      expect(testDate81.getTime()).assertEqual(1675207530140);
    });

    /**
     * @tc.name   Date4Test_082
     * @tc.number SUB_BUILTINS_Date4_TEST_8200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate82 = new Date(2024, 1, 1, 15, 50, 15, 680);
      expect(testDate82.getDate()).assertEqual(1);
      expect(testDate82.getDay()).assertEqual(4);
      expect(testDate82.getFullYear()).assertEqual(2024);
      expect(testDate82.getHours()).assertEqual(15);
      expect(testDate82.getMilliseconds()).assertEqual(680);
      expect(testDate82.getMinutes()).assertEqual(50);
      expect(testDate82.getMonth()).assertEqual(1);
      expect(testDate82.getSeconds()).assertEqual(15);
      expect(testDate82.getTime()).assertEqual(1706773815680);
    });

    /**
     * @tc.name   Date4Test_083
     * @tc.number SUB_BUILTINS_Date4_TEST_8300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate83 = new Date(2024, 11, 30, 10, 15, 40, 370);
      expect(testDate83.getDate()).assertEqual(30);
      expect(testDate83.getDay()).assertEqual(1);
      expect(testDate83.getFullYear()).assertEqual(2024);
      expect(testDate83.getHours()).assertEqual(10);
      expect(testDate83.getMilliseconds()).assertEqual(370);
      expect(testDate83.getMinutes()).assertEqual(15);
      expect(testDate83.getMonth()).assertEqual(11);
      expect(testDate83.getSeconds()).assertEqual(40);
      expect(testDate83.getTime()).assertEqual(1735524940370);
    });

    /**
     * @tc.name   Date4Test_084
     * @tc.number SUB_BUILTINS_Date4_TEST_8400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate84 = new Date(2023, 8, 15, 2, 29, 30, 500);
      expect(testDate84.getDate()).assertEqual(15);
      expect(testDate84.getDay()).assertEqual(5);
      expect(testDate84.getFullYear()).assertEqual(2023);
      expect(testDate84.getHours()).assertEqual(2);
      expect(testDate84.getMilliseconds()).assertEqual(500);
      expect(testDate84.getMinutes()).assertEqual(29);
      expect(testDate84.getMonth()).assertEqual(8);
      expect(testDate84.getSeconds()).assertEqual(30);
      expect(testDate84.getTime()).assertEqual(1694716170500);
    });

    /**
     * @tc.name   Date4Test_085
     * @tc.number SUB_BUILTINS_Date4_TEST_8500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate85 = new Date(2025, 5, 15, 16, 39, 45, 750);
      expect(testDate85.getDate()).assertEqual(15);
      expect(testDate85.getDay()).assertEqual(0);
      expect(testDate85.getFullYear()).assertEqual(2025);
      expect(testDate85.getHours()).assertEqual(16);
      expect(testDate85.getMilliseconds()).assertEqual(750);
      expect(testDate85.getMinutes()).assertEqual(39);
      expect(testDate85.getMonth()).assertEqual(5);
      expect(testDate85.getSeconds()).assertEqual(45);
      expect(testDate85.getTime()).assertEqual(1749976785750);
    });

    /**
     * @tc.name   Date4Test_086
     * @tc.number SUB_BUILTINS_Date4_TEST_8600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate86 = new Date("2023-11-01T20:00:00.000Z");
      expect(testDate86.getDate()).assertEqual(2);
      expect(testDate86.getDay()).assertEqual(4);
      expect(testDate86.getFullYear()).assertEqual(2023);
      expect(testDate86.getHours()).assertEqual(4);
      expect(testDate86.getMilliseconds()).assertEqual(0);
      expect(testDate86.getMinutes()).assertEqual(0);
      expect(testDate86.getMonth()).assertEqual(10);
      expect(testDate86.getSeconds()).assertEqual(0);
      expect(testDate86.getTime()).assertEqual(1698868800000);
    });

    /**
     * @tc.name   Date4Test_087
     * @tc.number SUB_BUILTINS_Date4_TEST_8700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate87 = new Date(2024, 2, 31, 19, 45, 20, 290);
      expect(testDate87.getDate()).assertEqual(31);
      expect(testDate87.getDay()).assertEqual(0);
      expect(testDate87.getFullYear()).assertEqual(2024);
      expect(testDate87.getHours()).assertEqual(19);
      expect(testDate87.getMilliseconds()).assertEqual(290);
      expect(testDate87.getMinutes()).assertEqual(45);
      expect(testDate87.getMonth()).assertEqual(2);
      expect(testDate87.getSeconds()).assertEqual(20);
      expect(testDate87.getTime()).assertEqual(1711885520290);
    });

    /**
     * @tc.name   Date4Test_088
     * @tc.number SUB_BUILTINS_Date4_TEST_8800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate88 = new Date(2023, 5, 30, 11, 10, 55, 860);
      expect(testDate88.getDate()).assertEqual(30);
      expect(testDate88.getDay()).assertEqual(5);
      expect(testDate88.getFullYear()).assertEqual(2023);
      expect(testDate88.getHours()).assertEqual(11);
      expect(testDate88.getMilliseconds()).assertEqual(860);
      expect(testDate88.getMinutes()).assertEqual(10);
      expect(testDate88.getMonth()).assertEqual(5);
      expect(testDate88.getSeconds()).assertEqual(55);
      expect(testDate88.getTime()).assertEqual(1688094655860);
    });

    /**
     * @tc.name   Date4Test_089
     * @tc.number SUB_BUILTINS_Date4_TEST_8900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate89 = new Date(2025, 0, 15, 11, 29, 30, 480);
      expect(testDate89.getDate()).assertEqual(15);
      expect(testDate89.getDay()).assertEqual(3);
      expect(testDate89.getFullYear()).assertEqual(2025);
      expect(testDate89.getHours()).assertEqual(11);
      expect(testDate89.getMilliseconds()).assertEqual(480);
      expect(testDate89.getMinutes()).assertEqual(29);
      expect(testDate89.getMonth()).assertEqual(0);
      expect(testDate89.getSeconds()).assertEqual(30);
      expect(testDate89.getTime()).assertEqual(1736911770480);
    });

    /**
     * @tc.name   Date4Test_090
     * @tc.number SUB_BUILTINS_Date4_TEST_9000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate90 = new Date(2024, 7, 31, 23, 29, 45, 999);
      expect(testDate90.getDate()).assertEqual(31);
      expect(testDate90.getDay()).assertEqual(6);
      expect(testDate90.getFullYear()).assertEqual(2024);
      expect(testDate90.getHours()).assertEqual(23);
      expect(testDate90.getMilliseconds()).assertEqual(999);
      expect(testDate90.getMinutes()).assertEqual(29);
      expect(testDate90.getMonth()).assertEqual(7);
      expect(testDate90.getSeconds()).assertEqual(45);
      expect(testDate90.getTime()).assertEqual(1725118185999);
    });
    /**
     * @tc.name   Date4Test_091
     * @tc.number SUB_BUILTINS_Date4_TEST_9100
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate91 = new Date(2025, 1, 21, 8, 35, 20, 170);
      expect(testDate91.getDate()).assertEqual(21);
      expect(testDate91.getDay()).assertEqual(5);
      expect(testDate91.getFullYear()).assertEqual(2025);
      expect(testDate91.getHours()).assertEqual(8);
      expect(testDate91.getMilliseconds()).assertEqual(170);
      expect(testDate91.getMinutes()).assertEqual(35);
      expect(testDate91.getMonth()).assertEqual(1);
      expect(testDate91.getSeconds()).assertEqual(20);
      expect(testDate91.getTime()).assertEqual(1740098120170);
    });

    /**
     * @tc.name   Date4Test_092
     * @tc.number SUB_BUILTINS_Date4_TEST_9200
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate92 = new Date(2024, 1, 21, 17, 10, 45, 710);
      expect(testDate92.getDate()).assertEqual(21);
      expect(testDate92.getDay()).assertEqual(3);
      expect(testDate92.getFullYear()).assertEqual(2024);
      expect(testDate92.getHours()).assertEqual(17);
      expect(testDate92.getMilliseconds()).assertEqual(710);
      expect(testDate92.getMinutes()).assertEqual(10);
      expect(testDate92.getMonth()).assertEqual(1);
      expect(testDate92.getSeconds()).assertEqual(45);
      expect(testDate92.getTime()).assertEqual(1708506645710);
    });

    /**
     * @tc.name   Date4Test_093
     * @tc.number SUB_BUILTINS_Date4_TEST_9300
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate93 = new Date(2023, 0, 5, 6, 50, 15, 350);
      expect(testDate93.getDate()).assertEqual(5);
      expect(testDate93.getDay()).assertEqual(4);
      expect(testDate93.getFullYear()).assertEqual(2023);
      expect(testDate93.getHours()).assertEqual(6);
      expect(testDate93.getMilliseconds()).assertEqual(350);
      expect(testDate93.getMinutes()).assertEqual(50);
      expect(testDate93.getMonth()).assertEqual(0);
      expect(testDate93.getSeconds()).assertEqual(15);
      expect(testDate93.getTime()).assertEqual(1672872615350);
    });

    /**
     * @tc.name   Date4Test_094
     * @tc.number SUB_BUILTINS_Date4_TEST_9400
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate94 = new Date(2024, 3, 25, 3, 19, 59, 520);
      expect(testDate94.getDate()).assertEqual(25);
      expect(testDate94.getDay()).assertEqual(4);
      expect(testDate94.getFullYear()).assertEqual(2024);
      expect(testDate94.getHours()).assertEqual(3);
      expect(testDate94.getMilliseconds()).assertEqual(520);
      expect(testDate94.getMinutes()).assertEqual(19);
      expect(testDate94.getMonth()).assertEqual(3);
      expect(testDate94.getSeconds()).assertEqual(59);
      expect(testDate94.getTime()).assertEqual(1713986399520);
    });

    /**
     * @tc.name   Date4Test_095
     * @tc.number SUB_BUILTINS_Date4_TEST_9500
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate95 = new Date(2025, 8, 25, 15, 49, 59, 890);
      expect(testDate95.getDate()).assertEqual(25);
      expect(testDate95.getDay()).assertEqual(4);
      expect(testDate95.getFullYear()).assertEqual(2025);
      expect(testDate95.getHours()).assertEqual(15);
      expect(testDate95.getMilliseconds()).assertEqual(890);
      expect(testDate95.getMinutes()).assertEqual(49);
      expect(testDate95.getMonth()).assertEqual(8);
      expect(testDate95.getSeconds()).assertEqual(59);
      expect(testDate95.getTime()).assertEqual(1758786599890);
    });

    /**
     * @tc.name   Date4Test_096
     * @tc.number SUB_BUILTINS_Date4_TEST_9600
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate96 = new Date("2024-12-31T10:00:00.000Z");
      expect(testDate96.getDate()).assertEqual(31);
      expect(testDate96.getDay()).assertEqual(2);
      expect(testDate96.getFullYear()).assertEqual(2024);
      expect(testDate96.getHours()).assertEqual(18);
      expect(testDate96.getMilliseconds()).assertEqual(0);
      expect(testDate96.getMinutes()).assertEqual(0);
      expect(testDate96.getMonth()).assertEqual(11);
      expect(testDate96.getSeconds()).assertEqual(0);
      expect(testDate96.getTime()).assertEqual(1735639200000);
    });

    /**
     * @tc.name   Date4Test_097
     * @tc.number SUB_BUILTINS_Date4_TEST_9700
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate97 = new Date(2023, 6, 5, 10, 5, 30, 260);
      expect(testDate97.getDate()).assertEqual(5);
      expect(testDate97.getDay()).assertEqual(3);
      expect(testDate97.getFullYear()).assertEqual(2023);
      expect(testDate97.getHours()).assertEqual(10);
      expect(testDate97.getMilliseconds()).assertEqual(260);
      expect(testDate97.getMinutes()).assertEqual(5);
      expect(testDate97.getMonth()).assertEqual(6);
      expect(testDate97.getSeconds()).assertEqual(30);
      expect(testDate97.getTime()).assertEqual(1688522730260);
    });

    /**
     * @tc.name   Date4Test_098
     * @tc.number SUB_BUILTINS_Date4_TEST_9800
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate98 = new Date(2024, 8, 5, 20, 35, 15, 840);
      expect(testDate98.getDate()).assertEqual(5);
      expect(testDate98.getDay()).assertEqual(4);
      expect(testDate98.getFullYear()).assertEqual(2024);
      expect(testDate98.getHours()).assertEqual(20);
      expect(testDate98.getMilliseconds()).assertEqual(840);
      expect(testDate98.getMinutes()).assertEqual(35);
      expect(testDate98.getMonth()).assertEqual(8);
      expect(testDate98.getSeconds()).assertEqual(15);
      expect(testDate98.getTime()).assertEqual(1725539715840);

    });

    /**
     * @tc.name   Date4Test_099
     * @tc.number SUB_BUILTINS_Date4_TEST_9900
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate99 = new Date(2025, 2, 15, 9, 59, 30, 470);
      expect(testDate99.getDate()).assertEqual(15);
      expect(testDate99.getDay()).assertEqual(6);
      expect(testDate99.getFullYear()).assertEqual(2025);
      expect(testDate99.getHours()).assertEqual(9);
      expect(testDate99.getMilliseconds()).assertEqual(470);
      expect(testDate99.getMinutes()).assertEqual(59);
      expect(testDate99.getMonth()).assertEqual(2);
      expect(testDate99.getSeconds()).assertEqual(30);
      expect(testDate99.getTime()).assertEqual(1742003970470);
    });

    /**
     * @tc.name   Date4Test_100
     * @tc.number SUB_BUILTINS_Date4_TEST_10000
     * @tc.desc   test date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Date4Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate100 = new Date(2023, 11, 15, 23, 59, 30, 999);
      expect(testDate100.getDate()).assertEqual(15);
      expect(testDate100.getDay()).assertEqual(5);
      expect(testDate100.getFullYear()).assertEqual(2023);
      expect(testDate100.getHours()).assertEqual(23);
      expect(testDate100.getMilliseconds()).assertEqual(999);
      expect(testDate100.getMinutes()).assertEqual(59);
      expect(testDate100.getMonth()).assertEqual(11);
      expect(testDate100.getSeconds()).assertEqual(30);
      expect(testDate100.getTime()).assertEqual(1702655970999);
    });

  })
}
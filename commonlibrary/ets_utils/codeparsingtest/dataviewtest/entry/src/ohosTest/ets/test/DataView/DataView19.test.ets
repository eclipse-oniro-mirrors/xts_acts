/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView19Test() {
  describe('DataView19Test', () => {
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
     * @tc.name   DataView19Test001
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      view1.setInt32(0, 123456789);
      expect(view1.getInt32(0)).assertEqual(123456789);
    });

    /**
     * @tc.name   DataView19Test002
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(4);
      const view2 = new DataView(buffer2);
      const testValue = -987654321;
      view2.setInt32(0, testValue, true);
      expect(view2.getInt32(0, true)).assertEqual(testValue);
    });

    /**
     * @tc.name   DataView19Test003
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(8);
      const view3 = new DataView(buffer3);
      view3.setInt32(4, 0x7FFFFFFF);
      expect(view3.getInt32(4)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.name   DataView19Test004
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(5);
      const view4 = new DataView(buffer4);
      view4.setInt32(1, 12345);
      expect(view4.getInt32(1)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView19Test005
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(6);
      const view5 = new DataView(buffer5);
      view5.setInt32(2, -1, true);
      expect(view5.getInt32(2, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView19Test006
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(4);
      const view6 = new DataView(buffer6);
      const maxInt32 = 2147483647;
      view6.setInt32(0, maxInt32, true);
      expect(view6.getInt32(0, true)).assertEqual(maxInt32);
    });

    /**
     * @tc.name   DataView19Test007
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(4);
      const view7 = new DataView(buffer7);
      const minInt32 = -2147483648;
      view7.setInt32(0, minInt32);
      expect(view7.getInt32(0)).assertEqual(minInt32);
    });

    /**
     * @tc.name   DataView19Test008
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(8);
      const view8 = new DataView(buffer8);
      view8.setInt32(0, 100);
      view8.setInt32(4, 200);
      expect(view8.getInt32(0)).assertEqual(100);
      expect(view8.getInt32(4)).assertEqual(200);
    });

    /**
     * @tc.name   DataView19Test009
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_0900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(7);
      const view9 = new DataView(buffer9);
      view9.setInt32(3, 0);
      expect(view9.getInt32(3)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test010
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(4);
      const view10 = new DataView(buffer10);
      const overflowValue = 2147483648;
      view10.setInt32(0, overflowValue);
      expect(view10.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView19Test011
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const view11 = new DataView(buffer11);
      const underflowValue = -2147483649;
      view11.setInt32(0, underflowValue, true);
      expect(view11.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView19Test012
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(4);
      const view12 = new DataView(buffer12);
      const testVal12 = 0x12345678;
      view12.setInt32(0, testVal12, true);
      expect(view12.getInt32(0)).assertEqual(0x78563412);
    });

    /**
     * @tc.name   DataView19Test013
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(4);
      const view13 = new DataView(buffer13);
      const testVal13 = 0x87654321;
      view13.setInt32(0, testVal13);
      expect(view13.getInt32(0, true)).assertEqual(0x21436587);
    });

    /**
     * @tc.name   DataView19Test014
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(5);
      const view14 = new DataView(buffer14);
      view14.setInt32(1, -9876);
      expect(view14.getInt32(1)).assertEqual(-9876);
    });

    /**
     * @tc.name   DataView19Test015
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(4);
      const view15 = new DataView(buffer15);
      const minInt32 = -2147483648;
      view15.setInt32(0, minInt32, true);
      expect(view15.getInt32(0, true)).assertEqual(minInt32);
    });

    /**
     * @tc.name   DataView19Test016
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const view16 = new DataView(buffer16);
      const maxInt32 = 2147483647;
      view16.setInt32(0, maxInt32);
      expect(view16.getInt32(0)).assertEqual(maxInt32);
    });

    /**
     * @tc.name   DataView19Test017
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(12);
      const view17 = new DataView(buffer17);
      view17.setInt32(0, 1);
      view17.setInt32(4, 2, true);
      view17.setInt32(8, 3);
      expect(view17.getInt32(0)).assertEqual(1);
      expect(view17.getInt32(4, true)).assertEqual(2);
      expect(view17.getInt32(8)).assertEqual(3);
    });

    /**
     * @tc.name   DataView19Test018
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(7);
      const view18 = new DataView(buffer18);
      view18.setInt32(3, -12345, true);
      expect(view18.getInt32(3, true)).assertEqual(-12345);
    });

    /**
     * @tc.name   DataView19Test019
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_1900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(4);
      const view19 = new DataView(buffer19);
      view19.setInt32(0, 0x80000000);
      expect(view19.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView19Test020
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const view20 = new DataView(buffer20);
      view20.setInt32(0, 0x7FFFFFFF, true);
      expect(view20.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView19Test021
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(6);
      const view21 = new DataView(buffer21);
      view21.setInt32(2, 98765432);
      expect(view21.getInt32(2)).assertEqual(98765432);
    });

    /**
     * @tc.name   DataView19Test022
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(5);
      const view22 = new DataView(buffer22);
      view22.setInt32(1, -98765432, true);
      expect(view22.getInt32(1, true)).assertEqual(-98765432);
    });

    /**
     * @tc.name   DataView19Test023
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(4);
      const view23 = new DataView(buffer23);
      view23.setInt32(0, 0x00010203, true);
      expect(view23.getUint8(0)).assertEqual(0x03);
      expect(view23.getUint8(1)).assertEqual(0x02);
      expect(view23.getUint8(2)).assertEqual(0x01);
      expect(view23.getUint8(3)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView19Test024
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(4);
      const view24 = new DataView(buffer24);
      view24.setInt32(0, 0x04050607);
      expect(view24.getUint8(0)).assertEqual(0x04);
      expect(view24.getUint8(1)).assertEqual(0x05);
      expect(view24.getUint8(2)).assertEqual(0x06);
      expect(view24.getUint8(3)).assertEqual(0x07);
    });

    /**
     * @tc.name   DataView19Test025
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(4);
      const view25 = new DataView(buffer25);
      view25.setInt32(0, 3, true);
      expect(view25.getInt32(0, true)).assertEqual(3);
    });

    /**
     * @tc.name   DataView19Test026
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(4);
      const view26 = new DataView(buffer26);
      view26.setInt32(0, -3);
      expect(view26.getInt32(0)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView19Test027
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(4);
      const view27 = new DataView(buffer27);
      view27.setInt32(0, 1000000000);
      expect(view27.getInt32(0)).assertEqual(1000000000);
    });

    /**
     * @tc.name   DataView19Test028
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const view28 = new DataView(buffer28);
      view28.setInt32(0, -1000000000, true);
      expect(view28.getInt32(0, true)).assertEqual(-1000000000);
    });

    /**
     * @tc.name   DataView19Test029
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_2900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const view29 = new DataView(buffer29);
      const pow30 = 1073741824;
      view29.setInt32(0, pow30, true);
      expect(view29.getInt32(0, true)).assertEqual(pow30);
    });

    /**
     * @tc.name   DataView19Test030
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(4);
      const view30 = new DataView(buffer30);
      const negPow30 = -1073741824;
      view30.setInt32(0, negPow30);
      expect(view30.getInt32(0)).assertEqual(negPow30);
    });

    /**
     * @tc.name   DataView19Test031
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(8);
      const view31 = new DataView(buffer31);
      const sameVal = 0x11223344;
      view31.setInt32(0, sameVal);
      view31.setInt32(4, sameVal, true);
      expect(view31.getInt32(0)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView19Test032
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(10);
      const view32 = new DataView(buffer32);
      view32.setInt32(2, 1234);
      expect(view32.getInt32(2)).assertEqual(1234);
    });

    /**
     * @tc.name   DataView19Test033
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(9);
      const view33 = new DataView(buffer33);
      view33.setInt32(1, -1234, true);
      expect(view33.getInt32(1, true)).assertEqual(-1234);
    });

    /**
     * @tc.name   DataView19Test034
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(4);
      const view34 = new DataView(buffer34);
      const minInt32 = -2147483648;
      view34.setInt32(0, minInt32, true);
      expect(view34.getInt32(0, true)).assertEqual(minInt32);
    });

    /**
     * @tc.name   DataView19Test035
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(4);
      const view35 = new DataView(buffer35);
      view35.setInt32(0, 5);
      view35.setInt32(0, 10);
      expect(view35.getInt32(0)).assertEqual(10);
    });

    /**
     * @tc.name   DataView19Test036
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(7);
      const view36 = new DataView(buffer36);
      view36.setInt32(3, 1);
      expect(view36.getInt32(3)).assertEqual(1);
    });

    /**
     * @tc.name   DataView19Test037
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(6);
      const view37 = new DataView(buffer37);
      view37.setInt32(2, -1, true);
      expect(view37.getInt32(2, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView19Test038
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(4);
      const view38 = new DataView(buffer38);
      view38.setInt32(0, 0x11223344);
      view38.setUint8(1, 0xFF);
      expect(view38.getInt32(0)).assertEqual(0x11FF3344);
    });

    /**
     * @tc.name   DataView19Test039
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_3900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(4);
      const view39 = new DataView(buffer39);
      view39.setInt32(0, 0x11223344, true);
      view39.setUint8(1, 0xFF);
      expect(view39.getInt32(0, true)).assertEqual(0x1122FF44);
    });

    /**
     * @tc.name   DataView19Test040
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(4);
      const view40 = new DataView(buffer40);
      const maxInt32 = 2147483647;
      view40.setInt32(0, maxInt32);
      expect(view40.getInt32(0, true)).assertEqual(-129);
    });

    /**
     * @tc.name   DataView19Test041
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(6);
      const view41 = new DataView(buffer41);
      view41.setInt32(2, 123, true);
      expect(view41.getInt32(2, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView19Test042
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(9);
      const view42 = new DataView(buffer42);
      view42.setInt32(5, 0);
      expect(view42.getInt32(5)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test043
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const view43 = new DataView(buffer43);
      const nearMin = -2147483647;
      view43.setInt32(0, nearMin, true);
      expect(view43.getInt32(0, true)).assertEqual(nearMin);
    });

    /**
     * @tc.name   DataView19Test044
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(4);
      const view44 = new DataView(buffer44);
      const nearMax = 2147483646;
      view44.setInt32(0, nearMax);
      expect(view44.getInt32(0)).assertEqual(nearMax);
    });

    /**
     * @tc.name   DataView19Test045
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(8);
      const view45a = new DataView(buffer45);
      const view45b = new DataView(buffer45);
      view45a.setInt32(0, 100);
      view45b.setInt32(4, 200, true);
      expect(view45a.getInt32(0)).assertEqual(100);
      expect(view45b.getInt32(4, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView19Test046
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const view46 = new DataView(buffer46);
      view46.setInt32(0, 0xABCD1234, true);
      expect(view46.getInt32(0)).assertEqual(0x3412CDAB);
    });

    /**
     * @tc.name   DataView19Test047
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(4);
      const view47 = new DataView(buffer47);
      view47.setInt32(0, 0xDCBA4321);
      expect(view47.getInt32(0, true)).assertEqual(0x2143BADc);
    });

    /**
     * @tc.name   DataView19Test048
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(7);
      const view48 = new DataView(buffer48);
      view48.setInt32(3, -1000);
      expect(view48.getInt32(3)).assertEqual(-1000);

    });

    /**
     * @tc.name   DataView19Test049
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_4900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(5);
      const view49 = new DataView(buffer49);
      view49.setInt32(1, 1000, true);
      expect(view49.getInt32(1, true)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView19Test050
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(4);
      const view50 = new DataView(buffer50);
      view50.setInt32(0, 0x12345678);
      expect(view50.getUint8(0)).assertEqual(0x12);
      expect(view50.getUint8(1)).assertEqual(0x34);
      expect(view50.getUint8(2)).assertEqual(0x56);
      expect(view50.getUint8(3)).assertEqual(0x78);
    });

    /**
     * @tc.name   DataView19Test051
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(4);
      const view51 = new DataView(buffer51);
      view51.setInt32(0, 0x87654321, true);
      expect(view51.getUint8(0)).assertEqual(0x21);
      expect(view51.getUint8(1)).assertEqual(0x43);
      expect(view51.getUint8(2)).assertEqual(0x65);
      expect(view51.getUint8(3)).assertEqual(0x87);
    });

    /**
     * @tc.name   DataView19Test052
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(12);
      const view52 = new DataView(buffer52);
      view52.setInt32(0, 111);
      view52.setInt32(4, 222);
      view52.setInt32(8, 333);
      expect(view52.getInt32(0)).assertEqual(111);
      expect(view52.getInt32(4)).assertEqual(222);
      expect(view52.getInt32(8)).assertEqual(333);
    });

    /**
     * @tc.name   DataView19Test053
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(12);
      const view53 = new DataView(buffer53);
      view53.setInt32(0, 444, true);
      view53.setInt32(4, 555, true);
      view53.setInt32(8, 666, true);
      expect(view53.getInt32(0, true)).assertEqual(444);
      expect(view53.getInt32(4, true)).assertEqual(555);
      expect(view53.getInt32(8, true)).assertEqual(666);
    });

    /**
     * @tc.name   DataView19Test054
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(6);
      const view54 = new DataView(buffer54);
      view54.setInt32(2, 2);
      expect(view54.getInt32(2)).assertEqual(2);
    });

    /**
     * @tc.name   DataView19Test055
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(7);
      const view55 = new DataView(buffer55);
      view55.setInt32(3, -2, true);
      expect(view55.getInt32(3, true)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView19Test056
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(4);
      const view56 = new DataView(buffer56);
      view56.setInt32(0, 2147483649);
      expect(view56.getInt32(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.name   DataView19Test057
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(4);
      const view57 = new DataView(buffer57);
      view57.setInt32(0, -2147483650, true);
      expect(view57.getInt32(0, true)).assertEqual(2147483646);
    });

    /**
     * @tc.name   DataView19Test058
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(4);
      const view58 = new DataView(buffer58);
      view58.setInt32(0, 0x00000001);
      expect(view58.getInt32(0, true)).assertEqual(0x01000000);
    });

    /**
     * @tc.name   DataView19Test059
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_5900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(4);
      const view59 = new DataView(buffer59);
      view59.setInt32(0, 0x00000001, true);
      expect(view59.getInt32(0)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView19Test060
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(4);
      const view60 = new DataView(buffer60);
      view60.setInt32(0, -2147483648);
      expect(view60.getUint8(0)).assertEqual(0x80);
      expect(view60.getUint8(1)).assertEqual(0x00);
      expect(view60.getUint8(2)).assertEqual(0x00);
      expect(view60.getUint8(3)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView19Test061
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(4);
      const view61 = new DataView(buffer61);
      view61.setInt32(0, -2147483648, true);
      expect(view61.getUint8(0)).assertEqual(0x00);
      expect(view61.getUint8(1)).assertEqual(0x00);
      expect(view61.getUint8(2)).assertEqual(0x00);
      expect(view61.getUint8(3)).assertEqual(0x80);
    });

    /**
     * @tc.name   DataView19Test062
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(4);
      const view62 = new DataView(buffer62);
      view62.setInt32(0, 0x11AA22BB);
      view62.setUint8(2, 0xFF);
      expect(view62.getInt32(0)).assertEqual(0x11AAFFBB);
    });
    /**
     * @tc.name   DataView19Test063
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const view63 = new DataView(buffer63);
      view63.setInt32(0, 0x11AA22BB, true);
      view63.setUint8(1, 0xCC);
      expect(view63.getInt32(0, true)).assertEqual(0x11AACCBB);
    });

    /**
     * @tc.name   DataView19Test064
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(12);
      const view64 = new DataView(buffer64);
      view64.setInt32(8, 456);
      expect(view64.getInt32(8)).assertEqual(456);
    });

    /**
     * @tc.name   DataView19Test065
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(12);
      const view65 = new DataView(buffer65);
      view65.setInt32(8, -456, true);
      expect(view65.getInt32(8, true)).assertEqual(-456);
    });

    /**
     * @tc.name   DataView19Test066
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(4);
      const view66 = new DataView(buffer66);
      const val66 = 123456;
      view66.setInt32(0, val66);
      expect(view66.getInt32(0, true)).assertEqual(1088553216);
    });

    /**
     * @tc.name   DataView19Test067
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(4);
      const view67 = new DataView(buffer67);
      const val66 = 123456;
      view67.setInt32(0, val66, true);
      expect(view67.getInt32(0)).assertEqual(1088553216);
    });

    /**
     * @tc.name   DataView19Test068
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(8);
      const view68 = new DataView(buffer68);
      view68.setInt32(4, 0);
      expect(view68.getInt32(4)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test069
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_6900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(8);
      const view69 = new DataView(buffer69);
      view69.setInt32(4, 0, true);
      expect(view69.getInt32(4, true)).assertEqual(0);

    });

    /**
     * @tc.name   DataView19Test070
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(4);
      const view70 = new DataView(buffer70);
      view70.setInt32(0, 2147483647);
      expect(view70.getInt32(0, true)).assertEqual(-129);
    });

    /**
     * @tc.name   DataView19Test071
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(4);
      const view71 = new DataView(buffer71);
      view71.setInt32(0, 0x0000FFFF);
      expect(view71.getInt32(0)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView19Test072
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(4);
      const view72 = new DataView(buffer72);
      view72.setInt32(0, 0xFFFF0000, true);
      expect(view72.getInt32(0, true)).assertEqual(-65536);
    });

    /**
     * @tc.name   DataView19Test073
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(9);
      const view73 = new DataView(buffer73);
      view73.setInt32(5, -9999);
      expect(view73.getInt32(5)).assertEqual(-9999);
    });

    /**
     * @tc.name   DataView19Test074
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(10);
      const view74 = new DataView(buffer74);
      view74.setInt32(2, 9999, true);
      expect(view74.getInt32(2, true)).assertEqual(9999);
    });

    /**
     * @tc.name   DataView19Test075
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(4);
      const view75 = new DataView(buffer75);
      view75.setInt32(0, 0x11111111);
      expect(view75.getUint32(0)).assertEqual(0x11111111);
    });

    /**
     * @tc.name   DataView19Test076
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(4);
      const view76 = new DataView(buffer76);
      view76.setInt32(0, 0x22222222, true);
      expect(view76.getUint32(0, true)).assertEqual(0x22222222);
    });

    /**
     * @tc.name   DataView19Test077
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(4);
      const view77 = new DataView(buffer77);
      view77.setInt32(0, 0x33333333);
      expect(view77.getUint32(0, true)).assertEqual(0x33333333);
    });

    /**
     * @tc.name   DataView19Test078
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(4);
      const view78 = new DataView(buffer78);
      view78.setInt32(0, 0x44444444, true);
      expect(view78.getUint32(0)).assertEqual(0x44444444);
    });

    /**
     * @tc.name   DataView19Test079
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_7900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(4);
      const view79 = new DataView(buffer79);
      view79.setInt32(0, -0);
      expect(view79.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test080
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(4);
      const view80 = new DataView(buffer80);
      const val80 = -2147483647;
      view80.setInt32(0, val80, true);
      expect(view80.getInt32(0, true)).assertEqual(val80);
    });

    /**
     * @tc.name   DataView19Test081
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(5);
      const view81 = new DataView(buffer81);
      view81.setInt32(0, 0x11223344);
      view81.setInt32(1, 0x55667788);
      expect(view81.getInt32(0)).assertEqual(0x11556677);
    });

    /**
     * @tc.name   DataView19Test082
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(16);
      const view82 = new DataView(buffer82);
      view82.setInt32(12, 678);
      expect(view82.getInt32(12)).assertEqual(678);
    });

    /**
     * @tc.name   DataView19Test083
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(16);
      const view83 = new DataView(buffer83);
      view83.setInt32(12, -678, true);
      expect(view83.getInt32(12, true)).assertEqual(-678);
    });

    /**
     * @tc.name   DataView19Test084
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(4);
      const view84 = new DataView(buffer84);
      view84.setInt32(0, 0x00FF00FF);
      expect(view84.getUint8(0)).assertEqual(0x00);
      expect(view84.getUint8(1)).assertEqual(0xFF);
      expect(view84.getUint8(2)).assertEqual(0x00);
      expect(view84.getUint8(3)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView19Test085
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(4);
      const view85 = new DataView(buffer85);
      view85.setInt32(0, 0xFF00FF00, true);
      expect(view85.getUint8(0)).assertEqual(0x00);
      expect(view85.getUint8(1)).assertEqual(0xFF);
      expect(view85.getUint8(2)).assertEqual(0x00);
      expect(view85.getUint8(3)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView19Test086
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(4);
      const view86 = new DataView(buffer86);
      const pow20 = 1048576;
      view86.setInt32(0, pow20);
      expect(view86.getInt32(0)).assertEqual(pow20);
    });

    /**
     * @tc.name   DataView19Test087
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(4);
      const view87 = new DataView(buffer87);
      const negPow20 = -1048576;
      view87.setInt32(0, negPow20, true);
      expect(view87.getInt32(0, true)).assertEqual(negPow20);
    });

    /**
     * @tc.name   DataView19Test088
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(7);
      const view88 = new DataView(buffer88);
      view88.setInt32(3, 1234567);
      expect(view88.getInt32(3)).assertEqual(1234567);
    });

    /**
     * @tc.name   DataView19Test089
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_8900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(5);
      const view89 = new DataView(buffer89);
      view89.setInt32(1, -1234567, true);
      expect(view89.getInt32(1, true)).assertEqual(-1234567);
    });

    /**
     * @tc.name   DataView19Test090
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(4);
      const view90 = new DataView(buffer90);
      view90.setInt32(0, 2147483648);
      expect(view90.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView19Test091
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(4);
      const view91 = new DataView(buffer91);
      view91.setInt32(0, -2147483649, true);
      expect(view91.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView19Test092
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(4);
      const view92 = new DataView(buffer92);
      view92.setInt32(0, 100);
      view92.setInt32(0, 200, true);
      expect(view92.getInt32(0, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView19Test093
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(4);
      const view93 = new DataView(buffer93);
      const val93 = 0xABCDEF12;
      view93.setInt32(0, val93);
      const littleVal = view93.getInt32(0, true);
      view93.setInt32(0, littleVal);
      expect(view93.getInt32(0, true)).assertEqual(-1412567278);
    });

    /**
     * @tc.name   DataView19Test094
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(4);
      const view94 = new DataView(buffer94);
      const val94 = 0x12EFCDAB;
      view94.setInt32(0, val94, true);
      const bigVal = view94.getInt32(0);
      view94.setInt32(0, bigVal, true);
      expect(view94.getInt32(0)).assertEqual(val94);
    });

    /**
     * @tc.name   DataView19Test095
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(4);
      const view95 = new DataView(buffer95);
      view95.setInt32(0, 1);
      expect(view95.getInt32(0)).assertEqual(1);
      expect(view95.getInt32(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView19Test096
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(4);
      const view96 = new DataView(buffer96);
      view96.setInt32(0, -1, true);
      expect(view96.getInt32(0, true)).assertEqual(-1);
      expect(view96.getInt32(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView19Test097
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(4);
      const view97A = new DataView(buffer97);
      const view97B = new DataView(buffer97);
      view97A.setInt32(0, 555);
      expect(view97B.getInt32(0)).assertEqual(555);
    });

    /**
     * @tc.name   DataView19Test098
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(4);
      const view98A = new DataView(buffer98);
      const view98B = new DataView(buffer98);
      view98A.setInt32(0, -555, true);
      expect(view98B.getInt32(0, true)).assertEqual(-555);
    });

    /**
     * @tc.name   DataView19Test099
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_9900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(4);
      const view99 = new DataView(buffer99);
      view99.setInt32(0, 0);
      expect(view99.getUint8(0)).assertEqual(0);
      expect(view99.getUint8(1)).assertEqual(0);
      expect(view99.getUint8(2)).assertEqual(0);
      expect(view99.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test100
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(4);
      const view100 = new DataView(buffer100);
      view100.setInt32(0, 0, true);
      expect(view100.getUint8(0)).assertEqual(0);
      expect(view100.getUint8(1)).assertEqual(0);
      expect(view100.getUint8(2)).assertEqual(0);
      expect(view100.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test101
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(10);
      const view101 = new DataView(buffer101);
      view101.setInt32(6, -123456);
      expect(view101.getInt32(6)).assertEqual(-123456);
    });

    /**
     * @tc.name   DataView19Test102
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(11);
      const view102 = new DataView(buffer102);
      view102.setInt32(7, 123456, true);
      expect(view102.getInt32(7, true)).assertEqual(123456);
    });

    /**
     * @tc.name   DataView19Test103
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(4);
      const view103 = new DataView(buffer103);
      view103.setInt32(0, -2);
      expect(view103.getUint8(0)).assertEqual(0xFF);
      expect(view103.getUint8(1)).assertEqual(0xFF);
      expect(view103.getUint8(2)).assertEqual(0xFF);
      expect(view103.getUint8(3)).assertEqual(0xFE);
    });

    /**
     * @tc.name   DataView19Test104
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(4);
      const view104 = new DataView(buffer104);
      view104.setInt32(0, -2, true);
      expect(view104.getUint8(0)).assertEqual(0xFE);
      expect(view104.getUint8(1)).assertEqual(0xFF);
      expect(view104.getUint8(2)).assertEqual(0xFF);
      expect(view104.getUint8(3)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView19Test107
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(4);
      const view107 = new DataView(buffer107);
      view107.setInt32(0, 2147483748);
      expect(view107.getInt32(0)).assertEqual(-2147483548);
    });

    /**
     * @tc.name   DataView19Test108
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(4);
      const view108 = new DataView(buffer108);
      view108.setInt32(0, -2147483748, true);
      expect(view108.getInt32(0, true)).assertEqual(2147483548);

    });

    /**
     * @tc.name   DataView19Test109
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_10900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(4);
      const view109 = new DataView(buffer109);
      view109.setInt32(0, 15);
      expect(view109.getInt32(0, true)).assertEqual(0x0F000000);
    });

    /**
     * @tc.name   DataView19Test110
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(4);
      const view110 = new DataView(buffer110);
      view110.setInt32(0, 251658240, true);
      expect(view110.getInt32(0)).assertEqual(15);
    });

    /**
     * @tc.name   DataView19Test111
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(4);
      const view111 = new DataView(buffer111);
      view111.setInt32(0, 32767);
      expect(view111.getInt32(0)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView19Test112
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(4);
      const view112 = new DataView(buffer112);
      view112.setInt32(0, -32768, true);
      expect(view112.getInt32(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView19Test113
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(20);
      const view113 = new DataView(buffer113);
      view113.setInt32(16, 98765);
      expect(view113.getInt32(16)).assertEqual(98765);
    });

    /**
     * @tc.name   DataView19Test114
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(20);
      const view114 = new DataView(buffer114);
      view114.setInt32(16, -98765, true);
      expect(view114.getInt32(16, true)).assertEqual(-98765);
    });

    /**
     * @tc.name   DataView19Test115
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const view115 = new DataView(buffer115);
      const val115 = 0x1234ABCD;
      view115.setInt32(0, val115);
      const reversed = view115.getInt32(0, true);
      view115.setInt32(0, reversed);
      expect(view115.getInt32(0, true)).assertEqual(val115);
    });

    /**
     * @tc.name   DataView19Test116
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(4);
      const view116 = new DataView(buffer116);
      const val116 = 0xDCBA3210;
      view116.setInt32(0, val116, true);
      const reversed116 = view116.getInt32(0);
      view116.setInt32(0, reversed116, true);
      expect(view116.getInt32(0)).assertEqual(-591777264);
    });

    /**
     * @tc.name   DataView19Test117
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(12);
      const view117 = new DataView(buffer117);
      view117.setInt32(0, 123);
      view117.setInt32(4, 0);
      view117.setInt32(8, 456);
      expect(view117.getInt32(4)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test118
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(12);
      const view118 = new DataView(buffer118);
      view118.setInt32(0, 123, true);
      view118.setInt32(4, 0, true);
      view118.setInt32(8, 456, true);
      expect(view118.getInt32(4, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView19Test119
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_11900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const view119 = new DataView(buffer119);
      view119.setInt32(0, 0x00010000);
      expect(view119.getInt32(0)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView19Test120
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(4);
      const view120 = new DataView(buffer120);
      view120.setInt32(0, 0x00010000, true);
      expect(view120.getInt32(0, true)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView19Test121
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(4);
      const view121 = new DataView(buffer121);
      view121.setInt32(0, 0xABCD1234);
      view121.setUint8(0, 0xEE);
      expect(view121.getInt32(0)).assertEqual(-288550348);
    });

    /**
     * @tc.name   DataView19Test122
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(4);
      const view122 = new DataView(buffer122);
      view122.setInt32(0, 0xABCD1234, true);
      view122.setUint8(3, 0xFF);
      expect(view122.getInt32(0, true)).assertEqual(-3337676);
    });

    /**
     * @tc.name   DataView19Test123
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(6);
      const view123 = new DataView(buffer123);
      view123.setInt32(2, -32767);
      expect(view123.getInt32(2)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView19Test124
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(7);
      const view124 = new DataView(buffer124);
      view124.setInt32(3, 32768, true);
      expect(view124.getInt32(3, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView19Test125
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(4);
      const view125 = new DataView(buffer125);
      view125.setInt32(0, 0x7F000000);
      expect(view125.getInt32(0)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView19Test126
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(4);
      const view126 = new DataView(buffer126);
      view126.setInt32(0, 0x80000000, true);
      expect(view126.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView19Test127
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(6);
      const view127 = new DataView(buffer127);
      view127.setInt32(0, 0x11111111);
      view127.setInt32(1, 0x22222222);
      view127.setInt32(2, 0x33333333);
      expect(view127.getInt32(0)).assertEqual(0x11223333);
    });

    /**
     * @tc.name   DataView19Test128
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const view128 = new DataView(buffer128);
      const val128 = 1000000;
      view128.setInt32(0, val128);
      expect(view128.getInt32(0, true)).assertEqual(0x40420F00);
    });

    /**
     * @tc.name   DataView19Test129
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_12900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const view128 = new DataView(buffer128);
      const val128 = 1000000;
      view128.setInt32(0, val128);
      expect(view128.getInt32(0, true)).assertEqual(0x40420F00);
    });

    /**
     * @tc.name   DataView19Test130
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const view128 = new DataView(buffer128);
      const val128 = 1000000;
      view128.setInt32(0, val128);
      expect(view128.getInt32(0, true)).assertEqual(0x40420F00);
    });

    /**
     * @tc.name   DataView19Test131
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(100);
      const view131 = new DataView(buffer131);
      view131.setInt32(96, -54321, true);
      expect(view131.getInt32(96, true)).assertEqual(-54321);
    });

    /**
     * @tc.name   DataView19Test132
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const view132 = new DataView(buffer132);
      view132.setInt32(0, 0x00000100);
      expect(view132.getInt32(0)).assertEqual(256);
    });

    /**
     * @tc.name   DataView19Test133
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(4);
      const view133 = new DataView(buffer133);
      view133.setInt32(0, 0x00010000, true);
      expect(view133.getUint8(0)).assertEqual(0x00);
      expect(view133.getUint8(1)).assertEqual(0x00);
      expect(view133.getUint8(2)).assertEqual(0x01);
      expect(view133.getUint8(3)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView19Test134
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(5);
      const view134 = new DataView(buffer134);
      view134.setInt32(1, -65536);
      expect(view134.getInt32(1)).assertEqual(-65536);
    });

    /**
     * @tc.name   DataView19Test135
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(6);
      const view135 = new DataView(buffer135);
      view135.setInt32(2, 65536, true);
      expect(view135.getInt32(2, true)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView19Test136
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(4);
      const view136 = new DataView(buffer136);
      const val136 = 2147483643;
      view136.setInt32(0, val136);
      expect(view136.getInt32(0)).assertEqual(val136);
    });

    /**
     * @tc.name   DataView19Test137
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const view137 = new DataView(buffer137);
      const val137 = -2147483643;
      view137.setInt32(0, val137, true);
      expect(view137.getInt32(0, true)).assertEqual(val137);
    });

    /**
     * @tc.name   DataView19Test138
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(4);
      const view138 = new DataView(buffer138);
      view138.setInt32(0, -2147483647);
      expect(view138.getInt8(0)).assertEqual(-128);
      expect(view138.getInt8(1)).assertEqual(0);
      expect(view138.getInt8(2)).assertEqual(0);
      expect(view138.getInt8(3)).assertEqual(1);
    });

    /**
     * @tc.name   DataView19Test139
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_13900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(4);
      const view139 = new DataView(buffer139);
      view139.setInt32(0, -2147483647, true);
      expect(view139.getInt8(0)).assertEqual(1);
      expect(view139.getInt8(1)).assertEqual(0);
      expect(view139.getInt8(2)).assertEqual(0);
      expect(view139.getInt8(3)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView19Test140
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(200);
      const view140 = new DataView(buffer140);
      view140.setInt32(196, 987654);
      expect(view140.getInt32(196)).assertEqual(987654);
    });

    /**
     * @tc.name   DataView19Test141
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14100
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(200);
      const view141 = new DataView(buffer141);
      view141.setInt32(196, -987654, true);
      expect(view141.getInt32(196, true)).assertEqual(-987654);
    });

    /**
     * @tc.name   DataView19Test142
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14200
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(4);
      const view142 = new DataView(buffer142);
      view142.setInt32(0, 0x11223344);
      const littleVal142 = view142.getInt32(0, true);
      view142.setInt32(0, littleVal142, true);
      expect(view142.getInt32(0)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView19Test143
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14300
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(4);
      const view143 = new DataView(buffer143);
      view143.setInt32(0, 0x44332211, true);
      const bigVal143 = view143.getInt32(0);
      view143.setInt32(0, bigVal143);
      expect(view143.getInt32(0, true)).assertEqual(1144201745);
    });

    /**
     * @tc.name   DataView19Test144
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14400
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(4);
      const view144 = new DataView(buffer144);
      view144.setInt32(0, 128);
      expect(view144.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView19Test145
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14500
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(4);
      const view145 = new DataView(buffer145);
      view145.setInt32(0, -2147483648, true);
      expect(view145.getInt32(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView19Test146
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14600
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(4);
      const view146 = new DataView(buffer146);
      view146.setInt32(0, 0x12345678);
      view146.setUint8(3, 0xFF);
      expect(view146.getInt32(0)).assertEqual(0x123456FF);
    });

    /**
     * @tc.name   DataView19Test147
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14700
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(4);
      const view147 = new DataView(buffer147);
      view147.setInt32(0, 0x12345678, true);
      view147.setUint8(0, 0xFF);
      expect(view147.getInt32(0, true)).assertEqual(0x123456FF);
    });

    /**
     * @tc.name   DataView19Test148
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14800
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(7);
      const view148 = new DataView(buffer148);
      view148.setInt32(3, -65535);
      expect(view148.getInt32(3)).assertEqual(-65535);
    });

    /**
     * @tc.name   DataView19Test149
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_14900
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(8);
      const view149 = new DataView(buffer149);
      view149.setInt32(4, 65535, true);
      expect(view149.getInt32(4, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView19Test150
     * @tc.number SUB_BUILTINS_DATAVIEW19_TEST_15000
     * @tc.desc   test DataView setInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView19Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(4);
      const view150 = new DataView(buffer150);
      view150.setInt32(0, 2147483647);
      expect(view150.getUint32(0)).assertEqual(2147483647);
    });

  })
}
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

export default function DataView22Test() {
  describe('DataView22Test', () => {
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
     * @tc.name   DataView22Test001
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const dv1 = new DataView(buffer1);
      dv1.setUint32(0, 0x12345678);
      expect(dv1.getUint32(0)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   DataView22Test002
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(4);
      const dv2 = new DataView(buffer2);
      dv2.setUint32(0, 0x87654321, true);
      expect(dv2.getUint32(0, true)).assertEqual(0x87654321);
    });

    /**
     * @tc.name   DataView22Test003
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(8);
      const dv3 = new DataView(buffer3);
      dv3.setUint32(4, 0xABCDEF12);
      expect(dv3.getUint32(4)).assertEqual(0xABCDEF12);
    });

    /**
     * @tc.name   DataView22Test004
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(4);
      const dv4 = new DataView(buffer4);
      dv4.setUint32(0, 0);
      expect(dv4.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView22Test005
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(4);
      const dv5 = new DataView(buffer5);
      dv5.setUint32(0, 0, true);
      expect(dv5.getUint32(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView22Test006
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(4);
      const dv6 = new DataView(buffer6);
      dv6.setUint32(0, 0xFFFFFFFF);
      expect(dv6.getUint32(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test007
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(4);
      const dv7 = new DataView(buffer7);
      dv7.setUint32(0, 0xFFFFFFFF, true);
      expect(dv7.getUint32(0, true)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test008
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(5);
      const dv8 = new DataView(buffer8);
      dv8.setUint32(1, 0x11223344);
      expect(dv8.getUint32(1)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView22Test009
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_0900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(6);
      const dv9 = new DataView(buffer9);
      dv9.setUint32(2, 0x55667788, true);
      expect(dv9.getUint32(2, true)).assertEqual(0x55667788);
    });

    /**
     * @tc.name   DataView22Test010
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(8);
      const dv10 = new DataView(buffer10);
      dv10.setUint32(0, 0x11111111);
      dv10.setUint32(4, 0x22222222);
      expect(dv10.getUint32(0)).assertEqual(0x11111111);
      expect(dv10.getUint32(4)).assertEqual(0x22222222);
    });

    /**
     * @tc.name   DataView22Test011
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const dv11 = new DataView(buffer11);
      dv11.setUint32(0, 0x12345678, true);
      expect(dv11.getUint32(0)).assertEqual(0x78563412);
    });

    /**
     * @tc.name   DataView22Test012
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(4);
      const dv12 = new DataView(buffer12);
      dv12.setUint32(0, 0x12345678);
      expect(dv12.getUint32(0, true)).assertEqual(0x78563412);
    });

    /**
     * @tc.name   DataView22Test013
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(4);
      const dv13 = new DataView(buffer13);
      dv13.setUint32(0, 1);
      expect(dv13.getUint32(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView22Test014
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(4);
      const dv14 = new DataView(buffer14);
      dv14.setUint32(0, 1, true);
      expect(dv14.getUint32(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView22Test015
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(4);
      const dv15 = new DataView(buffer15);
      dv15.setUint32(0, 0x000000FF);
      expect(dv15.getUint32(0)).assertEqual(0x000000FF);
    });

    /**
     * @tc.name   DataView22Test016
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const dv16 = new DataView(buffer16);
      dv16.setUint32(0, 0x0000FF00);
      expect(dv16.getUint32(0)).assertEqual(0x0000FF00);
    });

    /**
     * @tc.name   DataView22Test017
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(4);
      const dv17 = new DataView(buffer17);
      dv17.setUint32(0, 0x00FF0000);
      expect(dv17.getUint32(0)).assertEqual(0x00FF0000);
    });

    /**
     * @tc.name   DataView22Test018
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(4);
      const dv18 = new DataView(buffer18);
      dv18.setUint32(0, 0xFF000000);
      expect(dv18.getUint32(0)).assertEqual(0xFF000000);
    });

    /**
     * @tc.name   DataView22Test019
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_1900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(4);
      const dv19 = new DataView(buffer19);
      dv19.setUint32(0, 0x000000FF, true);
      expect(dv19.getUint32(0)).assertEqual(0xFF000000);

    });

    /**
     * @tc.name   DataView22Test020
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const dv20 = new DataView(buffer20);
      dv20.setUint32(0, 0x000000FF);
      expect(dv20.getUint32(0, true)).assertEqual(0xFF000000);
    });

    /**
     * @tc.name   DataView22Test021
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(8);
      const dv21 = new DataView(buffer21);
      dv21.setUint32(4, 0xABCD1234);
      expect(dv21.getUint32(4)).assertEqual(0xABCD1234);
    });

    /**
     * @tc.name   DataView22Test022
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(4);
      const dv22 = new DataView(buffer22);
      dv22.setUint32(0, 0x11223344);
      expect(dv22.getUint32(0)).assertEqual(0x11223344);

    });

    /**
     * @tc.name   DataView22Test023
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(4);
      const dv23 = new DataView(buffer23);
      dv23.setUint32(0, 0x11223344, true);
      expect(dv23.getUint32(0, true)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView22Test024
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(4);
      const dv24 = new DataView(buffer24);
      dv24.setUint32(0, 0xFFFFFFFF);
      expect(dv24.getUint32(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test025
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(10);
      const dv25 = new DataView(buffer25);
      dv25.setUint32(6, 0x44332211);
      expect(dv25.getUint32(6)).assertEqual(0x44332211);
    });

    /**
     * @tc.name   DataView22Test026
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(8);
      const dv26 = new DataView(buffer26);
      dv26.setUint32(0, 0x1234, false);
      dv26.setUint32(4, 0x5678, true);
      expect(dv26.getUint32(0, false)).assertEqual(0x1234);
      expect(dv26.getUint32(4, true)).assertEqual(0x5678);

    });

    /**
     * @tc.name   DataView22Test027
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(4);
      const dv27 = new DataView(buffer27);
      dv27.setUint32(0, 0x80000000);
      expect(dv27.getUint32(0)).assertEqual(0x80000000);
    });

    /**
     * @tc.name   DataView22Test028
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const dv28 = new DataView(buffer28);
      dv28.setUint32(0, 0x7FFFFFFF, true);
      expect(dv28.getUint32(0, true)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.name   DataView22Test029
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_2900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const dv29 = new DataView(buffer29);
      dv29.setUint32(0, 0xABCDEF12, true);
      expect(dv29.getUint32(0, true)).assertEqual(0xABCDEF12);
    });

    /**
     * @tc.name   DataView22Test030
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(4);
      const dv30 = new DataView(buffer30);
      dv30.setUint32(0, 0x12345678);
      expect(dv30.getUint32(0, true)).assertEqual(0x78563412);
    });

    /**
     * @tc.name   DataView22Test031
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(6);
      const dv31 = new DataView(buffer31);
      dv31.setUint32(2, 0x9ABCDEF0);
      expect(dv31.getUint32(2)).assertEqual(0x9ABCDEF0);

    });

    /**
     * @tc.name   DataView22Test032
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(4);
      const dv32 = new DataView(buffer32);
      dv32.setUint32(0, 0x00010000);
      expect(dv32.getUint32(0)).assertEqual(0x00010000);
    });

    /**
     * @tc.name   DataView22Test033
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(4);
      const dv33 = new DataView(buffer33);
      dv33.setUint32(0, 0x00010000, true);
      expect(dv33.getUint32(0)).assertEqual(0x00000100);
    });

    /**
     * @tc.name   DataView22Test034
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(12);
      const dv34 = new DataView(buffer34);
      dv34.setUint32(0, 0x1111, false);
      dv34.setUint32(4, 0x2222, true);
      dv34.setUint32(8, 0x3333, false);
      expect(dv34.getUint32(0)).assertEqual(0x1111);
      expect(dv34.getUint32(4, true)).assertEqual(0x2222);
      expect(dv34.getUint32(8)).assertEqual(0x3333);
    });

    /**
     * @tc.name   DataView22Test035
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(4);
      const dv35 = new DataView(buffer35);
      dv35.setUint32(0, 0x11111111, true);
      expect(dv35.getUint32(0)).assertEqual(0x11111111);
    });

    /**
     * @tc.name   DataView22Test036
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(4);
      const dv36 = new DataView(buffer36);
      dv36.setUint32(0, 0x1234ABCD);
      expect(dv36.getUint32(0)).assertEqual(0x1234ABCD);
    });

    /**
     * @tc.name   DataView22Test037
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(4);
      const dv37 = new DataView(buffer37);
      dv37.setUint32(0, 0xABCD1234, true);
      expect(dv37.getUint32(0, true)).assertEqual(0xABCD1234);
    });

    /**
     * @tc.name   DataView22Test038
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(7);
      const dv38 = new DataView(buffer38);
      dv38.setUint32(3, 0x55AA55AA);
      expect(dv38.getUint32(3)).assertEqual(0x55AA55AA);
    });

    /**
     * @tc.name   DataView22Test039
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_3900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(4);
      const dv39 = new DataView(buffer39);
      dv39.setUint32(0, 0x00FF00FF);
      expect(dv39.getUint32(0, true)).assertEqual(0xFF00FF00);
    });

    /**
     * @tc.name   DataView22Test040
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(4);
      const dv40 = new DataView(buffer40);
      dv40.setUint32(0, 0x00FF00FF, true);
      expect(dv40.getUint32(0)).assertEqual(0xFF00FF00);
    });

    /**
     * @tc.name   DataView22Test041
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const dv41 = new DataView(buffer41);
      dv41.setUint32(0, 0x0000FFFF);
      expect(dv41.getUint32(0)).assertEqual(0x0000FFFF);
    });

    /**
     * @tc.name   DataView22Test042
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(4);
      const dv42 = new DataView(buffer42);
      dv42.setUint32(0, 0xFFFF0000, true);
      expect(dv42.getUint32(0, true)).assertEqual(0xFFFF0000);
    });

    /**
     * @tc.name   DataView22Test043
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const dv43 = new DataView(buffer43);
      dv43.setUint32(0, -1);
      expect(dv43.getUint32(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test044
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const dv43 = new DataView(buffer43);
      dv43.setUint32(0, -1);
      expect(dv43.getUint32(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test045
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(4);
      const dv45 = new DataView(buffer45);
      dv45.setUint32(0, 0x100000000);
      expect(dv45.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView22Test046
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const dv46 = new DataView(buffer46);
      dv46.setUint32(0, 0x123456789);
      expect(dv46.getUint32(0)).assertEqual(0x23456789);
    });

    /**
     * @tc.name   DataView22Test047
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(4);
      const dv47 = new DataView(buffer47);
      dv47.setUint32(0, 0x11111111);
      dv47.setUint32(0, 0x22222222);
      expect(dv47.getUint32(0)).assertEqual(0x22222222);
    });

    /**
     * @tc.name   DataView22Test048
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(8);
      const dv48 = new DataView(buffer48);
      dv48.setUint32(4, 0x87654321, true);
      expect(dv48.getUint32(4, true)).assertEqual(0x87654321);
    });

    /**
     * @tc.name   DataView22Test049
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_4900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(4);
      const dv49 = new DataView(buffer49);
      dv49.setUint32(0, 0x01020304);
      expect(dv49.getUint8(0)).assertEqual(0x01);
      expect(dv49.getUint8(1)).assertEqual(0x02);
      expect(dv49.getUint8(2)).assertEqual(0x03);
      expect(dv49.getUint8(3)).assertEqual(0x04);
    });

    /**
     * @tc.name   DataView22Test050
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(4);
      const dv50 = new DataView(buffer50);
      dv50.setUint32(0, 0x01020304, true);
      expect(dv50.getUint8(0)).assertEqual(0x04);
      expect(dv50.getUint8(1)).assertEqual(0x03);
      expect(dv50.getUint8(2)).assertEqual(0x02);
      expect(dv50.getUint8(3)).assertEqual(0x01);
    });

    /**
     * @tc.name   DataView22Test051
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(4);
      const dv51 = new DataView(buffer51);
      dv51.setUint32(0, 0x11223344);
      expect(dv51.getUint32(0, true)).assertEqual(0x44332211);
      expect(dv51.getUint32(0)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView22Test052
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(4);
      const dv52 = new DataView(buffer52);
      dv52.setUint32(0, 0x44332211, true);
      expect(dv52.getUint32(0)).assertEqual(0x11223344);
      expect(dv52.getUint32(0, true)).assertEqual(0x44332211);
    });

    /**
     * @tc.name   DataView22Test053
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(4);
      const dv53 = new DataView(buffer53);
      dv53.setUint32(0, 0x80808080);
      expect(dv53.getUint32(0)).assertEqual(0x80808080);
    });

    /**
     * @tc.name   DataView22Test054
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(4);
      const dv54 = new DataView(buffer54);
      dv54.setUint32(0, 0x7F7F7F7F, true);
      expect(dv54.getUint32(0, true)).assertEqual(0x7F7F7F7F);
    });

    /**
     * @tc.name   DataView22Test055
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(12);
      const dv55 = new DataView(buffer55);
      dv55.setUint32(8, 0xABC123);
      expect(dv55.getUint32(8)).assertEqual(0xABC123);
    });

    /**
     * @tc.name   DataView22Test056
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(12);
      const dv56 = new DataView(buffer56);
      dv56.setUint32(0, 0x1111);
      dv56.setUint32(4, 0x2222);
      dv56.setUint32(8, 0x3333);
      expect(dv56.getUint32(0)).assertEqual(0x1111);
      expect(dv56.getUint32(4)).assertEqual(0x2222);
      expect(dv56.getUint32(8)).assertEqual(0x3333);
    });

    /**
     * @tc.name   DataView22Test057
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(4);
      const dv57 = new DataView(buffer57);
      dv57.setUint32(0, 0x00000001, true);
      expect(dv57.getUint32(0)).assertEqual(0x01000000);
    });

    /**
     * @tc.name   DataView22Test058
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(4);
      const dv58 = new DataView(buffer58);
      dv58.setUint32(0, 0x00000100);
      expect(dv58.getUint32(0, true)).assertEqual(0x00010000);
    });

    /**
     * @tc.name   DataView22Test059
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_5900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(4);
      const dv59 = new DataView(buffer59);
      dv59.setUint32(0, -2);
      expect(dv59.getUint32(0)).assertEqual(0xFFFFFFFE);

    });

    /**
     * @tc.name   DataView22Test060
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(4);
      const dv60 = new DataView(buffer60);
      dv60.setUint32(0, -0x80000000, true);
      expect(dv60.getUint32(0, true)).assertEqual(0x80000000);
    });

    /**
     * @tc.name   DataView22Test061
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(9);
      const dv61 = new DataView(buffer61);
      dv61.setUint32(5, 0x55667788);
      expect(dv61.getUint32(5)).assertEqual(0x55667788);
    });

    /**
     * @tc.name   DataView22Test062
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(4);
      const dv62 = new DataView(buffer62);
      dv62.setUint32(0, 0xABCDEF01);
      expect(dv62.getUint32(0, true)).assertEqual(0x01EFCDAB);
    });
    /**
     * @tc.name   DataView22Test063
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const dv63 = new DataView(buffer63);
      dv63.setUint32(0, 0x10FEDCBA, true);
      expect(dv63.getUint32(0)).assertEqual(3135045136);
    });

    /**
     * @tc.name   DataView22Test064
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(4);
      const dv64 = new DataView(buffer64);
      dv64.setUint32(0, 0x11111111, true);
      dv64.setUint32(0, 0x22222222);
      expect(dv64.getUint32(0)).assertEqual(0x22222222);
    });

    /**
     * @tc.name   DataView22Test065
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(7);
      const dv65 = new DataView(buffer65);
      dv65.setUint32(3, 0x00000000);
      expect(dv65.getUint32(3)).assertEqual(0x00000000);
    });

    /**
     * @tc.name   DataView22Test067
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(4);
      const dv67 = new DataView(buffer67);
      dv67.setUint32(0, 0x11112222);
      expect(dv67.getUint32(0)).assertEqual(0x11112222);
    });

    /**
     * @tc.name   DataView22Test068
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(4);
      const dv68 = new DataView(buffer68);
      dv68.setUint32(0, 0x22221111, true);
      expect(dv68.getUint32(0, true)).assertEqual(0x22221111);
    });

    /**
     * @tc.name   DataView22Test069
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_6900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(4);
      const dv69 = new DataView(buffer69);
      dv69.setUint32(0, 0x11223344);
      dv69.setUint8(1, 0xAA);
      expect(dv69.getUint32(0)).assertEqual(0x11AA3344);
    });

    /**
     * @tc.name   DataView22Test070
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(4);
      const dv70 = new DataView(buffer70);
      dv70.setUint32(0, 0x11223344, true);
      dv70.setUint8(1, 0xBB);
      expect(dv70.getUint32(0, true)).assertEqual(287488836);
    });

    /**
     * @tc.name   DataView22Test071
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(5);
      const dv71 = new DataView(buffer71);
      dv71.setUint32(1, 0x33333333);
      expect(dv71.getUint32(1)).assertEqual(0x33333333);
    });

    /**
     * @tc.name   DataView22Test072
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(4);
      const dv72 = new DataView(buffer72);
      dv72.setUint32(0, -0x12345678);
      expect(dv72.getUint32(0)).assertEqual(0xEDCBA988);
    });

    /**
     * @tc.name   DataView22Test073
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(9);
      const dv73 = new DataView(buffer73);
      dv73.setUint32(5, 0x00000001);
      expect(dv73.getUint32(5)).assertEqual(0x00000001);
    });

    /**
     * @tc.name   DataView22Test074
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(9);
      const dv74 = new DataView(buffer74);
      dv74.setUint32(5, 0x00000001, true);
      expect(dv74.getUint32(5, true)).assertEqual(0x00000001);

    });

    /**
     * @tc.name   DataView22Test075
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(4);
      const dv75 = new DataView(buffer75);
      dv75.setUint32(0, 0x11223344);
      expect(dv75.getUint16(2)).assertEqual(0x3344);
    });

    /**
     * @tc.name   DataView22Test076
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(4);
      const dv75 = new DataView(buffer75);
      dv75.setUint32(0, 0x11223344);
      expect(dv75.getUint16(2)).assertEqual(0x3344);
    });

    /**
     * @tc.name   DataView22Test077
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(4);
      const dv77 = new DataView(buffer77);
      dv77.setUint32(0, 0x7FFFFFFF);
      expect(dv77.getUint32(0)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.name   DataView22Test078
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(4);
      const dv78 = new DataView(buffer78);
      dv78.setUint32(0, 0x80000000, true);
      expect(dv78.getUint32(0, true)).assertEqual(0x80000000);
    });

    /**
     * @tc.name   DataView22Test079
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_7900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(4);
      const dv79 = new DataView(buffer79);
      dv79.setUint32(0, 0x12345678);
      dv79.setUint32(0, 0x12345678, true);
      expect(dv79.getUint32(0, true)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   DataView22Test080
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(4);
      const dv80 = new DataView(buffer80);
      dv80.setUint32(0, 0x87654321, true);
      dv80.setUint32(0, 0x87654321);
      expect(dv80.getUint32(0)).assertEqual(0x87654321);
    });

    /**
     * @tc.name   DataView22Test081
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(6);
      const dv81 = new DataView(buffer81);
      dv81.setUint32(2, 0x0000FFFF);
      expect(dv81.getUint32(2)).assertEqual(0x0000FFFF);
    });

    /**
     * @tc.name   DataView22Test082
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(6);
      const dv82 = new DataView(buffer82);
      dv82.setUint32(2, 0xFFFF0000, true);
      expect(dv82.getUint32(2, true)).assertEqual(0xFFFF0000);
    });

    /**
     * @tc.name   DataView22Test083
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(4);
      const dv83 = new DataView(buffer83);
      dv83.setUint32(0, -0x7FFFFFFF);
      expect(dv83.getUint32(0)).assertEqual(0x80000001);
    });

    /**
     * @tc.name   DataView22Test084
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(4);
      const dv84 = new DataView(buffer84);
      dv84.setUint32(0, -0x7FFFFFFF, true);
      expect(dv84.getUint32(0, true)).assertEqual(0x80000001);
    });

    /**
     * @tc.name   DataView22Test087
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(5);
      const dv87 = new DataView(buffer87);
      dv87.setUint32(0, 0x11111111);
      dv87.setUint32(1, 0x22222222);
      expect(dv87.getUint32(0)).assertEqual(287449634);
      expect(dv87.getUint32(1)).assertEqual(572662306);
    });

    /**
     * @tc.name   DataView22Test088
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(6);
      const dv88 = new DataView(buffer88);
      dv88.setUint32(1, 0x33333333);
      dv88.setUint32(2, 0x44444444);
      expect(dv88.getUint32(1)).assertEqual(860111940);
      expect(dv88.getUint32(2)).assertEqual(1145324612);
    });

    /**
     * @tc.name   DataView22Test089
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_8900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(4);
      const dv89 = new DataView(buffer89);
      dv89.setUint32(0, 0x01000000);
      expect(dv89.getUint32(0, true)).assertEqual(0x00000001);
    });

    /**
     * @tc.name   DataView22Test090
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(4);
      const dv90 = new DataView(buffer90);
      dv90.setUint32(0, 0x00000001, true);
      expect(dv90.getUint32(0)).assertEqual(0x01000000);

    });

    /**
     * @tc.name   DataView22Test091
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(11);
      const dv91 = new DataView(buffer91);
      dv91.setUint32(7, 0x11111111);
      expect(dv91.getUint32(7)).assertEqual(0x11111111);
    });

    /**
     * @tc.name   DataView22Test092
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(11);
      const dv92 = new DataView(buffer92);
      dv92.setUint32(7, 0x22222222, true);
      expect(dv92.getUint32(7, true)).assertEqual(0x22222222);

    });

    /**
     * @tc.name   DataView22Test093
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(4);
      const dv93 = new DataView(buffer93);
      dv93.setUint32(0, 0xFFFFFFFF);
      expect(dv93.getInt32(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView22Test094
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(4);
      const dv94 = new DataView(buffer94);
      dv94.setUint32(0, 0xFFFFFFFF, true);
      expect(dv94.getInt32(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView22Test095
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(4);
      const dv95 = new DataView(buffer95);
      dv95.setUint32(0, 0x00000000);
      dv95.setUint32(0, 0x00000000);
      expect(dv95.getUint32(0)).assertEqual(0x00000000);
    });

    /**
     * @tc.name   DataView22Test096
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(4);
      const dv96 = new DataView(buffer96);
      dv96.setUint32(0, 0xFFFFFFFF);
      dv96.setUint32(0, 0xFFFFFFFF);
      expect(dv96.getUint32(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test097
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(8);
      const dv97 = new DataView(buffer97);
      dv97.setUint32(0, 0x11111111);
      dv97.setUint32(4, 0xABCDEF12);
      expect(dv97.getUint32(0)).assertEqual(0x11111111);
    });

    /**
     * @tc.name   DataView22Test098
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(8);
      const dv98 = new DataView(buffer98);
      dv98.setUint32(0, 0x22222222, true);
      dv98.setUint32(4, 0x12EFCDAB, true);
      expect(dv98.getUint32(0, true)).assertEqual(0x22222222);
    });

    /**
     * @tc.name   DataView22Test099
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_9900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(7);
      const dv99 = new DataView(buffer99);
      dv99.setUint32(3, -0x1);
      expect(dv99.getUint32(3)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test100
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(7);
      const dv100 = new DataView(buffer100);
      dv100.setUint32(3, -0x2, true);
      expect(dv100.getUint32(3, true)).assertEqual(0xFFFFFFFE);
    });

    /**
     * @tc.name   DataView22Test101
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(4);
      const dv101 = new DataView(buffer101);
      dv101.setUint32(0, 0x1234);
      expect(dv101.getUint32(0)).assertEqual(0x00001234);
    });

    /**
     * @tc.name   DataView22Test102
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(4);
      const dv102 = new DataView(buffer102);
      dv102.setUint32(0, 0x3412, true);
      expect(dv102.getUint32(0, true)).assertEqual(0x00003412);
    });

    /**
     * @tc.name   DataView22Test103
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(4);
      const dv103 = new DataView(buffer103);
      dv103.setUint32(0, 0x0F0F0F0F);
      expect(dv103.getUint8(0)).assertEqual(0x0F);
      expect(dv103.getUint8(1)).assertEqual(0x0F);
      expect(dv103.getUint8(2)).assertEqual(0x0F);
      expect(dv103.getUint8(3)).assertEqual(0x0F);

    });

    /**
     * @tc.name   DataView22Test104
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(4);
      const dv104 = new DataView(buffer104);
      dv104.setUint32(0, 0x0F0F0F0F, true);
      expect(dv104.getUint8(0)).assertEqual(0x0F);
      expect(dv104.getUint8(1)).assertEqual(0x0F);
      expect(dv104.getUint8(2)).assertEqual(0x0F);
      expect(dv104.getUint8(3)).assertEqual(0x0F);
    });

    /**
     * @tc.name   DataView22Test105
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(4);
      const dv105 = new DataView(buffer105);
      dv105.setUint32(0, 0x11223344);
      expect(dv105.getInt32(0)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView22Test106
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(4);
      const dv106 = new DataView(buffer106);
      dv106.setUint32(0, 0x80000000, true);
      expect(dv106.getInt32(0, true)).assertEqual(-0x80000000);
    });

    /**
     * @tc.name   DataView22Test107
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(4);
      const dv107 = new DataView(buffer107);
      dv107.setUint32(0, 0x100000001);
      expect(dv107.getUint32(0)).assertEqual(0x00000001);
    });

    /**
     * @tc.name   DataView22Test109
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_10900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(8);
      const dv109 = new DataView(buffer109);
      dv109.setUint32(0, 0x1234);
      dv109.setUint32(4, 0x5678);
      expect(dv109.getUint32(0)).assertEqual(0x1234);
      expect(dv109.getUint32(4)).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView22Test110
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(8);
      const dv110 = new DataView(buffer110);
      dv110.setUint32(0, 0x4321, true);
      dv110.setUint32(4, 0x8765, true);
      expect(dv110.getUint32(0, true)).assertEqual(0x4321);
      expect(dv110.getUint32(4, true)).assertEqual(0x8765);
    });

    /**
     * @tc.name   DataView22Test111
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(4);
      const dv111 = new DataView(buffer111);
      dv111.setUint32(0, -0x80000001);
      expect(dv111.getUint32(0)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.name   DataView22Test112
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(4);
      const dv112 = new DataView(buffer112);
      dv112.setUint32(0, -0x7FFFFFFF, true);
      expect(dv112.getUint32(0, true)).assertEqual(0x80000001);
    });

    /**
     * @tc.name   DataView22Test113
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(5);
      const dv113 = new DataView(buffer113);
      dv113.setUint32(1, 0x12345678);
      expect(dv113.getUint8(1)).assertEqual(0x12);
      expect(dv113.getUint8(2)).assertEqual(0x34);
      expect(dv113.getUint8(3)).assertEqual(0x56);
      expect(dv113.getUint8(4)).assertEqual(0x78);
    });

    /**
     * @tc.name   DataView22Test114
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(5);
      const dv114 = new DataView(buffer114);
      dv114.setUint32(1, 0x87654321, true);
      expect(dv114.getUint8(1)).assertEqual(0x21);
      expect(dv114.getUint8(2)).assertEqual(0x43);
      expect(dv114.getUint8(3)).assertEqual(0x65);
      expect(dv114.getUint8(4)).assertEqual(0x87);
    });

    /**
     * @tc.name   DataView22Test115
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const dv115 = new DataView(buffer115);
      dv115.setUint32(0, 0x00000000, true);
      expect(dv115.getUint32(0)).assertEqual(0x00000000);
    });

    /**
     * @tc.name   DataView22Test116
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(4);
      const dv116 = new DataView(buffer116);
      dv116.setUint32(0, 0xFFFFFFFF);
      expect(dv116.getUint32(0, true)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.name   DataView22Test117
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(12);
      const dv117 = new DataView(buffer117);
      dv117.setUint32(8, 0xABCDEF);
      expect(dv117.getUint32(8)).assertEqual(0xABCDEF);
    });

    /**
     * @tc.name   DataView22Test118
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(12);
      const dv118 = new DataView(buffer118);
      dv118.setUint32(8, 0xFEDCBA, true);
      expect(dv118.getUint32(8, true)).assertEqual(0xFEDCBA);
    });

    /**
     * @tc.name   DataView22Test119
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_11900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const dv119 = new DataView(buffer119);
      dv119.setUint32(0, 0x11112222);
      expect(dv119.getUint16(0)).assertEqual(0x1111);
      expect(dv119.getUint16(2)).assertEqual(0x2222);
    });

    /**
     * @tc.name   DataView22Test120
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(4);
      const dv120 = new DataView(buffer120);
      dv120.setUint32(0, 0x22221111, true);
      expect(dv120.getUint16(0, true)).assertEqual(0x1111);
      expect(dv120.getUint16(2, true)).assertEqual(0x2222);
    });

    /**
     * @tc.name   DataView22Test121
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(4);
      const dv121 = new DataView(buffer121);
      dv121.setUint32(0, 0x00010203);
      expect(dv121.getUint32(0, true)).assertEqual(0x03020100);
    });

    /**
     * @tc.name   DataView22Test122
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(4);
      const dv122 = new DataView(buffer122);
      dv122.setUint32(0, 0x03020100, true);
      expect(dv122.getUint32(0)).assertEqual(0x00010203);
    });

    /**
     * @tc.name   DataView22Test123
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(4);
      const dv123 = new DataView(buffer123);
      dv123.setUint32(0, -0x1234);
      expect(dv123.getUint32(0)).assertEqual(0xFFFFEDCC);
    });

    /**
     * @tc.name   DataView22Test124
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(4);
      const dv124 = new DataView(buffer124);
      dv124.setUint32(0, -0x4321, true);
      expect(dv124.getUint32(0, true)).assertEqual(4294950111);
    });

    /**
     * @tc.name   DataView22Test125
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(4);
      const dv125 = new DataView(buffer125);
      dv125.setUint32(0, 0x12345678);
      dv125.setUint32(0, 0x87654321);
      expect(dv125.getUint32(0)).assertEqual(0x87654321);

    });

    /**
     * @tc.name   DataView22Test126
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(4);
      const dv126 = new DataView(buffer126);
      dv126.setUint32(0, 0x87654321, true);
      dv126.setUint32(0, 0x12345678, true);
      expect(dv126.getUint32(0, true)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   DataView22Test127
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(6);
      const dv127 = new DataView(buffer127);
      dv127.setUint32(2, 0x11AA22BB);
      expect(dv127.getUint8(2)).assertEqual(0x11);
      expect(dv127.getUint8(3)).assertEqual(0xAA);
      expect(dv127.getUint8(4)).assertEqual(0x22);
      expect(dv127.getUint8(5)).assertEqual(0xBB);
    });

    /**
     * @tc.name   DataView22Test128
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(6);
      const dv128 = new DataView(buffer128);
      dv128.setUint32(2, 0xBB22AA11, true);
      expect(dv128.getUint8(2)).assertEqual(0x11);
      expect(dv128.getUint8(3)).assertEqual(0xAA);
      expect(dv128.getUint8(4)).assertEqual(0x22);
      expect(dv128.getUint8(5)).assertEqual(0xBB);
    });

    /**
     * @tc.name   DataView22Test129
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_12900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(4);
      const dv129 = new DataView(buffer129);
      dv129.setUint32(0, 0x7FFFFFFF);
      expect(dv129.getUint32(0, true)).assertEqual(0xFFFFFF7F);
    });

    /**
     * @tc.name   DataView22Test130
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(4);
      const dv130 = new DataView(buffer130);
      dv130.setUint32(0, 0xFFFFFF7F, true);
      expect(dv130.getUint32(0)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.name   DataView22Test131
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(4);
      const dv131 = new DataView(buffer131);
      dv131.setUint32(0, 0x123456789, true);
      expect(dv131.getUint32(0, true)).assertEqual(591751049);
    });

    /**
     * @tc.name   DataView22Test132
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const dv132 = new DataView(buffer132);
      dv132.setUint32(0, 0x00056789, true);
      expect(dv132.getUint32(0, true)).assertEqual(0x00056789);
    });

    /**
     * @tc.name   DataView22Test133
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(8);
      const dv133 = new DataView(buffer133);
      dv133.setUint32(4, 0x11223344, true);
      expect(dv133.getUint32(4, true)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView22Test134
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13400
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(4);
      const dv134 = new DataView(buffer134);
      dv134.setUint32(0, 0x80000000);
      expect(dv134.getInt32(0, true)).assertEqual(128);
    });

    /**
     * @tc.name   DataView22Test135
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(4);
      const dv135 = new DataView(buffer135);
      dv135.setUint32(0, -0x123456, true);
      expect(dv135.getUint32(0, true)).assertEqual(4293774250);
    });

    /**
     * @tc.name   DataView22Test137
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const dv137 = new DataView(buffer137);
      dv137.setUint32(0, 0x1234);
      dv137.setUint32(0, 0x5678, true);
      expect(dv137.getUint32(0, true)).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView22Test138
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(5);
      const dv138 = new DataView(buffer138);
      dv138.setUint32(1, 0x11223344, true);
      expect(dv138.getUint8(1)).assertEqual(0x44);
      expect(dv138.getUint8(2)).assertEqual(0x33);
      expect(dv138.getUint8(3)).assertEqual(0x22);
      expect(dv138.getUint8(4)).assertEqual(0x11);
    });

    /**
     * @tc.name   DataView22Test139
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_13900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(8);
      const dv139 = new DataView(buffer139);
      dv139.setUint32(4, 0x00000000);
      expect(dv139.getUint32(4)).assertEqual(0x00000000);
    });

    /**
     * @tc.name   DataView22Test140
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(9);
      const dv140 = new DataView(buffer140);
      dv140.setUint32(5, 0xFFFFFFFF, true);
      expect(dv140.getUint32(5, true)).assertEqual(0xFFFFFFFF);

    });

    /**
     * @tc.name   DataView22Test141
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14100
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(4);
      const dv141 = new DataView(buffer141);
      dv141.setUint32(0, 0x12345678);
      expect(dv141.getUint32(0, true)).assertEqual(0x78563412);
    });

    /**
     * @tc.name   DataView22Test142
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14200
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(4);
      const dv142 = new DataView(buffer142);
      dv142.setUint32(0, 0x87654321, true);
      expect(dv142.getUint32(0)).assertEqual(0x21436587);
    });

    /**
     * @tc.name   DataView22Test143
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14300
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(4);
      const dv143 = new DataView(buffer143);
      dv143.setUint32(0, -0xFFFFFF);
      expect(dv143.getUint32(0)).assertEqual(4278190081);
    });

    /**
     * @tc.name   DataView22Test145
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14500
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(7);
      const dv145 = new DataView(buffer145);
      dv145.setUint32(3, 0xAA55AA55);
      expect(dv145.getUint32(3)).assertEqual(0xAA55AA55);
    });

    /**
     * @tc.name   DataView22Test146
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14600
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(6);
      const dv146 = new DataView(buffer146);
      dv146.setUint32(2, 0x55AA55AA, true);
      expect(dv146.getUint32(2, true)).assertEqual(0x55AA55AA);
    });

    /**
     * @tc.name   DataView22Test147
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14700
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(4);
      const dv147 = new DataView(buffer147);
      dv147.setUint32(0, 0x11111111);
      dv147.setUint16(1, 0x2222);
      expect(dv147.getUint32(0)).assertEqual(0x11222211);
    });

    /**
     * @tc.name   DataView22Test148
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14800
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(4);
      const dv148 = new DataView(buffer148);
      dv148.setUint32(0, 0x22222222, true);
      dv148.setUint16(1, 0x3333, true);
      expect(dv148.getUint32(0, true)).assertEqual(0x22333322);
    });

    /**
     * @tc.name   DataView22Test149
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_14900
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(4);
      const dv149 = new DataView(buffer149);
      dv149.setUint32(0, 0x80000000);
      expect(dv149.getUint32(0, true)).assertEqual(0x00000080);
    });

    /**
     * @tc.name   DataView22Test150
     * @tc.number SUB_BUILTINS_DATAVIEW22_TEST_15000
     * @tc.desc   test DataView setUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView22Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(4);
      const dv150 = new DataView(buffer150);
      dv150.setUint32(0, 0x00000080, true);
      expect(dv150.getUint32(0)).assertEqual(0x80000000);
    });

  })
}
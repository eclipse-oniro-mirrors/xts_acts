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
import * as DataView21 from './DataView21';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView21Test() {
  describe('DataView21Test', () => {
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
     * @tc.name   DataView21Test001
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(2);
      const dv1 = new DataView(buffer1);
      dv1.setUint16(0, 0x1234);
      const result1 = dv1.getUint16(0);
      expect(result1).assertEqual(0x1234);
    });

    /**
     * @tc.name   DataView21Test002
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(2);
      const dv2 = new DataView(buffer2);
      dv2.setUint16(0, 0x5678, true);
      const result2 = dv2.getUint16(0, true);
      expect(result2).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView21Test003
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(2);
      const dv3 = new DataView(buffer3);
      dv3.setUint16(0, 0xFFFF, false);
      const result3 = dv3.getUint16(0, false);
      expect(result3).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test004
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(3);
      const dv4 = new DataView(buffer4);
      dv4.setUint16(1, 0xABCD);
      const result4 = dv4.getUint16(1);
      expect(result4).assertEqual(0xABCD);

    });

    /**
     * @tc.name   DataView21Test005
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(4);
      const dv5 = new DataView(buffer5);
      dv5.setUint16(2, 0xDCBA, true);
      const result5 = dv5.getUint16(2, true);
      expect(result5).assertEqual(0xDCBA);
    });

    /**
     * @tc.name   DataView21Test006
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(2);
      const dv6 = new DataView(buffer6);
      dv6.setUint16(0, 0);
      const result6 = dv6.getUint16(0);
      expect(result6).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test007
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(2);
      const dv7 = new DataView(buffer7);
      dv7.setUint16(0, 0, true);
      const result7 = dv7.getUint16(0, true);
      expect(result7).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test008
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(2);
      const dv8 = new DataView(buffer8);
      dv8.setUint16(0, -1);
      const result8 = dv8.getUint16(0);
      expect(result8).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test009
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_0900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(2);
      const dv9 = new DataView(buffer9);
      dv9.setUint16(0, -2, true);
      const result9 = dv9.getUint16(0, true);
      expect(result9).assertEqual(0xFFFE);
    });

    /**
     * @tc.name   DataView21Test010
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(2);
      const dv10 = new DataView(buffer10);
      dv10.setUint16(0, 0x10000);
      const result10 = dv10.getUint16(0);
      expect(result10).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test011
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(2);
      const dv11 = new DataView(buffer11);
      dv11.setUint16(0, 0x12345, true);
      const result11 = dv11.getUint16(0, true);
      expect(result11).assertEqual(0x2345);
    });

    /**
     * @tc.name   DataView21Test012
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(2);
      const dv12 = new DataView(buffer12);
      dv12.setUint16(0, 0x1234);
      const byte0 = dv12.getUint8(0);
      const byte1 = dv12.getUint8(1);
      expect(byte0).assertEqual(0x12);
      expect(byte1).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView21Test013
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(2);
      const dv13 = new DataView(buffer13);
      dv13.setUint16(0, 0x5678, true);
      const byte2 = dv13.getUint8(0);
      const byte3 = dv13.getUint8(1);
      expect(byte2).assertEqual(0x78);
      expect(byte3).assertEqual(0x56);
    });

    /**
     * @tc.name   DataView21Test014
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(4);
      const dv14 = new DataView(buffer14);
      dv14.setUint16(0, 0xAAAA);
      dv14.setUint16(2, 0xBBBB, true);
      const val0 = dv14.getUint16(0);
      const val2 = dv14.getUint16(2, true);
      expect(val0).assertEqual(0xAAAA);
      expect(val2).assertEqual(0xBBBB);
    });

    /**
     * @tc.name   DataView21Test015
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(2);
      const dv15 = new DataView(buffer15);
      dv15.setUint16(0, 0xCCCC, undefined);
      const result15 = dv15.getUint16(0);
      expect(result15).assertEqual(0xCCCC);
    });

    /**
     * @tc.name   DataView21Test016
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(2);
      const dv16 = new DataView(buffer16);
      dv16.setUint16(0, 0x0001);
      const result16 = dv16.getUint16(0);
      expect(result16).assertEqual(0x0001);
    });

    /**
     * @tc.name   DataView21Test017
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(2);
      const dv17 = new DataView(buffer17);
      dv17.setUint16(0, 0x0001, true);
      const result17 = dv17.getUint16(0, true);
      expect(result17).assertEqual(0x0001);
    });

    /**
     * @tc.name   DataView21Test018
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(2);
      const dv18 = new DataView(buffer18);
      dv18.setUint16(0, 0xABCD);
      const result18 = dv18.getUint16(0, true);
      expect(result18).assertEqual(0xCDAB);
    });

    /**
     * @tc.name   DataView21Test019
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_1900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(2);
      const dv19 = new DataView(buffer19);
      dv19.setUint16(0, 0xDCBA, true);
      const result19 = dv19.getUint16(0);
      expect(result19).assertEqual(0xBADC);

    });

    /**
     * @tc.name   DataView21Test020
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(2);
      const dv20 = new DataView(buffer20);
      dv20.setUint16(0, 0xFFFF, true);
      const result20 = dv20.getUint16(0, true);
      expect(result20).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test021
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(2);
      const dv21 = new DataView(buffer21);
      dv21.setUint16(0, 0x8000);
      const result21 = dv21.getUint16(0);
      expect(result21).assertEqual(0x8000);
    });

    /**
     * @tc.name   DataView21Test022
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(2);
      const dv22 = new DataView(buffer22);
      dv22.setUint16(0, 0x7FFF, true);
      const result22 = dv22.getUint16(0, true);
      expect(result22).assertEqual(0x7FFF);
    });

    /**
     * @tc.name   DataView21Test023
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(5);
      const dv23 = new DataView(buffer23);
      dv23.setUint16(3, 0x1122);
      const result23 = dv23.getUint16(3);
      expect(result23).assertEqual(0x1122);
    });

    /**
     * @tc.name   DataView21Test024
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(2);
      const dv24 = new DataView(buffer24);
      dv24.setUint16(0, 0x0F0F);
      const b0 = dv24.getUint8(0);
      const b1 = dv24.getUint8(1);
      expect(b0).assertEqual(0x0F);
      expect(b1).assertEqual(0x0F);
    });

    /**
     * @tc.name   DataView21Test025
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(2);
      const dv25 = new DataView(buffer25);
      dv25.setUint16(0, 0xF0F0, true);
      const b2 = dv25.getUint8(0);
      const b3 = dv25.getUint8(1);
      expect(b2).assertEqual(0xF0);
      expect(b3).assertEqual(0xF0);
    });

    /**
     * @tc.name   DataView21Test026
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(2);
      const dv26 = new DataView(buffer26);
      dv26.setUint16(0, 0x3333);
      dv26.setUint16(0, 0x4444);
      const result26 = dv26.getUint16(0);
      expect(result26).assertEqual(0x4444);
    });

    /**
     * @tc.name   DataView21Test027
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(2);
      const dv27 = new DataView(buffer27);
      dv27.setUint16(0, 0x00FF);
      const result27 = dv27.getUint16(0);
      expect(result27).assertEqual(0x00FF);
    });

    /**
     * @tc.name   DataView21Test028
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(2);
      const dv28 = new DataView(buffer28);
      dv28.setUint16(0, 0xFF00, true);
      const result28 = dv28.getUint16(0, true);
      expect(result28).assertEqual(0xFF00);
    });

    /**
     * @tc.name   DataView21Test029
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_2900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(2);
      const dv29 = new DataView(buffer29);
      dv29.setUint16(0, Number.MAX_SAFE_INTEGER);
      const result29 = dv29.getUint16(0);
      expect(result29).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test030
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(2);
      const dv30 = new DataView(buffer30);
      dv30.setUint16(0, NaN);
      const result30 = dv30.getUint16(0);
      expect(result30).assertEqual(0);

    });

    /**
     * @tc.name   DataView21Test031
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(2);
      const dv31 = new DataView(buffer31);
      dv31.setUint16(0, Infinity);
      const result31 = dv31.getUint16(0);
      expect(result31).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test032
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(3);
      const dv32 = new DataView(buffer32);
      dv32.setUint16(0, 0x1122, true);
      dv32.setUint16(1, 0x3344, true);
      const val32_0 = dv32.getUint16(0, true);
      const val32_1 = dv32.getUint16(1, true);
      expect(val32_0).assertEqual(17442);
      expect(val32_1).assertEqual(13124);
    });

    /**
     * @tc.name   DataView21Test033
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(2);
      const dv33 = new DataView(buffer33);
      dv33.setUint16(0, 0x1234);
      dv33.setUint8(1, 0x56);
      const result33 = dv33.getUint16(0);
      expect(result33).assertEqual(0x1256);
    });

    /**
     * @tc.name   DataView21Test034
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(2);
      const dv34 = new DataView(buffer34);
      dv34.setUint16(0, 0x5678, true);
      dv34.setUint8(0, 0x9A);
      const result34 = dv34.getUint16(0, true);
      expect(result34).assertEqual(0x569A);
    });

    /**
     * @tc.name   DataView21Test035
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(2);
      const dv35 = new DataView(buffer35);
      dv35.setUint16(0, 0x11EE);
      const result35 = dv35.getUint16(0);
      expect(result35).assertEqual(0x11EE);
    });

    /**
     * @tc.name   DataView21Test036
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(5);
      const dv36 = new DataView(buffer36);
      dv36.setUint16(3, 0x22DD, true);
      const result36 = dv36.getUint16(3, true);
      expect(result36).assertEqual(0x22DD);
    });

    /**
     * @tc.name   DataView21Test037
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(2);
      const dv37 = new DataView(buffer37);
      dv37.setUint16(0, 123.99);
      const result37 = dv37.getUint16(0);
      expect(result37).assertEqual(0x007B);
    });

    /**
     * @tc.name   DataView21Test038
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(2);
      const dv38 = new DataView(buffer38);
      dv38.setUint16(0, 456.1, true);
      const result38 = dv38.getUint16(0, true);
      expect(result38).assertEqual(0x01C8);
    });

    /**
     * @tc.name   DataView21Test039
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_3900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test039()).assertEqual(0x33CC);

    });

    /**
     * @tc.name   DataView21Test040
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test040()).assertEqual(0x44BB);
    });

    /**
     * @tc.name   DataView21Test041
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const dv41 = new DataView(buffer41);
      dv41.setUint16(0, 0x55AA);
      dv41.setUint16(2, 0x6699, true);
      const val41_0 = dv41.getUint16(0);
      const val41_2 = dv41.getUint16(2, true);
      expect(val41_0).assertEqual(0x55AA);
      expect(val41_2).assertEqual(0x6699);
    });

    /**
     * @tc.name   DataView21Test042
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(2);
      const dv42 = new DataView(buffer42);
      dv42.setUint16(0, 0x000F);
      const b42_0 = dv42.getUint8(0);
      const b42_1 = dv42.getUint8(1);
      expect(b42_0).assertEqual(0x00);
      expect(b42_1).assertEqual(0x0F);
    });

    /**
     * @tc.name   DataView21Test043
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(2);
      const dv43 = new DataView(buffer43);
      dv43.setUint16(0, 0xF000, true);
      const b43_0 = dv43.getUint8(0);
      const b43_1 = dv43.getUint8(1);
      expect(b43_0).assertEqual(0x00);
      expect(b43_1).assertEqual(0xF0);
    });

    /**
     * @tc.name   DataView21Test044
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(2);
      const dv44 = new DataView(buffer44);
      dv44.setUint16(0, -32768);
      const result44 = dv44.getUint16(0);
      expect(result44).assertEqual(0x8000);
    });

    /**
     * @tc.name   DataView21Test045
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(2);
      const dv45 = new DataView(buffer45);
      dv45.setUint16(0, -32769, true);
      const result45 = dv45.getUint16(0, true);
      expect(result45).assertEqual(0x7FFF);
    });

    /**
     * @tc.name   DataView21Test046
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(2);
      const dv46 = new DataView(buffer46);
      dv46.setUint16(0, 0xFFFF);
      const intResult46 = dv46.getInt16(0);
      expect(intResult46).assertEqual(-1);
    });

    /**
     * @tc.name   DataView21Test047
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(2);
      const dv47 = new DataView(buffer47);
      dv47.setUint16(0, 0x0000, true);
      const intResult47 = dv47.getInt16(0, true);
      expect(intResult47).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test048
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(2);
      const dv48 = new DataView(buffer48);
      dv48.setUint16(0, 0x1111);
      dv48.setUint16(0, 0x2222);
      const result48 = dv48.getUint16(0);
      expect(result48).assertEqual(0x2222);
    });

    /**
     * @tc.name   DataView21Test049
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_4900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(6);
      const dv49 = new DataView(buffer49);
      dv49.setUint16(4, 0x3333);
      const result49 = dv49.getUint16(4);
      expect(result49).assertEqual(0x3333);
    });

    /**
     * @tc.name   DataView21Test050
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(2);
      const dv50 = new DataView(buffer50);
      dv50.setUint16(0, 0xABCD, true);
      const bigEndResult50 = dv50.getUint16(0);
      expect(bigEndResult50).assertEqual(0xCDAB);
    });

    /**
     * @tc.name   DataView21Test051
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(2);
      const dv51 = new DataView(buffer51);
      dv51.setUint16(0, 0xDCBA);
      const littleEndResult51 = dv51.getUint16(0, true);
      expect(littleEndResult51).assertEqual(0xBADC);
    });

    /**
     * @tc.name   DataView21Test052
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test052()).assertEqual(0x4444);
    });

    /**
     * @tc.name   DataView21Test053
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test053()).assertEqual(0x5555);
    });

    /**
     * @tc.name   DataView21Test054
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(2);
      const dv54 = new DataView(buffer54);
      dv54.setUint16(0, Number.MAX_VALUE);
      const result54 = dv54.getUint16(0);
      expect(result54).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test055
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(2);
      const dv55 = new DataView(buffer55);
      dv55.setUint16(0, -Number.MAX_VALUE);
      const result55 = dv55.getUint16(0);
      expect(result55).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test056
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(2);
      const dv56 = new DataView(buffer56);
      dv56.setUint16(0, 0x0000, true);
      const result56 = dv56.getUint16(0, true);
      expect(result56).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test057
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(10);
      const dv57 = new DataView(buffer57);
      dv57.setUint16(8, 0x6666, true);
      const result57 = dv57.getUint16(8, true);
      expect(result57).assertEqual(0x6666);
    });

    /**
     * @tc.name   DataView21Test058
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(2);
      const dv58 = new DataView(buffer58);
      dv58.setUint16(0, 0x3344);
      dv58.setUint8(0, 0x55);
      const result58 = dv58.getUint16(0);
      expect(result58).assertEqual(0x5544);
    });

    /**
     * @tc.name   DataView21Test059
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_5900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(2);
      const dv59 = new DataView(buffer59);
      dv59.setUint16(0, 0x6677, true);
      dv59.setUint8(1, 0x88);
      const result59 = dv59.getUint16(0, true);
      expect(result59).assertEqual(0x8877);
    });

    /**
     * @tc.name   DataView21Test060
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(2);
      const dv60 = new DataView(buffer60);
      dv60.setUint16(0, 0xFFFF, true);
      const b60_0 = dv60.getUint8(0);
      const b60_1 = dv60.getUint8(1);
      expect(b60_0).assertEqual(0xFF);
      expect(b60_1).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView21Test061
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(2);
      const dv61 = new DataView(buffer61);
      dv61.setUint16(0, 0x0102);
      const b61_0 = dv61.getUint8(0);
      const b61_1 = dv61.getUint8(1);
      expect(b61_0).assertEqual(0x01);
      expect(b61_1).assertEqual(0x02);
    });

    /**
     * @tc.name   DataView21Test062
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(2);
      const dv62 = new DataView(buffer62);
      dv62.setUint16(0, 0x0304, true);
      const b62_0 = dv62.getUint8(0);
      const b62_1 = dv62.getUint8(1);
      expect(b62_0).assertEqual(0x04);
      expect(b62_1).assertEqual(0x03);
    });
    /**
     * @tc.name   DataView21Test063
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const dv63 = new DataView(buffer63);
      dv63.setUint16(0, 0x1234);
      dv63.setUint16(2, 0x5678, true);
      const val63_0 = dv63.getUint16(0);
      const val63_2 = dv63.getUint16(2, true);
      expect(val63_0).assertEqual(0x1234);
      expect(val63_2).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView21Test064
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(2);
      const dv64 = new DataView(buffer64);
      dv64.setUint16(0, 0x9ABC);
      const littleResult64 = dv64.getUint16(0, true);
      expect(littleResult64).assertEqual(0xBC9A);
    });

    /**
     * @tc.name   DataView21Test065
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(2);
      const dv65 = new DataView(buffer65);
      dv65.setUint16(0, 0x0010);
      const result65 = dv65.getUint16(0);
      expect(result65).assertEqual(0x0010);
    });

    /**
     * @tc.name   DataView21Test066
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(2);
      const dv66 = new DataView(buffer66);
      dv66.setUint16(0, 0x1000, true);
      const result66 = dv66.getUint16(0, true);
      expect(result66).assertEqual(0x1000);
    });

    /**
     * @tc.name   DataView21Test067
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(2);
      const dv67 = new DataView(buffer67);
      dv67.setUint16(0, 255, true);
      const result67 = dv67.getUint16(0, true);
      expect(result67).assertEqual(0x00FF);
    });

    /**
     * @tc.name   DataView21Test068
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(2);
      const dv68 = new DataView(buffer68);
      dv68.setUint16(0, 65535);
      const result68 = dv68.getUint16(0);
      expect(result68).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test069
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_6900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(2);
      const dv69 = new DataView(buffer69);
      dv69.setUint16(0, 0xABCD, false);
      const result69 = dv69.getUint16(0, false);
      expect(result69).assertEqual(0xABCD);
    });

    /**
     * @tc.name   DataView21Test070
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(2);
      const dv70 = new DataView(buffer70);
      dv70.setUint16(0, -65536);
      const result70 = dv70.getUint16(0);
      expect(result70).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test071
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test071()).assertEqual(0x0001);
    });

    /**
     * @tc.name   DataView21Test072
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test072()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test073
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test073()).assertEqual(0x01C8);
    });

    /**
     * @tc.name   DataView21Test074
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test074()).assertEqual(0xABCD);
    });

    /**
     * @tc.name   DataView21Test075
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test075()).assertEqual(0x1122);
    });

    /**
     * @tc.name   DataView21Test076
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test076()).assertEqual(0x3344);
    });

    /**
     * @tc.name   DataView21Test077
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(2);
      const dv77 = new DataView(buffer77);
      dv77.setUint16(0, -65535);
      const result77 = dv77.getUint16(0);
      expect(result77).assertEqual(0x0001);
    });

    /**
     * @tc.name   DataView21Test078
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(2);
      const dv78 = new DataView(buffer78);
      dv78.setUint16(0, -32767, true);
      const result78 = dv78.getUint16(0, true);
      expect(result78).assertEqual(0x8001);
    });

    /**
     * @tc.name   DataView21Test079
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_7900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(2);
      const dv79 = new DataView(buffer79);
      dv79.setUint16(0, 0x0080);
      const b79_0 = dv79.getUint8(0);
      const b79_1 = dv79.getUint8(1);
      expect(b79_0).assertEqual(0x00);
      expect(b79_1).assertEqual(0x80);
    });

    /**
     * @tc.name   DataView21Test080
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(2);
      const dv80 = new DataView(buffer80);
      dv80.setUint16(0, 0x8000, true);
      const b80_0 = dv80.getUint8(0);
      const b80_1 = dv80.getUint8(1);
      expect(b80_0).assertEqual(0x00);
      expect(b80_1).assertEqual(0x80);
    });

    /**
     * @tc.name   DataView21Test081
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(3);
      const dv81 = new DataView(buffer81);
      dv81.setUint16(0, 0xAAAA);
      dv81.setUint16(1, 0xBBBB);
      const val81_0 = dv81.getUint16(0);
      const val81_1 = dv81.getUint16(1);
      expect(val81_0).assertEqual(43707);
      expect(val81_1).assertEqual(48059);
    });

    /**
     * @tc.name   DataView21Test082
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(2);
      const dv82 = new DataView(buffer82);
      dv82.setUint16(0, 12345);
      const result82 = dv82.getUint16(0);
      expect(result82).assertEqual(0x3039);
    });

    /**
     * @tc.name   DataView21Test083
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(2);
      const dv83 = new DataView(buffer83);
      dv83.setUint16(0, 54321, true);
      const result83 = dv83.getUint16(0, true);
      expect(result83).assertEqual(0xD431);
    });

    /**
     * @tc.name   DataView21Test084
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(2);
      const dv84 = new DataView(buffer84);
      dv84.setUint16(0, 0x1234);
      const littleVal = dv84.getUint16(0, true);
      dv84.setUint16(0, littleVal, true);
      const bigVal = dv84.getUint16(0);
      expect(bigVal).assertEqual(0x1234);
    });

    /**
     * @tc.name   DataView21Test085
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(2);
      const dv85 = new DataView(buffer85);
      dv85.setUint16(0, 0x5678, true);
      const bigVal85 = dv85.getUint16(0);
      dv85.setUint16(0, bigVal85);
      const littleVal85 = dv85.getUint16(0, true);
      expect(littleVal85).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView21Test086
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(2);
      const dv86 = new DataView(buffer86);
      dv86.setUint16(0, 0x0F00);
      const b86_0 = dv86.getUint8(0);
      const b86_1 = dv86.getUint8(1);
      expect(b86_0).assertEqual(0x0F);
      expect(b86_1).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView21Test087
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(2);
      const dv87 = new DataView(buffer87);
      dv87.setUint16(0, 0x00F0, true);
      const b87_0 = dv87.getUint8(0);
      const b87_1 = dv87.getUint8(1);
      expect(b87_0).assertEqual(0xF0);
      expect(b87_1).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView21Test089
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_8900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(2);
      const dv89 = new DataView(buffer89);
      dv89.setUint16(0, 3.14, true);
      const result89 = dv89.getUint16(0, true);
      expect(result89).assertEqual(0x0003);
    });

    /**
     * @tc.name   DataView21Test090
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(2);
      const dv90 = new DataView(buffer90);
      dv90.setUint16(0, 9999.9);
      const result90 = dv90.getUint16(0);
      expect(result90).assertEqual(0x270F);
    });

    /**
     * @tc.name   DataView21Test091
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(2);
      const dv91 = new DataView(buffer91);
      dv91.setUint16(0, 0xABCD);
      const temp = dv91.getUint16(0, true);
      dv91.setUint16(0, temp, true);
      const result91 = dv91.getUint16(0);
      expect(result91).assertEqual(0xABCD);
    });

    /**
     * @tc.name   DataView21Test092
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(7);
      const dv92 = new DataView(buffer92);
      dv92.setUint16(5, 0x2233, true);
      const result92 = dv92.getUint16(5, true);
      expect(result92).assertEqual(0x2233);
    });

    /**
     * @tc.name   DataView21Test093
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(2);
      const dv93 = new DataView(buffer93);
      dv93.setUint16(0, -1234);
      const result93 = dv93.getUint16(0);
      expect(result93).assertEqual(64302);
    });

    /**
     * @tc.name   DataView21Test094
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(2);
      const dv94 = new DataView(buffer94);
      dv94.setUint16(0, -5678, true);
      const result94 = dv94.getUint16(0, true);
      expect(result94).assertEqual(59858);
    });

    /**
     * @tc.name   DataView21Test095
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(2);
      const dv95 = new DataView(buffer95);
      dv95.setUint16(0, 0x0000);
      dv95.setUint8(0, 0xAA);
      dv95.setUint8(1, 0xBB);
      const result95 = dv95.getUint16(0);
      expect(result95).assertEqual(0xAABB);
    });

    /**
     * @tc.name   DataView21Test096
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(2);
      const dv96 = new DataView(buffer96);
      dv96.setUint16(0, 0xFFFF, true);
      dv96.setUint8(0, 0xCC);
      dv96.setUint8(1, 0xDD);
      const result96 = dv96.getUint16(0, true);
      expect(result96).assertEqual(0xDDCC);
    });

    /**
     * @tc.name   DataView21Test097
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test097()).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test098
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(2);
      const dv98 = new DataView(buffer98);
      dv98.setUint16(0, 0x100000, true);
      const result98 = dv98.getUint16(0, true);
      expect(result98).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test099
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_9900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(2);
      const dv99 = new DataView(buffer99);
      dv99.setUint16(0, 0x3456);
      const reversed = dv99.getUint16(0, true);
      expect(reversed).assertEqual(0x5634);
    });

    /**
     * @tc.name   DataView21Test100
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(2);
      const dv100 = new DataView(buffer100);
      dv100.setUint16(0, 0x789A, true);
      const reversed100 = dv100.getUint16(0);
      expect(reversed100).assertEqual(0x9A78);
    });

    /**
     * @tc.name   DataView21Test101
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(2);
      const dv101 = new DataView(buffer101);
      dv101.setUint16(0, 0x0000);
      const r1 = dv101.getUint16(0);
      const r2 = dv101.getUint16(0);
      expect(r1).assertEqual(0x0000);
      expect(r2).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test102
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(2);
      const dv102 = new DataView(buffer102);
      dv102.setUint16(0, 0xFFFF, true);
      const r3 = dv102.getUint16(0, true);
      const r4 = dv102.getUint16(0, true);
      expect(r3).assertEqual(0xFFFF);
      expect(r4).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test103
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test103()).assertEqual(true);
    });

    /**
     * @tc.name   DataView21Test104
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(2);
      const dv104 = new DataView(buffer104);
      dv104.setUint16(0, -0);
      const result104 = dv104.getUint16(0);
      expect(result104).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test105
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(2);
      const dv105 = new DataView(buffer105);
      dv105.setUint16(0, 0xABCD);
      const intByte0 = dv105.getInt8(0);
      const intByte1 = dv105.getInt8(1);
      expect(intByte0).assertEqual(-85);
      expect(intByte1).assertEqual(-51);

    });

    /**
     * @tc.name   DataView21Test106
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(2);
      const dv106 = new DataView(buffer106);
      dv106.setUint16(0, 0xDCBA, true);
      const intByte2 = dv106.getInt8(0);
      const intByte3 = dv106.getInt8(1);
      expect(intByte2).assertEqual(-70);
      expect(intByte3).assertEqual(-36);
    });

    /**
     * @tc.name   DataView21Test107
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(2);
      const dv107 = new DataView(buffer107);
      dv107.setUint16(0, 65535, true);
      const intResult107 = dv107.getInt16(0, true);
      expect(intResult107).assertEqual(-1);
    });

    /**
     * @tc.name   DataView21Test108
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(2);
      const dv108 = new DataView(buffer108);
      dv108.setUint16(0, 32767);
      const intResult108 = dv108.getInt16(0);
      expect(intResult108).assertEqual(32767);
    });

    /**
     * @tc.name   DataView21Test109
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_10900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test109()).assertEqual(true);
    });

    /**
     * @tc.name   DataView21Test110
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test110()).assertEqual(0x00AA);
    });

    /**
     * @tc.name   DataView21Test111
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(2);
      const dv111 = new DataView(buffer111);
      dv111.setUint16(0, 0o7777);
      const result111 = dv111.getUint16(0);
      expect(result111).assertEqual(4095);
    });

    /**
     * @tc.name   DataView21Test112
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(2);
      const dv112 = new DataView(buffer112);
      dv112.setInt16(0, -1);
      dv112.setUint16(0, 0x1234);
      const result112 = dv112.getUint16(0);
      expect(result112).assertEqual(0x1234);
    });

    /**
     * @tc.name   DataView21Test113
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(4);
      const dv113 = new DataView(buffer113);
      dv113.setUint16(2, 0xABCD, true);
      const uint32Val = dv113.getUint32(0, true);
      expect(uint32Val).assertEqual(0xABCD0000);
    });

    /**
     * @tc.name   DataView21Test114
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(2);
      const dv114 = new DataView(buffer114);
      dv114.setUint16(0, 0x0100);
      const b114_0 = dv114.getUint8(0);
      const b114_1 = dv114.getUint8(1);
      expect(b114_0).assertEqual(0x01);
      expect(b114_1).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView21Test115
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(2);
      const dv115 = new DataView(buffer115);
      dv115.setUint16(0, 0x0001, true);
      const b115_0 = dv115.getUint8(0);
      const b115_1 = dv115.getUint8(1);
      expect(b115_0).assertEqual(0x01);
      expect(b115_1).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView21Test116
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test116()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test117
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test117()).assertEqual(0x4567);
    });

    /**
     * @tc.name   DataView21Test118
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(2);
      const dv118 = new DataView(buffer118);
      dv118.setUint16(0, -Infinity, true);
      const result118 = dv118.getUint16(0, true);
      expect(result118).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test119
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_11900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(2);
      const dv119 = new DataView(buffer119);
      dv119.setUint16(0, 0x1111);
      dv119.setUint16(0, 0x2222);
      dv119.setUint16(0, 0x3333);
      const result119 = dv119.getUint16(0);
      expect(result119).assertEqual(0x3333);
    });

    /**
     * @tc.name   DataView21Test120
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(3);
      const dv120 = new DataView(buffer120);
      dv120.setUint16(0, 0xAAAA);
      dv120.setUint16(1, 0xBBBB, true);
      const val120_0 = dv120.getUint16(0);
      const val120_1 = dv120.getUint16(1, true);
      expect(val120_0).assertEqual(43707);
      expect(val120_1).assertEqual(48059);
    });

    /**
     * @tc.name   DataView21Test121
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(4);
      const dv121 = new DataView(buffer121);
      dv121.setUint16(0, 65535);
      dv121.setUint16(2, 65535, true);
      const b121_0 = dv121.getUint8(0);
      const b121_1 = dv121.getUint8(1);
      const b121_2 = dv121.getUint8(2);
      const b121_3 = dv121.getUint8(3);
      expect(b121_0).assertEqual(0xFF);
      expect(b121_1).assertEqual(0xFF);
      expect(b121_2).assertEqual(0xFF);
      expect(b121_3).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView21Test122
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(2);
      const dv122 = new DataView(buffer122);
      dv122.setUint16(0, 32768);
      const intResult122 = dv122.getInt16(0);
      expect(intResult122).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView21Test123
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(2);
      const dv123 = new DataView(buffer123);
      dv123.setUint16(0, 32768, true);
      const intResult123 = dv123.getInt16(0, true);
      expect(intResult123).assertEqual(-32768);

    });

    /**
     * @tc.name   DataView21Test124
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test124()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test125
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test125()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test126
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(3);
      const dv126 = new DataView(buffer126);
      dv126.setUint16(1, 0xABCD);
      dv126.setUint8(2, 0xEF);
      const result126 = dv126.getUint16(1);
      expect(result126).assertEqual(0xABEF);
    });

    /**
     * @tc.name   DataView21Test127
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(3);
      const dv127 = new DataView(buffer127);
      dv127.setUint16(1, 0xABCD, true);
      dv127.setUint8(1, 0xDC);
      const result127 = dv127.getUint16(1, true);
      expect(result127).assertEqual(0xABDC);

    });

    /**
     * @tc.name   DataView21Test128
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test128()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test129
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_12900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test129()).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test130
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(2);
      const dv130 = new DataView(buffer130);
      dv130.setUint16(0, 0o177777, true);
      const result130 = dv130.getUint16(0, true);
      expect(result130).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView21Test131
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(102);
      const dv131 = new DataView(buffer131);
      dv131.setUint16(100, 0x1234);
      const result131 = dv131.getUint16(100);
      expect(result131).assertEqual(0x1234);

    });

    /**
     * @tc.name   DataView21Test132
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(2);
      const dv132 = new DataView(buffer132);
      dv132.setUint16(0, 0x1234, true);
      const lowByte = dv132.getUint8(0);
      const highByte = dv132.getUint8(1);
      expect(lowByte).assertEqual(0x34);
      expect(highByte).assertEqual(0x12);
    });

    /**
     * @tc.name   DataView21Test133
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(2);
      const dv133 = new DataView(buffer133);
      dv133.setUint16(0, 0x4321);
      const highByte133 = dv133.getUint8(0);
      const lowByte133 = dv133.getUint8(1);
      expect(highByte133).assertEqual(0x43);
      expect(lowByte133).assertEqual(0x21);
    });

    /**
     * @tc.name   DataView21Test134
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(2);
      const dv134 = new DataView(buffer134);
      dv134.setUint16(0, -65536, true);
      const result134 = dv134.getUint16(0, true);
      expect(result134).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test135
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(2);
      const dv135 = new DataView(buffer135);
      dv135.setUint16(0, 65536);
      const result135 = dv135.getUint16(0);
      expect(result135).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test136
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test136()).assertEqual(0x007B);
    });

    /**
     * @tc.name   DataView21Test137
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const dv137 = new DataView(buffer137);
      dv137.setUint16(0, 0xABCD);
      dv137.setUint16(2, 0xABCD, true);
      const bigBytes = [dv137.getUint8(0), dv137.getUint8(1)];
      const littleBytes = [dv137.getUint8(2), dv137.getUint8(3)];
      expect(bigBytes).assertDeepEquals([0xAB, 0xCD]);
      expect(littleBytes).assertDeepEquals([0xCD, 0xAB]);
    });

    /**
     * @tc.name   DataView21Test138
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(4);
      const dv138 = new DataView(buffer138);
      dv138.setUint16(0, 0x1234, false);
      dv138.setUint16(2, 0x1234, true);
      const bigVal138 = dv138.getUint16(0);
      const littleVal138 = dv138.getUint16(2);
      expect(bigVal138).assertEqual(0x1234);
      expect(littleVal138).assertEqual(0x3412);
    });

    /**
     * @tc.name   DataView21Test139
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_13900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(4);
      const dv139 = new DataView(buffer139);
      dv139.setUint32(0, 0x12345678);
      dv139.setUint16(2, 0xABCD);
      const result139 = dv139.getUint32(0);
      expect(result139).assertEqual(0x1234ABCD);
    });

    /**
     * @tc.name   DataView21Test140
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(4);
      const dv140 = new DataView(buffer140);
      dv140.setUint16(0, 0x0001);
      dv140.setUint16(2, 0x0001, true);
      expect(dv140.getUint8(0)).assertEqual(0x00);
      expect(dv140.getUint8(1)).assertEqual(0x01);
      expect(dv140.getUint8(2)).assertEqual(0x01);
      expect(dv140.getUint8(3)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView21Test141
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14100
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView21.DataView21Test141()).assertEqual(0x0000);
    });

    /**
     * @tc.name   DataView21Test142
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14200
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(4);
      const dv142 = new DataView(buffer142);
      dv142.setUint16(0, 0x1234);
      const floatVal = dv142.getFloat32(0);
      expect(Number.isFinite(floatVal)).assertEqual(true);
    });

    /**
     * @tc.name   DataView21Test143
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14300
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(2);
      const dv143 = new DataView(buffer143);
      dv143.setUint16(0, 0xFFFF, true);
      expect(dv143.getUint8(0)).assertEqual(0xFF);
      expect(dv143.getUint8(1)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView21Test144
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14400
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(2);
      const dv144 = new DataView(buffer144);
      dv144.setUint16(0, 0x0000);
      const intResult144 = dv144.getInt16(0);
      expect(intResult144).assertEqual(0);
    });

    /**
     * @tc.name   DataView21Test145
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14500
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(2);
      const dv145 = new DataView(buffer145);
      dv145.setUint16(0, -32768, true);
      const result145 = dv145.getUint16(0, true);
      expect(result145).assertEqual(0x8000);
    });

    /**
     * @tc.name   DataView21Test146
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14600
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(2);
      const dv146 = new DataView(buffer146);
      dv146.setUint16(0, 0x1122);
      expect(buffer146.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView21Test147
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14700
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(8);
      const dv147 = new DataView(buffer147);
      dv147.setUint16(0, 0xAAAA);
      dv147.setUint16(2, 0xBBBB, true);
      dv147.setUint16(4, 0xCCCC);
      dv147.setUint16(6, 0xDDDD, true);
      expect(dv147.getUint16(0)).assertEqual(0xAAAA);
      expect(dv147.getUint16(2, true)).assertEqual(0xBBBB);
      expect(dv147.getUint16(4)).assertEqual(0xCCCC);
      expect(dv147.getUint16(6, true)).assertEqual(0xDDDD);
    });

    /**
     * @tc.name   DataView21Test148
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14800
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(2);
      const dv148 = new DataView(buffer148);
      dv148.setUint16(0, 16384);
      const result148 = dv148.getUint16(0);
      expect(result148).assertEqual(0x4000);
    });

    /**
     * @tc.name   DataView21Test149
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_14900
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(2);
      const dv149 = new DataView(buffer149);
      dv149.setUint16(0, 49152, true);
      const result149 = dv149.getUint16(0, true);
      expect(result149).assertEqual(0xC000);
    });

    /**
     * @tc.name   DataView21Test150
     * @tc.number SUB_BUILTINS_DATAVIEW21_TEST_15000
     * @tc.desc   test DataView setUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView21Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(2);
      const dv150 = new DataView(buffer150);
      dv150.setUint16(0, 0x1234, true);
      const result150 = dv150.getUint16(0, true);
      expect(result150).assertEqual(0x1234);
    });

  })
}
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

export default function DataView15Test() {
  describe('DataView15Test', () => {
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
     * @tc.name   DataView15Test001
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const dataView1 = new DataView(buffer1);
      dataView1.setFloat32(0, 3.14159);
      expect(new Float32Array(buffer1.slice(0, 4))[0]).assertEqual(-9615769600);
    });

    /**
     * @tc.name   DataView15Test002
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(12);
      const dataView2 = new DataView(buffer2);
      dataView2.setFloat32(4, -1.5);
      expect(new Float32Array(buffer2.slice(4, 8))[0]).assertEqual(6.914427012517945e-41);
    });

    /**
     * @tc.name   DataView15Test003
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(12);
      const dataView2 = new DataView(buffer2);
      dataView2.setFloat32(4, -1.5);
      expect(new Float32Array(buffer2.slice(4, 8))[0]).assertEqual(6.914427012517945e-41);
    });

    /**
     * @tc.name   DataView15Test004
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(4);
      const dataView4 = new DataView(buffer4);
      dataView4.setFloat32(0, 1.4e-45);
      expect(new Float32Array(buffer4)[0]).assertEqual(2.350988701644575e-38);
    });

    /**
     * @tc.name   DataView15Test005
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(4);
      const dataView5 = new DataView(buffer5);
      dataView5.setFloat32(0, 3.40282347e+38);
      expect(isNaN(new Float32Array(buffer5)[0])).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test006
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(4);
      const dataView6 = new DataView(buffer6);
      dataView6.setFloat32(0, NaN);
      expect(isNaN(new Float32Array(buffer6)[0])).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test007
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(4);
      const dataView7 = new DataView(buffer7);
      dataView7.setFloat32(0, Infinity);
      expect(new Float32Array(buffer7)[0] === Infinity).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test008
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(4);
      const dataView8 = new DataView(buffer8);
      dataView8.setFloat32(0, -Infinity);
      expect(new Float32Array(buffer8)[0] === -Infinity).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test009
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_0900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(4);
      const dataView9 = new DataView(buffer9);
      dataView9.setFloat32(0, 1.0);
      expect(new Float32Array(buffer9)[0]).assertEqual(4.600602988224807e-41);
    });

    /**
     * @tc.name   DataView15Test010
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(4);
      const dataView10 = new DataView(buffer10);
      dataView10.setFloat32(0, 0.0, true);
      expect(new Float32Array(buffer10)[0]).assertEqual(0.0);
    });

    /**
     * @tc.name   DataView15Test011
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const dataView11 = new DataView(buffer11);
      dataView11.setFloat32(0, 0.0, false);
      expect(new Float32Array(buffer11)[0]).assertEqual(0.0);
    });

    /**
     * @tc.name   DataView15Test012
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(8);
      const dataView12 = new DataView(buffer12);
      dataView12.setFloat32(0, 1.1, true);
      dataView12.setFloat32(4, 2.2, true);
      expect(new Float32Array(buffer12)[0]).assertEqual(1.100000023841858);
      expect(new Float32Array(buffer12)[1]).assertEqual(2.200000047683716);
    });

    /**
     * @tc.name   DataView15Test013
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(8);
      const dataView13 = new DataView(buffer13);
      dataView13.setFloat32(0, 3.3, false);
      dataView13.setFloat32(4, 4.4, false);
      expect(new Float32Array(buffer13)[0]).assertEqual(4.175240064796526e-8);
      expect(new Float32Array(buffer13)[1]).assertEqual(-428967936);
    });

    /**
     * @tc.name   DataView15Test014
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(4);
      const dataView14 = new DataView(buffer14);
      dataView14.setFloat32(0, 42);
      expect(new Float32Array(buffer14)[0]).assertEqual(1.4441781973331565e-41);
    });

    /**
     * @tc.name   DataView15Test015
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(4);
      const dataView15 = new DataView(buffer15);
      dataView15.setFloat32(0, -1.2e-30);
      expect(new Float32Array(buffer15)[0]).assertEqual(1.1263452393025425e-30);
    });

    /**
     * @tc.name   DataView15Test016
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const dataView16 = new DataView(buffer16);
      dataView16.setFloat32(0, 6.022e23);
      expect(new Float32Array(buffer16)[0]).assertEqual(-7.715919578070961e-15);
    });

    /**
     * @tc.name   DataView15Test017
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(8);
      const dataView17 = new DataView(buffer17);
      dataView17.setFloat32(1, 1.5);
      expect(dataView17.getFloat32(1)).assertEqual(1.5);
    });

    /**
     * @tc.name   DataView15Test018
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(4);
      const dataView18 = new DataView(buffer18);
      dataView18.setFloat32(0, 2.0);
      const floatView = new Float32Array(buffer18);
      expect(floatView[0]).assertEqual(8.96831017167883e-44);
    });

    /**
     * @tc.name   DataView15Test019
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_1900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(4);
      const dataView19 = new DataView(buffer19);
      dataView19.setFloat32(0, 1.0);
      dataView19.setFloat32(0, 2.0);
      dataView19.setFloat32(0, 3.0);
      expect(new Float32Array(buffer19)[0]).assertEqual(2.304855714121459e-41);
    });

    /**
     * @tc.name   DataView15Test020
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const dataView20 = new DataView(buffer20);
      dataView20.setFloat32(0, 1.0, true);
      const bytes20 = new Uint8Array(buffer20);
      const expected20 = new Uint8Array(new Float32Array([1.0]).buffer);
      expect(bytes20[0]).assertEqual(expected20[0]);
      expect(bytes20[1]).assertEqual(expected20[1]);
      expect(bytes20[2]).assertEqual(expected20[2]);
      expect(bytes20[3]).assertEqual(expected20[3]);
    });

    /**
     * @tc.name   DataView15Test021
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(4);
      const dataView21 = new DataView(buffer21);
      dataView21.setFloat32(0, 1.0, false);
      const bytes21 = new Uint8Array(buffer21);
      const expected21 = new Uint8Array(new Float32Array([1.0]).buffer);
      expect(bytes21[0]).assertEqual(63);
      expect(bytes21[1]).assertEqual(128);
      expect(bytes21[2]).assertEqual(0);
      expect(bytes21[3]).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test022
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(4);
      const dataView22 = new DataView(buffer22);
      dataView22.setFloat32(0, -0);
      expect(1 / new Float32Array(buffer22)[0] === -Infinity).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test023
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(16);
      const dataView23 = new DataView(buffer23, 4, 8);
      dataView23.setFloat32(0, 5.5);
      expect(new Float32Array(buffer23, 4, 2)[0]).assertEqual(6.322658671033575e-41);
    });

    /**
     * @tc.name   DataView15Test024
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(8);
      const dataView24 = new DataView(buffer24, 0, 8);
      dataView24.setFloat32(4, 6.6);
      expect(new Float32Array(buffer24)[1]).assertEqual(4.1868815969792195e-8);
    });

    /**
     * @tc.name   DataView15Test025
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(4);
      const dataView25 = new DataView(buffer25);
      dataView25.setFloat32(0, Math.sqrt(2));
      expect(new Float32Array(buffer25)[0]).assertEqual(-1.0514210400987192e+31);
    });

    /**
     * @tc.name   DataView15Test026
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(4);
      const dataView26 = new DataView(buffer26);
      dataView26.setFloat32(0, 1.0 / 3.0);
      expect(new Float32Array(buffer26)[0]).assertEqual(-1.2126478207002966e-12);
    });

    /**
     * @tc.name   DataView15Test027
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(16);
      const dvA = new DataView(buffer27, 0, 8);
      const dvB = new DataView(buffer27, 8, 8);
      dvA.setFloat32(0, 10.0);
      dvB.setFloat32(0, 20.0);
      expect(new Float32Array(buffer27)[0]).assertEqual(1.1570521419930015e-41);
      expect(new Float32Array(buffer27)[2]).assertEqual(5.748826949892562e-41);
    });

    /**
     * @tc.name   DataView15Test028
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const dataView28 = new DataView(buffer28);
      const preciseValue = 1.0000001192092896;
      dataView28.setFloat32(0, preciseValue);
      expect(new Float32Array(buffer28)[0] > 1.0).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test029
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_2900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(12);
      const dataView29 = new DataView(buffer29);
      dataView29.setFloat32(0, 1.0);
      dataView29.setFloat32(4, 2.0);
      dataView29.setFloat32(8, 3.0);
      const arr29 = new Float32Array(buffer29);
      expect(arr29[0]).assertEqual(4.600602988224807e-41);
      expect(arr29[1]).assertEqual(8.96831017167883e-44);
      expect(arr29[2]).assertEqual(2.304855714121459e-41);
    });

    /**
     * @tc.name   DataView15Test030
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(4);
      const dataView30 = new DataView(buffer30);
      dataView30.setFloat32(0, -1.0, true);
      const uint32View = new Uint32Array(buffer30);
      expect((uint32View[0] >>> 31) & 1).assertEqual(1);
    });

    /**
     * @tc.name   DataView15Test031
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(4);
      const dataView31 = new DataView(buffer31);
      const value31 = 7.89;
      dataView31.setFloat32(0, value31);
      expect(dataView31.getFloat32(0)).assertEqual(7.889999866485596);
    });

    /**
     * @tc.name   DataView15Test032
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(4);
      const dataView32 = new DataView(buffer32);
      dataView32.setFloat32(0, 0);
      expect(dataView32.getFloat32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test033
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(4);
      const dataView33 = new DataView(buffer33);
      dataView33.setFloat32(0, 1e-37);
      expect(new Float32Array(buffer33)[0] > 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test034
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(4);
      const dataView34 = new DataView(buffer34);
      dataView34.setFloat32(0, parseFloat("123.45"));
      expect(new Float32Array(buffer34)[0]).assertEqual(5.453434729516787e+23);
    });

    /**
     * @tc.name   DataView15Test035
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(4);
      const dataView35 = new DataView(buffer35);
      dataView35.setFloat32(0, 42.42);
      expect(new Float32Array(buffer35)[0]).assertEqual(1.758578341874047e-26);
    });

    /**
     * @tc.name   DataView15Test036
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(4);
      const dataView36 = new DataView(buffer36);
      dataView36.setFloat32(0, 16.0);
      expect(new Float32Array(buffer36)[0]).assertEqual(4.600883247917672e-41);
    });

    /**
     * @tc.name   DataView15Test037
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(8);
      const dataView37 = new DataView(buffer37);
      dataView37.setFloat32(4, 100.5, true);
      expect(dataView37.getFloat32(4, true)).assertEqual(100.5);
    });

    /**
     * @tc.name   DataView15Test038
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(4);
      const dataView38 = new DataView(buffer38);
      dataView38.setFloat32(0, -9.81e-3);
      expect(new Float32Array(buffer38)[0]).assertEqual(7.882821857537801e-20);
    });

    /**
     * @tc.name   DataView15Test039
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_3900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(32);
      const dataView39 = new DataView(buffer39);
      dataView39.setFloat32(12, 3.1415926);
      expect(new Float32Array(buffer39, 12, 1)[0]).assertEqual(-10082865224089600);
    });

    /**
     * @tc.name   DataView15Test040
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(4);
      const dataView40 = new DataView(buffer40);
      dataView40.setFloat32(0, NaN);
      expect(isNaN(dataView40.getFloat32(0))).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test042
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(4);
      const dataView42 = new DataView(buffer42);
      dataView42.setFloat32(0, 123.456, false);
      const bytes42 = new Uint8Array(buffer42);
      const expectedBytes42 = new Uint8Array(new Float32Array([123.456]).buffer);
      expect(bytes42[0]).assertEqual(66);
      expect(bytes42[1]).assertEqual(246);
      expect(bytes42[2]).assertEqual(233);
      expect(bytes42[3]).assertEqual(121);
    });

    /**
     * @tc.name   DataView15Test043
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const dataView43 = new DataView(buffer43);
      dataView43.setFloat32(0, Infinity);
      expect(dataView43.getFloat32(0) === Infinity).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test044
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(4);
      const dataView44 = new DataView(buffer44);
      dataView44.setFloat32(0, -Infinity);
      expect(dataView44.getFloat32(0) === -Infinity).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test045
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(4);
      const dataView45 = new DataView(buffer45);
      dataView45.setFloat32(0, 1.17549435e-38);
      expect(new Float32Array(buffer45)[0]).assertEqual(4.591774807899561e-41);
    });

    /**
     * @tc.name   DataView15Test046
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const dataView46 = new DataView(buffer46);
      dataView46.setFloat32(0, 1.5, true);
      const byteLow46 = new Uint8Array(buffer46)[0];
      const expectedLow46 = new Uint8Array(new Float32Array([1.5]).buffer)[0];
      expect(byteLow46).assertEqual(expectedLow46);
    });

    /**
     * @tc.name   DataView15Test047
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(4);
      const dataView47 = new DataView(buffer47);
      dataView47.setFloat32(0, Math.sin(Math.PI / 4));
      expect(new Float32Array(buffer47)[0]).assertEqual(-1.047459631973006e+31);
    });

    /**
     * @tc.name   DataView15Test048
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(4);
      const dataView48 = new DataView(buffer48, 0, 4);
      dataView48.setFloat32(0, 7.0);
      expect(new Float32Array(buffer48)[0]).assertEqual(8.04457422399591e-41);
    });

    /**
     * @tc.name   DataView15Test049
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_4900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(4);
      const dataView49 = new DataView(buffer49);
      dataView49.setFloat32(0, 0, true);
      const bytes49 = new Uint8Array(buffer49);
      expect(bytes49[0]).assertEqual(0);
      expect(bytes49[1]).assertEqual(0);
      expect(bytes49[2]).assertEqual(0);
      expect(bytes49[3]).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test050
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(4);
      const dataView50 = new DataView(buffer50);
      dataView50.setFloat32(0, -0.001);
      expect(dataView50.getFloat32(0)).assertEqual(-0.0010000000474974513);
    });

    /**
     * @tc.name   DataView15Test051
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(16);
      const dvA51 = new DataView(buffer51, 0, 8);
      const dvB51 = new DataView(buffer51, 4, 8);
      dvA51.setFloat32(0, 1.0);
      dvB51.setFloat32(0, 2.0);
      expect(dvA51.getFloat32(0)).assertEqual(1);
      expect(dvB51.getFloat32(0)).assertEqual(2);
      expect(new Float32Array(buffer51)[1]).assertEqual(8.96831017167883e-44);
    });

    /**
     * @tc.name   DataView15Test052
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(4);
      const dataView52 = new DataView(buffer52);
      dataView52.setFloat32(0, -1e-40);
      expect(new Float32Array(buffer52)[0] < 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test053
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(4);
      const dataView53 = new DataView(buffer53);
      dataView53.setFloat32(0, 9.99);
      const directRead = new Float32Array(buffer53)[0];
      const viewRead = dataView53.getFloat32(0);
      expect(directRead).assertEqual(2.0715503315038947e-32);

    });

    /**
     * @tc.name   DataView15Test054
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(4);
      const dataView54 = new DataView(buffer54);
      dataView54.setFloat32(0, 1000);
      expect(new Float32Array(buffer54)[0]).assertEqual(4.3860641933366774e-41);
    });

    /**
     * @tc.name   DataView15Test055
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(4);
      const dataView55 = new DataView(buffer55);
      dataView55.setFloat32(0, 55.55, undefined);
      expect(new Float32Array(buffer55)[0]).assertEqual(4.176241219511212e-8);
    });

    /**
     * @tc.name   DataView15Test056
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(4);
      const dataView56 = new DataView(buffer56);
      dataView56.setFloat32(0, 56.56, false);
      expect(new Float32Array(buffer56)[0]).assertEqual(9.377832522039091e+29);
    });

    /**
     * @tc.name   DataView15Test057
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(4);
      const dataView57 = new DataView(buffer57);
      dataView57.setFloat32(0, 0.33333333);
      expect(new Float32Array(buffer57)[0]).assertEqual(-1.2126478207002966e-12);
    });

    /**
     * @tc.name   DataView15Test058
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(12);
      const dataView58 = new DataView(buffer58);
      dataView58.setUint32(0, 0xABCDEF00, true);
      dataView58.setFloat32(4, 1.23, true);
      dataView58.setUint16(8, 0xABCD, true);
      expect(dataView58.getFloat32(4, true)).assertEqual(1.2300000190734863);
    });

    /**
     * @tc.name   DataView15Test059
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_5900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(4);
      const dataView59 = new DataView(buffer59);
      const valueToWrite = 59.59;
      dataView59.setFloat32(0, valueToWrite);
      expect(new Float32Array(buffer59)[0]).assertEqual(4.894544649138369e-14);
    });

    /**
     * @tc.name   DataView15Test060
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(4);
      const dataView60 = new DataView(buffer60);
      for (let i = 0; i < 100; i++) {
        dataView60.setFloat32(0, i * 0.1);
      }
      expect(new Float32Array(buffer60)[0]).assertEqual(2.7167559428146054e+23);
    });

    /**
     * @tc.name   DataView15Test061
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(4);
      const dataView61 = new DataView(buffer61);
      const exactValue = 16777217;
      dataView61.setFloat32(0, exactValue);
      expect(new Float32Array(buffer61)[0] > 16777216).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test062
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(10);
      const dataView62 = new DataView(buffer62, 4, 4);
      dataView62.setFloat32(0, 62.62, true);
      expect(new Float32Array(buffer62, 4, 1)[0]).assertEqual(62.619998931884766);
    });
    /**
     * @tc.name   DataView15Test063
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const dataView63 = new DataView(buffer63);
      dataView63.setFloat32(0, -1024);
      expect(new Float32Array(buffer63)[0]).assertEqual(4.619240257800327e-41);
    });

    /**
     * @tc.name   DataView15Test064
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(4);
      const dataView64 = new DataView(buffer64);
      dataView64.setFloat32(0, 64.64);
      const expected64 = new Float32Array([64.64]);
      const actual64 = new Float32Array(buffer64);
      expect(actual64[0]).assertEqual(-4.5362165412843325e-11);
    });

    /**
     * @tc.name   DataView15Test065
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(4);
      const dataView65 = new DataView(buffer65);
      dataView65.setFloat32(0, 0.1 + 0.2);
      expect(new Float32Array(buffer65)[0]).assertEqual(-6.352689296680118e-23);
    });

    /**
     * @tc.name   DataView15Test066
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(4);
      const dataView66 = new DataView(buffer66);
      dataView66.setFloat32(0, -0, true);
      const uintView66 = new Uint32Array(buffer66);
      expect(uintView66[0] >>> 31).assertEqual(1);
    });

    /**
     * @tc.name   DataView15Test067
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(8);
      const dataView67 = new DataView(buffer67, 0, 8);
      dataView67.setFloat32(4, 67.67);
      expect(dataView67.getFloat32(4)).assertEqual(67.66999816894531);
    });

    /**
     * @tc.name   DataView15Test068
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(4);
      const dataView68 = new DataView(buffer68);
      dataView68.setFloat32(0, 1e+38);
      expect(new Float32Array(buffer68)[0]).assertEqual(-1.2748293573237345e-23);
    });

    /**
     * @tc.name   DataView15Test069
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_6900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(16);
      const dvA69 = new DataView(buffer69, 0, 4);
      const dvB69 = new DataView(buffer69, 4, 4);
      const dvC69 = new DataView(buffer69, 8, 8);
      dvA69.setFloat32(0, 1.0);
      dvB69.setFloat32(0, 2.0);
      dvC69.setFloat32(0, 3.0);
      expect(new Float32Array(buffer69)[0]).assertEqual(4.600602988224807e-41);
      expect(new Float32Array(buffer69)[1]).assertEqual(8.96831017167883e-44);
      expect(new Float32Array(buffer69)[2]).assertEqual(2.304855714121459e-41);
    });

    /**
     * @tc.name   DataView15Test070
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(4);
      const dataView70 = new DataView(buffer70);
      dataView70.setFloat32(0, Math.PI * 2);
      expect(new Float32Array(buffer70)[0]).assertEqual(-40472198384713730);
    });

    /**
     * @tc.name   DataView15Test071
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(4);
      const dataView71 = new DataView(buffer71);
      dataView71.setFloat32(0, 100.0, true);
      const bytes71 = new Uint8Array(buffer71);
      const expectedBytes71 = new Uint8Array(new Float32Array([100.0]).buffer);
      expect(bytes71[0]).assertEqual(expectedBytes71[0]);
    });

    /**
     * @tc.name   DataView15Test072
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(4);
      const dataView72 = new DataView(buffer72);
      dataView72.setFloat32(0, -500);
      expect(dataView72.getFloat32(0)).assertEqual(-500);
    });

    /**
     * @tc.name   DataView15Test073
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(7);
      const dataView73 = new DataView(buffer73);
      dataView73.setFloat32(3, 73.73);
      expect(dataView73.getFloat32(3)).assertEqual(73.7300033569336);
    });

    /**
     * @tc.name   DataView15Test074
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(4);
      const dataView74 = new DataView(buffer74);
      dataView74.setFloat32(0, 1.23456789);
      expect(new Float32Array(buffer74)[0]).assertEqual(144545136640);
    });

    /**
     * @tc.name   DataView15Test075
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(4);
      const dataView75 = new DataView(buffer75);
      dataView75.setFloat32(0, 200.0, false);
      const bytes75 = new Uint8Array(buffer75);
      const expectedBytes75 = new Uint8Array(new Float32Array([200.0]).buffer);
      expect(bytes75[3]).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test076
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(4);
      const dataView76 = new DataView(buffer76);
      dataView76.setFloat32(0, 2.5 * 4.0);
      expect(new Float32Array(buffer76)[0]).assertEqual(1.1570521419930015e-41);
    });

    /**
     * @tc.name   DataView15Test077
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(12);
      const dvA77 = new DataView(buffer77, 0, 8);
      const dvB77 = new DataView(buffer77, 8, 4);
      dvA77.setFloat32(4, 77.77);
      expect(dvA77.getFloat32(4)).assertEqual(77.7699966430664);
    });

    /**
     * @tc.name   DataView15Test078
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(4);
      const dataView78 = new DataView(buffer78);
      dataView78.setFloat32(0, NaN);
      expect(isNaN(dataView78.getFloat32(0))).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test079
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_7900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(4);
      const dataView79 = new DataView(buffer79);
      dataView79.setFloat32(0, Infinity);
      const uint79 = new Uint32Array(buffer79)[0];
      const infinityBits = 0x7F800000;
      expect(uint79).assertEqual(32895);
    });

    /**
     * @tc.name   DataView15Test080
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(4);
      const dataView80 = new DataView(buffer80);
      dataView80.setFloat32(0, -Infinity);
      const uint80 = new Uint32Array(buffer80)[0];
      const negInfinityBits = 0xFF800000;
      expect(uint80).assertEqual(33023);
    });

    /**
     * @tc.name   DataView15Test081
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(4);
      const dataView81 = new DataView(buffer81);
      dataView81.setFloat32(0, 1.0e-40);
      const result81 = new Float32Array(buffer81)[0];
      expect(result81 >= 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test082
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(4);
      const dataView82 = new DataView(buffer82);
      dataView82.setFloat32(0, 300, true);
      expect(new Float32Array(buffer82)[0]).assertEqual(300);
    });

    /**
     * @tc.name   DataView15Test083
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(10);
      const dataView83 = new DataView(buffer83, 4, 6);
      dataView83.setFloat32(0, 83.83);
      expect(new Float32Array(buffer83, 4, 1)[0]).assertEqual(-1.7103481712820055e+33);
    });

    /**
     * @tc.name   DataView15Test084
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(4);
      const dataView84 = new DataView(buffer84);
      dataView84.setFloat32(0, 1.0 / 7.0);
      expect(new Float32Array(buffer84)[0]).assertEqual(1.7440151627103908e-16);
    });

    /**
     * @tc.name   DataView15Test085
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(4);
      const dataView85 = new DataView(buffer85);
      const val85 = 85.85;
      for (let i = 0; i < 5; i++) {
        dataView85.setFloat32(0, val85);
      }
      expect(new Float32Array(buffer85)[0]).assertEqual(8.366488657429727e-8);
    });

    /**
     * @tc.name   DataView15Test086
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(4);
      const dataView86 = new DataView(buffer86);
      dataView86.setFloat32(0, -1.7e+38);
      expect(new Float32Array(buffer86)[0]).assertEqual(-2.1387578686996816e-20);
    });

    /**
     * @tc.name   DataView15Test087
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(4);
      const dataView87 = new DataView(buffer87);
      dataView87.setFloat32(0, 87.87);
      expect(dataView87.getFloat32(0)).assertEqual(87.87000274658203);
    });

    /**
     * @tc.name   DataView15Test088
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(4);
      const dataView88 = new DataView(buffer88);
      dataView88.setFloat32(0, 88.88);
      expect(new Float32Array(buffer88)[0]).assertEqual(-1.9198154177403602e-29);
    });

    /**
     * @tc.name   DataView15Test089
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_8900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(4);
      const dataView89 = new DataView(buffer89);
      dataView89.setFloat32(0, Math.max(1.5, 2.3, 0.8));
      expect(new Float32Array(buffer89)[0]).assertEqual(4.169419298705179e-8);

    });

    /**
     * @tc.name   DataView15Test090
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(4);
      const dataView90 = new DataView(buffer90, 0, 4);
      dataView90.setFloat32(0, 90.90);
      expect(dataView90.getFloat32(0)).assertEqual(90.9000015258789);
    });

    /**
     * @tc.name   DataView15Test091
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(4);
      const dataView91 = new DataView(buffer91);
      dataView91.setFloat32(0, -91.91);
      expect(new Float32Array(buffer91)[0]).assertEqual(-2.0282661442733835e+27);
    });

    /**
     * @tc.name   DataView15Test092
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(4);
      const dataView92 = new DataView(buffer92);
      dataView92.setFloat32(0, 257, true);
      const lowByte92 = new Uint8Array(buffer92)[0];
      expect(lowByte92).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test093
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(4);
      const dataView93 = new DataView(buffer93);
      dataView93.setFloat32(0, parseFloat("93" + ".93"));
      expect(new Float32Array(buffer93)[0]).assertEqual(9.802446669041759e-14);
    });

    /**
     * @tc.name   DataView15Test094
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(4);
      const dataView94 = new DataView(buffer94);
      dataView94.setFloat32(0, 94.94);
      const bytes94 = new Uint8Array(buffer94);
      expect(bytes94[0] === 0 && bytes94[1] === 0 && bytes94[2] === 0 && bytes94[3] === 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test096
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(4);
      const dataView96 = new DataView(buffer96);
      let x = 10, y = 2.5;
      dataView96.setFloat32(0, x * y + 1);
      expect(new Float32Array(buffer96)[0]).assertEqual(7.470742502854897e-41);
    });

    /**
     * @tc.name   DataView15Test098
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(4);
      const dataView98 = new DataView(buffer98);
      dataView98.setFloat32(0, -64.0);
      expect(new Float32Array(buffer98)[0]).assertEqual(4.618959998107462e-41);
    });

    /**
     * @tc.name   DataView15Test099
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_9900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(20);
      const dataView99 = new DataView(buffer99, 4, 10);
      dataView99.setFloat32(0, 99.99);
      expect(new Float32Array(buffer99, 4, 1)[0]).assertEqual(-578255507123674800000);
    });

    /**
     * @tc.name   DataView15Test100
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(4);
      const dataView100 = new DataView(buffer100);
      dataView100.setFloat32(0, Math.round(100.49));
      expect(new Float32Array(buffer100)[0]).assertEqual(7.183896707207607e-41);
    });

    /**
     * @tc.name   DataView15Test101
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(4);
      const dataView101 = new DataView(buffer101);
      dataView101.setFloat32(0, 101.101, true);
      const bytes101 = new Uint8Array(buffer101);
      const expectedBytes101 = new Uint8Array(new Float32Array([101.101]).buffer);
      expect(bytes101[3]).assertEqual(expectedBytes101[3]);
    });

    /**
     * @tc.name   DataView15Test102
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(4);
      const dataView102 = new DataView(buffer102);
      dataView102.setFloat32(0, -3.3e+38);
      expect(new Float32Array(buffer102)[0]).assertEqual(-7.111253252922722e-10);
    });

    /**
     * @tc.name   DataView15Test103
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(4);
      const dataView103 = new DataView(buffer103, 0, 4);
      dataView103.setFloat32(0, 103.103);
      expect(dataView103.getFloat32(0)).assertEqual(103.10299682617188);
    });

    /**
     * @tc.name   DataView15Test104
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(4);
      const dataView104 = new DataView(buffer104);
      dataView104.setFloat32(0, 1.0 * 0.1 + 2.0 * 0.2);
      expect(new Float32Array(buffer104)[0]).assertEqual(8.828180325246348e-44);
    });

    /**
     * @tc.name   DataView15Test105
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(4);
      const dataView105 = new DataView(buffer105);
      const value105 = 105.105;
      dataView105.setFloat32(0, value105);
      expect(dataView105.getFloat32(0)).assertEqual(105.1050033569336);
    });

    /**
     * @tc.name   DataView15Test106
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(4);
      const dataView106 = new DataView(buffer106);
      dataView106.setFloat32(0, 0, false);
      const bytes106 = new Uint8Array(buffer106);
      expect(bytes106[0]).assertEqual(0);
      expect(bytes106[1]).assertEqual(0);
      expect(bytes106[2]).assertEqual(0);
      expect(bytes106[3]).assertEqual(0);
    });

    /**
     * @tc.name   DataView15Test107
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(4);
      const dataView107 = new DataView(buffer107);
      dataView107.setFloat32(0, Math.pow(2, 8));
      expect(new Float32Array(buffer107)[0]).assertEqual(4.601163507610537e-41);
    });

    /**
     * @tc.name   DataView15Test108
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(12);
      const dvA108 = new DataView(buffer108, 0, 4);
      const dvB108 = new DataView(buffer108, 4, 4);
      const dvC108 = new DataView(buffer108, 8, 4);
      dvA108.setFloat32(0, 108.1);
      dvB108.setFloat32(0, 108.2);
      dvC108.setFloat32(0, 108.3);
      expect(dvA108.getFloat32(0)).assertEqual(108.0999984741211);
      expect(dvB108.getFloat32(0)).assertEqual(108.19999694824219);
      expect(dvC108.getFloat32(0)).assertEqual(108.30000305175781);
    });

    /**
     * @tc.name   DataView15Test109
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_10900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(4);
      const dataView109 = new DataView(buffer109);
      dataView109.setFloat32(0, 0.999999);
      expect(new Float32Array(buffer109)[0]).assertEqual(-1.5814501718524494e+29);
    });

    /**
     * @tc.name   DataView15Test110
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(4);
      const dataView110 = new DataView(buffer110);
      dataView110.setFloat32(0, 65535, true);
      const bytes110 = new Uint8Array(buffer110);
      const expected110 = [0, 255, 127, 71];
      expect(bytes110[0]).assertEqual(expected110[0]);
      expect(bytes110[1]).assertEqual(expected110[1]);
      expect(bytes110[2]).assertEqual(expected110[2]);
      expect(bytes110[3]).assertEqual(expected110[3]);
    });

    /**
     * @tc.name   DataView15Test111
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(4);
      const dataView111 = new DataView(buffer111);
      dataView111.setFloat32(0, -0.111);
      expect(new Float32Array(buffer111)[0]).assertEqual(-1.7190526847712387e+34);
    });

    /**
     * @tc.name   DataView15Test112
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(12);
      const dataView112 = new DataView(buffer112, 4, 8);
      dataView112.setFloat32(0, 112.112);
      expect(new Float32Array(buffer112, 4, 1)[0]).assertEqual(817491324436480);
    });

    /**
     * @tc.name   DataView15Test113
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(4);
      const dataView113 = new DataView(buffer113);
      dataView113.setFloat32(0, 2.0 - 0.5);
      expect(new Float32Array(buffer113)[0]).assertEqual(6.896490392174587e-41);
    });

    /**
     * @tc.name   DataView15Test114
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(4);
      const dataView114 = new DataView(buffer114);
      dataView114.setFloat32(0, NaN);
      const uint114 = new Uint32Array(buffer114)[0];
      expect(uint114 > 0x7F800000 && uint114 < 0xFF800000).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test115
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const dataView115 = new DataView(buffer115);
      dataView115.setFloat32(0, 1.0e-40);
      const result115 = new Float32Array(buffer115)[0];
      expect(result115 >= 0 && result115 <= 1.175e-38).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test117
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(4);
      const dataView117 = new DataView(buffer117);
      dataView117.setFloat32(0, parseFloat("1.17e3"));
      expect(new Float32Array(buffer117)[0]).assertEqual(5.929941973809616e-39);

    });

    /**
     * @tc.name   DataView15Test118
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(4);
      const dataView118 = new DataView(buffer118);
      const fixedValue118 = 118.118;
      for (let i = 0; i < 10; i++) {
        dataView118.setFloat32(0, fixedValue118);
      }
      expect(new Float32Array(buffer118)[0]).assertEqual(5.70984375156541e+25);
    });

    /**
     * @tc.name   DataView15Test119
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_11900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const dataView119 = new DataView(buffer119);
      dataView119.setFloat32(0, 4.0);
      expect(new Float32Array(buffer119)[0]).assertEqual(4.600743118071239e-41);
    });

    /**
     * @tc.name   DataView15Test120
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(4);
      const dataView120 = new DataView(buffer120);
      dataView120.setFloat32(0, -120, true);
      const uint120 = new Uint32Array(buffer120)[0];
      expect((uint120 >>> 31) & 1).assertEqual(1);
    });

    /**
     * @tc.name   DataView15Test121
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(4);
      const dataView121 = new DataView(buffer121);
      dataView121.setFloat32(0, Math.min(121.1, 121.2, 121.0));
      expect(new Float32Array(buffer121)[0]).assertEqual(8.690572816049651e-41);
    });

    /**
     * @tc.name   DataView15Test122
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(4);
      const dataView122 = new DataView(buffer122, 0, 4);
      dataView122.setFloat32(0, 122.122);
      expect(dataView122.getFloat32(0)).assertEqual(122.12200164794922);
    });

    /**
     * @tc.name   DataView15Test123
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(4);
      const dataView123 = new DataView(buffer123);
      dataView123.setFloat32(0, 123.456);
      expect(new Float32Array(buffer123)[0]).assertEqual(1.5184998373247989e+35);
    });

    /**
     * @tc.name   DataView15Test125
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(4);
      const dataView125 = new DataView(buffer125);
      dataView125.setFloat32(0, -125.125);
      expect(dataView125.getFloat32(0)).assertEqual(-125.125);
    });

    /**
     * @tc.name   DataView15Test126
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(8);
      const dataView126 = new DataView(buffer126);
      dataView126.setInt32(0, 0xDEADBEEF, true);
      dataView126.setFloat32(4, 126.126, true);
      expect(dataView126.getFloat32(4, true)).assertEqual(126.1259994506836);
    });

    /**
     * @tc.name   DataView15Test127
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(4);
      const dataView127 = new DataView(buffer127);
      const base = 100, offset = 27.127;
      dataView127.setFloat32(0, base + offset);
      expect(new Float32Array(buffer127)[0]).assertEqual(3.64860646922961e-35);
    });

    /**
     * @tc.name   DataView15Test128
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const dataView128 = new DataView(buffer128);
      dataView128.setFloat32(0, 3.40282347e+38, true);
      expect(new Float32Array(buffer128)[0]).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.name   DataView15Test129
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_12900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(4);
      const dataView129 = new DataView(buffer129);
      dataView129.setFloat32(0, 1e-45);
      expect(new Float32Array(buffer129)[0] > 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test130
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(16);
      const dataView130 = new DataView(buffer130, 4, 8);
      dataView130.setFloat32(4, 130.130);
      expect(dataView130.getFloat32(4)).assertEqual(130.1300048828125);
    });

    /**
     * @tc.name   DataView15Test131
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(4);
      const dataView131 = new DataView(buffer131);
      dataView131.setFloat32(0, Math.ceil(130.1));
      expect(new Float32Array(buffer131)[0]).assertEqual(1.1700842177112223e-42);
    });

    /**
     * @tc.name   DataView15Test132
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const dvLittle132 = new DataView(buffer132);
      const dvBig132 = new DataView(buffer132);
      const value132 = 132.132;

      dvLittle132.setFloat32(0, value132, true);
      const littleBytes = new Uint8Array(buffer132).slice();

      dvBig132.setFloat32(0, value132, false);
      const bigBytes = new Uint8Array(buffer132);

      expect(littleBytes[0]).assertEqual(bigBytes[3]);
      expect(littleBytes[1]).assertEqual(bigBytes[2]);
      expect(littleBytes[2]).assertEqual(bigBytes[1]);
      expect(littleBytes[3]).assertEqual(bigBytes[0]);
    });

    /**
     * @tc.name   DataView15Test133
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(4);
      const dataView133 = new DataView(buffer133);
      dataView133.setFloat32(0, -1.17549435e-38);
      expect(new Float32Array(buffer133)[0]).assertEqual(4.609711428242918e-41);
    });

    /**
     * @tc.name   DataView15Test134
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(4);
      const dataView134 = new DataView(buffer134, 0, 4);
      dataView134.setFloat32(0, 134.134);
      expect(dataView134.getFloat32(0)).assertEqual(134.13400268554688);
    });

    /**
     * @tc.name   DataView15Test135
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(4);
      const dataView135 = new DataView(buffer135);
      const angle = Math.PI / 6;
      dataView135.setFloat32(0, Math.pow(Math.sin(angle), 2) + Math.pow(Math.cos(angle), 2));
      expect(Math.abs(new Float32Array(buffer135)[0] - 1.0) < 1e-6).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test136
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(4);
      const dataView136 = new DataView(buffer136);
      dataView136.setFloat32(0, 136.136);
      expect(buffer136.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView15Test137
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const dataView137 = new DataView(buffer137);
      dataView137.setFloat32(0, 65536, false);
      const bytes137 = new Uint8Array(buffer137);
      expect(bytes137[0]).assertEqual(71);
    });

    /**
     * @tc.name   DataView15Test138
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(8);
      const dvA138 = new DataView(buffer138, 0, 8);
      const dvB138 = new DataView(buffer138, 4, 4);
      dvA138.setFloat32(0, 1.0);
      dvA138.setFloat32(4, 2.0);
      expect(dvB138.getFloat32(0)).assertEqual(2.0);
    });

    /**
     * @tc.name   DataView15Test139
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_13900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(4);
      const dataView139 = new DataView(buffer139);
      const flag = true;
      dataView139.setFloat32(0, flag ? 139.139 : 0);
      expect(new Float32Array(buffer139)[0]).assertEqual(-1.317058871308394e-25);
    });

    /**
     * @tc.name   DataView15Test140
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(4);
      const dataView140 = new DataView(buffer140);
      dataView140.setFloat32(0, -0.5, true);
      const lowByte140 = new Uint8Array(buffer140)[0];
      const expectedLow140 = new Uint8Array(new Float32Array([-0.5]).buffer)[0];
      expect(lowByte140).assertEqual(expectedLow140);
    });

    /**
     * @tc.name   DataView15Test141
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14100
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(4);
      const dataView141 = new DataView(buffer141);
      dataView141.setFloat32(0, 0.125);
      expect(new Float32Array(buffer141)[0]).assertEqual(8.688050478813866e-44);
    });

    /**
     * @tc.name   DataView15Test142
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14200
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(16);
      const dataView142 = new DataView(buffer142, 8, 8);
      dataView142.setFloat32(0, 142.142);
      expect(new Float32Array(buffer142, 8, 1)[0]).assertEqual(11544394276536320);
    });

    /**
     * @tc.name   DataView15Test143
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14300
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(4);
      const dataView143 = new DataView(buffer143);
      const num = 143;
      dataView143.setFloat32(0, parseFloat(`${num}.143`));
      expect(new Float32Array(buffer143)[0]).assertEqual(-5.428277349264149e-22);
    });

    /**
     * @tc.name   DataView15Test144
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14400
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(4);
      const dataView144 = new DataView(buffer144);
      dataView144.setFloat32(0, Infinity);
      const finiteValue = new Float32Array([1e30])[0];
      expect(dataView144.getFloat32(0) > finiteValue).assertEqual(true);
    });

    /**
     * @tc.name   DataView15Test145
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14500
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(4);
      const dataView145 = new DataView(buffer145);
      dataView145.setFloat32(0, -1.0e-40);
      const result145 = new Float32Array(buffer145)[0];
      expect(result145 < 0 && result145 >= -1.175e-38).assertEqual(false);
    });

    /**
     * @tc.name   DataView15Test146
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14600
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(4);
      const dataView146 = new DataView(buffer146);
      dataView146.setFloat32(0, 146.146);
      expect(dataView146.getFloat32(0)).assertEqual(146.14599609375);
    });

    /**
     * @tc.name   DataView15Test147
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14700
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(4);
      const dataView147 = new DataView(buffer147);
      const condition = 2 > 1;
      dataView147.setFloat32(0, condition ? 147.147 : -147.147);
      expect(new Float32Array(buffer147)[0]).assertEqual(-2.2371866876514776e-18);
    });

    /**
     * @tc.name   DataView15Test148
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14800
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(4);
      const dataView148 = new DataView(buffer148);
      for (let i = 0; i < 10; i++) {
        dataView148.setFloat32(0, i % 2 === 0 ? 148.0 : 148.1);
      }
      expect(new Float32Array(buffer148)[0]).assertEqual(-3.1656025716214834e-23);
    });

    /**
     * @tc.name   DataView15Test149
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_14900
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(4);
      const dataView149 = new DataView(buffer149);
      dataView149.setFloat32(0, 0xABCDEF);
      expect(new Float32Array(buffer149)[0]).assertEqual(-1.2699353000221077e+29);
    });

    /**
     * @tc.name   DataView15Test150
     * @tc.number SUB_BUILTINS_DATAVIEW15_TEST_15000
     * @tc.desc   test DataView setFloat32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView15Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(4);
      const dataView150 = new DataView(buffer150);
      const value150 = 150.150;
      dataView150.setFloat32(0, value150, true);
      const uint150 = new Uint32Array(buffer150)[0];
      const expectedUint150 = new Uint32Array(new Float32Array([value150]).buffer)[0];
      expect(uint150).assertEqual(expectedUint150);
    });

  })
}
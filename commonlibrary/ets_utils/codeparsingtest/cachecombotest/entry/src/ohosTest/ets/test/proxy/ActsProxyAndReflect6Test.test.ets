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
import {
  test1,
  test10,
  test100,
  test101,
  test102,
  test103,
  test108,
  test109,
  test11,
  test12,
  test13,
  test14,
  test16,
  test17,
  test18,
  test19,
  test2,
  test20,
  test21,
  test22,
  test23,
  test24,
  test25,
  test26,
  test27,
  test28,
  test29,
  test3,
  test30,
  test31,
  test32,
  test33,
  test34,
  test35,
  test36,
  test37,
  test38,
  test39,
  test4,
  test40,
  test42,
  test43,
  test44,
  test45,
  test46,
  test47,
  test48,
  test49,
  test5,
  test50,
  test51,
  test52,
  test53,
  test54,
  test55,
  test56,
  test57,
  test58,
  test59,
  test6,
  test60,
  test61,
  test62,
  test63,
  test64,
  test65,
  test66,
  test67,
  test68,
  test69,
  test7,
  test70,
  test71,
  test74,
  test75,
  test76,
  test77,
  test78,
  test8,
  test84,
  test85,
  test86,
  test87,
  test88,
  test89,
  test9,
  test91,
  test92,
  test93,
  test95,
  test96,
  test98,
  test99
} from './ActsProxyAndReflect6Test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflect6Test() {
  describe('actsProxyAndReflect6Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testCacheProxyReflectTarget_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test1();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test3();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test4();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test5();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test6();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test7();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test8();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_0900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test9();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test10();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test11();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test12();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test13();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test14();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test16();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test17();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test18();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_1900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test19();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test20();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test21();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test22();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test23();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test24();
      expect(result).assertEqual(true);
    })



    /**
     * @tc.name   testCacheProxyReflectTarget_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test26();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test27();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test28();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_2900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test29();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test30();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test31();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test32();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test33();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test34();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test35();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test36();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test37();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test38();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_3900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test39();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test40();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test42();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test43();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test44();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test45();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test46();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test47();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test48();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_4900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test49();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test50();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test51();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test52();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test53();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test54();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test55();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test56();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test57();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test58();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_5900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test59();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test60();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test61();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test62();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test63();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test64();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test65();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test66();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test67();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test68();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_069
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_6900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test69();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test70();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test71();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test74();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test75();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test76();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test77();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_7800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test78();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8400
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test84();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test85();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test86();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8700
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test87();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test88();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_8900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test89();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test91();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test92();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test93();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9500
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test95();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9600
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test96();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test98();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_9900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test99();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10000
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test100();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10100
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test101();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_102
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10200
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test102();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10300
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test103();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10800
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test108();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyReflectTarget_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYREFLECTTARGET_10900
     * @tc.desc   Test proxy as a combination scenario of Reflect target and Reflect.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyReflectTarget_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test109();
      expect(result).assertEqual(true);
    })
  })
}
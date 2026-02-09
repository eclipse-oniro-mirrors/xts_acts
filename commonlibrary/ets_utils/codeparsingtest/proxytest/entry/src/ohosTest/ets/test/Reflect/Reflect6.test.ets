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
  test_getOwnPropertyDescriptor_1,
  test_getOwnPropertyDescriptor_10,
  test_getOwnPropertyDescriptor_100,
  test_getOwnPropertyDescriptor_101,
  test_getOwnPropertyDescriptor_102,
  test_getOwnPropertyDescriptor_103,
  test_getOwnPropertyDescriptor_104,
  test_getOwnPropertyDescriptor_105,
  test_getOwnPropertyDescriptor_106,
  test_getOwnPropertyDescriptor_108,
  test_getOwnPropertyDescriptor_109,
  test_getOwnPropertyDescriptor_11,
  test_getOwnPropertyDescriptor_110,
  test_getOwnPropertyDescriptor_112,
  test_getOwnPropertyDescriptor_113,
  test_getOwnPropertyDescriptor_114,
  test_getOwnPropertyDescriptor_115,
  test_getOwnPropertyDescriptor_116,
  test_getOwnPropertyDescriptor_117,
  test_getOwnPropertyDescriptor_118,
  test_getOwnPropertyDescriptor_119,
  test_getOwnPropertyDescriptor_12,
  test_getOwnPropertyDescriptor_120,
  test_getOwnPropertyDescriptor_121,
  test_getOwnPropertyDescriptor_122,
  test_getOwnPropertyDescriptor_123,
  test_getOwnPropertyDescriptor_124,
  test_getOwnPropertyDescriptor_125,
  test_getOwnPropertyDescriptor_126,
  test_getOwnPropertyDescriptor_127,
  test_getOwnPropertyDescriptor_128,
  test_getOwnPropertyDescriptor_129,
  test_getOwnPropertyDescriptor_13,
  test_getOwnPropertyDescriptor_130,
  test_getOwnPropertyDescriptor_131,
  test_getOwnPropertyDescriptor_132,
  test_getOwnPropertyDescriptor_133,
  test_getOwnPropertyDescriptor_134,
  test_getOwnPropertyDescriptor_135,
  test_getOwnPropertyDescriptor_136,
  test_getOwnPropertyDescriptor_137,
  test_getOwnPropertyDescriptor_138,
  test_getOwnPropertyDescriptor_139,
  test_getOwnPropertyDescriptor_14,
  test_getOwnPropertyDescriptor_140,
  test_getOwnPropertyDescriptor_141,
  test_getOwnPropertyDescriptor_142,
  test_getOwnPropertyDescriptor_143,
  test_getOwnPropertyDescriptor_144,
  test_getOwnPropertyDescriptor_145,
  test_getOwnPropertyDescriptor_146,
  test_getOwnPropertyDescriptor_147,
  test_getOwnPropertyDescriptor_148,
  test_getOwnPropertyDescriptor_149,
  test_getOwnPropertyDescriptor_15,
  test_getOwnPropertyDescriptor_150,
  test_getOwnPropertyDescriptor_16,
  test_getOwnPropertyDescriptor_17,
  test_getOwnPropertyDescriptor_18,
  test_getOwnPropertyDescriptor_19,
  test_getOwnPropertyDescriptor_2,
  test_getOwnPropertyDescriptor_20,
  test_getOwnPropertyDescriptor_21,
  test_getOwnPropertyDescriptor_22,
  test_getOwnPropertyDescriptor_23,
  test_getOwnPropertyDescriptor_24,
  test_getOwnPropertyDescriptor_25,
  test_getOwnPropertyDescriptor_26,
  test_getOwnPropertyDescriptor_27,
  test_getOwnPropertyDescriptor_28,
  test_getOwnPropertyDescriptor_29,
  test_getOwnPropertyDescriptor_3,
  test_getOwnPropertyDescriptor_30,
  test_getOwnPropertyDescriptor_31,
  test_getOwnPropertyDescriptor_32,
  test_getOwnPropertyDescriptor_33,
  test_getOwnPropertyDescriptor_34,
  test_getOwnPropertyDescriptor_35,
  test_getOwnPropertyDescriptor_36,
  test_getOwnPropertyDescriptor_37,
  test_getOwnPropertyDescriptor_38,
  test_getOwnPropertyDescriptor_39,
  test_getOwnPropertyDescriptor_4,
  test_getOwnPropertyDescriptor_40,
  test_getOwnPropertyDescriptor_41,
  test_getOwnPropertyDescriptor_42,
  test_getOwnPropertyDescriptor_43,
  test_getOwnPropertyDescriptor_44,
  test_getOwnPropertyDescriptor_45,
  test_getOwnPropertyDescriptor_46,
  test_getOwnPropertyDescriptor_47,
  test_getOwnPropertyDescriptor_48,
  test_getOwnPropertyDescriptor_49,
  test_getOwnPropertyDescriptor_5,
  test_getOwnPropertyDescriptor_50,
  test_getOwnPropertyDescriptor_51,
  test_getOwnPropertyDescriptor_52,
  test_getOwnPropertyDescriptor_53,
  test_getOwnPropertyDescriptor_54,
  test_getOwnPropertyDescriptor_55,
  test_getOwnPropertyDescriptor_56,
  test_getOwnPropertyDescriptor_57,
  test_getOwnPropertyDescriptor_58,
  test_getOwnPropertyDescriptor_59,
  test_getOwnPropertyDescriptor_6,
  test_getOwnPropertyDescriptor_60,
  test_getOwnPropertyDescriptor_61,
  test_getOwnPropertyDescriptor_62,
  test_getOwnPropertyDescriptor_63,
  test_getOwnPropertyDescriptor_64,
  test_getOwnPropertyDescriptor_65,
  test_getOwnPropertyDescriptor_66,
  test_getOwnPropertyDescriptor_67,
  test_getOwnPropertyDescriptor_68,
  test_getOwnPropertyDescriptor_69,
  test_getOwnPropertyDescriptor_7,
  test_getOwnPropertyDescriptor_70,
  test_getOwnPropertyDescriptor_71,
  test_getOwnPropertyDescriptor_72,
  test_getOwnPropertyDescriptor_74,
  test_getOwnPropertyDescriptor_75,
  test_getOwnPropertyDescriptor_76,
  test_getOwnPropertyDescriptor_77,
  test_getOwnPropertyDescriptor_78,
  test_getOwnPropertyDescriptor_79,
  test_getOwnPropertyDescriptor_8,
  test_getOwnPropertyDescriptor_81,
  test_getOwnPropertyDescriptor_82,
  test_getOwnPropertyDescriptor_83,
  test_getOwnPropertyDescriptor_84,
  test_getOwnPropertyDescriptor_85,
  test_getOwnPropertyDescriptor_86,
  test_getOwnPropertyDescriptor_87,
  test_getOwnPropertyDescriptor_88,
  test_getOwnPropertyDescriptor_89,
  test_getOwnPropertyDescriptor_9,
  test_getOwnPropertyDescriptor_90,
  test_getOwnPropertyDescriptor_91,
  test_getOwnPropertyDescriptor_92,
  test_getOwnPropertyDescriptor_93,
  test_getOwnPropertyDescriptor_94,
  test_getOwnPropertyDescriptor_95,
  test_getOwnPropertyDescriptor_96,
  test_getOwnPropertyDescriptor_97,
  test_getOwnPropertyDescriptor_98,
  test_getOwnPropertyDescriptor_99
} from './Reflect6';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function reflect6Test() {
  describe('reflect6Test', () => {
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
     * @tc.name   reflect6Test001
     * @tc.number SUB_BUILTINS_REFLECT6_TEST_00100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test002
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test003
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test004
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test005
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test006
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test007
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test008
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test009
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test010
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_10();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test011
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test012
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test013
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test014
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test015
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test016
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test017
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test018
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test019
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test020
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect6Test021
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test022
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test023
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test024
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test025
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test026
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test027
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_27();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test028
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test029
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test030
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test031
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test032
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_32();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test033
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test034
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test035
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_35();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test036
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_36();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test037
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_37();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test038
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_38();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test039
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test040
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect6Test041
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test042
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test043
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test044
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test045
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test046
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test047
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test048
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test049
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_49();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test050
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_50();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test051
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test052
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_52();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test053
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_53();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test054
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_54();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test055
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test056
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_56();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test057
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test058
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test059
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test060
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect6Test061
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test062
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test063
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test064
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_64();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test065
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test066
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test067
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test068
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test069
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test070
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test071
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test072
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test074
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test075
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test076
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test077
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_77();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test078
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test079
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_79();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect6Test081
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test082
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test083
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test084
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test085
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_85();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test086
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_86();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test087
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_87();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test088
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test089
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test090
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test091
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test092
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test093
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test094
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test095
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test096
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test097
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test098
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test099
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test100
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_100();
      expect(result).assertFalse();
    });
    /**
     * @tc.name   reflect6Test101
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test102
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_102();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test103
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_103();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test104
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_104();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test105
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test106
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test108
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test109
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test110
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_110();
      expect(result).assertFalse();
    });


    /**
     * @tc.name   reflect6Test112
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_112();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test113
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test114
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test115
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_115();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test116
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_116();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test117
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test118
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test119
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test120
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test121
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test122
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test123
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test124
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test125
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect6Test126
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test127
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test128
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test129
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test130
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test131
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test132
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test133
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test134
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test135
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test136
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test137
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test138
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test139
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_139();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test140
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_140();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test141
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14100
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test142
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14200
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test143
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14300
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_143();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test144
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14400
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test145
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14500
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_145();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test146
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14600
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_146();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test147
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14700
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_147();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test148
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14800
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_148();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect6Test149
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14900
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect6Test150
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_15000
     * @tc.desc   test reflect getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect6Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getOwnPropertyDescriptor_150();
      expect(result).assertTrue();
    });
  })
}
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
  test_getPrototypeOf_1,
  test_getPrototypeOf_10,
  test_getPrototypeOf_100,
  test_getPrototypeOf_101,
  test_getPrototypeOf_102,
  test_getPrototypeOf_103,
  test_getPrototypeOf_104,
  test_getPrototypeOf_105,
  test_getPrototypeOf_106,
  test_getPrototypeOf_107,
  test_getPrototypeOf_108,
  test_getPrototypeOf_109,
  test_getPrototypeOf_11,
  test_getPrototypeOf_110,
  test_getPrototypeOf_111,
  test_getPrototypeOf_112,
  test_getPrototypeOf_113,
  test_getPrototypeOf_114,
  test_getPrototypeOf_115,
  test_getPrototypeOf_116,
  test_getPrototypeOf_117,
  test_getPrototypeOf_118,
  test_getPrototypeOf_119,
  test_getPrototypeOf_12,
  test_getPrototypeOf_120,
  test_getPrototypeOf_124,
  test_getPrototypeOf_125,
  test_getPrototypeOf_126,
  test_getPrototypeOf_127,
  test_getPrototypeOf_128,
  test_getPrototypeOf_129,
  test_getPrototypeOf_13,
  test_getPrototypeOf_130,
  test_getPrototypeOf_131,
  test_getPrototypeOf_132,
  test_getPrototypeOf_133,
  test_getPrototypeOf_134,
  test_getPrototypeOf_135,
  test_getPrototypeOf_136,
  test_getPrototypeOf_137,
  test_getPrototypeOf_138,
  test_getPrototypeOf_139,
  test_getPrototypeOf_14,
  test_getPrototypeOf_140,
  test_getPrototypeOf_141,
  test_getPrototypeOf_142,
  test_getPrototypeOf_143,
  test_getPrototypeOf_144,
  test_getPrototypeOf_145,
  test_getPrototypeOf_146,
  test_getPrototypeOf_147,
  test_getPrototypeOf_148,
  test_getPrototypeOf_149,
  test_getPrototypeOf_15,
  test_getPrototypeOf_150,
  test_getPrototypeOf_16,
  test_getPrototypeOf_17,
  test_getPrototypeOf_18,
  test_getPrototypeOf_19,
  test_getPrototypeOf_2,
  test_getPrototypeOf_20,
  test_getPrototypeOf_21,
  test_getPrototypeOf_22,
  test_getPrototypeOf_23,
  test_getPrototypeOf_24,
  test_getPrototypeOf_25,
  test_getPrototypeOf_26,
  test_getPrototypeOf_27,
  test_getPrototypeOf_28,
  test_getPrototypeOf_29,
  test_getPrototypeOf_3,
  test_getPrototypeOf_30,
  test_getPrototypeOf_31,
  test_getPrototypeOf_32,
  test_getPrototypeOf_33,
  test_getPrototypeOf_34,
  test_getPrototypeOf_35,
  test_getPrototypeOf_36,
  test_getPrototypeOf_37,
  test_getPrototypeOf_38,
  test_getPrototypeOf_39,
  test_getPrototypeOf_4,
  test_getPrototypeOf_40,
  test_getPrototypeOf_41,
  test_getPrototypeOf_42,
  test_getPrototypeOf_43,
  test_getPrototypeOf_44,
  test_getPrototypeOf_45,
  test_getPrototypeOf_46,
  test_getPrototypeOf_47,
  test_getPrototypeOf_48,
  test_getPrototypeOf_49,
  test_getPrototypeOf_5,
  test_getPrototypeOf_50,
  test_getPrototypeOf_51,
  test_getPrototypeOf_52,
  test_getPrototypeOf_53,
  test_getPrototypeOf_54,
  test_getPrototypeOf_55,
  test_getPrototypeOf_57,
  test_getPrototypeOf_58,
  test_getPrototypeOf_59,
  test_getPrototypeOf_6,
  test_getPrototypeOf_60,
  test_getPrototypeOf_61,
  test_getPrototypeOf_62,
  test_getPrototypeOf_63,
  test_getPrototypeOf_64,
  test_getPrototypeOf_65,
  test_getPrototypeOf_66,
  test_getPrototypeOf_67,
  test_getPrototypeOf_68,
  test_getPrototypeOf_69,
  test_getPrototypeOf_7,
  test_getPrototypeOf_70,
  test_getPrototypeOf_71,
  test_getPrototypeOf_72,
  test_getPrototypeOf_73,
  test_getPrototypeOf_74,
  test_getPrototypeOf_75,
  test_getPrototypeOf_76,
  test_getPrototypeOf_77,
  test_getPrototypeOf_78,
  test_getPrototypeOf_79,
  test_getPrototypeOf_8,
  test_getPrototypeOf_80,
  test_getPrototypeOf_81,
  test_getPrototypeOf_82,
  test_getPrototypeOf_83,
  test_getPrototypeOf_84,
  test_getPrototypeOf_85,
  test_getPrototypeOf_86,
  test_getPrototypeOf_87,
  test_getPrototypeOf_88,
  test_getPrototypeOf_89,
  test_getPrototypeOf_9,
  test_getPrototypeOf_90,
  test_getPrototypeOf_91,
  test_getPrototypeOf_92,
  test_getPrototypeOf_93,
  test_getPrototypeOf_94,
  test_getPrototypeOf_95,
  test_getPrototypeOf_96,
  test_getPrototypeOf_97,
  test_getPrototypeOf_98,
  test_getPrototypeOf_99
} from './Reflect7';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect7Test() {
  describe('reflect7Test', () => {
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
     * @tc.name   reflect7Test001
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test002
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test003
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test004
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test005
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test006
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test007
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test008
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test009
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_00900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test010
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test011
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test012
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test013
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test014
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test015
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test016
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test017
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test018
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test019
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_01900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test020
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect7Test021
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test022
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test023
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test024
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test025
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test026
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test027
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test028
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test029
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_02900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test030
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test031
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test032
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test033
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test034
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test035
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test036
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_36();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect7Test037
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test038
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test039
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_03900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test040
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_40();
      expect(result).assertFalse();
    });
    /**
     * @tc.name   reflect7Test041
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test042
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test043
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test044
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test045
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test046
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test047
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test048
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test049
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_04900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test050
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test051
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test052
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test053
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test054
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_54();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect7Test055
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test057
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test058
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test059
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_05900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test060
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test_getPrototypeOf_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect7Test061
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test062
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test063
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test064
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test065
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test066
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test067
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test068
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test069
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_06900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test070
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test071
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test072
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test073
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test074
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test075
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test076
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test077
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test078
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test079
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_07900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test080
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect7Test081
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test082
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test083
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test084
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test085
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test086
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test087
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test088
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test_getPrototypeOf_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test089
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_08900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test090
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test091
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test092
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test093
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test094
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test095
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test096
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test097
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test098
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test099
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_09900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test100
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect7Test101
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test102
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test103
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test104
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test105
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test106
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test107
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test108
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test109
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_10900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test110
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_110();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect7Test111
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test112
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test113
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test114
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test115
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test116
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test117
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test118
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test119
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_11900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test120
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test124
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test125
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect7Test126
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test127
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test128
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test129
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_12900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_129();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect7Test130
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test131
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test132
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test133
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test134
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test135
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test136
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test137
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test138
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test139
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_13900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test140
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test141
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14100
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test142
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14200
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test143
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14300
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test144
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14400
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test145
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14500
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_145();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect7Test146
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14600
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test147
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14700
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test148
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14800
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test149
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_14900
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect7Test150
     * @tc.number SUB_BUILTINS_REFLECT7_TEST_15000
     * @tc.desc   test reflect getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect7Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_getPrototypeOf_150();
      expect(result).assertTrue();
    });
  })
}
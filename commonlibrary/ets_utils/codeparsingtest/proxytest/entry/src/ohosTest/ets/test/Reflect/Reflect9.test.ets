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
  test_isExtensible_1,
  test_isExtensible_10,
  test_isExtensible_100,
  test_isExtensible_101,
  test_isExtensible_102,
  test_isExtensible_103,
  test_isExtensible_104,
  test_isExtensible_105,
  test_isExtensible_106,
  test_isExtensible_107,
  test_isExtensible_108,
  test_isExtensible_109,
  test_isExtensible_11,
  test_isExtensible_110,
  test_isExtensible_111,
  test_isExtensible_112,
  test_isExtensible_113,
  test_isExtensible_114,
  test_isExtensible_115,
  test_isExtensible_116,
  test_isExtensible_117,
  test_isExtensible_118,
  test_isExtensible_119,
  test_isExtensible_12,
  test_isExtensible_120,
  test_isExtensible_121,
  test_isExtensible_122,
  test_isExtensible_123,
  test_isExtensible_124,
  test_isExtensible_125,
  test_isExtensible_126,
  test_isExtensible_127,
  test_isExtensible_128,
  test_isExtensible_129,
  test_isExtensible_13,
  test_isExtensible_130,
  test_isExtensible_131,
  test_isExtensible_132,
  test_isExtensible_133,
  test_isExtensible_134,
  test_isExtensible_135,
  test_isExtensible_136,
  test_isExtensible_137,
  test_isExtensible_138,
  test_isExtensible_139,
  test_isExtensible_14,
  test_isExtensible_140,
  test_isExtensible_141,
  test_isExtensible_142,
  test_isExtensible_143,
  test_isExtensible_144,
  test_isExtensible_145,
  test_isExtensible_146,
  test_isExtensible_147,
  test_isExtensible_148,
  test_isExtensible_149,
  test_isExtensible_15,
  test_isExtensible_150,
  test_isExtensible_16,
  test_isExtensible_17,
  test_isExtensible_18,
  test_isExtensible_19,
  test_isExtensible_2,
  test_isExtensible_20,
  test_isExtensible_21,
  test_isExtensible_22,
  test_isExtensible_23,
  test_isExtensible_24,
  test_isExtensible_25,
  test_isExtensible_26,
  test_isExtensible_27,
  test_isExtensible_28,
  test_isExtensible_29,
  test_isExtensible_3,
  test_isExtensible_30,
  test_isExtensible_31,
  test_isExtensible_32,
  test_isExtensible_33,
  test_isExtensible_34,
  test_isExtensible_35,
  test_isExtensible_36,
  test_isExtensible_37,
  test_isExtensible_38,
  test_isExtensible_39,
  test_isExtensible_4,
  test_isExtensible_40,
  test_isExtensible_41,
  test_isExtensible_42,
  test_isExtensible_43,
  test_isExtensible_44,
  test_isExtensible_45,
  test_isExtensible_46,
  test_isExtensible_47,
  test_isExtensible_48,
  test_isExtensible_49,
  test_isExtensible_5,
  test_isExtensible_50,
  test_isExtensible_51,
  test_isExtensible_52,
  test_isExtensible_53,
  test_isExtensible_54,
  test_isExtensible_55,
  test_isExtensible_56,
  test_isExtensible_57,
  test_isExtensible_58,
  test_isExtensible_59,
  test_isExtensible_6,
  test_isExtensible_61,
  test_isExtensible_62,
  test_isExtensible_63,
  test_isExtensible_64,
  test_isExtensible_65,
  test_isExtensible_66,
  test_isExtensible_67,
  test_isExtensible_68,
  test_isExtensible_69,
  test_isExtensible_7,
  test_isExtensible_70,
  test_isExtensible_71,
  test_isExtensible_72,
  test_isExtensible_73,
  test_isExtensible_74,
  test_isExtensible_75,
  test_isExtensible_76,
  test_isExtensible_77,
  test_isExtensible_78,
  test_isExtensible_79,
  test_isExtensible_8,
  test_isExtensible_80,
  test_isExtensible_81,
  test_isExtensible_82,
  test_isExtensible_83,
  test_isExtensible_84,
  test_isExtensible_85,
  test_isExtensible_86,
  test_isExtensible_87,
  test_isExtensible_89,
  test_isExtensible_9,
  test_isExtensible_90,
  test_isExtensible_91,
  test_isExtensible_92,
  test_isExtensible_93,
  test_isExtensible_94,
  test_isExtensible_95,
  test_isExtensible_96,
  test_isExtensible_97,
  test_isExtensible_98,
  test_isExtensible_99
} from './Reflect9';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect9Test() {
  describe('reflect9Test', () => {
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
     * @tc.name   reflect9Test001
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test002
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test003
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test004
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test005
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test006
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test007
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test008
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test009
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_00900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test010
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test011
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test012
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test013
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test014
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test015
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test016
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test017
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test018
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test019
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_01900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test020
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect9Test021
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test022
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test023
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test024
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test025
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test026
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test027
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test028
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test029
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_02900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test030
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test031
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test032
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test033
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test034
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test035
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test036
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test037
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test038
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test039
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_03900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test040
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect9Test041
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test042
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test043
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test044
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test045
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test046
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test047
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test048
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test049
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_04900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test050
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test051
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test052
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test053
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test054
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test055
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test056
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test057
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test058
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test059
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_05900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test061
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test062
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test063
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test064
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test065
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test066
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test067
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test068
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test069
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_06900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test070
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test071
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test072
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test073
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test074
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test075
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test076
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test077
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test078
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test079
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_07900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test080
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect9Test081
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test082
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test083
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test084
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test085
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test086
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test087
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test088
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test089
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_08900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test090
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test091
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test092
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test093
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test094
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test095
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test096
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test097
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test098
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test099
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_09900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test100
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect9Test101
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test102
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test103
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test104
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test105
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test106
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test107
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test108
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test109
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_10900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test110
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test111
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test112
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test113
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test114
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test115
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test116
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test117
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test118
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test119
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_11900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test120
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test121
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test122
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test123
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test124
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test125
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect9Test126
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test127
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test128
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test129
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_12900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test130
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test131
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test132
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test133
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test134
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test135
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test136
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test137
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test138
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test139
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_13900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test140
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test141
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14100
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test142
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14200
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test143
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14300
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test144
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14400
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test145
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14500
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test146
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14600
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test147
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14700
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test148
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14800
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test149
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_14900
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect9Test150
     * @tc.number SUB_BUILTINS_REFLECT9_TEST_15000
     * @tc.desc   test reflect isExtensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect9Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_isExtensible_150();
      expect(result).assertTrue();
    });
  })
}
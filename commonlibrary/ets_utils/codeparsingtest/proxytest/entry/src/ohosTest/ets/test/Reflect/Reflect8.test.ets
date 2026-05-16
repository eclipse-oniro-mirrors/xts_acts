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


  test_has_1,
  test_has_2,
  test_has_3,
  test_has_4,
  test_has_5,
  test_has_6,
  test_has_7,
  test_has_8,
  test_has_9,
  test_has_10,
  test_has_88,
  test_has_11,
  test_has_12,
  test_has_13,
  test_has_14,
  test_has_15,
  test_has_16,
  test_has_17,
  test_has_18,
  test_has_19,
  test_has_20,
  test_has_21,
  test_has_22,
  test_has_23,
  test_has_24,
  test_has_25,
  test_has_26,
  test_has_27,
  test_has_28,
  test_has_29,
  test_has_30,
  test_has_31,
  test_has_32,
  test_has_33,
  test_has_34,
  test_has_35,
  test_has_36,
  test_has_37,
  test_has_38,
  test_has_39,
  test_has_40,
  test_has_41,
  test_has_42,
  test_has_43,
  test_has_44,
  test_has_45,
  test_has_46,
  test_has_47,
  test_has_48,
  test_has_49,
  test_has_50,
  test_has_51,
  test_has_52,
  test_has_53,
  test_has_54,
  test_has_55,
  test_has_56,
  test_has_57,
  test_has_58,
  test_has_59,
  test_has_60,
  test_has_61,
  test_has_62,
  test_has_63,
  test_has_64,
  test_has_65,
  test_has_66,
  test_has_67,
  test_has_68,
  test_has_69,
  test_has_70,
  test_has_71,
  test_has_72,
  test_has_73,
  test_has_74,
  test_has_75,
  test_has_76,
  test_has_77,
  test_has_78,
  test_has_79,
  test_has_80,
  test_has_81,
  test_has_82,
  test_has_83,
  test_has_84,
  test_has_85,
  test_has_86,
  test_has_87,
  test_has_89,
  test_has_90,
  test_has_91,
  test_has_92,
  test_has_93,
  test_has_94,
  test_has_95,
  test_has_96,
  test_has_97,
  test_has_98,
  test_has_99,
  test_has_100,
  test_has_101,
  test_has_102,
  test_has_103,
  test_has_104,
  test_has_105,
  test_has_106,
  test_has_107,
  test_has_108,
  test_has_109,
  test_has_110,
  test_has_111,
  test_has_112,
  test_has_113,
  test_has_114,
  test_has_115,
  test_has_116,
  test_has_117,
  test_has_118,
  test_has_119,
  test_has_120,
  test_has_121,
  test_has_122,
  test_has_123,
  test_has_124,
  test_has_125,
  test_has_126,
  test_has_127,
  test_has_128,
  test_has_129,
  test_has_130,
  test_has_131,
  test_has_132,
  test_has_133,
  test_has_134,
  test_has_135,
  test_has_136,
  test_has_137,
  test_has_138,
  test_has_139,
  test_has_140,
  test_has_141,
  test_has_142,
  test_has_143,
  test_has_144,
  test_has_145,
  test_has_146,
  test_has_147,
  test_has_148,
  test_has_149,
  test_has_150,

} from './Reflect8';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect8Test() {
  describe('reflect8Test', () => {
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
     * @tc.name   reflect8Test001
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test002
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test003
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test004
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test005
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test006
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test007
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test008
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test009
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_00900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test010
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test011
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test012
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test013
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test014
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test015
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test016
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test017
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test018
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test019
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_01900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test020
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test021
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test022
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test023
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test024
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test025
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test026
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test027
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test028
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test029
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_02900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test030
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test031
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test032
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test033
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test034
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test035
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test036
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test037
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test038
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test039
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_03900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test040
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test041
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test042
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test043
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test044
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test045
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test046
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test047
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test048
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test049
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_04900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test050
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test051
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_51();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect8Test052
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test053
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test054
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test055
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test056
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test057
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_57();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect8Test058
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test059
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_05900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test060
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test061
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test062
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test063
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test064
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test065
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test066
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test067
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test068
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test069
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_06900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test070
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test071
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test072
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test073
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test074
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test075
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test076
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test077
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test078
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test079
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_07900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test080
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test081
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test082
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test083
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test084
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test085
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test086
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test087
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test088
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test089
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_08900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test090
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test091
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test092
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test093
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test094
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test095
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test096
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test097
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test098
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test099
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_09900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test100
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test101
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test102
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test103
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test104
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test105
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_105();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect8Test106
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test107
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test108
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test109
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_10900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test110
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test111
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test112
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test113
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test114
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test115
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test116
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test117
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test118
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test119
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_11900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test120
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test121
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test122
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test123
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test124
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test125
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect8Test126
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test127
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test128
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test129
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_12900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test130
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test131
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test132
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test133
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test134
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test135
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test136
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test137
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test138
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test139
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_13900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test140
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test141
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14100
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test142
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14200
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test143
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14300
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test144
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14400
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test145
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14500
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test146
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14600
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test147
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14700
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test148
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14800
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test149
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_14900
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect8Test150
     * @tc.number SUB_BUILTINS_REFLECT8_TEST_15000
     * @tc.desc   test reflect has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect8Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_has_150();
      expect(result).assertTrue();
    });
  })
}
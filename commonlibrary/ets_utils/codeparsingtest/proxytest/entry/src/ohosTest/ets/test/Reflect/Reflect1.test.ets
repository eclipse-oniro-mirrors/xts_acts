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
  test_apply_1,
  test_apply_10,
  test_apply_100,
  test_apply_101,
  test_apply_102,
  test_apply_103,
  test_apply_104,
  test_apply_105,
  test_apply_106,
  test_apply_107,
  test_apply_108,
  test_apply_109,
  test_apply_11,
  test_apply_111,
  test_apply_113,
  test_apply_114,
  test_apply_115,
  test_apply_116,
  test_apply_117,
  test_apply_118,
  test_apply_119,
  test_apply_12,
  test_apply_120,
  test_apply_121,
  test_apply_122,
  test_apply_123,
  test_apply_124,
  test_apply_125,
  test_apply_127,
  test_apply_128,
  test_apply_129,
  test_apply_13,
  test_apply_131,
  test_apply_132,
  test_apply_133,
  test_apply_134,
  test_apply_135,
  test_apply_136,
  test_apply_137,
  test_apply_138,
  test_apply_139,
  test_apply_14,
  test_apply_140,
  test_apply_141,
  test_apply_142,
  test_apply_143,
  test_apply_144,
  test_apply_145,
  test_apply_146,
  test_apply_147,
  test_apply_148,
  test_apply_149,
  test_apply_15,
  test_apply_150,
  test_apply_16,
  test_apply_17,
  test_apply_18,
  test_apply_19,
  test_apply_2,
  test_apply_20,
  test_apply_21,
  test_apply_22,
  test_apply_23,
  test_apply_24,
  test_apply_25,
  test_apply_26,
  test_apply_27,
  test_apply_28,
  test_apply_29,
  test_apply_3,
  test_apply_30,
  test_apply_31,
  test_apply_32,
  test_apply_33,
  test_apply_34,
  test_apply_35,
  test_apply_36,
  test_apply_37,
  test_apply_38,
  test_apply_39,
  test_apply_4,
  test_apply_40,
  test_apply_41,
  test_apply_42,
  test_apply_43,
  test_apply_44,
  test_apply_45,
  test_apply_46,
  test_apply_47,
  test_apply_48,
  test_apply_49,
  test_apply_5,
  test_apply_50,
  test_apply_51,
  test_apply_52,
  test_apply_53,
  test_apply_54,
  test_apply_55,
  test_apply_56,
  test_apply_57,
  test_apply_58,
  test_apply_59,
  test_apply_6,
  test_apply_60,
  test_apply_61,
  test_apply_62,
  test_apply_64,
  test_apply_66,
  test_apply_67,
  test_apply_69,
  test_apply_7,
  test_apply_70,
  test_apply_71,
  test_apply_72,
  test_apply_73,
  test_apply_74,
  test_apply_75,
  test_apply_77,
  test_apply_78,
  test_apply_79,
  test_apply_8,
  test_apply_80,
  test_apply_81,
  test_apply_82,
  test_apply_83,
  test_apply_84,
  test_apply_85,
  test_apply_86,
  test_apply_87,
  test_apply_88,
  test_apply_89,
  test_apply_9,
  test_apply_90,
  test_apply_91,
  test_apply_92,
  test_apply_93,
  test_apply_95,
  test_apply_96,
  test_apply_97,
  test_apply_98,
  test_apply_99
} from './Reflect1';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect1Test() {
  describe('reflect1Test', () => {
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
     * @tc.name   reflect1Test001
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test002
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_2();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect1Test003
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test004
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test005
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test006
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test007
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test008
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test009
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_00900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test010
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test011
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_11();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test012
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_12();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test013
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test014
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test015
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test016
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test017
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test018
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test019
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_01900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test020
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_20();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test021
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_21();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect1Test022
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test023
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_23();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test024
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test025
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test026
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test027
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test028
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test029
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_02900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_29();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test030
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_30();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test031
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_31();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test032
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test033
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test034
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test035
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test036
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test037
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test038
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test039
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_03900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test040
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_40();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test041
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test042
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test043
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test044
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test045
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test046
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test047
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test048
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test049
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_04900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test050
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test051
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test052
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test053
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test054
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test055
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test056
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_56();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test057
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test058
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test059
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_05900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test060
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect1Test061
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test062
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_62();
      expect(result).assertTrue();
    });


    // todo
    /**
     * @tc.name   reflect1Test064
     * @tc.number reflect1Test064
     * @tc.desc   reflect1Test064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test066
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test067
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test069
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_06900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test070
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test071
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test072
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test073
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test074
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test075
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_75();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   reflect1Test077
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test078
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test079
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_07900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test080
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect1Test081
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test082
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test083
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_83();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test084
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test085
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test086
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test087
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test088
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test089
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_08900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_89();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test090
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test091
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test092
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test093
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test095
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test096
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test097
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test098
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test099
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_09900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test100
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect1Test101
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test102
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test103
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test104
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test105
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test106
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test107
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test108
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test109
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_10900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test111
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test113
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test114
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test115
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test116
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test117
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_117();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test118
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test119
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_11900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test120
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test121
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test122
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test123
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test124
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test125
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_125();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test127
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test128
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test129
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_12900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test131
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test132
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test133
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test134
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test135
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test136
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test137
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_137();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect1Test138
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test139
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_13900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test140
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test141
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14100
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test142
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14200
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test143
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14300
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test144
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14400
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test145
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14500
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test146
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14600
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test147
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14700
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test148
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14800
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test149
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_14900
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect1Test150
     * @tc.number SUB_BUILTINS_REFLECT1_TEST_15000
     * @tc.desc   test reflect apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect1Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_apply_150();
      expect(result).assertTrue();
    });
  })
}
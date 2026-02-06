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
  test_defineProperty_1,
  test_defineProperty_10,
  test_defineProperty_100,
  test_defineProperty_101,
  test_defineProperty_102,
  test_defineProperty_103,
  test_defineProperty_104,
  test_defineProperty_105,
  test_defineProperty_106,
  test_defineProperty_107,
  test_defineProperty_108,
  test_defineProperty_109,
  test_defineProperty_11,
  test_defineProperty_110,
  test_defineProperty_111,
  test_defineProperty_112,
  test_defineProperty_113,
  test_defineProperty_114,
  test_defineProperty_115,
  test_defineProperty_116,
  test_defineProperty_117,
  test_defineProperty_118,
  test_defineProperty_119,
  test_defineProperty_12,
  test_defineProperty_120,
  test_defineProperty_121,
  test_defineProperty_123,
  test_defineProperty_124,
  test_defineProperty_125,
  test_defineProperty_126,
  test_defineProperty_128,
  test_defineProperty_129,
  test_defineProperty_13,
  test_defineProperty_130,
  test_defineProperty_131,
  test_defineProperty_132,
  test_defineProperty_133,
  test_defineProperty_134,
  test_defineProperty_135,
  test_defineProperty_136,
  test_defineProperty_137,
  test_defineProperty_138,
  test_defineProperty_139,
  test_defineProperty_14,
  test_defineProperty_140,
  test_defineProperty_141,
  test_defineProperty_142,
  test_defineProperty_143,
  test_defineProperty_144,
  test_defineProperty_145,
  test_defineProperty_146,
  test_defineProperty_147,
  test_defineProperty_148,
  test_defineProperty_149,
  test_defineProperty_15,
  test_defineProperty_150,
  test_defineProperty_16,
  test_defineProperty_19,
  test_defineProperty_2,
  test_defineProperty_20,
  test_defineProperty_21,
  test_defineProperty_22,
  test_defineProperty_23,
  test_defineProperty_24,
  test_defineProperty_25,
  test_defineProperty_26,
  test_defineProperty_27,
  test_defineProperty_28,
  test_defineProperty_29,
  test_defineProperty_3,
  test_defineProperty_30,
  test_defineProperty_31,
  test_defineProperty_32,
  test_defineProperty_33,
  test_defineProperty_34,
  test_defineProperty_35,
  test_defineProperty_36,
  test_defineProperty_37,
  test_defineProperty_38,
  test_defineProperty_39,
  test_defineProperty_4,
  test_defineProperty_40,
  test_defineProperty_41,
  test_defineProperty_42,
  test_defineProperty_43,
  test_defineProperty_44,
  test_defineProperty_45,
  test_defineProperty_46,
  test_defineProperty_47,
  test_defineProperty_48,
  test_defineProperty_49,
  test_defineProperty_5,
  test_defineProperty_50,
  test_defineProperty_51,
  test_defineProperty_52,
  test_defineProperty_53,
  test_defineProperty_54,
  test_defineProperty_55,
  test_defineProperty_56,
  test_defineProperty_57,
  test_defineProperty_58,
  test_defineProperty_59,
  test_defineProperty_6,
  test_defineProperty_60,
  test_defineProperty_61,
  test_defineProperty_62,
  test_defineProperty_63,
  test_defineProperty_64,
  test_defineProperty_65,
  test_defineProperty_66,
  test_defineProperty_67,
  test_defineProperty_68,
  test_defineProperty_69,
  test_defineProperty_7,
  test_defineProperty_70,
  test_defineProperty_71,
  test_defineProperty_72,
  test_defineProperty_74,
  test_defineProperty_75,
  test_defineProperty_76,
  test_defineProperty_77,
  test_defineProperty_78,
  test_defineProperty_79,
  test_defineProperty_8,
  test_defineProperty_80,
  test_defineProperty_81,
  test_defineProperty_82,
  test_defineProperty_83,
  test_defineProperty_84,
  test_defineProperty_85,
  test_defineProperty_86,
  test_defineProperty_87,
  test_defineProperty_88,
  test_defineProperty_89,
  test_defineProperty_9,
  test_defineProperty_90,
  test_defineProperty_91,
  test_defineProperty_92,
  test_defineProperty_93,
  test_defineProperty_94,
  test_defineProperty_95,
  test_defineProperty_97,
  test_defineProperty_98,
  test_defineProperty_99
} from './Reflect3';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect3Test() {
  describe('reflect3Test', () => {
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
     * @tc.name   reflect3Test001
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test002
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_2();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test003
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test004
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test005
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test006
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test007
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test008
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test009
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_00900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test010
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test011
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test012
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test013
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test014
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test015
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test016
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test019
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_01900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test020
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_20();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test021
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test022
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test023
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test024
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test025
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test026
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test027
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test028
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test029
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_02900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test030
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test031
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test032
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test033
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test034
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test035
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_35();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect3Test036
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test037
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test038
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test039
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_03900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test040
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test041
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test042
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test043
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test044
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test045
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test046
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test047
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test048
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test049
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_04900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test050
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test051
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test052
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test053
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test054
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test055
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test056
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test057
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test058
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test059
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_05900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test060
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test061
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test062
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test063
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test064
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test065
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test066
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test067
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test068
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test069
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_06900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test070
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test071
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test072
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test074
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test075
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test076
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test077
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test078
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test079
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_07900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test080
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test081
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test082
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test083
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test084
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test085
     * @tc.number SUB * SUB_BUILTINS_REFLECT3_TEST_08500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test086
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test087
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test088
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test089
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_08900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test090
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test091
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test092
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test093
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test094
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test095
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test097
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test098
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test099
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_09900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test100
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test101
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test102
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test103
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test104
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test105
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test106
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test107
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test108
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test109
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_10900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test110
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test111
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test112
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test113
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test114
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test115
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test116
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test117
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test118
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test119
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_11900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test120
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test121
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test123
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test124
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test125
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect3Test126
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_126();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   reflect3Test128
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test129
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_12900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test130
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test131
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test132
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test133
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test134
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test135
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test136
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test137
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test138
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test139
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_13900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test140
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test141
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14100
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test142
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14200
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test143
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14300
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test144
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14400
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test145
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14500
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test146
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14600
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test147
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14700
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test148
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14800
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test149
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_14900
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect3Test150
     * @tc.number SUB_BUILTINS_REFLECT3_TEST_15000
     * @tc.desc   test reflect defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect3Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_defineProperty_150();
      expect(result).assertTrue();
    });
  })
}
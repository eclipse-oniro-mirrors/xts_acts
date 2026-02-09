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
  test_construct_1,
  test_construct_10,
  test_construct_100,
  test_construct_101,
  test_construct_102,
  test_construct_103,
  test_construct_104,
  test_construct_105,
  test_construct_106,
  test_construct_107,
  test_construct_108,
  test_construct_109,
  test_construct_11,
  test_construct_110,
  test_construct_111,
  test_construct_112,
  test_construct_113,
  test_construct_114,
  test_construct_115,
  test_construct_117,
  test_construct_118,
  test_construct_119,
  test_construct_12,
  test_construct_120,
  test_construct_121,
  test_construct_122,
  test_construct_123,
  test_construct_124,
  test_construct_125,
  test_construct_126,
  test_construct_127,
  test_construct_128,
  test_construct_129,
  test_construct_13,
  test_construct_130,
  test_construct_131,
  test_construct_132,
  test_construct_133,
  test_construct_134,
  test_construct_135,
  test_construct_136,
  test_construct_137,
  test_construct_138,
  test_construct_139,
  test_construct_14,
  test_construct_140,
  test_construct_141,
  test_construct_142,
  test_construct_143,
  test_construct_144,
  test_construct_145,
  test_construct_147,
  test_construct_148,
  test_construct_15,
  test_construct_150,
  test_construct_16,
  test_construct_17,
  test_construct_18,
  test_construct_19,
  test_construct_2,
  test_construct_20,
  test_construct_21,
  test_construct_22,
  test_construct_23,
  test_construct_24,
  test_construct_25,
  test_construct_26,
  test_construct_27,
  test_construct_28,
  test_construct_29,
  test_construct_3,
  test_construct_30,
  test_construct_31,
  test_construct_32,
  test_construct_33,
  test_construct_34,
  test_construct_35,
  test_construct_36,
  test_construct_37,
  test_construct_38,
  test_construct_39,
  test_construct_4,
  test_construct_40,
  test_construct_41,
  test_construct_42,
  test_construct_43,
  test_construct_44,
  test_construct_45,
  test_construct_46,
  test_construct_47,
  test_construct_48,
  test_construct_49,
  test_construct_5,
  test_construct_51,
  test_construct_52,
  test_construct_53,
  test_construct_54,
  test_construct_55,
  test_construct_56,
  test_construct_57,
  test_construct_58,
  test_construct_59,
  test_construct_6,
  test_construct_61,
  test_construct_62,
  test_construct_63,
  test_construct_64,
  test_construct_65,
  test_construct_66,
  test_construct_67,
  test_construct_68,
  test_construct_69,
  test_construct_7,
  test_construct_70,
  test_construct_71,
  test_construct_72,
  test_construct_73,
  test_construct_74,
  test_construct_75,
  test_construct_76,
  test_construct_77,
  test_construct_79,
  test_construct_8,
  test_construct_80,
  test_construct_81,
  test_construct_82,
  test_construct_83,
  test_construct_84,
  test_construct_85,
  test_construct_86,
  test_construct_87,
  test_construct_88,
  test_construct_89,
  test_construct_9,
  test_construct_91,
  test_construct_92,
  test_construct_93,
  test_construct_94,
  test_construct_95,
  test_construct_96,
  test_construct_97,
  test_construct_98,
  test_construct_99
} from './Reflect2';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect2Test() {
  describe('reflect2Test', () => {
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
     * @tc.name   reflect2Test001
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test002
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_2();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect2Test003
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test004
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test005
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test006
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test007
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test008
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test009
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_00900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test010
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_10();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test011
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_11();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test012
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test013
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test014
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test015
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test016
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test017
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test018
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test019
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_01900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_19();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test020
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_20();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test021
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test_construct_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test022
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test023
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test024
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test025
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test026
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test027
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test028
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test029
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_02900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test030
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test031
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test032
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test033
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test034
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test035
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test036
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test037
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test038
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test039
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_03900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_39();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test040
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_40();
      expect(result).assertFalse();
    });
    /**
     * @tc.name   reflect2Test041
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test042
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test043
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test044
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_44();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test045
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test046
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test047
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_47();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test048
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test049
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_04900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_49();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   reflect2Test051
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test052
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test053
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test054
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test055
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test056
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test057
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test058
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test059
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_05900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_59();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   reflect2Test061
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test062
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test063
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test064
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test065
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test066
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test067
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test068
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test069
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_06900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test070
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test071
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test072
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test073
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test074
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test075
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test076
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test077
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test079
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_07900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_79();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test080
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect2Test081
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test082
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test083
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test084
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test085
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test086
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test087
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_87();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test088
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test089
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_08900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_89();
      expect(result).assertTrue();
    });


    /**
     * @tc.name   reflect2Test091
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test092
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_92();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test093
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_93();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test094
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_94();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test095
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test096
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test097
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test098
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test099
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_09900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test100
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_100();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test101
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test102
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test103
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test104
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test105
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test106
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test107
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test108
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test109
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_10900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test110
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test111
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test112
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test113
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test114
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test115
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_115();
      expect(result).assertFalse();
    });


    /**
     * @tc.name   reflect2Test117
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test118
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_118();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test119
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_11900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test120
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test121
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test122
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test123
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test124
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test125
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_125();
      expect(result).assertFalse();
    });
    /**
     * @tc.name   reflect2Test126
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test127
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test128
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test129
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_12900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test130
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test131
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test132
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_132();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test133
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test134
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_134();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect2Test135
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test136
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13600
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test137
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test138
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test139
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_13900
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test140
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test141
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14100
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test142
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14200
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test143
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14300
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test144
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14400
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test145
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14500
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test147
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14700
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test148
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_14800
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect2Test150
     * @tc.number SUB_BUILTINS_REFLECT2_TEST_15000
     * @tc.desc   test reflect construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect2Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_construct_150();
      expect(result).assertTrue();
    });
  })
}
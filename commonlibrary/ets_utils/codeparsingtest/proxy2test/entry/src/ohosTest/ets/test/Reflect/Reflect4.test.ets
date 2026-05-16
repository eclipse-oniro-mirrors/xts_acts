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
  test_deleteProperty_1,
  test_deleteProperty_10,
  test_deleteProperty_100,
  test_deleteProperty_102,
  test_deleteProperty_103,
  test_deleteProperty_104,
  test_deleteProperty_105,
  test_deleteProperty_106,
  test_deleteProperty_107,
  test_deleteProperty_108,
  test_deleteProperty_109,
  test_deleteProperty_11,
  test_deleteProperty_110,
  test_deleteProperty_111,
  test_deleteProperty_112,
  test_deleteProperty_113,
  test_deleteProperty_114,
  test_deleteProperty_115,
  test_deleteProperty_116,
  test_deleteProperty_117,
  test_deleteProperty_118,
  test_deleteProperty_119,
  test_deleteProperty_12,
  test_deleteProperty_120,
  test_deleteProperty_121,
  test_deleteProperty_122,
  test_deleteProperty_123,
  test_deleteProperty_124,
  test_deleteProperty_125,
  test_deleteProperty_126,
  test_deleteProperty_127,
  test_deleteProperty_128,
  test_deleteProperty_129,
  test_deleteProperty_13,
  test_deleteProperty_131,
  test_deleteProperty_132,
  test_deleteProperty_133,
  test_deleteProperty_134,
  test_deleteProperty_135,
  test_deleteProperty_136,
  test_deleteProperty_137,
  test_deleteProperty_138,
  test_deleteProperty_139,
  test_deleteProperty_14,
  test_deleteProperty_140,
  test_deleteProperty_141,
  test_deleteProperty_143,
  test_deleteProperty_144,
  test_deleteProperty_145,
  test_deleteProperty_146,
  test_deleteProperty_147,
  test_deleteProperty_148,
  test_deleteProperty_149,
  test_deleteProperty_15,
  test_deleteProperty_150,
  test_deleteProperty_16,
  test_deleteProperty_17,
  test_deleteProperty_18,
  test_deleteProperty_19,
  test_deleteProperty_2,
  test_deleteProperty_20,
  test_deleteProperty_21,
  test_deleteProperty_22,
  test_deleteProperty_23,
  test_deleteProperty_25,
  test_deleteProperty_26,
  test_deleteProperty_27,
  test_deleteProperty_28,
  test_deleteProperty_29,
  test_deleteProperty_3,
  test_deleteProperty_30,
  test_deleteProperty_31,
  test_deleteProperty_32,
  test_deleteProperty_33,
  test_deleteProperty_34,
  test_deleteProperty_35,
  test_deleteProperty_36,
  test_deleteProperty_37,
  test_deleteProperty_38,
  test_deleteProperty_39,
  test_deleteProperty_4,
  test_deleteProperty_40,
  test_deleteProperty_41,
  test_deleteProperty_42,
  test_deleteProperty_43,
  test_deleteProperty_44,
  test_deleteProperty_45,
  test_deleteProperty_46,
  test_deleteProperty_47,
  test_deleteProperty_48,
  test_deleteProperty_49,
  test_deleteProperty_5,
  test_deleteProperty_50,
  test_deleteProperty_51,
  test_deleteProperty_52,
  test_deleteProperty_53,
  test_deleteProperty_54,
  test_deleteProperty_55,
  test_deleteProperty_56,
  test_deleteProperty_57,
  test_deleteProperty_58,
  test_deleteProperty_59,
  test_deleteProperty_6,
  test_deleteProperty_60,
  test_deleteProperty_61,
  test_deleteProperty_62,
  test_deleteProperty_63,
  test_deleteProperty_64,
  test_deleteProperty_65,
  test_deleteProperty_66,
  test_deleteProperty_67,
  test_deleteProperty_68,
  test_deleteProperty_69,
  test_deleteProperty_7,
  test_deleteProperty_70,
  test_deleteProperty_71,
  test_deleteProperty_72,
  test_deleteProperty_73,
  test_deleteProperty_74,
  test_deleteProperty_75,
  test_deleteProperty_76,
  test_deleteProperty_77,
  test_deleteProperty_78,
  test_deleteProperty_79,
  test_deleteProperty_8,
  test_deleteProperty_80,
  test_deleteProperty_81,
  test_deleteProperty_82,
  test_deleteProperty_83,
  test_deleteProperty_84,
  test_deleteProperty_85,
  test_deleteProperty_86,
  test_deleteProperty_87,
  test_deleteProperty_89,
  test_deleteProperty_9,
  test_deleteProperty_90,
  test_deleteProperty_91,
  test_deleteProperty_92,
  test_deleteProperty_93,
  test_deleteProperty_94,
  test_deleteProperty_95,
  test_deleteProperty_97,
  test_deleteProperty_98,
  test_deleteProperty_99
} from './Reflect4';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect4Test() {
  describe('reflect4Test', () => {
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
     * @tc.name   reflect4Test001
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test002
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test003
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test004
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test005
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test006
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test007
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test008
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test009
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_00900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test010
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test011
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test012
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test013
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test014
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test015
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test016
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test017
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test018
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test019
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_01900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test020
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect4Test021
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test022
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test023
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test025
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test026
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test027
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test028
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test029
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_02900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test030
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test031
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_31();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test032
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test033
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test034
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test035
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test036
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test037
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_37();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect4Test038
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test039
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_03900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test040
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect4Test041
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test042
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test043
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test044
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test045
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test046
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test047
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test048
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test049
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_04900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test050
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test051
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test052
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test053
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test054
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test055
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test056
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test057
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test058
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test059
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_05900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test060
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect4Test061
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test062
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test063
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test064
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test065
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test066
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test067
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test068
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test069
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_06900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test070
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test071
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test072
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test073
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test074
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test075
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test076
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test077
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test078
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test079
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_07900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test080
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect4Test081
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test082
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test083
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test084
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test085
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test086
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test087
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test089
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_08900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test090
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test091
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test092
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test093
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test094
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test095
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test097
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test098
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test099
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_09900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test100
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_100();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test102
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test103
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test104
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test105
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test106
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test107
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test108
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test109
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_10900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test110
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test111
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test112
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test113
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test114
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test115
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test116
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test117
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test118
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test119
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_11900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test120
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test121
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test122
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test123
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_123();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect4Test124
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test125
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_125();
      expect(result).assertFalse();
    });
    /**
     * @tc.name   reflect4Test126
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test127
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_127();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test128
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test129
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_12900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test131
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test132
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13200
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test133
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test134
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test135
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test136
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test137
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test138
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_138();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect4Test139
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_13900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test140
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test141
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14100
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test143
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14300
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test144
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14400
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test145
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14500
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test146
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14600
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test147
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14700
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test148
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14800
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test149
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_14900
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect4Test150
     * @tc.number SUB_BUILTINS_REFLECT4_TEST_15000
     * @tc.desc   test reflect deleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_deleteProperty_150();
      expect(result).assertTrue();
    });
  })
}
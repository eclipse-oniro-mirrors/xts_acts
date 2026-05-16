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
  test_preventExtensions_100,
  test_preventExtensions_101,
  test_preventExtensions_102,
  test_preventExtensions_103,
  test_preventExtensions_104,
  test_preventExtensions_105,
  test_preventExtensions_106,
  test_preventExtensions_107,
  test_preventExtensions_108,
  test_preventExtensions_109,
  test_preventExtensions_11,
  test_preventExtensions_110,
  test_preventExtensions_111,
  test_preventExtensions_112,
  test_preventExtensions_113,
  test_preventExtensions_114,
  test_preventExtensions_115,
  test_preventExtensions_116,
  test_preventExtensions_117,
  test_preventExtensions_118,
  test_preventExtensions_119,
  test_preventExtensions_12,
  test_preventExtensions_120,
  test_preventExtensions_121,
  test_preventExtensions_122,
  test_preventExtensions_123,
  test_preventExtensions_124,
  test_preventExtensions_125,
  test_preventExtensions_126,
  test_preventExtensions_128,
  test_preventExtensions_129,
  test_preventExtensions_13,
  test_preventExtensions_130,
  test_preventExtensions_131,
  test_preventExtensions_132,
  test_preventExtensions_133,
  test_preventExtensions_134,
  test_preventExtensions_135,
  test_preventExtensions_136,
  test_preventExtensions_137,
  test_preventExtensions_138,
  test_preventExtensions_139,
  test_preventExtensions_14,
  test_preventExtensions_140,
  test_preventExtensions_141,
  test_preventExtensions_142,
  test_preventExtensions_143,
  test_preventExtensions_144,
  test_preventExtensions_145,
  test_preventExtensions_146,
  test_preventExtensions_147,
  test_preventExtensions_149,
  test_preventExtensions_15,
  test_preventExtensions_150,
  test_preventExtensions_16,
  test_preventExtensions_17,
  test_preventExtensions_18,
  test_preventExtensions_19,
  test_preventExtensions_20,
  test_preventExtensions_21,
  test_preventExtensions_22,
  test_preventExtensions_23,
  test_preventExtensions_24,
  test_preventExtensions_25,
  test_preventExtensions_26,
  test_preventExtensions_27,
  test_preventExtensions_28,
  test_preventExtensions_29,
  test_preventExtensions_31,
  test_preventExtensions_32,
  test_preventExtensions_33,
  test_preventExtensions_34,
  test_preventExtensions_35,
  test_preventExtensions_36,
  test_preventExtensions_37,
  test_preventExtensions_38,
  test_preventExtensions_39,
  test_preventExtensions_40,
  test_preventExtensions_41,
  test_preventExtensions_42,
  test_preventExtensions_43,
  test_preventExtensions_44,
  test_preventExtensions_45,
  test_preventExtensions_46,
  test_preventExtensions_47,
  test_preventExtensions_48,
  test_preventExtensions_49,
  test_preventExtensions_50,
  test_preventExtensions_51,
  test_preventExtensions_52,
  test_preventExtensions_53,
  test_preventExtensions_54,
  test_preventExtensions_55,
  test_preventExtensions_56,
  test_preventExtensions_57,
  test_preventExtensions_58,
  test_preventExtensions_59,
  test_preventExtensions_60,
  test_preventExtensions_61,
  test_preventExtensions_62,
  test_preventExtensions_63,
  test_preventExtensions_64,
  test_preventExtensions_65,
  test_preventExtensions_66,
  test_preventExtensions_67,
  test_preventExtensions_68,
  test_preventExtensions_69,
  test_preventExtensions_70,
  test_preventExtensions_71,
  test_preventExtensions_72,
  test_preventExtensions_73,
  test_preventExtensions_74,
  test_preventExtensions_75,
  test_preventExtensions_76,
  test_preventExtensions_77,
  test_preventExtensions_78,
  test_preventExtensions_79,
  test_preventExtensions_80,
  test_preventExtensions_81,
  test_preventExtensions_82,
  test_preventExtensions_83,
  test_preventExtensions_84,
  test_preventExtensions_85,
  test_preventExtensions_86,
  test_preventExtensions_87,
  test_preventExtensions_88,
  test_preventExtensions_89,
  test_preventExtensions_90,
  test_preventExtensions_91,
  test_preventExtensions_92,
  test_preventExtensions_93,
  test_preventExtensions_94,
  test_preventExtensions_95,
  test_preventExtensions_96,
  test_preventExtensions_97,
  test_preventExtensions_98,
  test_preventExtensions_99
} from './Reflect11';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect11Test() {
  describe('reflect11Test', () => {
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
     * @tc.name   reflect11Test011
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test012
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test013
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test014
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test015
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test016
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test017
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test018
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test019
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_01900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test020
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test021
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test022
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test023
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test024
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test025
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_25();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test026
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_26();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test027
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_27();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test028
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test029
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_02900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test031
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_31();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect11Test032
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_32();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test033
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test034
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test035
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test036
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test037
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_37();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test038
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test039
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_03900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test040
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_40();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test041
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_41();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test042
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_42();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test043
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_43();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test044
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_44();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test045
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_45();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test046
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_46();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test047
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_47();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test048
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_48();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test049
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_04900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_49();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test050
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_50();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test051
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test052
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test053
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test054
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test055
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test056
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test057
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test058
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test059
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_05900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test060
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test061
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test062
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test063
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test064
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test065
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test066
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test067
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test068
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test069
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_06900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test070
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test071
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_71();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test072
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_72();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test073
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test074
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test075
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_75();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test076
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test077
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test078
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_78();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect11Test079
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_07900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test080
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test081
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test082
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test083
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test084
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test085
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test086
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test087
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test088
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test089
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_08900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test090
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test091
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test092
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test093
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test094
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test095
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test096
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test097
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test098
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test099
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_09900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test100
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test101
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test102
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test103
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test104
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test105
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test106
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test107
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test108
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_108();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test109
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_10900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test110
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test111
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test112
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test113
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test114
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test115
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test116
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test117
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test118
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test119
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_11900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test120
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test121
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test122
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_122();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test123
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_123();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test124
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test125
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect11Test126
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test128
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test129
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_12900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test130
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test131
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test132
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test133
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test134
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test135
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test136
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_136();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test137
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_137();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test138
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13800
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test139
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_13900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test140
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test141
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14100
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test142
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14200
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test143
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14300
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test144
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14400
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test145
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14500
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test146
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14600
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test147
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14700
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test149
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_14900
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect11Test150
     * @tc.number SUB_BUILTINS_REFLECT11_TEST_15000
     * @tc.desc   test reflect preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect11Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_preventExtensions_150();
      expect(result).assertTrue();
    });
  })
}
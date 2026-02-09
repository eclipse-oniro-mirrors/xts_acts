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
  test_ownKeys_1,
  test_ownKeys_10,
  test_ownKeys_100,
  test_ownKeys_101,
  test_ownKeys_102,
  test_ownKeys_103,
  test_ownKeys_104,
  test_ownKeys_105,
  test_ownKeys_106,
  test_ownKeys_107,
  test_ownKeys_109,
  test_ownKeys_11,
  test_ownKeys_110,
  test_ownKeys_111,
  test_ownKeys_112,
  test_ownKeys_113,
  test_ownKeys_114,
  test_ownKeys_115,
  test_ownKeys_116,
  test_ownKeys_117,
  test_ownKeys_118,
  test_ownKeys_119,
  test_ownKeys_12,
  test_ownKeys_120,
  test_ownKeys_121,
  test_ownKeys_124,
  test_ownKeys_125,
  test_ownKeys_126,
  test_ownKeys_128,
  test_ownKeys_129,
  test_ownKeys_13,
  test_ownKeys_130,
  test_ownKeys_131,
  test_ownKeys_132,
  test_ownKeys_133,
  test_ownKeys_134,
  test_ownKeys_135,
  test_ownKeys_136,
  test_ownKeys_137,
  test_ownKeys_138,
  test_ownKeys_139,
  test_ownKeys_14,
  test_ownKeys_140,
  test_ownKeys_141,
  test_ownKeys_142,
  test_ownKeys_143,
  test_ownKeys_144,
  test_ownKeys_145,
  test_ownKeys_146,
  test_ownKeys_147,
  test_ownKeys_148,
  test_ownKeys_149,
  test_ownKeys_15,
  test_ownKeys_150,
  test_ownKeys_16,
  test_ownKeys_17,
  test_ownKeys_18,
  test_ownKeys_19,
  test_ownKeys_2,
  test_ownKeys_20,
  test_ownKeys_21,
  test_ownKeys_22,
  test_ownKeys_23,
  test_ownKeys_24,
  test_ownKeys_25,
  test_ownKeys_26,
  test_ownKeys_27,
  test_ownKeys_28,
  test_ownKeys_29,
  test_ownKeys_3,
  test_ownKeys_30,
  test_ownKeys_31,
  test_ownKeys_33,
  test_ownKeys_34,
  test_ownKeys_35,
  test_ownKeys_36,
  test_ownKeys_37,
  test_ownKeys_38,
  test_ownKeys_39,
  test_ownKeys_4,
  test_ownKeys_40,
  test_ownKeys_5,
  test_ownKeys_51,
  test_ownKeys_52,
  test_ownKeys_53,
  test_ownKeys_54,
  test_ownKeys_55,
  test_ownKeys_56,
  test_ownKeys_57,
  test_ownKeys_58,
  test_ownKeys_59,
  test_ownKeys_6,
  test_ownKeys_60,
  test_ownKeys_61,
  test_ownKeys_62,
  test_ownKeys_63,
  test_ownKeys_64,
  test_ownKeys_65,
  test_ownKeys_66,
  test_ownKeys_67,
  test_ownKeys_68,
  test_ownKeys_69,
  test_ownKeys_7,
  test_ownKeys_70,
  test_ownKeys_71,
  test_ownKeys_73,
  test_ownKeys_74,
  test_ownKeys_75,
  test_ownKeys_76,
  test_ownKeys_77,
  test_ownKeys_78,
  test_ownKeys_79,
  test_ownKeys_8,
  test_ownKeys_80,
  test_ownKeys_81,
  test_ownKeys_82,
  test_ownKeys_83,
  test_ownKeys_84,
  test_ownKeys_85,
  test_ownKeys_86,
  test_ownKeys_87,
  test_ownKeys_88,
  test_ownKeys_89,
  test_ownKeys_9,
  test_ownKeys_90,
  test_ownKeys_91,
  test_ownKeys_92,
  test_ownKeys_93,
  test_ownKeys_94,
  test_ownKeys_95,
  test_ownKeys_96,
  test_ownKeys_97,
  test_ownKeys_98,
  test_ownKeys_99
} from './Reflect10';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function reflect10Test() {
  describe('reflect10Test', () => {
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
     * @tc.name   reflect10Test001
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_1();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test002
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_2();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test003
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_3();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test004
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_4();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test005
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_5();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test006
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_6();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test007
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_7();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test008
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_8();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test009
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_00900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_9();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test010
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_10();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test011
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_11();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test012
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_12();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test013
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_13();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test014
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_14();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test015
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_15();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test016
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_16();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test017
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_17();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test018
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_18();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test019
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_01900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_19();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test020
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_20();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect10Test021
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_21();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test022
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_22();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test023
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_23();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test024
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_24();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test025
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_25();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test026
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_26();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test027
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_27();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test028
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_28();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test029
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_02900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_29();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test030
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_30();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test031
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_31();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test033
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_33();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test034
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_34();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test035
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_35();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test036
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_36();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test037
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_37();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test038
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_38();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test039
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_03900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_39();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test040
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_04000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_40();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test051
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_51();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test052
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_52();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test053
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_53();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test054
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_54();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test055
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_55();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test056
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_56();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test057
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_57();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test058
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_58();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test059
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_05900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_59();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test060
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_60();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect10Test061
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_61();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test062
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_62();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test063
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_63();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test064
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_64();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test065
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_65();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test066
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_66();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test067
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_67();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test068
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_68();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test069
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_06900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_69();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test070
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_70();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test071
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_71();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test073
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_73();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test074
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_74();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test075
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_75();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test076
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_76();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test077
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_77();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test078
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_78();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test079
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_07900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_79();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test080
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_80();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect10Test081
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_81();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test082
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_82();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test083
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_83();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test084
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_84();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test085
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_85();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test086
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_86();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test087
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_87();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test088
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_88();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test089
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_08900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_89();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test090
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_90();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test091
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_91();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test092
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_92();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test093
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_93();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test094
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_94();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test095
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_95();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test096
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_96();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test097
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_97();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test098
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_98();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test099
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_09900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_99();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test100
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_100();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect10Test101
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_101();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test102
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_102();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test103
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_103();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test104
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_104();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test105
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_105();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test106
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_106();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test107
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_107();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test109
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_10900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_109();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test110
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_110();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test111
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_111();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test112
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_112();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test113
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_113();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test114
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_114();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test115
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_115();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test116
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_116();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test117
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_117();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test118
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_118();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test119
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_11900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_119();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test120
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_120();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test121
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_121();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test124
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_124();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test125
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_125();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   reflect10Test126
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_126();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test128
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_128();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test129
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_12900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_129();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test130
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_130();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test131
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_131();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test132
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_132();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test133
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_133();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test134
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_134();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test135
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_135();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test136
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_136();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test137
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_137();
      expect(result).assertFalse();
    });

    /**
     * @tc.name   reflect10Test138
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_138();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test139
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_13900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_139();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test140
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_140();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test141
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14100
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_141();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test142
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14200
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_142();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test143
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14300
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_143();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test144
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14400
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_144();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test145
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14500
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_145();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test146
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14600
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_146();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test147
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14700
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_147();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test148
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14800
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_148();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test149
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_14900
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_149();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   reflect10Test150
     * @tc.number SUB_BUILTINS_REFLECT10_TEST_15000
     * @tc.desc   test reflect ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reflect10Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test_ownKeys_150();
      expect(result).assertTrue();
    });
  })
}
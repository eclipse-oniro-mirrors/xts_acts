/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libAudioDecoder from 'libentry.so';

export default function NullCheckTest() {
  describe('NullCheckTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name   NULL_CHECK_001
     * @tc.number NULL_CHECK_001
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_001', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(0)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_002
     * @tc.number NULL_CHECK_002
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_002', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(1)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_003
     * @tc.number NULL_CHECK_003
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_003', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(2)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_004
     * @tc.number NULL_CHECK_004
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_004', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(3)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_005
     * @tc.number NULL_CHECK_005
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_005', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(4)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_006
     * @tc.number NULL_CHECK_006
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_006', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(5)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_007
     * @tc.number NULL_CHECK_007
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_007', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(6)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_008
     * @tc.number NULL_CHECK_008
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_008', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(7)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_009
     * @tc.number NULL_CHECK_009
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_009', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(8)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_010
     * @tc.number NULL_CHECK_010
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_010', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(9)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_011
     * @tc.number NULL_CHECK_011
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_011', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(10)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_012
     * @tc.number NULL_CHECK_012
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_012', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(11)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_013
     * @tc.number NULL_CHECK_013
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_013', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(12)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_014
     * @tc.number NULL_CHECK_014
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_014', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(13)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_015
     * @tc.number NULL_CHECK_015
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_015', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(14)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_016
     * @tc.number NULL_CHECK_016
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_016', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(15)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_017
     * @tc.number NULL_CHECK_017
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_017', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(16)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_018
     * @tc.number NULL_CHECK_018
     * @tc.desc   SetIntBuffer - format null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_018', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(17)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_019
     * @tc.number NULL_CHECK_019
     * @tc.desc   SetIntBuffer - key null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_019', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(18)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_020
     * @tc.number NULL_CHECK_020
     * @tc.desc   SetIntBuffer - addr null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_020', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(19)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_021
     * @tc.number NULL_CHECK_021
     * @tc.desc   SetIntBuffer - size is zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_021', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(20)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_022
     * @tc.number NULL_CHECK_022
     * @tc.desc   GetIntBuffer - format null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_022', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(21)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_023
     * @tc.number NULL_CHECK_023
     * @tc.desc   GetIntBuffer - key null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_023', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(22)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_024
     * @tc.number NULL_CHECK_024
     * @tc.desc   GetIntBuffer - addr null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_024', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(23)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_025
     * @tc.number NULL_CHECK_025
     * @tc.desc   GetIntBuffer - size null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_025', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(24)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_026
     * @tc.number NULL_CHECK_026
     * @tc.desc   QueryInputBuffer - codec null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_026', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(25)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_027
     * @tc.number NULL_CHECK_027
     * @tc.desc   QueryInputBuffer - index null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_027', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(26)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_028
     * @tc.number NULL_CHECK_028
     * @tc.desc   GetInputBuffer - codec null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_028', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(27)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_029
     * @tc.number NULL_CHECK_029
     * @tc.desc   QueryOutputBuffer - codec null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_029', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(28)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_030
     * @tc.number NULL_CHECK_030
     * @tc.desc   QueryOutputBuffer - index null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_030', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(29)).assertEqual(0);
    })

    /**
     * @tc.name   NULL_CHECK_031
     * @tc.number NULL_CHECK_031
     * @tc.desc   GetOutputBuffer - codec null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_031', Level.LEVEL0, () => {
      expect(libAudioDecoder.NULL_CHECK(30)).assertEqual(0);
    })
  })
}
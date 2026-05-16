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

export default function ParamCheckTest() {
  describe('ParamCheckTest', () => {
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
     * @tc.name   PARAM_CHECK_001
     * @tc.number PARAM_CHECK_001
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_001', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(0)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_002
     * @tc.number PARAM_CHECK_002
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_002', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(1)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_003
     * @tc.number PARAM_CHECK_003
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_003', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(2)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_004
     * @tc.number PARAM_CHECK_004
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_004', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(3)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_005
     * @tc.number PARAM_CHECK_005
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_005', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(4)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_006
     * @tc.number PARAM_CHECK_006
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_006', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(5)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_007
     * @tc.number PARAM_CHECK_007
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_007', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(6)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_008
     * @tc.number PARAM_CHECK_008
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_008', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(7)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_011
     * @tc.number PARAM_CHECK_011
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_011', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(8)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_012
     * @tc.number PARAM_CHECK_012
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_012', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(9)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_013
     * @tc.number PARAM_CHECK_013
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_013', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(10)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_014
     * @tc.number PARAM_CHECK_014
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_014', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(11)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_016
     * @tc.number PARAM_CHECK_016
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_016', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(12)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_017
     * @tc.number PARAM_CHECK_017
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_017', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(13)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_021
     * @tc.number PARAM_CHECK_021
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_021', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(14)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_022
     * @tc.number PARAM_CHECK_022
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_022', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(15)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_023
     * @tc.number PARAM_CHECK_023
     * @tc.desc   Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_023', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(16)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_024
     * @tc.number PARAM_CHECK_024
     * @tc.desc   Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_024', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(17)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_025
     * @tc.number PARAM_CHECK_025
     * @tc.desc   Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_WMAPRO) param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_025', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(18)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_026
     * @tc.number PARAM_CHECK_026
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_026', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(19)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_027
     * @tc.number PARAM_CHECK_027
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_027', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(20)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_028
     * @tc.number PARAM_CHECK_028
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_028', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(21)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_029
     * @tc.number PARAM_CHECK_029
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_029', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(22)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_030
     * @tc.number PARAM_CHECK_030
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_030', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(23)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_031
     * @tc.number PARAM_CHECK_031
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_031', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(24)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_032
     * @tc.number PARAM_CHECK_032
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_032', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(25)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_033
     * @tc.number PARAM_CHECK_033
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_033', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(26)).assertEqual(0);
    })

    /**
     * @tc.name   PARAM_CHECK_034
     * @tc.number PARAM_CHECK_034
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_034', Level.LEVEL0, () => {
      expect(libAudioDecoder.PARAM_CHECK(27)).assertEqual(0);
    })
  })
}


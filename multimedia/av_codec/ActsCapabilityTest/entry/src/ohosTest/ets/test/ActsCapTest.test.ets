import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libentry from "libentry.so"


export default function ActsCapTest() {
  describe('ActsCapTest', () => {
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
     * @tc.name   AUDIO_CAPABILITY_TEST_001
     * @tc.number AUDIO_CAPABILITY_TEST_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_001', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility1(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_002
     * @tc.number AUDIO_CAPABILITY_TEST_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_002', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility1(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_003
     * @tc.number AUDIO_CAPABILITY_TEST_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_003', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility1(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_004
     * @tc.number AUDIO_CAPABILITY_TEST_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_004', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility1(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_005
     * @tc.number AUDIO_CAPABILITY_TEST_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_005', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility2(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_006
     * @tc.number AUDIO_CAPABILITY_TEST_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_006', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility2(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_007
     * @tc.number AUDIO_CAPABILITY_TEST_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_007', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility2(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   AUDIO_CAPABILITY_TEST_008
     * @tc.number AUDIO_CAPABILITY_TEST_008
     * @tc.desc   check nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_CAPABILITY_TEST_008', Level.LEVEL2, () => {
      const result = libentry.AudioCapAbility2(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0010
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0010', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode1(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0011
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0011
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0011', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode1(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0012
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0012
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0012', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode1(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0013
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0013
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0013', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode1(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0014
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0014
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0014', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode1(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0015
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0015
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0015', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode2(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0016
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0016
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0016', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode2(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0017
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0017
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0017', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode2(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0018
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0018
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0018', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode2(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0019
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0019
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0019', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode2(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0020
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0020', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode3(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0021
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0021
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0021', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode3(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0022
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0022
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0022', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode3(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0023
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0023
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0023', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode3(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0024
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0024
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0024', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode3(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0025
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0025
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0025', Level.LEVEL1, () => {
      const result = libentry.VideoTemporalEncode4(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0026
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0026
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0026', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode4(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0027
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0027
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0027', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode4(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0028
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0028
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level2
     */
    it('VIDEO_TEMPORAL_ENCODE_API_0028', Level.LEVEL2, () => {
      const result = libentry.VideoTemporalEncode4(3);
      expect(result).assertEqual(0);
    })
  })
}
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMediaCppStandard from 'libmediacppstandard_test.so';

export default function ActsAudioDecEncNdkTest() {
  describe('ActsAudioDecEncNdkTest', () => {
    beforeAll(() => {})
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.AudioDecEncFuncTest(6);
      expect(result).assertEqual(0);
    })

  })
}

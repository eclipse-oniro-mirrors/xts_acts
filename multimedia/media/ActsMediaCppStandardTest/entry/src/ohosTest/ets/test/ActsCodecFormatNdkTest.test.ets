import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMediaCppStandard from 'libmediacppstandard_test.so';

export default function ActsCodecFormatNdkTest() {
  describe('ActsCodecFormatNdkTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0100
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0100', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.CodecFormatFuncTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0200
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0200', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.CodecFormatFuncTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0300
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0300', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.CodecFormatFuncTest(2);
      expect(result).assertEqual(0);
    })

  })
}

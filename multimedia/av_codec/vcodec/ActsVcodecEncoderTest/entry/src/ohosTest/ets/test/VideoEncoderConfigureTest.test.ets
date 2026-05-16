import hilog from '@ohos.hilog';
import testNapi from 'libvcodec_encoder_test.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function VideoEncoderConfigureTest() {
  describe('VideoEncoderConfigureTest', () => {
    beforeAll(() => {
      console.info('VideoEncoderConfigureTest beforeAll called');
    });

    afterAll(() => {
      console.info('VideoEncoderConfigureTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderConfigureTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderConfigureTest afterEach called');
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1800', Level.LEVEL2, async () => {
      console.info('VideoEncodeHevcCapability1800Test start');
      let result: number = await testNapi.runConfigureTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4000', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4000Test start');
      let result: number = await testNapi.runConfigureTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4400', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4400Test start');
      let result: number = await testNapi.runConfigureTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4400', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4410Test start');
      let result: number = await testNapi.runConfigureTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4700', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4700Test start');
      let result: number = await testNapi.runConfigureTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_4700', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4710Test start');
      let result: number = await testNapi.runConfigureTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5000', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5000Test start');
      let result: number = await testNapi.runConfigureTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_5000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_5000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_5000', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5010Test start');
      let result: number = await testNapi.runConfigureTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5100
     * @tc.desc   test cbrhq with normal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5100', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5100Test start');
      let result: number = await testNapi.runConfigureTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5200
     * @tc.desc   test cbrhq with incorrect parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CBRHQ_CAPABILITY_5200', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5200Test start');
      let result: number = await testNapi.runConfigureTest(9);
      expect(result).assertEqual(0);
    });
  });
}

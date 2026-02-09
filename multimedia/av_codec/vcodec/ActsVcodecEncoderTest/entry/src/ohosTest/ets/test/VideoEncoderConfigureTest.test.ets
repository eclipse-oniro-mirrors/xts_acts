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
     * @tc.name VideoEncodeHevcCapability1800Test
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeHevcCapability1800Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeHevcCapability1800Test start');
      let result: number = await testNapi.runConfigureTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability4000Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_4000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability4000Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4000Test start');
      let result: number = await testNapi.runConfigureTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability4400Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_4400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability4400Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4400Test start');
      let result: number = await testNapi.runConfigureTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability4410Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_4410
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability4410Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4410Test start');
      let result: number = await testNapi.runConfigureTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability4700Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_4700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability4700Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4700Test start');
      let result: number = await testNapi.runConfigureTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability4710Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_4710
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability4710Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability4710Test start');
      let result: number = await testNapi.runConfigureTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability5000Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_5000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability5000Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5000Test start');
      let result: number = await testNapi.runConfigureTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoEncodeCapability5010Test
     * @tc.number VIDEO_ENCODE_CAPABILITY_5010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoEncodeCapability5010Test', Level.LEVEL2, async () => {
      console.info('VideoEncodeCapability5010Test start');
      let result: number = await testNapi.runConfigureTest(7);
      expect(result).assertEqual(0);
    });
  });
}

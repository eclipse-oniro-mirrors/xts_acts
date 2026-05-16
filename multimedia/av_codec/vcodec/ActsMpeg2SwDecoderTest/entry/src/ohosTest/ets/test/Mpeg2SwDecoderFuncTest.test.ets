import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMpeg2SwDecoder from 'libmpeg2swdecoder_test.so';

export default function Mpeg2SwDecoderFuncTest() {
  describe('Mpeg2SwDecoderFuncTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010
     * @tc.desc   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2FuncTest(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020
     * @tc.desc   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020', Level.LEVEL0, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2FuncTest(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040
     * @tc.desc   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2FuncTest(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_BLANK_FRAME_0010
     * @tc.number VIDEO_DECODE_BLANK_FRAME_0010
     * @tc.desc   VIDEO_DECODE_BLANK_FRAME_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_BLANK_FRAME_0010', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeBlankFrameTest(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_DECODE_BLANK_ADD_0010
     * @tc.number VIDEO_DECODE_BLANK_ADD_0010
     * @tc.desc   VIDEO_DECODE_BLANK_ADD_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_BLANK_ADD_0010', Level.LEVEL2, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeBlankAddTest(0);
      expect(result).assertEqual(0);
      done();
    })

  })
}

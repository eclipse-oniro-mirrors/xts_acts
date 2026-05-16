import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libSwdecoderTest from 'libswdecoder_test.so';

export default function ActsFuncTest() {
  describe('ActsFuncTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_0200
     * @tc.number VIDEO_SWDEC_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_0200', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncCreateTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_0300
     * @tc.number VIDEO_SWDEC_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_SWDEC_FUNCTION_0300', Level.LEVEL0, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_0400
     * @tc.number VIDEO_SWDEC_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_SWDEC_FUNCTION_0400', Level.LEVEL0, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_0700
     * @tc.number VIDEO_SWDEC_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_0700', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_0800
     * @tc.number VIDEO_SWDEC_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_0800', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_4000
     * @tc.number VIDEO_SWDEC_FUNCTION_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_4000', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1000
     * @tc.number VIDEO_SWDEC_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_1000', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1100
     * @tc.number VIDEO_SWDEC_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDEC_FUNCTION_1100', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1200
     * @tc.number VIDEO_SWDEC_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_FUNCTION_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1300
     * @tc.number VIDEO_SWDEC_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_FUNCTION_1300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1400
     * @tc.number VIDEO_SWDEC_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_FUNCTION_1400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1500
     * @tc.number VIDEO_SWDEC_FUNCTION_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_FUNCTION_1500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDEC_FUNCTION_1600
     * @tc.number VIDEO_SWDEC_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_FUNCTION_1600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecFuncNdkTest(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW264_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_SW264_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SW264_FUNC_0010', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecSync264Test(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW264_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_SW264_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_SW264_FUNC_0020', Level.LEVEL0, async () => {
      const result = await libSwdecoderTest.SwdecSync264Test(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW264_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_SW264_FUNC_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SW264_FUNC_0040', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecSync264Test(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   VIDEO_SWDECODE_BLANK_FRAME_0010
     * @tc.number VIDEO_SWDECODE_BLANK_FRAME_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_SWDECODE_BLANK_FRAME_0010', Level.LEVEL1, async () => {
      const result = await libSwdecoderTest.SwdecBlankFrameTest(0);
      expect(result).assertEqual(0);
    })
  })
}

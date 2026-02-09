import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';

export default function VideoEncoderFuncTest2() {
  describe('VideoEncoderFuncTest2', () => {
    beforeAll(() => {
      console.info('VideoEncoderFuncTest2 beforeAll called');
      testNapi.initTests();
    });

    afterAll(() => {
      console.info('VideoEncoderFuncTest2 afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderFuncTest2 beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderFuncTest2 afterEach called');
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5100
     * @tc.number VIDEO_ENCODE_CAPABILITY_5100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5200
     * @tc.number VIDEO_ENCODE_CAPABILITY_5200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5300
     * @tc.number VIDEO_ENCODE_CAPABILITY_5300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5400
     * @tc.number VIDEO_ENCODE_CAPABILITY_5400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5500
     * @tc.number VIDEO_ENCODE_CAPABILITY_5500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5600
     * @tc.number VIDEO_ENCODE_CAPABILITY_5600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5700
     * @tc.number VIDEO_ENCODE_CAPABILITY_5700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5800
     * @tc.number VIDEO_ENCODE_CAPABILITY_5800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_5900
     * @tc.number VIDEO_ENCODE_CAPABILITY_5900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_5900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6000
     * @tc.number VIDEO_ENCODE_CAPABILITY_6000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6100
     * @tc.number VIDEO_ENCODE_CAPABILITY_6100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6200
     * @tc.number VIDEO_ENCODE_CAPABILITY_6200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6300
     * @tc.number VIDEO_ENCODE_CAPABILITY_6300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6400
     * @tc.number VIDEO_ENCODE_CAPABILITY_6400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6500
     * @tc.number VIDEO_ENCODE_CAPABILITY_6500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6600
     * @tc.number VIDEO_ENCODE_CAPABILITY_6600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6700
     * @tc.number VIDEO_ENCODE_CAPABILITY_6700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6800
     * @tc.number VIDEO_ENCODE_CAPABILITY_6800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_6900
     * @tc.number VIDEO_ENCODE_CAPABILITY_6900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_6900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7000
     * @tc.number VIDEO_ENCODE_CAPABILITY_7000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7100
     * @tc.number VIDEO_ENCODE_CAPABILITY_7100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7200
     * @tc.number VIDEO_ENCODE_CAPABILITY_7200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7300
     * @tc.number VIDEO_ENCODE_CAPABILITY_7300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7400
     * @tc.number VIDEO_ENCODE_CAPABILITY_7400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7500
     * @tc.number VIDEO_ENCODE_CAPABILITY_7500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7600
     * @tc.number VIDEO_ENCODE_CAPABILITY_7600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7700
     * @tc.number VIDEO_ENCODE_CAPABILITY_7700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7800
     * @tc.number VIDEO_ENCODE_CAPABILITY_7800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_7900
     * @tc.number VIDEO_ENCODE_CAPABILITY_7900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_7900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8000
     * @tc.number VIDEO_ENCODE_CAPABILITY_8000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8100
     * @tc.number VIDEO_ENCODE_CAPABILITY_8100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8200
     * @tc.number VIDEO_ENCODE_CAPABILITY_8200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_CAPABILITY_8300
     * @tc.number VIDEO_ENCODE_CAPABILITY_8300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_CAPABILITY_8300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0100
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0200
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0300
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0400
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.desc   VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0600
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0700
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_07
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_5200
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_5200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_5300
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_5300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_5400
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_5400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0800
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_0900
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_0900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1000
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1100
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(46);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1200
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(47);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1300
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(48);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1400
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(49);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1500
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(50);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1600
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(51);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1700
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(52);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_1900
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_1900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(53);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2000
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(54);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2100
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(55);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2200
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(56);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2300
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(57);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2400
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2400', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(58);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2500
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(59);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2600
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2600', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(60);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2700
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(61);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2800
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(62);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_2900
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_2900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_2900', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(63);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name VIDEO_ENCODE_HEVC_CAPABILITY_3000
     * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_ENCODE_HEVC_CAPABILITY_3000', Level.LEVEL2, async () => {
      let result: number = await testNapi.runFuncTest2(64);
      expect(result).assertEqual(0);
    });
  });
}

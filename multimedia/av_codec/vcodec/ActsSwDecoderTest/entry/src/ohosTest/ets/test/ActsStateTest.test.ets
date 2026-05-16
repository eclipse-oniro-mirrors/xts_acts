import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libSwdecoderTest from 'libswdecoder_test.so';

export default function ActsStateTest() {
  describe('ActsStateTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name   VIDEO_SWDEC_STATE_0100
     * @tc.number VIDEO_SWDEC_STATE_0100
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0101
     * @tc.number VIDEO_SWDEC_STATE_0101
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0101', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0200
     * @tc.number VIDEO_SWDEC_STATE_0200
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0300
     * @tc.number VIDEO_SWDEC_STATE_0300
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0400
     * @tc.number VIDEO_SWDEC_STATE_0400
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0500
     * @tc.number VIDEO_SWDEC_STATE_0500
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0600
     * @tc.number VIDEO_SWDEC_STATE_0600
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0700
     * @tc.number VIDEO_SWDEC_STATE_0700
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0800
     * @tc.number VIDEO_SWDEC_STATE_0800
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_0900
     * @tc.number VIDEO_SWDEC_STATE_0900
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1000
     * @tc.number VIDEO_SWDEC_STATE_1000
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1100
     * @tc.number VIDEO_SWDEC_STATE_1100
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1200
     * @tc.number VIDEO_SWDEC_STATE_1200
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1300
     * @tc.number VIDEO_SWDEC_STATE_1300
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1400
     * @tc.number VIDEO_SWDEC_STATE_1400
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1500
     * @tc.number VIDEO_SWDEC_STATE_1500
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1600
     * @tc.number VIDEO_SWDEC_STATE_1600
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1700
     * @tc.number VIDEO_SWDEC_STATE_1700
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1800
     * @tc.number VIDEO_SWDEC_STATE_1800
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_1900
     * @tc.number VIDEO_SWDEC_STATE_1900
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_1900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2000
     * @tc.number VIDEO_SWDEC_STATE_2000
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2100
     * @tc.number VIDEO_SWDEC_STATE_2100
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2200
     * @tc.number VIDEO_SWDEC_STATE_2200
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2300
     * @tc.number VIDEO_SWDEC_STATE_2300
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2400
     * @tc.number VIDEO_SWDEC_STATE_2400
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2500
     * @tc.number VIDEO_SWDEC_STATE_2500
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2600
     * @tc.number VIDEO_SWDEC_STATE_2600
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2700
     * @tc.number VIDEO_SWDEC_STATE_2700
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2800
     * @tc.number VIDEO_SWDEC_STATE_2800
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_2900
     * @tc.number VIDEO_SWDEC_STATE_2900
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_2900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_3000
     * @tc.number VIDEO_SWDEC_STATE_3000
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_3000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_3100
     * @tc.number VIDEO_SWDEC_STATE_3100
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_3100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_3200
     * @tc.number VIDEO_SWDEC_STATE_3200
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_3200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_3300
     * @tc.number VIDEO_SWDEC_STATE_3300
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_3300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_STATE_3400
     * @tc.number VIDEO_SWDEC_STATE_3400
     * @tc.desc   state test
     * @tc.type   STATE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_STATE_3400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecStateTest(34);
      expect(result).assertEqual(0);
    });
  });
}

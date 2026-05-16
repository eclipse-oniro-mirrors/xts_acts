import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libSwdecoderTest from 'libswdecoder_test.so';

export default function ActsApiTest() {
  describe('ActsApiTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    // SwdecApiIllegalParaTest: 30 cases
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3300
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0300
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0400
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1400
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_5000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_5000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_5000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_5100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_5100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_5100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0900
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_4100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_4100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_4100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2900
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiIllegalParaTest(29);
      expect(result).assertEqual(0);
    });

    // SwdecApiTest: 12 cases
    /**
     * @tc.name   VIDEO_SWDEC_API_0100
     * @tc.number VIDEO_SWDEC_API_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0200
     * @tc.number VIDEO_SWDEC_API_0200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0300
     * @tc.number VIDEO_SWDEC_API_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0400
     * @tc.number VIDEO_SWDEC_API_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0500
     * @tc.number VIDEO_SWDEC_API_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0600
     * @tc.number VIDEO_SWDEC_API_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0700
     * @tc.number VIDEO_SWDEC_API_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0800
     * @tc.number VIDEO_SWDEC_API_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0900
     * @tc.number VIDEO_SWDEC_API_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1000
     * @tc.number VIDEO_SWDEC_API_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1100
     * @tc.number VIDEO_SWDEC_API_1100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1200
     * @tc.number VIDEO_SWDEC_API_1200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecApiTest(11);
      expect(result).assertEqual(0);
    });

    // SwdecCapApiTest: 51 cases
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0100
     * @tc.number VIDEO_SWDEC_CAP_API_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0300
     * @tc.number VIDEO_SWDEC_CAP_API_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0400
     * @tc.number VIDEO_SWDEC_CAP_API_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(2);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0500
     * @tc.number VIDEO_SWDEC_CAP_API_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(3);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0600
     * @tc.number VIDEO_SWDEC_CAP_API_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(4);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0700
     * @tc.number VIDEO_SWDEC_CAP_API_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(5);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0800
     * @tc.number VIDEO_SWDEC_CAP_API_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(6);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0900
     * @tc.number VIDEO_SWDEC_CAP_API_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(7);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_1000
     * @tc.number VIDEO_SWDEC_CAP_API_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(8);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3100
     * @tc.number VIDEO_SWDEC_CAP_API_3100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(9);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3200
     * @tc.number VIDEO_SWDEC_CAP_API_3200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(10);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3300
     * @tc.number VIDEO_SWDEC_CAP_API_3300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(11);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3400
     * @tc.number VIDEO_SWDEC_CAP_API_3400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(12);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3500
     * @tc.number VIDEO_SWDEC_CAP_API_3500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(13);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3600
     * @tc.number VIDEO_SWDEC_CAP_API_3600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(14);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3700
     * @tc.number VIDEO_SWDEC_CAP_API_3700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(15);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3800
     * @tc.number VIDEO_SWDEC_CAP_API_3800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(16);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3900
     * @tc.number VIDEO_SWDEC_CAP_API_3900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(17);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4000
     * @tc.number VIDEO_SWDEC_CAP_API_4000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(18);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4100
     * @tc.number VIDEO_SWDEC_CAP_API_4100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(19);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4200
     * @tc.number VIDEO_SWDEC_CAP_API_4200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(20);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4300
     * @tc.number VIDEO_SWDEC_CAP_API_4300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(21);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4400
     * @tc.number VIDEO_SWDEC_CAP_API_4400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(22);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4500
     * @tc.number VIDEO_SWDEC_CAP_API_4500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(23);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4600
     * @tc.number VIDEO_SWDEC_CAP_API_4600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(24);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4700
     * @tc.number VIDEO_SWDEC_CAP_API_4700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(25);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4800
     * @tc.number VIDEO_SWDEC_CAP_API_4800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(26);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4900
     * @tc.number VIDEO_SWDEC_CAP_API_4900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(27);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5000
     * @tc.number VIDEO_SWDEC_CAP_API_5000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(28);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5100
     * @tc.number VIDEO_SWDEC_CAP_API_5100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(29);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5200
     * @tc.number VIDEO_SWDEC_CAP_API_5200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(30);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5300
     * @tc.number VIDEO_SWDEC_CAP_API_5300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(31);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_9400
     * @tc.number VIDEO_SWDEC_CAP_API_9400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_9400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(32);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5400
     * @tc.number VIDEO_SWDEC_CAP_API_5400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(33);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5500
     * @tc.number VIDEO_SWDEC_CAP_API_5500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(34);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5600
     * @tc.number VIDEO_SWDEC_CAP_API_5600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(35);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5700
     * @tc.number VIDEO_SWDEC_CAP_API_5700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(36);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5800
     * @tc.number VIDEO_SWDEC_CAP_API_5800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(37);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5900
     * @tc.number VIDEO_SWDEC_CAP_API_5900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(38);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6000
     * @tc.number VIDEO_SWDEC_CAP_API_6000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(39);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6100
     * @tc.number VIDEO_SWDEC_CAP_API_6100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(40);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6200
     * @tc.number VIDEO_SWDEC_CAP_API_6200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(41);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6300
     * @tc.number VIDEO_SWDEC_CAP_API_6300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(42);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6400
     * @tc.number VIDEO_SWDEC_CAP_API_6400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(43);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6500
     * @tc.number VIDEO_SWDEC_CAP_API_6500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(44);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6600
     * @tc.number VIDEO_SWDEC_CAP_API_6600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(45);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6700
     * @tc.number VIDEO_SWDEC_CAP_API_6700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(46);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6800
     * @tc.number VIDEO_SWDEC_CAP_API_6800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(47);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6900
     * @tc.number VIDEO_SWDEC_CAP_API_6900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(48);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_7000
     * @tc.number VIDEO_SWDEC_CAP_API_7000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_7000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(49);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_7100
     * @tc.number VIDEO_SWDEC_CAP_API_7100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_7100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecCapApiTest(50);
      expect(result).assertEqual(0);
    });

    // SwdecOtherCodecIllegalTest: 3 cases
    /**
     * @tc.name   VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecOtherCodecIllegalTest(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecOtherCodecIllegalTest(1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_H263SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_H263SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_H263SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.SwdecOtherCodecIllegalTest(2);
      expect(result).assertEqual(0);
    });
  });
}

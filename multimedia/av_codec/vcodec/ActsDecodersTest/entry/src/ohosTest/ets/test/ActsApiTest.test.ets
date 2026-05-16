/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libdecoder_test.so';

const TAG = 'ActsApiTest';
const DOMAIN = 0x0001;
const TEST_SUCCESS = 0;
const TEST_FAILED = -1;

export default function actsApiTest() {
  describe('ActsApiTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder API test suite started');
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder API test suite completed');
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case started');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case completed');
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0100
     * @tc.desc    Test OH_AVCodec_GetCapability for VC1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0100', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0100');
      let result = testNapi.apitest(0);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0200
     * @tc.desc    Test OH_AVCodec_GetCapabilityByCategory
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0200', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0200');
      let result = testNapi.apitest(1);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0300
     * @tc.desc    Test OH_AVCapability_GetVideoWidthRange
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0300', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0300');
      let result = testNapi.apitest(2);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0400
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0400
     * @tc.desc    Test OH_AVCapability_GetVideoSupportedPixelFormats
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0400', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0400');
      let result = testNapi.apitest(3);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0500
     * @tc.desc    Test pixel format validation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0500', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0500');
      let result = testNapi.apitest(4);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0600
     * @tc.desc    Test OH_AVCapability_GetSupportedProfiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0600', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0600');
      let result = testNapi.apitest(5);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0700
     * @tc.desc    Test OH_AVCapability_GetSupportedLevelsForProfile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0700', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0700');
      let result = testNapi.apitest(6);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0800
     * @tc.desc    Test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0800', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_0800');
      let result = testNapi.apitest(7);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0900
     * @tc.desc    Test MSVIDEO1 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0900', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0900');
      let result = testNapi.apitest(8);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1000
     * @tc.desc    Test WMV3 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1000', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1000');
      let result = testNapi.apitest(9);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1100
     * @tc.desc    Test WMV3 levels for profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1100');
      let result = testNapi.apitest(10);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1200
     * @tc.desc    Test WMV3 profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1200', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_1200');
      let result = testNapi.apitest(11);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_0100
     * @tc.desc    Test VP8 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_0100');
      let result = testNapi.apitest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0100
     * @tc.desc    Test VP9 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0100');
      let result = testNapi.apitest(13);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0100
     * @tc.desc    Test AV1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0100');
      let result = testNapi.apitest(14);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_0100
     * @tc.desc    Test RV30 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_0100');
      let result = testNapi.apitest(15);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_0100
     * @tc.desc    Test RV40 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_0100');
      let result = testNapi.apitest(16);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_0100
     * @tc.desc    Test MJPEG decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_0100');
      let result = testNapi.apitest(17);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0100
     * @tc.desc    Test MSVIDEO1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_0100');
      let result = testNapi.apitest(18);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_0100
     * @tc.desc    Test RAWVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_0100');
      let result = testNapi.apitest(19);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_0100
     * @tc.desc    Test MPEG1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_0100');
      let result = testNapi.apitest(20);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0100
     * @tc.desc    Test WVC1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0100');
      let result = testNapi.apitest(21);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_0100
     * @tc.desc    Test WMV3 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_0100');
      let result = testNapi.apitest(22);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_0100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_0100
     * @tc.desc    Test DVVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_0100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_0100');
      let result = testNapi.apitest(23);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0130
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0130
     * @tc.desc    Test VP9 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0130', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_0130');
      let result = testNapi.apitest(24);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0140
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0140
     * @tc.desc    Test AV1 decoder profile and level support (part 1)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0140', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0140');
      let result = testNapi.apitest(25);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0150
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0150
     * @tc.desc    Test AV1 decoder profile and level support (part 2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0150', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0150');
      let result = testNapi.apitest(26);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0160
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0160
     * @tc.desc    Test WVC1 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0160', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_0160');
      let result = testNapi.apitest(27);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0170
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0170
     * @tc.desc    Test AV1 decoder supported profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0170', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_0170');
      let result = testNapi.apitest(28);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0200
     * @tc.desc    Obtain a list of supported capabilities and their names for the video encoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0200', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0200');
      let result = testNapi.apitest(29);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0300
     * @tc.desc    Obtain a list of supported capabilities and their names for the video decoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0300', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0300');
      let result = testNapi.apitest(30);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_0400
     * @tc.name    SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_0400
     * @tc.desc    Obtain a list of supported capabilities and their names for the audio encoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_0400', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_0400');
      let result = testNapi.apitest(31);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_0500
     * @tc.name    SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_0500
     * @tc.desc    Obtain a list of supported capabilities and their names for the audio decoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_0500', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_0500');
      let result = testNapi.apitest(32);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0600
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0600', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_0600');
      let result = testNapi.apitest(33);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0700
     * @tc.desc    Check the secure decoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0700', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0700');
      let result = testNapi.apitest(34);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0800
     * @tc.desc    Check the mimetype decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0800', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0800');
      let result = testNapi.apitest(35);
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0900
     * @tc.desc    Check the mimetype decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0900', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_0900');
      let result = testNapi.apitest(36);
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_1000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_1000
     * @tc.desc    Check the secure decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_1000', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_1000');
      let result = testNapi.apitest(37);
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_1100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_1100
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_1100', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_1100');
      let result = testNapi.apitest(38);
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}

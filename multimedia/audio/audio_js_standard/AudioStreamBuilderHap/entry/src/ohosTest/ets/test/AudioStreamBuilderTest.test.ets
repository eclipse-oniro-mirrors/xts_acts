/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import testNapi from 'libaudio_stream_builder_test.so';

const TAG = 'AudioStreamBuilderTest';
const DOMAIN = 0x0001;
const TEST_SUCCESS = 0;
const TEST_FAILURE = -1;

export default function audioStreamBuilderTest() {
  describe('AudioStreamBuilderTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'AudioStreamBuilder test suite started');
      hilog.info(DOMAIN, TAG, 'testNapi object: ' + JSON.stringify(Object.keys(testNapi)));
      hilog.info(DOMAIN, TAG, 'audioStreamBuilderTest exists: ' + 
        (typeof testNapi.audioStreamBuilderTest !== 'undefined'));
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'AudioStreamBuilder test suite completed');
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case started');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case completed');
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_001
     * @tc.desc    Create audio stream builder with renderer type and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_Create_001');
      let result = testNapi.audioStreamBuilderTest(0);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_002
     * @tc.desc    Create audio stream builder with capturer type and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_CREATE_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_Create_002');
      let result = testNapi.audioStreamBuilderTest(1);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_DESTROY_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_DESTROY_001
     * @tc.desc    Destroy nullptr builder and verify error handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_DESTROY_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_Destroy_001');
      let result = testNapi.audioStreamBuilderTest(2);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_001
     * @tc.desc    Set sampling rate to 48000Hz and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_001');
      let result = testNapi.audioStreamBuilderTest(3);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_002
     * @tc.desc    Set sampling rate to 44100Hz and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_002');
      let result = testNapi.audioStreamBuilderTest(4);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_003
     * @tc.desc    Set sampling rate to 88200Hz and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_003');
      let result = testNapi.audioStreamBuilderTest(5);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_004
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_004
     * @tc.desc    Set channel count to 1 and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_004', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_004');
      let result = testNapi.audioStreamBuilderTest(6);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_005
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_005
     * @tc.desc    Set channel count to 16 and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_005', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_005');
      let result = testNapi.audioStreamBuilderTest(7);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_006
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_006
     * @tc.desc    Set invalid channel count and verify error handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_006', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_006');
      let result = testNapi.audioStreamBuilderTest(8);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_007
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_007
     * @tc.desc    Set encoding type to RAW and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_007', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_007');
      let result = testNapi.audioStreamBuilderTest(9);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_008
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_008
     * @tc.desc    Set renderer info on capturer type and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_008', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_008');
      let result = testNapi.audioStreamBuilderTest(10);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_009
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_009
     * @tc.desc    Set renderer usage to VOICE_COMMUNICATION and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_009', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_009');
      let result = testNapi.audioStreamBuilderTest(11);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_010
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_010
     * @tc.desc    Set renderer info on capturer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_010', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_010');
      let result = testNapi.audioStreamBuilderTest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_011
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_011
     * @tc.desc    Set renderer callback and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_011', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_011');
      let result = testNapi.audioStreamBuilderTest(13);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_012
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_012
     * @tc.desc    Set renderer callback on capturer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_012', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_012');
      let result = testNapi.audioStreamBuilderTest(14);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_013
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_013
     * @tc.desc    Set capturer source to MIC and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_013', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_013');
      let result = testNapi.audioStreamBuilderTest(15);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_014
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_014
     * @tc.desc    Set capturer source to VOICE_RECOGNITION and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_014', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_014');
      let result = testNapi.audioStreamBuilderTest(16);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_015
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_015
     * @tc.desc    Set capturer info on renderer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_015', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_015');
      let result = testNapi.audioStreamBuilderTest(17);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_016
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_016
     * @tc.desc    Set capturer callback and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_016', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_016');
      let result = testNapi.audioStreamBuilderTest(18);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_017
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_017
     * @tc.desc    Set capturer callback on renderer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_017', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_017');
      let result = testNapi.audioStreamBuilderTest(19);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_018
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_018
     * @tc.desc    Set sampling rate to 176400Hz and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_018', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_018');
      let result = testNapi.audioStreamBuilderTest(20);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_019
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_019
     * @tc.desc    Set sampling rate to 192000Hz and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_019', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_019');
      let result = testNapi.audioStreamBuilderTest(21);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_020
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_020
     * @tc.desc    Set invalid sampling rate and verify error handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_PARAMETER_020', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetParameter_020');
      let result = testNapi.audioStreamBuilderTest(22);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_001
     * @tc.desc    Set renderer privacy on capturer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererPrivacy_001');
      let result = testNapi.audioStreamBuilderTest(23);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_002
     * @tc.desc    Set renderer privacy to PUBLIC and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererPrivacy_002');
      let result = testNapi.audioStreamBuilderTest(24);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_003
     * @tc.desc    Set renderer privacy to PRIVATE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_PRIVACY_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererPrivacy_003');
      let result = testNapi.audioStreamBuilderTest(25);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_001
     * @tc.desc    Set sample format to U8 and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetSampleFormat_001');
      let result = testNapi.audioStreamBuilderTest(26);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_002
     * @tc.desc    Set sample format to S16LE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetSampleFormat_002');
      let result = testNapi.audioStreamBuilderTest(27);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_003
     * @tc.desc    Set sample format to S24LE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetSampleFormat_003');
      let result = testNapi.audioStreamBuilderTest(28);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_004
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_004
     * @tc.desc    Set sample format to S32LE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_004', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetSampleFormat_004');
      let result = testNapi.audioStreamBuilderTest(29);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_005
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_005
     * @tc.desc    Set sample format to S32LE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_SAMPLE_FORMAT_005', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetSampleFormat_005');
      let result = testNapi.audioStreamBuilderTest(30);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_LATENCY_MODE_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_LATENCY_MODE_001
     * @tc.desc    Set latency mode to NORMAL and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_LATENCY_MODE_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetLatencyMode_001');
      let result = testNapi.audioStreamBuilderTest(31);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_001
     * @tc.desc    Set invalid capturer source and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetCapturerInfo_001');
      let result = testNapi.audioStreamBuilderTest(32);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_002
     * @tc.desc    Set capturer source to VOICE_COMMUNICATION and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CAPTURER_INFO_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetCapturerInfo_002');
      let result = testNapi.audioStreamBuilderTest(33);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_001
     * @tc.desc    Set renderer usage to UNKNOWN and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererInfo_001');
      let result = testNapi.audioStreamBuilderTest(34);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_002
     * @tc.desc    Set renderer usage to MUSIC and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererInfo_002');
      let result = testNapi.audioStreamBuilderTest(35);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_003
     * @tc.desc    Set renderer usage to MUSIC and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INFO_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererInfo_003');
      let result = testNapi.audioStreamBuilderTest(36);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CHANNEL_LAYOUT_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CHANNEL_LAYOUT_001
     * @tc.desc    Set channel layout to UNKNOWN and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_CHANNEL_LAYOUT_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetChannelLayout_001');
      let result = testNapi.audioStreamBuilderTest(37);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_WRITE_DATA_WITH_METADATA_CALLBACK_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_WRITE_DATA_WITH_METADATA_CALLBACK_001
     * @tc.desc    Set write data with metadata callback and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_WRITE_DATA_WITH_METADATA_CALLBACK_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback_001');
      let result = testNapi.audioStreamBuilderTest(38);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_001
     * @tc.desc    Set interrupt mode with nullptr builder and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetInterruptMode_001');
      let result = testNapi.audioStreamBuilderTest(39);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_002
     * @tc.desc    Set interrupt mode to SHARE and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetInterruptMode_002');
      let result = testNapi.audioStreamBuilderTest(40);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_003
     * @tc.desc    Set interrupt mode to INDEPENDENT and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetInterruptMode_003');
      let result = testNapi.audioStreamBuilderTest(41);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_006
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_006
     * @tc.desc    Set invalid interrupt mode and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_INTERRUPT_MODE_006', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetInterruptMode_006');
      let result = testNapi.audioStreamBuilderTest(42);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_004
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_004
     * @tc.desc    Set INDEPENDENT and SHARE modes on different builders
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_004', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererInterruptMode_004');
      let result = testNapi.audioStreamBuilderTest(43);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_005
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_005
     * @tc.desc    Switch between SHARE and INDEPENDENT modes and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_INTERRUPT_MODE_005', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererInterruptMode_005');
      let result = testNapi.audioStreamBuilderTest(44);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_001
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_001
     * @tc.desc    Set renderer write data callback returning VALID and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererWriteDataCallback_001');
      let result = testNapi.audioStreamBuilderTest(45);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_002
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_002
     * @tc.desc    Set renderer write data callback returning INVALID and verify success
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererWriteDataCallback_002');
      let result = testNapi.audioStreamBuilderTest(46);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_003
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_003
     * @tc.desc    Set renderer write data callback on capturer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererWriteDataCallback_003');
      let result = testNapi.audioStreamBuilderTest(47);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_004
     * @tc.name    SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_004
     * @tc.desc    Set renderer write data callback on capturer and verify error
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_004', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test OH_AudioStreamBuilder_SetRendererWriteDataCallback_004');
      let result = testNapi.audioStreamBuilderTest(48);
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}

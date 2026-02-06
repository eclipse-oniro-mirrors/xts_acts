/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AudioKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function AudioTest() {
  describe('AudioTest', () => {

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_START_0100
     * @tc.name testMultimediaAudioCapturerStart0100
     * @tc.desc Testing OH_AudioCapturer_Start returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerStart0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_START_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureStartInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PAUSE_0100
     * @tc.name testMultimediaAudioCapturerPause0100
     * @tc.desc Testing OH_AudioCapturer_Pause returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_PAUSE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCapturePauseInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_STOP_0100
     * @tc.name testMultimediaAudioCapturerStop0100
     * @tc.desc Testing OH_AudioCapturer_Stop returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureStopInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_FLUSH_0100
     * @tc.name testMultimediaAudioCapturerFlush0100
     * @tc.desc Testing OH_AudioCapturer_Flush returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerFlush0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_FLUSH_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureFlushInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTSTATE_0100
     * @tc.name testMultimediaAudioCapturerGetCurrentState0100
     * @tc.desc Testing OH_AudioCapturer_GetCurrentState returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetCurrentState0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTSTATE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetCurrentStateInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETLATENCYMODE_0100
     * @tc.name testMultimediaAudioCapturerGetLatencyMode0100
     * @tc.desc Testing OH_AudioCapturer_GetLatencyMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetLatencyMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETLATENCYMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetLatencyModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSTREAMID_0100
     * @tc.name testMultimediaAudioCapturerGetStreamId0100
     * @tc.desc Testing OH_AudioCapturer_GetStreamId returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetStreamId0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSTREAMID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetStreamIdInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSAMPLINGRATE_0100
     * @tc.name testMultimediaAudioCapturerGetSamplingRate0100
     * @tc.desc Testing OH_AudioCapturer_GetSamplingRate returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetSamplingRate0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSAMPLINGRATE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetSamplingRateInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCHANNELCOUNT_0100
     * @tc.name testMultimediaAudioCapturerGetChannelCount0100
     * @tc.desc Testing OH_AudioCapturer_GetChannelCount returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetChannelCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCHANNELCOUNT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetChannelCountInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSAMPLEFORMAT_0100
     * @tc.name testMultimediaAudioCapturerGetSampleFormat0100
     * @tc.desc Testing OH_AudioCapturer_GetSampleFormat returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetSampleFormat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETSAMPLEFORMAT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetSampleFormatInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETENCODINGTYPE_0100
     * @tc.name testMultimediaAudioCapturerGetEncodingType0100
     * @tc.desc Testing OH_AudioCapturer_GetEncodingType returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetEncodingType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETENCODINGTYPE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetEncodingTypeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCAPUTURERINFO_0100
     * @tc.name testMultimediaAudioCapturerGetCapturerInfo0100
     * @tc.desc Testing OH_AudioCapturer_GetCapturerInfo returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetCapturerInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCAPUTURERINFO_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetCapturerInfoInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETFRAMESIZEINCALLBACK_0100
     * @tc.name testMultimediaAudioCapturerGetFrameSizeInCallback0100
     * @tc.desc Testing OH_AudioCapturer_GetFrameSizeInCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetFrameSizeInCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETFRAMESIZEINCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetFrameSizeInCallbackInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETTIMESTAMP_0100
     * @tc.name testMultimediaAudioCapturerGetTimestamp0100
     * @tc.desc Testing OH_AudioCapturer_GetTimestamp returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetTimestamp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETTIMESTAMP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetTimestampInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETFRAMESREAD_0100
     * @tc.name testMultimediaAudioCapturerGetFramesRead0100
     * @tc.desc Testing OH_AudioCapturer_GetFramesRead returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetFramesRead0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETFRAMESREAD_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetFramesReadInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETOVERFLOWCOUNT_0100
     * @tc.name testMultimediaAudioCapturerGetOverflowCount0100
     * @tc.desc Testing OH_AudioCapturer_GetOverflowCount returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioCapturerGetOverflowCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_GETOVERFLOWCOUNT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureGetOverflowCountInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_START_0100
     * @tc.name testMultimediaAudioRendererStart0100
     * @tc.desc Testing OH_AudioRenderer_Start returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererStart0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_START_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererStartInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PAUSE_0100
     * @tc.name testMultimediaAudioRendererPause0100
     * @tc.desc Testing OH_AudioRenderer_Pause returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_PAUSE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererPauseInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_STOP_0100
     * @tc.name testMultimediaAudioRendererStop0100
     * @tc.desc Testing OH_AudioRenderer_Stop returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererStopInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_FLUSH_0100
     * @tc.name testMultimediaAudioRendererFlush0100
     * @tc.desc Testing OH_AudioRenderer_Flush returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererFlush0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_FLUSH_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererFlushInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTSTATE_0100
     * @tc.name testMultimediaAudioRendererGetCurrentState0100
     * @tc.desc Testing OH_AudioRenderer_GetCurrentState returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetCurrentState0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTSTATE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetCurrentStateInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSAMPLINGRATE_0100
     * @tc.name testMultimediaAudioRendererGetSamplingRate0100
     * @tc.desc Testing OH_AudioRenderer_GetSamplingRate returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetSamplingRate0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSAMPLINGRATE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetSamplingRateInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSTREAMID_0100
     * @tc.name testMultimediaAudioRendererGetStreamId0100
     * @tc.desc Testing OH_AudioRenderer_GetStreamId returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetStreamId0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSTREAMID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetStreamIdInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELCOUNT_0100
     * @tc.name testMultimediaAudioRendererGetChannelCount0100
     * @tc.desc Testing OH_AudioRenderer_GetChannelCount returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetChannelCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELCOUNT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetChannelCountInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSAMPLEFORMAT_0100
     * @tc.name testMultimediaAudioRendererGetSampleFormat0100
     * @tc.desc Testing OH_AudioRenderer_GetSampleFormat returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetSampleFormat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSAMPLEFORMAT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetSampleFormatInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETLATENCYMODE_0100
     * @tc.name testMultimediaAudioRendererGetLatencyMode0100
     * @tc.desc Testing OH_AudioRenderer_GetLatencyMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetLatencyMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETLATENCYMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetLatencyModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERINFO_0100
     * @tc.name testMultimediaAudioRendererGetRendererInfo0100
     * @tc.desc Testing OH_AudioRenderer_GetRendererInfo returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetRendererInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERINFO_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetRendererInfoInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETENCODINGTYPE_0100
     * @tc.name testMultimediaAudioRendererGetEncodingType0100
     * @tc.desc Testing OH_AudioRenderer_GetEncodingType returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetEncodingType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETENCODINGTYPE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetEncodingTypeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETFRAMESWRITTEN_0100
     * @tc.name testMultimediaAudioRendererGetFramesWritten0100
     * @tc.desc Testing OH_AudioRenderer_GetFramesWritten returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetFramesWritten0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETFRAMESWRITTEN_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetFramesWrittenInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETTIMESTAMP_0100
     * @tc.name testMultimediaAudioRendererGetTimestamp0100
     * @tc.desc Testing OH_AudioRenderer_GetTimestamp returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetTimestamp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETTIMESTAMP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetTimestampInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETTIMESTAMP_0200
     * @tc.name testMultimediaAudioRendererGetTimestamp0200
     * @tc.desc Test OH_AudioRenderer_GetTimestamp error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetTimestamp0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETTIMESTAMP_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetTimestampIllegalState();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETFRAMESIZEINCALLBACK_0100
     * @tc.name testMultimediaAudioRendererGetFrameSizeInCallback0100
     * @tc.desc Testing OH_AudioRenderer_GetFrameSizeInCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetFrameSizeInCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETFRAMESIZEINCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetFrameSizeInCallbackInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSPEED_0100
     * @tc.name testMultimediaAudioRendererGetSpeed0100
     * @tc.desc Testing OH_AudioRenderer_GetSpeed returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetSpeed0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSPEED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetSpeedInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETSPEED_0100
     * @tc.name testMultimediaAudioRendererSetSpeed0100
     * @tc.desc Testing OH_AudioRenderer_SetSpeed returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetSpeed0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETSPEED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetSpeedInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUME_0100
     * @tc.name testMultimediaAudioRendererSetVolume0100
     * @tc.desc Testing OH_AudioRenderer_SetVolume returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetVolume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetVolumeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUME_0200
     * @tc.name testMultimediaAudioRendererSetVolume0200
     * @tc.desc Testing OH_AudioRenderer_SetVolume returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetVolume0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUME_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetVolumeSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0100
     * @tc.name testMultimediaAudioRendererSetVolumeWithRamp0100
     * @tc.desc Testing OH_AudioRenderer_SetVolumeWithRamp returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetVolumeWithRamp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetVolumeWithRampInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0200
     * @tc.name testMultimediaAudioRendererSetVolumeWithRamp0200
     * @tc.desc Testing OH_AudioRenderer_SetVolumeWithRamp returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetVolumeWithRamp0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetVolumeWithRampSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETVOLUME_0100
     * @tc.name testMultimediaAudioRendererGetVolume0100
     * @tc.desc Testing OH_AudioRenderer_GetVolume returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetVolume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETVOLUME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetVolumeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETVOLUME_0200
     * @tc.name testMultimediaAudioRendererGetVolume0200
     * @tc.desc Testing OH_AudioRenderer_GetVolume returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetVolume0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETVOLUME_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetVolumeSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETMARKPOSITION_0100
     * @tc.name testMultimediaAudioRendererSetMarkPosition0100
     * @tc.desc Testing OH_AudioRenderer_SetMarkPosition returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetMarkPosition0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETMARKPOSITION_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetMarkPositionInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETMARKPOSITION_0200
     * @tc.name testMultimediaAudioRendererSetMarkPosition0200
     * @tc.desc Testing OH_AudioRenderer_SetMarkPosition returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetMarkPosition0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETMARKPOSITION_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetMarkPositionSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_CANCELMARK_0100
     * @tc.name testMultimediaAudioRendererCancelMark0100
     * @tc.desc Testing OH_AudioRenderer_CancelMark returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererCancelMark0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_CANCELMARK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererCancelMarkInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_CANCELMARK_0200
     * @tc.name testMultimediaAudioRendererCancelMark0200
     * @tc.desc Testing OH_AudioRenderer_CancelMark returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererCancelMark0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_CANCELMARK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererCancelMarkSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_0100
     * @tc.name testMultimediaAudioRendererGetUnderflowCount0100
     * @tc.desc Testing OH_AudioRenderer_GetUnderflowCount returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetUnderflowCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetUnderflowCountInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_0200
     * @tc.name testMultimediaAudioRendererGetUnderflowCount0200
     * @tc.desc Testing OH_AudioRenderer_GetUnderflowCount returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetUnderflowCount0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetUnderflowCountSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELLAYOUT_0100
     * @tc.name testMultimediaAudioRendererGetChannelLayout0100
     * @tc.desc Testing OH_AudioRenderer_GetChannelLayout returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetChannelLayout0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELLAYOUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetChannelLayoutInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELLAYOUT_0200
     * @tc.name testMultimediaAudioRendererGetChannelLayout0200
     * @tc.desc Testing OH_AudioRenderer_GetChannelLayout returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetChannelLayout0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETCHANNELLAYOUT_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetChannelLayoutSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETEFFECTMODE_0100
     * @tc.name testMultimediaAudioRendererGetEffectMode0100
     * @tc.desc Testing OH_AudioRenderer_GetEffectMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetEffectMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETEFFECTMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetEffectModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETEFFECTMODE_0200
     * @tc.name testMultimediaAudioRendererGetEffectMode0200
     * @tc.desc Testing OH_AudioRenderer_GetEffectMode returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetEffectMode0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETEFFECTMODE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetEffectModeSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETEFFECTMODE_0100
     * @tc.name testMultimediaAudioRendererSetEffectMode0100
     * @tc.desc Testing OH_AudioRenderer_SetEffectMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetEffectMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETEFFECTMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetEffectModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETEFFECTMODE_0200
     * @tc.name testMultimediaAudioRendererSetEffectMode0200
     * @tc.desc Testing OH_AudioRenderer_SetEffectMode returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetEffectMode0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETEFFECTMODE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetEffectModeSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERPRIVACY_0100
     * @tc.name testMultimediaAudioRendererGetRendererPrivacy0100
     * @tc.desc Testing OH_AudioRenderer_GetRendererPrivacy returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetRendererPrivacy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERPRIVACY_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetRendererPrivacyInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETSILENTMODEANDMIXWITHOTHERS_0100
     * @tc.name testMultimediaAudioRendererSetSilentModeAndMixWithOthers0100
     * @tc.desc Testing OH_AudioRenderer_SetSilentModeAndMixWithOthers returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetSilentModeAndMixWithOthers0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETSILENTMODEANDMIXWITHOTHERS_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetSilentModeAndMixWithOthersInvPar();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETSILENTMODEANDMIXWITHOTHERS_0200
     * @tc.name testMultimediaAudioRendererSetSilentModeAndMixWithOthers0200
     * @tc.desc Testing OH_AudioRenderer_SetSilentModeAndMixWithOthers returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetSilentModeAndMixWithOthers0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETSILENTMODEANDMIXWITHOTHERS_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetSilentModeAndMixWithOthersSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSILENTMODEANDMIXWITHOTHERS_0100
     * @tc.name testMultimediaAudioRendererGetSilentModeAndMixWithOthers0100
     * @tc.desc Testing OH_AudioRenderer_GetSilentModeAndMixWithOthers returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetSilentModeAndMixWithOthers0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSILENTMODEANDMIXWITHOTHERS_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetSilentModeAndMixWithOthersInvPar();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSILENTMODEANDMIXWITHOTHERS_0200
     * @tc.name testMultimediaAudioRendererGetSilentModeAndMixWithOthers0200
     * @tc.desc Testing OH_AudioRenderer_GetSilentModeAndMixWithOthers returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetSilentModeAndMixWithOthers0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETSILENTMODEANDMIXWITHOTHERS_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetSilentModeAndMixWithOthersSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETDEFAULTOUTPUTDEVICE_0100
     * @tc.name testMultimediaAudioRendererSetDefaultOutputDevice0100
     * @tc.desc Testing OH_AudioRenderer_SetDefaultOutputDevice returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetDefaultOutputDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETDEFAULTOUTPUTDEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetDefaultOutputDeviceInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETDEFAULTOUTPUTDEVICE_0200
     * @tc.name testMultimediaAudioRendererSetDefaultOutputDevice0200
     * @tc.desc Testing OH_AudioRenderer_SetDefaultOutputDevice returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetDefaultOutputDevice0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETDEFAULTOUTPUTDEVICE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetDefaultOutputDeviceSuccess();
          if (result == 2) {
            console.info(`====>${LOG_NAME} result: ` + result);
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETAUDIOTIMESTAMPINFO_0100
     * @tc.name testMultimediaAudioRendererGetAudioTimestampInfo0100
     * @tc.desc Testing OH_AudioRenderer_GetAudioTimestampInfo returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetAudioTimestampInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETAUDIOTIMESTAMPINFO_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetAudioTimestampInfoInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETLOUDNESSGAIN_0100
     * @tc.name testMultimediaAudioRendererSetLoudnessGain0100
     * @tc.desc Testing OH_AudioRenderer_SetLoudnessGain returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetLoudnessGain0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETLOUDNESSGAIN_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetLoudnessGainInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETLOUDNESSGAIN_0200
     * @tc.name testMultimediaAudioRendererSetLoudnessGain0200
     * @tc.desc Testing OH_AudioRenderer_SetLoudnessGain returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererSetLoudnessGain0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETLOUDNESSGAIN_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererSetLoudnessGainSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETLOUDNESSGAIN_0100
     * @tc.name testMultimediaAudioRendererGetLoudnessGain0100
     * @tc.desc Testing OH_AudioRenderer_GetLoudnessGain returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetLoudnessGain0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETLOUDNESSGAIN_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetLoudnessGainInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETLOUDNESSGAIN_0200
     * @tc.name testMultimediaAudioRendererGetLoudnessGain0200
     * @tc.desc Testing OH_AudioRenderer_GetLoudnessGain returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRendererGetLoudnessGain0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETLOUDNESSGAIN_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRendererGetLoudnessGainSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETSAMPLEFORMAT_0100
     * @tc.name testMultimediaAudioStreamSetSampleFormat0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetSampleFormat returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetSampleFormat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETSAMPLEFORMAT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetSampleFormatInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETENCODINGTYPE_0100
     * @tc.name testMultimediaAudioStreamSetEncodingType0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetEncodingType returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetEncodingType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETENCODINGTYPE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetEncodingTypeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETLATENCYMODE_0100
     * @tc.name testMultimediaAudioStreamSetLatencyMode0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetLatencyMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetLatencyMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETLATENCYMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetLatencyModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCHANNNELLAYOUT_0100
     * @tc.name testMultimediaAudioStreamSetChannelLayout0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetChannelLayout returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetChannelLayout0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCHANNNELLAYOUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetChannelLayoutInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCHANNELLAYOUT_0200
     * @tc.name testMultimediaAudioStreamSetChannelLayout0200
     * @tc.desc Testing OH_AudioStreamBuilder_SetChannelLayout returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetChannelLayout0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCHANNELLAYOUT_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetChannelLayoutSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERINFO_0100
     * @tc.name testMultimediaAudioStreamSetRendererInfo0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererInfo returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERINFO_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetRendererInfoInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetRendererCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetRendererCallbackInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDEROUTPUTDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetRendererOutputDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererOutputDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDEROUTPUTDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetOutDeviceChangeCbInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetCapturerCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerCallbackInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETFRAMESIZEINCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetFrameSizeInCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetFrameSizeInCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetFrameSizeInCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETFRAMESIZEINCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetFrameSizeInCallbackInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETWRITEDATAWITHMETADATACALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetWriteDataWithMetadataCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetWriteDataWithMetadataCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETWRITEDATAWITHMETADATACALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetWriteDataMetaCbInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETWRITEDATAWITHMETADATACALLBACK_0200
     * @tc.name testMultimediaAudioStreamSetWriteDataWithMetadataCallback0200
     * @tc.desc Testing OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetWriteDataWithMetadataCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETWRITEDATAWITHMETADATACALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetWriteDataMetaCbSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERINTERRUPTMODE_0100
     * @tc.name testMultimediaAudioStreamSetRendererInterruptMode0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererInterruptMode returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererInterruptMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERINTERRUPTMODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetRendererInterruptModeInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetRendererWriteDataCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererWriteDataCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererWriteDataCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetRendererWriteDataCbInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACKADVANCED_0100
     * @tc.name testMultimediaAudioStreamSetRendererWriteDataCallbackAdvanced0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererWriteDataCallbackAdvanced returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererWriteDataCallbackAdvanced0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACKADVANCED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetWriteDataCbAdvancedInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACKADVANCED_0200
     * @tc.name testMultimediaAudioStreamSetRendererWriteDataCallbackAdvanced0200
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererWriteDataCallbackAdvanced returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererWriteDataCallbackAdvanced0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERWRITEDATACALLBACKADVANCED_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetWriteDataCbAdvancedSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERERRORCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetRendererErrorCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetRendererErrorCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetRendererErrorCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETRENDERERERRORCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetRendererErrorCallbackSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERREADDATACALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetCapturerReadDataCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerReadDataCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerReadDataCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERREADDATACALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerReadDataCallbackSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetCapturerDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerDeviceChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerDeviceChangeCbSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERINTERRUPTCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetCapturerInterruptCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerInterruptCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerInterruptCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERINTERRUPTCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerInterruptCallbackSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERERRORCALLBACK_0100
     * @tc.name testMultimediaAudioStreamSetCapturerErrorCallback0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerErrorCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerErrorCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERERRORCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerErrorCallbackSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERWILLMUTEWHENINTERRUPTED_0100
     * @tc.name testMultimediaAudioStreamSetCapturerWillMuteWhenInterrupted0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerWillMuteWhenInterrupted returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSetCapturerWillMuteWhenInterrupted0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SETCAPTURERWILLMUTEWHENINTERRUPTED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSetCapturerWillMuteOnIntrptInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEROLE_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceRole0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceRole returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceRole0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEROLE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceRoleInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEROLE_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceRole0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceRole returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceRole0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEROLE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceRoleSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICETYPE_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceType0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceType returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICETYPE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceTypeInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICETYPE_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceType0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceType returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceType0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICETYPE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceTypeSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEID_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceId0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceId returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceId0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceIdInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEID_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceId0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceId returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceId0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEID_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceIdSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICENAME_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceName0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceName returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceName0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICENAME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceNameInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICENAME_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceName0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceName returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceName0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICENAME_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceIdSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEADDRESS_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceAddress0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceAddress returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceAddress0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEADDRESS_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceAddressInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEADDRESS_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceAddress0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceAddress returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceAddress0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEADDRESS_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceAddressSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICESAMPLERATES_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceSampleRates0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceSampleRates returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceSampleRates0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICESAMPLERATES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceSampleRatesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICESAMPLERATES_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceSampleRates0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceSampleRates returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceSampleRates0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICESAMPLERATES_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceSampleRatesSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICECHANNELCOUNTS_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceChannelCounts0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceChannelCounts returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceChannelCounts0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICECHANNELCOUNTS_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceChannelCountsInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICECHANNELCOUNTS_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceChannelCounts0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceChannelCounts returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceChannelCounts0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICECHANNELCOUNTS_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceChannelCountsSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEDISPLAYNAME_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceDisplayName0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceDisplayName returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceDisplayName0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEDISPLAYNAME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceDisplayNameInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEDISPLAYNAME_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceDisplayName0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceDisplayName returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceDisplayName0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEDISPLAYNAME_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceDisplayNameSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEENCODINGTYPE_0100
     * @tc.name testMultimediaAudioDeviceGetDeviceEncodingTypes0100
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceEncodingTypes returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceEncodingTypes0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEENCODINGTYPE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceEncodingTypesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEENCODINGTYPE_0200
     * @tc.name testMultimediaAudioDeviceGetDeviceEncodingTypes0200
     * @tc.desc Testing OH_AudioDeviceDescriptor_GetDeviceEncodingTypes returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceGetDeviceEncodingTypes0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_GETDEVICEENCODINGTYPE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceGetDeviceEncodingTypesSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETAUDIOMANGAGER_0100
     * @tc.name testMultimediaAudioGetAudioManager0100
     * @tc.desc Testing OH_GetAudioManager returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioGetAudioManager0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_GETAUDIOMANGAGER_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioGetAudioManagerInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETAUDIOMANGAGER_0200
     * @tc.name testMultimediaAudioGetAudioManager0200
     * @tc.desc Testing OH_GetAudioManager returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioGetAudioManager0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_GETAUDIOMANGAGER_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioGetAudioManagerSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETAUDIOSCENE_0100
     * @tc.name testMultimediaAudioGetAudioScene0100
     * @tc.desc Testing OH_GetAudioScene returns an invalid param code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioGetAudioScene0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_GETAUDIOSCENE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioGetAudioSceneInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETAUDIOSCENE_0200
     * @tc.name testMultimediaAudioGetAudioScene0200
     * @tc.desc Testing OH_GetAudioScene returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioGetAudioScene0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_GETAUDIOSCENE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioGetAudioSceneSuccess();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })
  })
}

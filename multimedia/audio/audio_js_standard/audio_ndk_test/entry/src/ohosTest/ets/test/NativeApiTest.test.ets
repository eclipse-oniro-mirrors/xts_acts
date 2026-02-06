/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import myaudioNdk from 'libentry.so'
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import common from '@ohos.app.ability.common';

const Tag = 'audio_ndk_test:'
const TEST_PASS = 0; // success result

export class AudioData {
  streamRendererUsageNum: number;
  streamSourceTypeNum: number;
  streamSamplingRateNum: number;
  streamSampleFormatNum: number;
  streamChannelCountNum: number;
  streamLatencyModeNum: number;

  constructor(streamRendererUsageNum: number, streamSourceTypeNum: number, streamSamplingRateNum: number,
    streamSampleFormatNum: number, streamChannelCountNum: number, streamLatencyModeNum: number) {
    this.streamRendererUsageNum = streamRendererUsageNum;
    this.streamSourceTypeNum = streamSourceTypeNum;
    this.streamSampleFormatNum = streamSampleFormatNum;
    this.streamSamplingRateNum = streamSamplingRateNum;
    this.streamChannelCountNum = streamChannelCountNum;
    this.streamLatencyModeNum = streamLatencyModeNum;
  }
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let getPermission = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  let context: Context = globalThis.context;
  atManager.requestPermissionsFromUser(context, permissions).then((data: PermissionRequestResult) => {
    console.info('datassss:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(500);
  await power?.click();
  await sleep(500);
}

let sleepForPermissions = async () => {
  console.info('getPermission sleep start: 10000ms')
  await sleep(10000)
  console.info('getPermission sleep end: 10000ms')
}

export default function audioNDK() {
  describe('audioNDKTest', () => {
    beforeAll(() => {      
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(200);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100
        * @tc.name      : create OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
        * @tc.desc      : test OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = myaudioNdk.createAudioStreamBuilder();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100 createAudioStreamBuilder: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100
        * @tc.name      : generate audioCapturer with OH_AudioStreamBuilder_GenerateCapturer
        * @tc.desc      : test OH_AudioStreamBuilder_GenerateCapturer
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100 audioCapture builder result: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100
        * @tc.name      : generate audioCapturer err
        * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateCapturer
        * @tc.size      : MediumTest MediumTest
        * @tc.type      : Function
        * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100 audioCaptureGenerateErr: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100
        * @tc.name      : start audioCapturer
        * @tc.desc      : test OH_AudioCapturer_Start
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100 audioCaptureStart: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100
        * @tc.name      : start audioCapture twice
        * @tc.desc      : test OH_AudioCapturer_Start twice
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100 audioCaptureStartErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100
       * @tc.name      : pause audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCapturePause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100 audioCapturePause: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100
       * @tc.name      : pause audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Pause without OH_AudioCapturer_Start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCapturePauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100 audioCapturePauseErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100
       * @tc.name      : stop audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100 audioCaptureStop: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100
       * @tc.name      : stop audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Stop without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100 audioCaptureStopErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100
       * @tc.name      : flush audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Flush
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level1
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100 audioCaptureFlush: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100
       * @tc.name      : flush audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Flush without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : FWK Layer
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100 audioCaptureFlushErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100
       * @tc.name      : release audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100 audioCaptureRelease: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100
       * @tc.name      : release audioCapturer twice
       * @tc.desc      : test OH_AudioCapturer_Release twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100 audioCaptureReleaseErr: ${result}`);
      expect(result).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100
       * @tc.name      : get latency mode after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100 audioCaptureGetParameter: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100
       * @tc.name      : get current state after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetCurrentState
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100 audioCaptureGetCurrentState: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100
       * @tc.name      : get streamId after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetStreamId
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100 audioCaptureGetStreamId: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100
       * @tc.name      : get sampleRate after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100 audioCaptureGetSamplingRate: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100
       * @tc.name      : get sampleFormat after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100 audioCaptureGetSampleFormat: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100
       * @tc.name      : get encodingType after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100 audioCaptureGetEncodingType: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100
       * @tc.name      : get capturerInfo after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetCapturerInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100 audioCaptureGetCapturerInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get channelCount after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100 audioCaptureGetChannelCount: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100
       * @tc.name      : GetTimestamp after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetTimestamp
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100 audioCaptureGetTimestamp: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100
       * @tc.name      : get FramesRead after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetFramesRead
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetFramesRead();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100 audioCaptureGetFramesRead: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100
       * @tc.name      : get FrameSizeInCallback after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetFrameSizeInCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100 audioCaptureGetFrameSizeInCallback: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100
       * @tc.name      : SetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_SetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100 audioRendererSetSpeed: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100
       * @tc.name      : GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100 audioRendererGetSpeed: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100
       * @tc.name      : SetSpeed&GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100 audioRendererSetGetSpeed: ${result}`);
      expect(result).assertEqual(1.5)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100
       * @tc.name      : SetRendererOutputDeviceChangeCallback with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioSetRendererOutputDeviceChangeCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100 audioCaptureGetCapturerInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100
       * @tc.name      : GetFramesWritten with OH_AudioRenderer_GetFramesWritten
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetFramesWritten();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100 audioRenderGetFramesWritten: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100
       * @tc.name      : GetTimestamp with OH_AudioRenderer_GetTimestamp
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100 audioRenderGetTimestamp: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMP_0100
       * @tc.name      : GetTimestamp with OH_AudioRenderer_GetAudioTimestampInfo
       * @tc.desc      : test OH_AudioRenderer_GetAudioTimestampInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetAudioTimestampInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMP_0100 audioRenderGetAudioTimestampInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMPINFOINTERVAL_0100
       * @tc.name      : GetTimestamp with OH_AudioRenderer_GetAudioTimestampInfoInterval
       * @tc.desc      : test OH_AudioRenderer_GetAudioTimestampInfoInterval
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMPINFOINTERVAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetAudioTimestampInfoInterval();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMEAUDIOSTAMPINFOINTERVAL_0100 audioRenderGetAudioTimestampInfoInterval: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100
       * @tc.name      : GetFrameSizeInCallback with OH_AudioRenderer_GetFrameSizeInCallback
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100 audioRenderGetFrameSizeInCallback: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100
       * @tc.name      : generate audioRenderer with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_GenerateRenderer
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100 audioCaptureGetCapturerInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100
       * @tc.name      : generate audioRenderer err
       * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100 audioRenderGenerateErr: ${result}`);
      expect(result).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100
       * @tc.name      : start audioRenderer
       * @tc.desc      : test OH_AudioRenderer_Start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100 audioRenderStart: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100
       * @tc.name      : start audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Start twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100 audioRenderStartErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100
       * @tc.name      : pause audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderPause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100 audioRenderPause: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100
       * @tc.name      : pause audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Pause without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderPauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100 audioRenderPauseErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100
       * @tc.name      : stop audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100 audioRenderStop: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100
       * @tc.name      : stop audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Stop without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100 audioRenderStopErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100
       * @tc.name      : flush audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Flush
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100 audioRenderFlush: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100
       * @tc.name      : flush audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Flush without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100 audioRenderFlushErr: ${result}`);
      expect(result).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100
       * @tc.name      : release audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100 audioRenderRelease: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100
       * @tc.name      : release audioRenderer twice
       * @tc.desc      : test OH_AudioRenderer_Release twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100 audioRenderReleaseErr: ${result}`);
      expect(result).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100
       * @tc.name      : get current state after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetCurrentState
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100 audioRenderGetCurrentState: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100
       * @tc.name      : get latencyMode after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100 audioRenderGetParameter: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100
       * @tc.name      : get streamId after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetStreamId
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100 audioRenderGetStreamId: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100
       * @tc.name      : get samplingRate after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100 audioRenderGetSamplingRate: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100
       * @tc.name      : get sampleFormat after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100 audioRenderGetSampleFormat: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100
       * @tc.name      : get encodingType after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100 audioRenderGetEncodingType: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100
       * @tc.name      : get RendererInfo after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetRendererInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100 audioRenderGetRendererInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get ChannelCount after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRenderGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100 audioRenderGetChannelCount: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100
       * @tc.name      : set sampleRate 48000 after create a
       * @tc.desc      : test OH_AudioStreamBuilder_SetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100 aSetSamplingRate: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100
       * @tc.name      : set channelCount 1 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetChannelCount
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100 aSetChannelCount: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100
       * @tc.name      : set sampleFormat AUDIOSTREAM_SAMPLE_U8 after create a
       * @tc.desc      : test OH_AudioStreamBuilder_SetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100 aSetSampleFormat: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100
       * @tc.name      : set encodingType AUDIOSTREAM_ENCODING_TYPE_RAW after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100 aSetEncodingType: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100
       * @tc.name      : set latencyMode AUDIOSTREAM_LATENCY_MODE_NORMAL streamUsage after create a
       * @tc.desc      : test OH_AudioStreamBuilder_SetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetLatencyMode();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100 aSetLatencyMode: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100
       * @tc.name      : set captureInfo AUDIOSTREAM_USAGE_MUSIC after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100 aSetRendererInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100
       * @tc.name      : set captureInfo AUDIOSTREAM_SOURCE_TYPE_MIC after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100 aSetCapturerInfo: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100
       * @tc.name      : set rendererCallback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100 aSetRendererCallback: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100
       * @tc.name      : set captureCallback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100 aSetCapturerCallback: ${result}`);
      expect(result).assertEqual(0)
      done()
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100
       * @tc.name      : set framesize in callback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetFrameSizeInCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100 aSetFrameSizeInCallback: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100
     * @tc.name      : getVolume with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_GetVolume
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererGetVolume_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100 audioRendererGetVolume: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100 audioRendererSetVolume: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200 audioRendererSetVolume: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300 audioRendererSetVolume: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400 audioRendererSetVolume fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500 audioRendererSetVolume fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolume_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600 audioRendererSetVolume fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600 audioRendererSetVolumeWithRamp: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700 audioRendererSetVolumeWithRamp fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_08();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800 audioRendererSetVolumeWithRamp fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetVolumeWithRamp_09();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900 audioRendererSetVolumeWithRamp fail: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500
            * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
            * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetOnMarkReached_08();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800 audioRendererSetOnMarkReached: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererCancelMark_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100 audioRendererCancelMark: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererCancelMark_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200 audioRendererCancelMark: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererCancelMark_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300 audioRendererCancelMark: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetInterruptMode_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100 audioRendererSetInterruptMode: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetInterruptMode_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200 audioRendererSetInterruptMode: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetInterruptMode_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300 audioRendererSetInterruptMode: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetInterruptMode_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400 audioRendererSetInterruptMode: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100
     * @tc.name      : get audioRoutingManager
     * @tc.desc      : test OH_AudioManager_GetAudioRoutingManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioRoutingManager_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100 audioManagerGetAudioRoutingManager: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100
     * @tc.name      : get none devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100 audioRoutingManagerDevices result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200
     * @tc.name      : get output devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300
     * @tc.name      : get input devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400
     * @tc.name      : get all devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500
     * @tc.name      : get devices with invaild flag
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600
     * @tc.name      : get devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700
     * @tc.name      : get devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetDevices_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700 audioRoutingManagerDevice result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001
     * @tc.name      : Obtain AudioManager with null pointer
     * @tc.desc      : Test OH_GetAudioManager function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetManager_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001 audioManager result: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002
     * @tc.name      : get AudioManager
     * @tc.desc      : Test OH_GetAudioManager function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetManager_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002 audioManagerGetManager_02: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001
     * @tc.name      : get AudioScene
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioScene_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001 audioManagerGetAudioScene_01: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002
     * @tc.name      : get AudioScene with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioScene_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002 audioManagerGetAudioScene_02: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0001
     * @tc.name      : register AudioSceneChangeCallback
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerRegisterAudioSceneChangeCallback_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0001 audioManagerRegisterAudioSceneChangeCallback_01: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0002
     * @tc.name      : register AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerRegisterAudioSceneChangeCallback_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0002 audioManagerRegisterAudioSceneChangeCallback_02: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0003
     * @tc.name      : register AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerRegisterAudioSceneChangeCallback_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_REGISTERAUDIOSCENECHANGECALLBACK_0003 audioManagerRegisterAudioSceneChangeCallback_03: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0001
     * @tc.name      : unregister AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerUnregisterAudioSceneChangeCallback_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0001 audioManagerUnregisterAudioSceneChangeCallback_01: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0002
     * @tc.name      : unregister AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerUnregisterAudioSceneChangeCallback_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0002 audioManagerUnregisterAudioSceneChangeCallback_02: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0003
     * @tc.name      : unregister AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerUnregisterAudioSceneChangeCallback_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0003 audioManagerUnregisterAudioSceneChangeCallback_03: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0004
     * @tc.name      : unregister AudioSceneChangeCallback with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerUnregisterAudioSceneChangeCallback_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_UNREGISTERAUDIOSCENECHANGECALLBACK_0004 audioManagerUnregisterAudioSceneChangeCallback_04: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001
     * @tc.name      : get available device
     * @tc.desc      : test OH_AudioRoutingManager_GetAvailableDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetAvailableDevices001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001 audioRoutingManagerGetAvailableDevices001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001
     * @tc.name      : GetPreferredOutputDevice
     * @tc.desc      : test OH_AudioRoutingManager_GetPreferredOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetPreferredOutputDevice001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001 audioRoutingManagerGetPreferredOutputDevice001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001
     * @tc.name      : GetPreferredInputDevice
     * @tc.desc      : test OH_AudioRoutingManager_GetPreferredInputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerGetPreferredInputDevice001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001 audioRoutingManagerGetPreferredInputDevice001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100
     * @tc.name      : setMicBlockStatusCallback with callback
     * @tc.desc      : test OH_AudioRoutingManager_SetMicBlockStatusCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerSetMicBlockStatusCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100 audioRoutingManagerSetMicBlockStatusCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200
     * @tc.name      : setMicBlockStatusCallback without audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_SetMicBlockStatusCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerSetMicBlockStatusCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200 audioRoutingManagerSetMicBlockStatusCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100
     * @tc.name      : registerDeviceChangeCallback with none device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200
     * @tc.name      : registerDeviceChangeCallback with output device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300
     * @tc.name      : registerDeviceChangeCallback with input device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400
     * @tc.name      : registerDeviceChangeCallback with all device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500
     * @tc.name      : registerDeviceChangeCallback without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_005();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_006();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_007();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_008();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800 audioRoutingManagerRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100
     * @tc.name      : unRegisterDeviceChangeCallback without register callback
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerUnRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200
     * @tc.name      : unRegisterDeviceChangeCallback without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerUnRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300
     * @tc.name      : unRegisterDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerUnRegisterDeviceChangeCallback: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100
     * @tc.name      : release devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerReleaseDevices_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100 audioRoutingManagerReleaseDevices: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200
     * @tc.name      : release devices with nullptr devices
     * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRoutingManagerReleaseDevices_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200 audioRoutingManagerReleaseDevices: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100
     * @tc.name      : get deviceType with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100 audioAudioDeviceDescriptorGetDeviceType: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200
     * @tc.name      : get deviceType with nullptr devicetype
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200 audioAudioDeviceDescriptorGetDeviceType: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300
     * @tc.name      : get deviceType with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300 audioAudioDeviceDescriptorGetDeviceType: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100
     * @tc.name      : get deviceRole with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100 audioAudioDeviceDescriptorGetDeviceRole: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200
     * @tc.name      : get deviceRole with nullptr deviceRole
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200 audioAudioDeviceDescriptorGetDeviceRole: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300
     * @tc.name      : get deviceRole with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300 audioAudioDeviceDescriptorGetDeviceRole: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100
     * @tc.name      : get deviceId with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100 audioAudioDeviceDescriptorGetDeviceId: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200
     * @tc.name      : get deviceId with nullptr deviceId
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200 audioAudioDeviceDescriptorGetDeviceId: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300
     * @tc.name      : get deviceId with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300 audioAudioDeviceDescriptorGetDeviceId: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100
     * @tc.name      : get deviceName with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100 audioAudioDeviceDescriptorGetDeviceName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200
     * @tc.name      : get deviceName with nullptr deviceName
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200 audioAudioDeviceDescriptorGetDeviceName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300
     * @tc.name      : get deviceName with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300 audioAudioDeviceDescriptorGetDeviceName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100
     * @tc.name      : get deviceAddress with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100 audioAudioDeviceDescriptorGetDeviceAddress: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200
     * @tc.name      : get deviceAddress with nullptr deviceAddress
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200 audioAudioDeviceDescriptorGetDeviceAddress: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300
     * @tc.name      : get deviceAddress with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300 audioAudioDeviceDescriptorGetDeviceAddress: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100
     * @tc.name      : get deviceSampleRates with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100 audioAudioDeviceDescriptorGetDeviceSampleRates: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200
     * @tc.name      : get deviceSampleRates with nullptr deviceSampleRates
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200 audioAudioDeviceDescriptorGetDeviceSampleRates: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300
     * @tc.name      : get deviceSampleRates with nullptr size
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300 audioAudioDeviceDescriptorGetDeviceSampleRates: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400
     * @tc.name      : get deviceSampleRates with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400 audioAudioDeviceDescriptorGetDeviceSampleRates: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100
     * @tc.name      : get deviceChannelCounts with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200
     * @tc.name      : get deviceChannelCounts with nullptr channelCounts
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300
     * @tc.name      : get deviceChannelCounts with nullptr channelSize
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400
     * @tc.name      : get deviceChannelCounts with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100
     * @tc.name      : get deviceDisplayName with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100 audioAudioDeviceDescriptorGetDeviceDisplayName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200
     * @tc.name      : get deviceDisplayName with nullptr displayName
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200 audioAudioDeviceDescriptorGetDeviceDisplayName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300
     * @tc.name      : get deviceDisplayName with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300 audioAudioDeviceDescriptorGetDeviceDisplayName: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100
     * @tc.name      : get deviceEncodingTypes with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200
     * @tc.name      : get deviceEncodingTypes with nullptr encodingTypes
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300
     * @tc.name      : get deviceEncodingTypes with nullptr encodingTypeSize
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400
     * @tc.name      : get deviceEncodingTypes with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioInternalRecordingSuccess01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003 audioAudioInternalRecordingSuccess: ${result}`);
      expect(result).assertEqual(0)
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioInternalRecordingSuccess02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004 audioAudioInternalRecordingSuccess: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioAudioInternalRecordingFalse();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005 audioAudioInternalRecordingFalse: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100
     * @tc.name      : set rendererWriteDataCallback with VALID result after create a
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100`,
        `audioStreamBuilderSetRendererWriteDataCallback_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200
     * @tc.name      : set rendererWriteDataCallback with INVALID result after create a
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200`,
        `audioStreamBuilderSetRendererWriteDataCallback_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0100
     * @tc.name      : set rendererInterruptCallback with INVALID result after create a
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererInterruptCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererInterruptCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0100`,
        `audioStreamBuilderSetRendererInterruptCallback_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0200
     * @tc.name      : set rendererInterruptCallback with INVALID result after create a
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererInterruptCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererInterruptCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_INTERRUPT_CALLBACK_0200`,
        `audioStreamBuilderSetRendererInterruptCallback_002: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_ERROR_CALLBACK_0200
     * @tc.name      : set rendererErrorCallback with INVALID result after create a
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererErrorCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_ERROR_CALLBACK_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererErrorCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_RENDERER_ERROR_CALLBACK_0200`,
        `audioStreamBuilderSetRendererErrorCallback_002: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_READ_DATA_CALLBACK_0200
     * @tc.name      : set captureCallback after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerReadDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_READ_DATA_CALLBACK_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerReadDataCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_READ_DATA_CALLBACK_0200`,
        `aSetCapturerReadDataCallback: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_DEVICE_CHANGE_CALLBACK_0200
     * @tc.name      : set captureDeviceChangeCallback after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_DEVICE_CHANGE_CALLBACK_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerDeviceChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_DEVICE_CHANGE_CALLBACK_0200`,
        `aSetCapturerCallback: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_INTERRUPT_CALLBACK_0200
     * @tc.name      : set captureInterruptCallback after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_INTERRUPT_CALLBACK_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerInterruptCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_INTERRUPT_CALLBACK_0200`,
        `aSetCapturerInterruptCallback: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_ERROR_CALLBACK_0200
     * @tc.name      : set captureErrorCallback after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerErrorCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_ERROR_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerErrorCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_OH_STREAM_BUILDER_SET_CAPTURER_ERROR_CALLBACK_0200`,
        `aSetCapturerErrorCallback: ${result}`);
      expect(result).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100
     * @tc.name      : set  create audioStreamBuilder
     * @tc.desc      : test OH_AudioCapturer_GetOverflowCount
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCapturerGetOverflowCount_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100`,
        `audioCapturerGetOverflowCount_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_MIX_WITH_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStrategy_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100`,
        `AudioSessionManagerStrategy_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DEFAULT
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStrategy_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200`,
        `AudioSessionManagerStrategy_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DUCK_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStrategy_003();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300`,
        `AudioSessionManagerStrategy_003: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_PAUSE_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStrategy_004();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400`,
        `AudioSessionManagerStrategy_004: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStrategyError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100`,
        `AudioSessionManagerStrategyError_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerActivatedError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100`,
        `AudioSessionManagerActivatedError_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStopError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100`,
        `AudioSessionManagerStopError_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200
     * @tc.name      : stpo AudioSessionManager twice
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerStopError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200`,
        `AudioSessionManagerStopError_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100`,
        `AudioSessionManagerRegisterError_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200`,
        `AudioSessionManagerRegisterError_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerUnregisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100`,
        `AudioSessionManagerUnregisterError_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerUnregisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200`,
        `AudioSessionManagerUnregisterError_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_LOWER_PRIORITY
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerReason_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100`,
        `AudioSessionManagerReason_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_TIMEOUT
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerReason_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200`,
        `AudioSessionManagerReason_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetScene_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetScene_001
     * @tc.desc      : set AudioSessionManagerSetScene for vaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetScene_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerSetScene_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetScene_001`,
        `AudioSessionManagerSetScene_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_001
     * @tc.desc      : set AudioSessionManagerRegisterStateChangeCallback for vaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterStateChangeCallback_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_001`,
        `AudioSessionManagerRegisterStateChangeCallback_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_002
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_002
     * @tc.desc      : set AudioSessionManagerRegisterStateChangeCallback for invaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterStateChangeCallback_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_002`,
        `AudioSessionManagerRegisterStateChangeCallback_002: ${result}`);
      expect(0).assertEqual(result)
      done()
    })
  
    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_003
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_003
     * @tc.desc      : set AudioSessionManagerRegisterStateChangeCallback for double register
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterStateChangeCallback_003();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterStateChangeCallback_003`,
        `AudioSessionManagerRegisterStateChangeCallback_003: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_001
     * @tc.desc      : SetDefaultOutputDevice for vail value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerSetDefaultOutputDevice_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_001`,
        `AudioSessionManagerSetDefaultOutputDevice_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_002
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_002
     * @tc.desc      : SetDefaultOutputDevice for invail value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerSetDefaultOutputDevice_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerSetDefaultOutputDevice_002`,
        `AudioSessionManagerSetDefaultOutputDevice_002: ${result}`);
      expect(0).assertEqual(result)
      done()
    })
    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerGetDefaultOutputDevice_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerGetDefaultOutputDevice_001
     * @tc.desc      : GetDefaultOutputDevice for invail value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerGetDefaultOutputDevice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerGetDefaultOutputDevice_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerGetDefaultOutputDevice_001`,
        `AudioSessionManagerGetDefaultOutputDevice_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_001
     * @tc.desc      : set AudioSessionManagerRegisterDeviceCallback for vaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterDeviceCallback_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_001`,
        `AudioSessionManagerRegisterDeviceCallback_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_002
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_002
     * @tc.desc      : set AudioSessionManagerRRegisterDeviceCallback for invaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterDeviceCallback_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_002`,
        `AudioSessionManagerRegisterDeviceCallback_002: ${result}`);
      expect(0).assertEqual(result)
      done()
    })
  
    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_003
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_003
     * @tc.desc      : set AudioSessionManagerRegisterDeviceCallback for double register
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerRegisterDeviceCallback_003();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterDeviceCallback_003`,
        `AudioSessionManagerRegisterDeviceCallback_003: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_001
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_001
     * @tc.desc      : AudioSessionManagerReleaseDevices for vaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerReleaseDevices_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_001`,
        `AudioSessionManagerReleaseDevices_001: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_002
     * @tc.name      : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_002
     * @tc.desc      : AudioSessionManagerReleaseDevices for invaild value
     * @tc.size      : MediumTest
     * @tc.type      : Function 
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioSessionManagerReleaseDevices_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReleaseDevices_002`,
        `AudioSessionManagerReleaseDevices_002: ${result}`);
      expect(0).assertEqual(result)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100
     * @tc.name      : set  set default output device with invalid devicetype
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetDefaultOutputDevice_01();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100`,
        `audioRendererSetDefaultOutputDevice_01: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200
     * @tc.name      : set  set default output device with invalid streamusage
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetDefaultOutputDevice_02();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200`,
        `audioRendererSetDefaultOutputDevice_02: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300
     * @tc.name      : set  set default output device with nullptr
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererSetDefaultOutputDevice_03();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300`,
        `audioRendererSetDefaultOutputDevice_03: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0100
     * @tc.name      : test OH_Audio format f32 normal
     * @tc.desc      : test OH_Audio format f32 normal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let streamRendererUsageNum = 1; //AUDIOSTREAM_USAGE_MUSIC
      let streamSampleFormatNum = 4; //F32LE
      let streamSamplingRateNum = 48000;
      let streamChannelCountNum = 2;
      let streamSourceTypeNum = 0; //AUDIOSTREAM_SOURCE_TYPE_MIC
      let streamLatencyModeNum = 0;   //AUDIOSTREAM_LATENCY_MODE_NORMAL

      let caseTag: string = "SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0100";

      try {
        let mydata = new AudioData(streamRendererUsageNum, streamSourceTypeNum, streamSamplingRateNum,
            streamSampleFormatNum,  streamChannelCountNum, streamLatencyModeNum);

        myaudioNdk.audioCapturerInit(mydata);
        console.log(`${caseTag} audioCapturerInit success`);

        myaudioNdk.audioCapturerStart();
        console.log(`${caseTag} audioCapturerStart success`);

        await sleep(1000);

        myaudioNdk.audioCapturerStop();
        console.log(`${caseTag} audioCapturerStop success`);

        myaudioNdk.audioCapturerRelease();
        console.log(`${caseTag} audioCapturerRelease success`);

        await sleep(200);

        myaudioNdk.audioRendererInit(mydata);
        console.log(`${caseTag} audioRendererInit success`);

        myaudioNdk.audioRendererStart();
        console.log(`${caseTag} audioRendererStart success`);

        await sleep(1000);

        myaudioNdk.audioRendererStop();
        console.log(`${caseTag} audioRendererStop success`);
          
        myaudioNdk.audioRendererRelease();
        console.log(`${caseTag} audioRendererRelease success`);
        
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0200
     * @tc.name      : test OH_Audio format f32 normal
     * @tc.desc      : test OH_Audio format f32 normal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let streamRendererUsageNum = 2; //AUDIOSTREAM_USAGE_VOICE_COMMUNICATION
      let streamSampleFormatNum = 4; //F32LE
      let streamSamplingRateNum = 32000;
      let streamChannelCountNum = 2;
      let streamSourceTypeNum = 0; //AUDIOSTREAM_SOURCE_TYPE_MIC
      let streamLatencyModeNum = 0;   //AUDIOSTREAM_LATENCY_MODE_NORMAL

      let caseTag: string = "SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0200";

      try {
        let mydata = new AudioData(streamRendererUsageNum, streamSourceTypeNum, streamSamplingRateNum,
            streamSampleFormatNum,  streamChannelCountNum, streamLatencyModeNum);

        myaudioNdk.audioCapturerInit(mydata);
        console.log(`${caseTag} audioCapturerInit success`);

        myaudioNdk.audioCapturerStart();
        console.log(`${caseTag} audioCapturerStart success`);

        await sleep(1000);

        myaudioNdk.audioCapturerStop();
        console.log(`${caseTag} audioCapturerStop success`);

        myaudioNdk.audioCapturerRelease();
        console.log(`${caseTag} audioCapturerRelease success`);

        await sleep(200);

        myaudioNdk.audioRendererInit(mydata);
        console.log(`${caseTag} audioRendererInit success`);

        myaudioNdk.audioRendererStart();
        console.log(`${caseTag} audioRendererStart success`);

        await sleep(1000);

        myaudioNdk.audioRendererStop();
        console.log(`${caseTag} audioRendererStop success`);
          
        myaudioNdk.audioRendererRelease();
        console.log(`${caseTag} audioRendererRelease success`);
        
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0300
     * @tc.name      : test OH_Audio format f32 latency mode
     * @tc.desc      : test OH_Audio format f32 latency mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let streamRendererUsageNum = 2; //AUDIOSTREAM_USAGE_VOICE_COMMUNICATION
      let streamSampleFormatNum = 4; //F32LE
      let streamSamplingRateNum = 48000;
      let streamChannelCountNum = 2;
      let streamSourceTypeNum = 0; //AUDIOSTREAM_SOURCE_TYPE_MIC
      let streamLatencyModeNum = 1;   //AUDIOSTREAM_LATENCY_MODE_FAST

      let caseTag: string = "SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0300";

      try {
        let mydata = new AudioData(streamRendererUsageNum, streamSourceTypeNum, streamSamplingRateNum,
            streamSampleFormatNum,  streamChannelCountNum, streamLatencyModeNum);

        myaudioNdk.audioCapturerInit(mydata);
        console.log(`${caseTag} audioCapturerInit success`);

        myaudioNdk.audioCapturerStart();
        console.log(`${caseTag} audioCapturerStart success`);

        await sleep(1000);

        myaudioNdk.audioCapturerStop();
        console.log(`${caseTag} audioCapturerStop success`);

        myaudioNdk.audioCapturerRelease();
        console.log(`${caseTag} audioCapturerRelease success`);

        await sleep(200);

        myaudioNdk.audioRendererInit(mydata);
        console.log(`${caseTag} audioRendererInit success`);

        myaudioNdk.audioRendererStart();
        console.log(`${caseTag} audioRendererStart success`);

        await sleep(1000);

        myaudioNdk.audioRendererStop();
        console.log(`${caseTag} audioRendererStop success`);
          
        myaudioNdk.audioRendererRelease();
        console.log(`${caseTag} audioRendererRelease success`);
        
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0400
     * @tc.name      : test OH_Audio format f32 latency mode
     * @tc.desc      : test OH_Audio format f32 latency mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let streamRendererUsageNum = 2; //AUDIOSTREAM_USAGE_VOICE_COMMUNICATION
      let streamSampleFormatNum = 4; //F32LE
      let streamSamplingRateNum = 48000;
      let streamChannelCountNum = 1;
      let streamSourceTypeNum = 0; //AUDIOSTREAM_SOURCE_TYPE_MIC
      let streamLatencyModeNum = 1;   //AUDIOSTREAM_LATENCY_MODE_FAST

      let caseTag: string = "SUM_MULTIMEDIA_AUDIO_OH_Audio_Format_F32_TEST_0400";

      try {
        let mydata = new AudioData(streamRendererUsageNum, streamSourceTypeNum, streamSamplingRateNum,
            streamSampleFormatNum,  streamChannelCountNum, streamLatencyModeNum);

        myaudioNdk.audioCapturerInit(mydata);
        console.log(`${caseTag} audioCapturerInit success`);

        myaudioNdk.audioCapturerStart();
        console.log(`${caseTag} audioCapturerStart success`);

        await sleep(1000);

        myaudioNdk.audioCapturerStop();
        console.log(`${caseTag} audioCapturerStop success`);

        myaudioNdk.audioCapturerRelease();
        console.log(`${caseTag} audioCapturerRelease success`);

        await sleep(200);

        myaudioNdk.audioRendererInit(mydata);
        console.log(`${caseTag} audioRendererInit success`);

        myaudioNdk.audioRendererStart();
        console.log(`${caseTag} audioRendererStart success`);

        await sleep(1000);

        myaudioNdk.audioRendererStop();
        console.log(`${caseTag} audioRendererStop success`);
          
        myaudioNdk.audioRendererRelease();
        console.log(`${caseTag} audioRendererRelease success`);
        
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : audioStreamBuilderSetVolumeModeTest_001
     * @tc.name      : test OH_AudioStreamBuilder_SetVolumeMode AUDIOSTREAM_VOLUMEMODE_SYSTEM_GLOBAL
     * @tc.desc      : test OH_AudioStreamBuilder_SetVolumeMode AUDIOSTREAM_VOLUMEMODE_SYSTEM_GLOBAL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('audioStreamBuilderSetVolumeModeTest_001', TestType.FUNCTION | TestType.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Number = myaudioNdk.audioStreamBuilderSetVolumeModeTest_001();
      console.info(`TAG: audioStreamBuilderSetVolumeModeTest_001: 
        result: ${result}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : audioStreamBuilderSetVolumeModeTest_002
     * @tc.name      : test OH_AudioStreamBuilder_SetVolumeMode AUDIOSTREAM_VOLUMEMODE_APP_INDIVIDUAL
     * @tc.desc      : test OH_AudioStreamBuilder_SetVolumeMode AUDIOSTREAM_VOLUMEMODE_APP_INDIVIDUAL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('audioStreamBuilderSetVolumeModeTest_002', TestType.FUNCTION | TestType.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Number = myaudioNdk.audioStreamBuilderSetVolumeModeTest_002();
      console.info(`TAG: audioStreamBuilderSetVolumeModeTest_002: 
        result: ${result}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : audioStreamBuilderSetVolumeModeTest_003
     * @tc.name      : test OH_AudioStreamBuilder_SetVolumeMode OH_AudioStreamBuilder parameter is nullptr
     * @tc.desc      : test OH_AudioStreamBuilder_SetVolumeMode OH_AudioStreamBuilder parameter is nullptr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('audioStreamBuilderSetVolumeModeTest_003', TestType.FUNCTION | TestType.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Number = myaudioNdk.audioStreamBuilderSetVolumeModeTest_003();
      console.info(`TAG: audioStreamBuilderSetVolumeModeTest_003: 
        result: ${result}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : audioStreamBuilderSetVolumeModeTest_004
     * @tc.name      : test OH_AudioStreamBuilder_SetVolumeMode OH_AudioStream_VolumeMode parameter is invaild
     * @tc.desc      : test OH_AudioStreamBuilder_SetVolumeMode OH_AudioStream_VolumeMode parameter is invaild
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('audioStreamBuilderSetVolumeModeTest_004', TestType.FUNCTION | TestType.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: Number = myaudioNdk.audioStreamBuilderSetVolumeModeTest_004();
      console.info(`TAG: audioStreamBuilderSetVolumeModeTest_004: 
        result: ${result}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0001
     * @tc.name      : get AudioVolumeManager
     * @tc.desc      : test OH_AudioManager_GetAudioVolumeManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioVolumeManager_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0001 audioManagerGetAudioVolumeManager_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0002
     * @tc.name      : get AudioVolumeManager with nullptr
     * @tc.desc      : test OH_AudioManager_GetAudioVolumeManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioVolumeManager_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_AUDIOVOLUMEMANAGER_0002 audioManagerGetAudioVolumeManager_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0001
     * @tc.name      : get max volume by usage
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMaxVolumeByUsage_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0001 audioVolumeManagerGetMaxVolumeByUsage_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0002
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMaxVolumeByUsage_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0002 audioVolumeManagerGetMaxVolumeByUsage_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0003
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMaxVolumeByUsage_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0003 audioVolumeManagerGetMaxVolumeByUsage_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0004
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMaxVolumeByUsage_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MAX_VOLUME_BY_USAGE_0004 audioVolumeManagerGetMaxVolumeByUsage_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0001
     * @tc.name      : get max volume by usage
     * @tc.desc      : test OH_AudioVolumeManager_GetMinVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMinVolumeByUsage_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0001 audioVolumeManagerGetMinVolumeByUsage_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0002
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMinVolumeByUsage_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0002 audioVolumeManagerGetMinVolumeByUsage_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0003
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMinVolumeByUsage_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0003 audioVolumeManagerGetMinVolumeByUsage_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0004
     * @tc.name      : get max volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetMaxVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetMinVolumeByUsage_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_MIN_VOLUME_BY_USAGE_0004 audioVolumeManagerGetMinVolumeByUsage_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0001
     * @tc.name      : get volume by usage
     * @tc.desc      : test OH_AudioVolumeManager_GetVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetVolumeByUsage_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0001 audioVolumeManagerGetVolumeByUsage_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0002
     * @tc.name      : get volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetVolumeByUsage_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0002 audioVolumeManagerGetVolumeByUsage_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0003
     * @tc.name      : get volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetVolumeByUsage_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0003 audioVolumeManagerGetVolumeByUsage_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0004
     * @tc.name      : get volume by usage whit invaild param
     * @tc.desc      : test OH_AudioVolumeManager_GetVolumeByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetVolumeByUsage_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_VOLUME_BY_USAGE_0004 audioVolumeManagerGetVolumeByUsage_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0001
     * @tc.name      : get volume by usage
     * @tc.desc      : test OH_AudioVolumeManager_IsMuteByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerIsMuteByUsage_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0001 audioVolumeManagerIsMuteByUsage_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0002
     * @tc.name      : get volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_IsMuteByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerIsMuteByUsage_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0002 audioVolumeManagerIsMuteByUsage_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0003
     * @tc.name      : get volume by usage whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_IsMuteByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerIsMuteByUsage_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0003 audioVolumeManagerIsMuteByUsage_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0004
     * @tc.name      : get volume by usage with invaild param
     * @tc.desc      : test OH_AudioVolumeManager_IsMuteByUsage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerIsMuteByUsage_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_IS_MUTE_BY_USAGE_0004 audioVolumeManagerIsMuteByUsage_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001
     * @tc.name      : register stream volume change callback
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001 audioVolumeManagerRegisterStreamVolumeChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002
     * @tc.name      : register stream volume change callback
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002 audioVolumeManagerRegisterStreamVolumeChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003
     * @tc.name      : register stream volume change callback
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003 audioVolumeManagerRegisterStreamVolumeChangeCallback_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004
     * @tc.name      : register stream volume change callback
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004 audioVolumeManagerRegisterStreamVolumeChangeCallback_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0005
     * @tc.name      : register stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_005();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0005 audioVolumeManagerRegisterStreamVolumeChangeCallback_005: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0006
     * @tc.name      : register stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_006();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0006 audioVolumeManagerRegisterStreamVolumeChangeCallback_006: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0007
     * @tc.name      : register stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_007();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0007 audioVolumeManagerRegisterStreamVolumeChangeCallback_007: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0008
     * @tc.name      : register stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterStreamVolumeChangeCallback_008();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0008 audioVolumeManagerRegisterStreamVolumeChangeCallback_008: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001
     * @tc.name      : unregister stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterStreamVolumeChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0001 audioVolumeManagerUnregisterStreamVolumeChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002
     * @tc.name      : unregister stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterStreamVolumeChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0002 audioVolumeManagerUnregisterStreamVolumeChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003
     * @tc.name      : unregister stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterStreamVolumeChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0003 audioVolumeManagerUnregisterStreamVolumeChangeCallback_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004
     * @tc.name      : unregister stream volume change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterStreamVolumeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterStreamVolumeChangeCallback_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_STREAM_VOLUME_CHANGE_CALLBACK_0004 audioVolumeManagerUnregisterStreamVolumeChangeCallback_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0001
     * @tc.name      : get ringer mode
     * @tc.desc      : test OH_AudioVolumeManager_GetRingerMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetRingerMode_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0001 audioVolumeManagerGetRingerMode_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0002
     * @tc.name      : get ringer mode whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetRingerMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetRingerMode_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0002 audioVolumeManagerGetRingerMode_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0003
     * @tc.name      : get ringer mode whit nullptr
     * @tc.desc      : test OH_AudioVolumeManager_GetRingerMode 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerGetRingerMode_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_RINGER_MODE_0003 audioVolumeManagerGetRingerMode_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0001
     * @tc.name      : register ringer mode change callback
     * @tc.desc      : test OH_AudioVolumeManager_RegisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterRingerModeChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0001 audioVolumeManagerRegisterRingerModeChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0002
     * @tc.name      : register ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterRingerModeChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0002 audioVolumeManagerRegisterRingerModeChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0003
     * @tc.name      : register ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_RegisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerRegisterRingerModeChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_REGISTER_RINGER_MODE_CHANGE_CALLBACK_0003 audioVolumeManagerRegisterRingerModeChangeCallback_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0001
     * @tc.name      : unregister ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterRingerModeChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0001 audioVolumeManagerUnregisterRingerModeChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0002
     * @tc.name      : unregister ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterRingerModeChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0002 audioVolumeManagerUnregisterRingerModeChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0003
     * @tc.name      : unregister ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterRingerModeChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0003 audioVolumeManagerUnregisterRingerModeChangeCallback_003: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0004
     * @tc.name      : unregister ringer mode change callback with invalid param
     * @tc.desc      : test OH_AudioVolumeManager_UnregisterRingerModeChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioVolumeManagerUnregisterRingerModeChangeCallback_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_UNREGISTER_RINGER_MODE_CHANGE_CALLBACK_0004 audioVolumeManagerUnregisterRingerModeChangeCallback_004: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
     })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED
     * @tc.name      : set interrupt strategy before generate audioCaptuer
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerWillMuteWhenInterrupted
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.AudioCapturerSetWillMuteWhenInterrupted();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED AudioCapturerSetWillMuteWhenInterrupted: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_001
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_001
     * @tc.desc      : test OH_AudioManager_GetAudioStreamManager nullptr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioStreamManagerTest_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_001 audioManagerGetAudioStreamManagerTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_002
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_002
     * @tc.desc      : test OH_AudioManager_GetAudioStreamManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetAudioStreamManagerTest_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_002 audioManagerGetAudioStreamManagerTest_002: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001
     * @tc.desc      : test OH_AudioStreamManager_GetDirectPlaybackSupport
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetDirectPlaybackSupportTest_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001 AudioManagerGetDirectPlaybackSupportTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_002
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_002
     * @tc.desc      : test OH_AudioStreamManager_GetDirectPlaybackSupport nullptr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetDirectPlaybackSupportTest_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001 AudioManagerGetDirectPlaybackSupportTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_003
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_003
     * @tc.desc      : test OH_AudioStreamManager_GetDirectPlaybackSupport nullptr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetDirectPlaybackSupportTest_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001 AudioManagerGetDirectPlaybackSupportTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_004
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_004
     * @tc.desc      : test OH_AudioStreamManager_GetDirectPlaybackSupport nullptr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetDirectPlaybackSupportTest_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001 AudioManagerGetDirectPlaybackSupportTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_005
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_005
     * @tc.desc      : test OH_AudioStreamManager_GetDirectPlaybackSupport usage invaild
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result = myaudioNdk.audioManagerGetDirectPlaybackSupportTest_005();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAMMANAGER_GETDIRECTPLAYBACKSUPPORT_001 AudioManagerGetDirectPlaybackSupportTest_001: ${result}`);
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_FAST_STATUS_001
     * @tc.name      : TestCapturerGetFastStatus001
     * @tc.desc      : test OH_AudioCapturer_GetFastStatus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestCapturerGetFastStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetFastStatus_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_FAST_STATUS_001 audioCaptureGetFastStatus_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_FAST_STATUS_002
     * @tc.name      : TestCapturerGetFastStatus002
     * @tc.desc      : test OH_AudioCapturer_GetFastStatus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestCapturerGetFastStatus002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioCaptureGetFastStatus_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_FAST_STATUS_002 audioCaptureGetFastStatus_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GET_FAST_STATUS_001
     * @tc.name      : TestRendererGetFastStatus001
     * @tc.desc      : test OH_AudioRenderer_GetFastStatus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestRendererGetFastStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererGetFastStatus_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_RENDERER_GET_FAST_STATUS_001 audioRendererGetFastStatus_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GET_FAST_STATUS_002
     * @tc.name      : TestRendererGetFastStatus002
     * @tc.desc      : test OH_AudioRenderer_GetFastStatus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestRendererGetFastStatus002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioRendererGetFastStatus_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_RENDERER_GET_FAST_STATUS_002 audioRendererGetFastStatus_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_IS_FAST_PLAYBACK_SUPPORTED_001
     * @tc.name      : TestIsFastPlaybackSupported001
     * @tc.desc      : test OH_AudioStreamManager_IsFastPlaybackSupported
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestIsFastPlaybackSupported001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamManagerIsFastPlaybackSupported_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_IS_FAST_PLAYBACK_SUPPORTED_001 audioStreamManagerIsFastPlaybackSupported_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_IS_FAST_RECORDING_SUPPORTED_001
     * @tc.name      : TestIsFastRecordingSupported001
     * @tc.desc      : test OH_AudioStreamManager_IsFastRecordingSupported
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestIsFastRecordingSupported001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamManagerIsFastRecordingSupported_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_IS_FAST_RECORDING_SUPPORTED_001 audioStreamManagerIsFastRecordingSupported_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_CAPTURER_FAST_STATUS_CHANGED_CALLBACK_001
     * @tc.name      : TestSetCapturerFastStatusChangeCallback001
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerFastStatusChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestSetCapturerFastStatusChangeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerFastStatusChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_SET_CAPTURER_FAST_STATUS_CHANGED_CALLBACK_001 audioStreamBuilderSetCapturerFastStatusChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_CAPTURER_FAST_STATUS_CHANGED_CALLBACK_002
     * @tc.name      : TestSetCapturerFastStatusChangeCallback002
     * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerFastStatusChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestSetCapturerFastStatusChangeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetCapturerFastStatusChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_SET_CAPTURER_FAST_STATUS_CHANGED_CALLBACK_002 audioStreamBuilderSetCapturerFastStatusChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_RENDERER_FAST_STATUS_CHANGED_CALLBACK_001
     * @tc.name      : TestSetRendererFastStatusChangeCallback001
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererFastStatusChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestSetRendererFastStatusChangeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererFastStatusChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_SET_RENDERER_FAST_STATUS_CHANGED_CALLBACK_001 audioStreamBuilderSetRendererFastStatusChangeCallback_001: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_RENDERER_FAST_STATUS_CHANGED_CALLBACK_002
     * @tc.name      : TestSetRendererFastStatusChangeCallback002
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererFastStatusChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TestSetRendererFastStatusChangeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = myaudioNdk.audioStreamBuilderSetRendererFastStatusChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_SET_RENDERER_FAST_STATUS_CHANGED_CALLBACK_002 audioStreamBuilderSetRendererFastStatusChangeCallback_002: ${result}`);
      expect(result).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIORENDERER_WRITEONCALLBACKENHANCE_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIORENDERER_WRITEONCALLBACKENHANCE_0100
     * @tc.desc      : test WRITEONCALLBACKENHANCE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIORENDERER_WRITEONCALLBACKENHANCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
        let resMgr: resourceManager.ResourceManager = testContext!.resourceManager;
        let fileList: Array<String> = myaudioNdk.getFileList(resMgr, '');

        let fileName: string = fileList.filter((file: String) => {return file === 'S16LE.pcm';})?.[0] as string;

        try {
          let fileSize: number = 6156288;
          let getRawFileContent: number = myaudioNdk.GetRawFileContent(resMgr, fileName).byteLength;
          expect(getRawFileContent).assertEqual(fileSize);
        } catch (error) {
          console.info(`getRawFileContent ERROR: ${error.message}`);
          expect().assertFail();
        }

        try {
          let res: number = myaudioNdk.AudioLowLatencyOut();
          expect(Boolean(res)).assertTrue();
        } catch (error) {
          console.info(`AudioLowLatencyOut ERROR: ${error.message}`);
          expect().assertFail();
        }

        try {
          myaudioNdk.StartAudioRenderer();
        } catch (error) {
          console.info(`StartAudioRenderer ERROR: ${error.message}`);
          expect().assertFail();
        }

        await sleep(1000);

        myaudioNdk.StopAndReleaseRenderer();
        expect(true).assertTrue();
        done();
      })
      /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIORENDERER_AUDIOWORKGROUPSET_0100
     * @tc.name      : SUB_MULTIMEDIA_AUDIORENDERER_AUDIOWORKGROUPSET_0100
     * @tc.desc      : test WRITEONCALLBACKENHANCE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIORENDERER_AUDIOWORKGROUPSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
        let resMgr: resourceManager.ResourceManager = testContext!.resourceManager;
        let fileList: Array<String> = myaudioNdk.getFileList(resMgr, '');

        let fileName: string = fileList.filter((file: String) => {return file === 'S16LE.pcm';})?.[0] as string;

        try {
          let fileSize: number = 6156288;
          let getRawFileContent: number = myaudioNdk.GetRawFileContent(resMgr, fileName).byteLength;
          expect(getRawFileContent).assertEqual(fileSize);
        } catch (error) {
          console.info(`getRawFileContent ERROR: ${error.message}`);
          expect().assertFail();
        }

        try {
          let res: number = myaudioNdk.AudioWorkGroupSet();
          expect(Boolean(res)).assertTrue();
        } catch (error) {
          console.info(`AudioWorkGroupSet ERROR: ${error.message}`);
          expect().assertFail();
        }

        try {
          myaudioNdk.StartAudioRenderer();
        } catch (error) {
          console.info(`StartAudioRenderer ERROR: ${error.message}`);
          expect().assertFail();
        }
        await sleep(1000);
        myaudioNdk.StopAndReleaseRenderer();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIORENDERER_AUDIOWORKGROUPSET_0100 StopAndReleaseRenderer`);
        expect(true).assertTrue();
        done();
      })
  })
}

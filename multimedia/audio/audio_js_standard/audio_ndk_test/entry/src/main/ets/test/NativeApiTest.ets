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

import featureAbility from '@ohos.ability.featureAbility';
import { UiDriver, BY } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import myaudioNdk from "libaudioNdkTest.so"

const Tag = 'audio_ndk_test:'
const TEST_PASS = 0; // success result

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

async function getPermission() {
  let permissions = ['ohos.permission.MICROPHONE'];
  featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
    console.info(Tag + "request success" + JSON.stringify(data));
  })
}

async function driveFn() {
  console.info(Tag + `come in driveFn`);
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let driver = await UiDriver.create();
  console.info(Tag + `driver is ${JSON.stringify(driver)}`);
  await sleep(100);
  console.info(Tag + `UiDriver start`);
  let button = await driver.findComponent(BY.text('允许'));
  if (button == null) {
    let cmd = "hidumper -s WindowManagerService -a'-a'"
    await delegator.executeShellCommand(cmd);
  }
  console.info(Tag + `button is ${JSON.stringify(button)}`);
  await sleep(100);
  await button.click();
}

export default function audioNDK() {
  describe('audioNDKTest', () => {
    beforeAll(async () => {
      await getPermission();
      await sleep(100);
      await driveFn();
      await sleep(1000);
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
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
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100', 0, async (done: Function) => {
      let a = myaudioNdk.createAudioStreamBuilder();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100 createAudioStreamBuilder: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100
        * @tc.name      : generate audioCapturer with OH_AudioStreamBuilder_GenerateCapturer
        * @tc.desc      : test OH_AudioStreamBuilder_GenerateCapturer
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100 audioCaptureGenerate: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100 audioCaptureGenerateErr: ${a}`);
      expect(a).assertEqual(1)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100
        * @tc.name      : start audioCapturer
        * @tc.desc      : test OH_AudioCapturer_Start
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100 audioCaptureStart: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100 audioCaptureStartErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100
       * @tc.name      : pause audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCapturePause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100 audioCapturePause: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCapturePauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100 audioCapturePauseErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100
       * @tc.name      : stop audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100 audioCaptureStop: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100 audioCaptureStopErr: ${a}`);
      expect(a).assertEqual(2)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100 audioCaptureFlush: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100 audioCaptureFlushErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100
       * @tc.name      : release audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100 audioCaptureRelease: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100 audioCaptureReleaseErr: ${a}`);
      expect(a).assertEqual(1)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100 audioCaptureGetParameter: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100 audioCaptureGetCurrentState: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100 audioCaptureGetStreamId: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100 audioCaptureGetSamplingRate: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100 audioCaptureGetSampleFormat: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100 audioCaptureGetEncodingType: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100 audioCaptureGetCapturerInfo: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100 audioCaptureGetChannelCount: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100 audioCaptureGetTimestamp: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetFramesRead();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100 audioCaptureGetFramesRead: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCaptureGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100 audioCaptureGetFrameSizeInCallback: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100
       * @tc.name      : SetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_SetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRendererSetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100 audioRendererSetSpeed: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100
       * @tc.name      : GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRendererGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100 audioRendererGetSpeed: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100
       * @tc.name      : SetSpeed&GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRendererSetGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100 audioRendererSetGetSpeed: ${a}`);
      expect(a).assertEqual(1.5)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100
       * @tc.name      : SetRendererOutputDeviceChangeCallback with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioSetRendererOutputDeviceChangeCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100 audioCaptureGetCapturerInfo: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100
       * @tc.name      : GetFramesWritten with OH_AudioRenderer_GetFramesWritten
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetFramesWritten();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100 audioRenderGetFramesWritten: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100
       * @tc.name      : GetTimestamp with OH_AudioRenderer_GetTimestamp
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100 audioRenderGetTimestamp: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100
       * @tc.name      : GetFrameSizeInCallback with OH_AudioRenderer_GetFrameSizeInCallback
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100 audioRenderGetFrameSizeInCallback: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100
       * @tc.name      : generate audioRenderer with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_GenerateRenderer
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100 audioCaptureGetCapturerInfo: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100
       * @tc.name      : generate audioRenderer err
       * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateRenderer
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100 audioRenderGenerateErr: ${a}`);
      expect(a).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100
       * @tc.name      : start audioRenderer
       * @tc.desc      : test OH_AudioRenderer_Start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100 audioRenderStart: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100 audioRenderStartErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100
       * @tc.name      : pause audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderPause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100 audioRenderPause: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderPauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100 audioRenderPauseErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100
       * @tc.name      : stop audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100 audioRenderStop: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100 audioRenderStopErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100
       * @tc.name      : flush audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Flush
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100 audioRenderFlush: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100 audioRenderFlushErr: ${a}`);
      expect(a).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100
       * @tc.name      : release audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100 audioRenderRelease: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100 audioRenderReleaseErr: ${a}`);
      expect(a).assertEqual(1)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100 audioRenderGetCurrentState: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100 audioRenderGetParameter: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100 audioRenderGetStreamId: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100 audioRenderGetSamplingRate: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100 audioRenderGetSampleFormat: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100 audioRenderGetEncodingType: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100 audioRenderGetRendererInfo: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioRenderGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100 audioRenderGetChannelCount: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100
       * @tc.name      : set sampleRate 48000 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100 audioStreamBuilderSetSamplingRate: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100 audioStreamBuilderSetChannelCount: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100
       * @tc.name      : set sampleFormat AUDIOSTREAM_SAMPLE_U8 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100 audioStreamBuilderSetSampleFormat: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100 audioStreamBuilderSetEncodingType: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100
       * @tc.name      : set latencyMode AUDIOSTREAM_LATENCY_MODE_NORMAL streamUsage after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetLatencyMode();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100 audioStreamBuilderSetLatencyMode: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100 audioStreamBuilderSetRendererInfo: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100 audioStreamBuilderSetCapturerInfo: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetRendererCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100 audioStreamBuilderSetRendererCallback: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetCapturerCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100 audioStreamBuilderSetCapturerCallback: ${a}`);
      expect(a).assertEqual(0)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100 audioStreamBuilderSetFrameSizeInCallback: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100
        * @tc.name      : getVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_GetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererGetVolume_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100 audioRendererGetVolume: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100 audioRendererSetVolume: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200 audioRendererSetVolume: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300 audioRendererSetVolume: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_04();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400 audioRendererSetVolume fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_05();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500 audioRendererSetVolume fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600
        * @tc.name      : setVolume with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolume
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolume_06();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600 audioRendererSetVolume fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_04();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_05();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_06();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600 audioRendererSetVolumeWithRamp: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_07();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700 audioRendererSetVolumeWithRamp fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_08();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800 audioRendererSetVolumeWithRamp fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900
        * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetVolumeWithRamp
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetVolumeWithRamp_09();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900 audioRendererSetVolumeWithRamp fail: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_04();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500
            * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
            * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_05();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_07();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetOnMarkReached_08();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800 audioRendererSetOnMarkReached: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100
        * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_CancelMark
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererCancelMark_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100 audioRendererCancelMark: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200
        * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_CancelMark
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200', 0, async function (done) {
        let a = myaudioNdk.audioRendererCancelMark_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200 audioRendererCancelMark: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300
        * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_CancelMark
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300', 0, async function (done) {
        let a = myaudioNdk.audioRendererCancelMark_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300 audioRendererCancelMark: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100
        * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetInterruptMode_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100 audioRendererSetInterruptMode: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200
        * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetInterruptMode_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200 audioRendererSetInterruptMode: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300
        * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetInterruptMode_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300 audioRendererSetInterruptMode: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400
        * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400', 0, async function (done) {
        let a = myaudioNdk.audioRendererSetInterruptMode_04();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400 audioRendererSetInterruptMode: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100
        * @tc.name      : get audioRoutingManager
        * @tc.desc      : test OH_AudioManager_GetAudioRoutingManager
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100', 0, async function (done) {
        let a = myaudioNdk.audioManagerGetAudioRoutingManager_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100 audioManagerGetAudioRoutingManager: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100
        * @tc.name      : get none devices after get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200
        * @tc.name      : get output devices after get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300
        * @tc.name      : get input devices after get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_03();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400
        * @tc.name      : get all devices after get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_04();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500
        * @tc.name      : get devices with invaild flag
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_05();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600
        * @tc.name      : get devices without get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_06();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700
        * @tc.name      : get devices without get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_GetDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetDevices_07();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700 audioRoutingManagerGetDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001
        * @tc.name      : get AudioManager with nullptr
        * @tc.desc      : test OH_GetAudioManager
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001', 0, async function (done) {
        let a = myaudioNdk.audioManagerGetManager_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001 audioManagerGetManager_01: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002
        * @tc.name      : get AudioManager
        * @tc.desc      : test OH_GetAudioManager
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002', 0, async function (done) {
        let a = myaudioNdk.audioManagerGetManager_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002 audioManagerGetManager_02: ${a}`);
        expect(a).assertEqual(TEST_PASS)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001', 0, async function (done) {
        let a = myaudioNdk.audioManagerGetAudioScene_01();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001 audioManagerGetAudioScene_01: ${a}`);
        expect(a).assertEqual(TEST_PASS)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002', 0, async function (done) {
        let a = myaudioNdk.audioManagerGetAudioScene_02();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002 audioManagerGetAudioScene_02: ${a}`);
        expect(a).assertEqual(TEST_PASS)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetAvailableDevices001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001 audioRoutingManagerGetAvailableDevices001: ${a}`);
        expect(a).assertEqual(TEST_PASS)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetPreferredOutputDevice001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001 audioRoutingManagerGetPreferredOutputDevice001: ${a}`);
        expect(a).assertEqual(TEST_PASS)
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
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerGetPreferredInputDevice001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001 audioRoutingManagerGetPreferredInputDevice001: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100
        * @tc.name      : registerDeviceChangeCallback with none device flag
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200
        * @tc.name      : registerDeviceChangeCallback with output device flag
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300
        * @tc.name      : registerDeviceChangeCallback with input device flag
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400
        * @tc.name      : registerDeviceChangeCallback with all device flag
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_004();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500
        * @tc.name      : registerDeviceChangeCallback without get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_005();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600
        * @tc.name      : registerDeviceChangeCallback with nullptr callback
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_006();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700
        * @tc.name      : registerDeviceChangeCallback with nullptr callback
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_007();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800
        * @tc.name      : registerDeviceChangeCallback with nullptr callback
        * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_008();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800 audioRoutingManagerRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100
        * @tc.name      : unRegisterDeviceChangeCallback without register callback
        * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerUnRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200
        * @tc.name      : unRegisterDeviceChangeCallback without get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerUnRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300
        * @tc.name      : unRegisterDeviceChangeCallback with nullptr callback
        * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerUnRegisterDeviceChangeCallback: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100
        * @tc.name      : release devices without get audioRoutingManager
        * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerReleaseDevices_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100 audioRoutingManagerReleaseDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200
        * @tc.name      : release devices with nullptr devices
        * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200', 0, async function (done) {
        let a = myaudioNdk.audioRoutingManagerReleaseDevices_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200 audioRoutingManagerReleaseDevices: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100
        * @tc.name      : get deviceType with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100 audioAudioDeviceDescriptorGetDeviceType: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200
        * @tc.name      : get deviceType with nullptr devicetype
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200 audioAudioDeviceDescriptorGetDeviceType: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300
        * @tc.name      : get deviceType with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300 audioAudioDeviceDescriptorGetDeviceType: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100
        * @tc.name      : get deviceRole with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100 audioAudioDeviceDescriptorGetDeviceRole: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200
        * @tc.name      : get deviceRole with nullptr deviceRole
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200 audioAudioDeviceDescriptorGetDeviceRole: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300
        * @tc.name      : get deviceRole with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300 audioAudioDeviceDescriptorGetDeviceRole: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100
        * @tc.name      : get deviceId with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100 audioAudioDeviceDescriptorGetDeviceId: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200
        * @tc.name      : get deviceId with nullptr deviceId
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200 audioAudioDeviceDescriptorGetDeviceId: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300
        * @tc.name      : get deviceId with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300 audioAudioDeviceDescriptorGetDeviceId: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100
        * @tc.name      : get deviceName with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100 audioAudioDeviceDescriptorGetDeviceName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200
        * @tc.name      : get deviceName with nullptr deviceName
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200 audioAudioDeviceDescriptorGetDeviceName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300
        * @tc.name      : get deviceName with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300 audioAudioDeviceDescriptorGetDeviceName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100
        * @tc.name      : get deviceAddress with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100 audioAudioDeviceDescriptorGetDeviceAddress: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200
        * @tc.name      : get deviceAddress with nullptr deviceAddress
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200 audioAudioDeviceDescriptorGetDeviceAddress: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300
        * @tc.name      : get deviceAddress with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300 audioAudioDeviceDescriptorGetDeviceAddress: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100
        * @tc.name      : get deviceSampleRates with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100 audioAudioDeviceDescriptorGetDeviceSampleRates: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200
        * @tc.name      : get deviceSampleRates with nullptr deviceSampleRates
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200 audioAudioDeviceDescriptorGetDeviceSampleRates: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300
        * @tc.name      : get deviceSampleRates with nullptr size
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300 audioAudioDeviceDescriptorGetDeviceSampleRates: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400
        * @tc.name      : get deviceSampleRates with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_004();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400 audioAudioDeviceDescriptorGetDeviceSampleRates: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100
        * @tc.name      : get deviceChannelCounts with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200
        * @tc.name      : get deviceChannelCounts with nullptr channelCounts
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300
        * @tc.name      : get deviceChannelCounts with nullptr channelSize
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400
        * @tc.name      : get deviceChannelCounts with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_004();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100
        * @tc.name      : get deviceDisplayName with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100 audioAudioDeviceDescriptorGetDeviceDisplayName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200
        * @tc.name      : get deviceDisplayName with nullptr displayName
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200 audioAudioDeviceDescriptorGetDeviceDisplayName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300
        * @tc.name      : get deviceDisplayName with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300 audioAudioDeviceDescriptorGetDeviceDisplayName: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100
        * @tc.name      : get deviceEncodingTypes with all devices
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_001();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200
        * @tc.name      : get deviceEncodingTypes with nullptr encodingTypes
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_002();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300
        * @tc.name      : get deviceEncodingTypes with nullptr encodingTypeSize
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_003();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400
        * @tc.name      : get deviceEncodingTypes with nullptr descriptor
        * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400', 0, async function (done) {
        let a = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_004();
        console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${a}`);
        expect(a).assertEqual(TEST_PASS)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003', 0, async function (done) {
      let a = myaudioNdk.audioAudioInternalRecordingSuccess01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003 audioAudioInternalRecordingSuccess: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004', 0, async function (done) {
      let a = myaudioNdk.audioAudioInternalRecordingSuccess02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004 audioAudioInternalRecordingSuccess: ${a}`);
      expect(a).assertEqual(0)
      done()
    })
 
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005', 0, async function (done) {
      let a = myaudioNdk.audioAudioInternalRecordingFalse();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005 audioAudioInternalRecordingFalse: ${a}`);
      expect(a).assertEqual(1)
      done()
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100
     * @tc.name      : set rendererWriteDataCallback with VALID result after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100`,
        `audioStreamBuilderSetRendererWriteDataCallback_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200
     * @tc.name      : set rendererWriteDataCallback with INVALID result after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200', 0, async (done: Function) => {
      let a = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200`,
        `audioStreamBuilderSetRendererWriteDataCallback_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100
     * @tc.name      : set  create audioStreamBuilder
     * @tc.desc      : test OH_AudioCapturer_GetOverflowCount
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100', 0, async (done: Function) => {
      let a = myaudioNdk.audioCapturerGetOverflowCount_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100`,
        `audioCapturerGetOverflowCount_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_MIX_WITH_OTHERS  
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStrategy_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100`,
        `AudioSessionManagerStrategy_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DEFAULT   
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStrategy_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200`,
        `AudioSessionManagerStrategy_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DUCK_OTHERS   
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStrategy_003();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300`,
        `AudioSessionManagerStrategy_003: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_PAUSE_OTHERS   
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStrategy_004();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400`,
        `AudioSessionManagerStrategy_004: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStrategyError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100`,
        `AudioSessionManagerStrategyError_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerActivatedError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100`,
        `AudioSessionManagerActivatedError_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStopError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100`,
        `AudioSessionManagerStopError_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

     /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200
     * @tc.name      : stpo AudioSessionManager twice
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerStopError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200`,
        `AudioSessionManagerStopError_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerRegisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100`,
        `AudioSessionManagerRegisterError_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerRegisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200`,
        `AudioSessionManagerRegisterError_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerUnregisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100`,
        `AudioSessionManagerUnregisterError_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerUnregisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200`,
        `AudioSessionManagerUnregisterError_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_LOWER_PRIORITY 
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerReason_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100`,
        `AudioSessionManagerReason_001: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_TIMEOUT  
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200', 0, async (done: Function) => {
      let a = myaudioNdk.AudioSessionManagerReason_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200`,
        `AudioSessionManagerReason_002: ${a}`);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100
     * @tc.name      : set  set default output device with invalid devicetype
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100', 0, async (done: Function) => {
        let a = myaudioNdk.audioRendererSetDefaultOutputDevice_01();
        console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100`,
          `audioRendererSetDefaultOutputDevice_01: ${a}`);
        expect(a).assertEqual(0)
        done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200
     * @tc.name      : set  set default output device with invalid streamusage
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200', 0, async (done: Function) => {
        let a = myaudioNdk.audioRendererSetDefaultOutputDevice_02();
        console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200`,
          `audioRendererSetDefaultOutputDevice_02: ${a}`);
        expect(a).assertEqual(0)
        done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300
     * @tc.name      : set  set default output device with nullptr
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300', 0, async (done: Function) => {
        let a = myaudioNdk.audioRendererSetDefaultOutputDevice_03();
        console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300`,
          `audioRendererSetDefaultOutputDevice_03: ${a}`);
        expect(a).assertEqual(0)
        done()
    })
  })
}

/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base'

const defaultVolumeGroupId = audio.DEFAULT_VOLUME_GROUP_ID;
let audioManager = audio.getAudioManager();
let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
let audioVolumeGroupManager: audio.AudioVolumeGroupManager | undefined = undefined;
let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
let REMOTE_CAST = audio.DeviceType.REMOTE_CAST;
let rate_88200 = audio.AudioSamplingRate.SAMPLE_RATE_88200;
let rate_176400 = audio.AudioSamplingRate.SAMPLE_RATE_176400;
let rate_19200 = audio.AudioSamplingRate.SAMPLE_RATE_192000;


let capturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_MIC,
  capturerFlags: 0
}

let rendererInfo: audio.AudioRendererInfo = {
  usage : audio.StreamUsage.STREAM_USAGE_MUSIC,
  rendererFlags : 0
}

const prame =async ()=>{
  audioVolumeManager.getVolumeGroupManager(defaultVolumeGroupId, (err: BusinessError, value: audio.AudioVolumeGroupManager) => {
    if (err) {
      console.error(`Failed to obtain the volume group infos list. ${err}`);
      return;
    }
    audioVolumeGroupManager = value;
    console.info('Callback invoked to indicate that the volume group infos list is obtained.');
  });
}

export default function maxAmplitudeFor() {
  describe('maxAmplitudeFor', function () {
   const prame =async ()=>{
     audioVolumeManager.getVolumeGroupManager(defaultVolumeGroupId, (err: BusinessError, value: audio.AudioVolumeGroupManager) => {
       if (err) {
         console.error(`Failed to obtain the volume group infos list. ${err}`);
         return;
       }
       audioVolumeGroupManager = value;
       console.info('Callback invoked to indicate that the volume group infos list is obtained.');
     });
   }

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      prame();
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200
     * @tc.name      : AudioRenderer - STATE_RUNNING - Callback
     * @tc.desc      : AudioRenderer - STATE_RUNNING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, function () {
      audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((data) => {
        audioVolumeGroupManager.getMaxAmplitudeForInputDevice(data[0]).then((value) => {
          console.info(`mic volatileume amplitude is: ${value}`);
          expect(value).assertEqual(0);
        }).catch((err: BusinessError) => {
          expect(false).assertTrue();
          console.error("getMaxAmplitudeForInputDevice error" + JSON.stringify(err));
        })
      }).catch((err: BusinessError) => {
        expect(false).assertTrue();
        console.error("get outputDeviceId error" + JSON.stringify(err));
      })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200
     * @tc.name      : AudioRenderer - STATE_RUNNING - Callback
     * @tc.desc      : AudioRenderer - STATE_RUNNING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, function () {
      audioRoutingManager.getPreferOutputDeviceForRendererInfo(rendererInfo).then((data) => {
        audioVolumeGroupManager.getMaxAmplitudeForOutputDevice(data[0]).then((value) => {
          console.info(`mic volatileume amplitude is: ${value}`);
          expect(value).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.error("getMaxAmplitudeForOutputDevice error" + JSON.stringify(err));
          expect(false).assertTrue();
        })
      }).catch((err: BusinessError) => {
        console.error("getPreferOutputDeviceForRendererInfo error" + JSON.stringify(err));
        expect(false).assertTrue();
      })
    })

  })
}
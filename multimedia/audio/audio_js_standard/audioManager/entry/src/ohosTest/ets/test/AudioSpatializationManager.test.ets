/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { Driver } from '@ohos.UiTest';

let audioRendererOptions: audio.AudioRendererOptions[] = [
  {
    streamInfo:{
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
      channels: audio.AudioChannel.CHANNEL_2,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
    },
    rendererInfo:{
      usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
      rendererFlags: 0
    }
  },
  {
    streamInfo:{
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
      channels: audio.AudioChannel.CHANNEL_6,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
    },
    rendererInfo: {
      usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
      rendererFlags: 0
    }
  }
]

// export function sleep(ms: number): Promise<string> {
//   return new Promise((resolve) => {
//     setTimeout(() => {
//       resolve('');
//     }, ms);
//   });
// }

export default function audioSpatializationManager() {

  const TAG = "[AudioSpatializationManagerJsTest]";
  const stringParameter: ESObject = 'stringParameter';
  const params: ESObject = '';
  const numberParameter = 12345678;

  describe("AudioSpatializationManagerJsTest", () => {

    beforeAll(async () => {
      console.info(TAG + "beforeAll called");
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called')
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called')
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called')
    })


    /**
     * @tc.number    : SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.name      : AudioSpatializationManager
     * @tc.desc      : on(spatializationEnabledChangeForCurrentDevice)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.on("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 SUCCESS.`);
        expect(false == ret).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG} SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 ERROR: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.name      : AudioSpatializationManager
     * @tc.desc      : off(spatializationEnabledChangeForCurrentDevice)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.off("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 SUCCESS.`);
        expect(false == ret).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG} SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 ERROR: ${err.message}`);
        expect().assertFail();
        done();
      }
    })
    

    /**
     * @tc.number    : SUB_AUDIO_SPATIALIZATION_MANAGER_ISSPATIALIZATIONENABLEDFORCURRENTDEVICE_TEST_001
     * @tc.name      : AudioSpatializationManager
     * @tc.desc      : isSpatializationEnabledForCurrentDevice
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISSPATIALIZATIONENABLEDFORCURRENTDEVICE_TEST_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioSpatializationManager:audio.AudioSpatializationManager;
        let audioManager = audio.getAudioManager();
        audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
        console.log("Sample_ret_isSpatializationEnabledForCurrentDevice_test = %s,",ret);
        expect(false == ret).assertTrue();
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_SPATIALIZATION_MANAGER_SPATIALIZATIONSUPPORTED_TEST_001
     * @tc.name      : AudioSpatializationManager
     * @tc.desc      : spatializationSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SPATIALIZATIONSUPPORTED_TEST_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioRoutingManager: audio.AudioRoutingManager;
        let audioManager = audio.getAudioManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors: audio.AudioDeviceDescriptors =
          audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let isSpaSupported = audioDeviceDescriptors[0].spatializationSupported as boolean;
        console.log("Sample_ret_isSpaSupported = %s",isSpaSupported);
        expect(false == isSpaSupported).assertTrue();
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })

  })
}
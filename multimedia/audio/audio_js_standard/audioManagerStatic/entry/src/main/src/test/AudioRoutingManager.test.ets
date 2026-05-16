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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';

export default function audioRoutingManager() {
  const TAG = "[AudioRoutingManagerJsTest]";
  const numberParameter = 12345678;

  describe("AudioRoutingManagerJsTest", () => {

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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err: BusinessError) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0200
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err: BusinessError) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0400
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err: BusinessError) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0400 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0500
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err: BusinessError<void> | null, AudioDeviceDescriptors: audio.AudioDeviceDescriptors | undefined) => {
            if (err) {
              console.error(`get device descriptor fail: ${err?.code},${err?.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0500 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0600
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err: BusinessError<void> | null, AudioDeviceDescriptors: audio.AudioDeviceDescriptors | undefined) => {
            if (err) {
              console.error(`get device descriptor fail: ${err?.code},${err?.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0600 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0800
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err: BusinessError<void> | null, AudioDeviceDescriptors: audio.AudioDeviceDescriptors | undefined) => {
            if (err) {
              console.error(`get device descriptor fail: ${err?.code},${err?.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0800 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_STATIC_0100
     * @tc.desc   Get prefer output device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 SUCCESS` +
        JSON.stringify(data));
        expect(true).assertTrue();
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0500
     * @tc.desc   Get prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0500 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0500 SUCCESS`);
        expect(true).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100
     * @tc.desc   Off prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.offPreferOutputDeviceChangeForRendererInfo((data: audio.AudioDeviceDescriptors) => {
        });
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0200
     * @tc.desc   Off prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.offPreferOutputDeviceChangeForRendererInfo();
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0200 SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0200 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0100
     * @tc.desc   Get preferred output device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0500
     * @tc.desc   Get preferred output device - Sync - STREAM_USAGE_GAME_Parameters - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0400 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0400 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0100
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e: BusinessError) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
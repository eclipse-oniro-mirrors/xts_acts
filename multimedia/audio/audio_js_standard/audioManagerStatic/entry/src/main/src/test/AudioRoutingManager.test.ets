/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
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
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
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
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
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
      } catch (e) {
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
      } catch (e) {
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
      } catch (e) {
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
        done();
      } catch (e) {
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
        done();
      } catch (e) {
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
        done();
      } catch (e) {
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
      } catch (e) {
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
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0500 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0500 ERROR: ${e.message},ErrorCode:${e.code}`);
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
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0001
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0001
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0001 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0001 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0002
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0002
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0002 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0002 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0003
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0003
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0003 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0003 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0004
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0004
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0004 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0004 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0005
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0005
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0005 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0005 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0006
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0006
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0006 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0006 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0007
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0007
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0007 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0007 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0008
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0008
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0008 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0008 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0009
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0009
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0009 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0009 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0010
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0010
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0010 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0010 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0011
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0011
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0011 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0011 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0012
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0012
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0012 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0012 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0013
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0013
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0013 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0013 SUCCESS`);
        done();
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0014
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0014
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0014 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0014 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0015
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0015
    * @tc.desc   Get prefer output device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (e?.code) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0015 ERROR: ${e?.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0015 SUCCESS`);
        done();
      });
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0017
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0017
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0017 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0017 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0018
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0018
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0018 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0018 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0019
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0019
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0019 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0019 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0020
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0020
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0020 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0020 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0021
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0021
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0021 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0021 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0022
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0022
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0022 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0022 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0023
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0023
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0023 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0023 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0024
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0024
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0024 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0024 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0025
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0025
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0025 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0025 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0026
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0026
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0027
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0027
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0016 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0028
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0028
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0028 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0028 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0029
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0029
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0029 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0029 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0030
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0030
    * @tc.desc   Get prefer output device - primose
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0030 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_0030 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0900
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0900
    * @tc.desc   Get prefer input device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err: BusinessError<void> | null, AudioDeviceDescriptors: audio.AudioDeviceDescriptors | undefined) => {
            if (err) {
              console.error(`get device descriptor fail: ${err?.code},${err?.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              console.log(`get device descriptor success: `);
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_0900 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1000
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1000
    * @tc.desc   Get prefer input device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
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
              console.log(`get device descriptor success: `);
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1000 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1100
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1100
    * @tc.desc   Get prefer input device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
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
              console.log(`get device descriptor success: `);
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1100 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1200
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1200
    * @tc.desc   Get prefer input device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
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
              console.log(`get device descriptor success: `);
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1200 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1300
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1300
    * @tc.desc   Get prefer input device - callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
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
              console.log(`get device descriptor success: `);
              let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors!;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1300 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1400
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1400
    * @tc.desc   Get prefer input device - promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: `);
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(Number(err.code)).assertEqual(6800101);
          done();
        }
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1400 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1500
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1500
    * @tc.desc   Get prefer input device - promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: `);
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1500 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1600
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1600
    * @tc.desc   Get prefer input device - promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: `);
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1600 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1700
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1700
    * @tc.desc   Get prefer input device - promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: `);
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1700 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1800
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1800
    * @tc.desc   Get prefer input device - promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        try {
          let AudioDeviceDescriptors = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
          console.log(`get device descriptor success: `);
          let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(data[0].networkId).assertEqual("LocalDevice");
          done();
        } catch (err) {
          console.error(`get device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_STATIC_1800 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })
        /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0001
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0001
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0001 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0001 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })



    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0002
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0002
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0002 SUCCESS`);
        console.log(`get device descriptor success: `);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0002 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0003
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0003
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0003 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0003 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0004
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0004
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0004 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0004 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0005
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0005
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0005 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0005 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0006
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0006
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0006 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0006 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0007
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0007
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0007 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0007 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0008
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0008
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0008 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0008 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0009
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0009
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0009 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0009 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0010
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0010
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0010 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0010 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0011
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0011
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0011 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0011 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0012
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0012
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0012 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0012 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0013
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0013
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0013 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0013 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0014
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0014
    * @tc.desc   Get preferred output device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0014 SUCCESS`);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_STATIC_0014 ERROR: ${e?.message}`);
        expect().assertFail();
        done();
      }
    })
    
    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0200
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0200
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0200 ERROR: ${e?.message}`);
        expect(Number(e.code)).assertEqual(6800101);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0300
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0300
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0300 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0400
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0400
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0400 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0500
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0500
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0500 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0600
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0600
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0600 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0700
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0700
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0700 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0800
    * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0800
    * @tc.desc   Get preferred input device - Sync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: `);
        console.log(`get device descriptor success: `);
        let data: audio.AudioDeviceDescriptors = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_STATIC_0800 ERROR: ${e?.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_001
     * @tc.number AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_001
     * @tc.desc   on/off DeviceChange OUTPUT_DEVICES_FLAG - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        try {
            audioRoutingManager.offDeviceChange();
            audioRoutingManager.onDeviceChange(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
            audioRoutingManager.offDeviceChange((deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
        } catch (err) {
            console.log(`AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_001 on deviceChange err: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done();
        }
        done();
    });
    /**
     * @tc.name   AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_002
     * @tc.number AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_002
     * @tc.desc   on/off DeviceChange INPUT_DEVICES_FLAG - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        try {
            audioRoutingManager.offDeviceChange();
            audioRoutingManager.onDeviceChange(audio.DeviceFlag.INPUT_DEVICES_FLAG, (deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
            audioRoutingManager.offDeviceChange((deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
        } catch (err) {
            console.log(`AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_002 on deviceChange err: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done();
        }
        done();
    });
    /**
     * @tc.name   AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_003
     * @tc.number AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_003
     * @tc.desc   on/off DeviceChange ALL_DEVICES_FLAG - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        try {
            audioRoutingManager.offDeviceChange();
            audioRoutingManager.onDeviceChange(audio.DeviceFlag.ALL_DEVICES_FLAG, (deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
            audioRoutingManager.offDeviceChange((deviceChanged: audio.DeviceChangeAction) => {
                console.info(`deviceChange event received: ${JSON.stringify(deviceChanged)}`);
                expect(deviceChanged.type).assertLargerOrEqual(0);
                expect(deviceChanged.deviceDescriptors != null).assertTrue();
            });
        } catch (err) {
            console.log(`AUDIO_ROUTING_MANAGER_ON_OFF_DEVICE_CHANGE_TYPE_STATIC_003 on deviceChange err: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done();
        }
        done();
    });
    /**
     * @tc.name   AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_001
     * @tc.number AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_001
     * @tc.desc   On/Off prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioRoutingManager = audio.getAudioManager().getRoutingManager();
        let rendererInfo: audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
        };
        try {
            audioRoutingManager.onPreferOutputDeviceChangeForRendererInfo(rendererInfo, (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
                console.info(`Succeeded in using on function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
            });
            audioRoutingManager.offPreferOutputDeviceChangeForRendererInfo((data: audio.AudioDeviceDescriptors) => {
            });
            console.info(`AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_001 SUCCESS`);
        } catch (e) {
            console.error(`AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_STATIC_001 ERROR: ${e.message}`);
            expect().assertFail();
            done();
        }
        done();
    })
    /**
     * @tc.name   AUDIO_ROUTINGMANAGER_ON_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_STATIC_001
     * @tc.number AUDIO_ROUTINGMANAGER_ON_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_STATIC_001
     * @tc.desc   On/Off prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_ROUTINGMANAGER_ON_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_STATIC_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioRoutingManager = audio.getAudioManager().getRoutingManager();
        let capturerInfo: audio.AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
        };
        try {
            audioRoutingManager.offPreferredInputDeviceChangeForCapturerInfo();
            audioRoutingManager.onPreferredInputDeviceChangeForCapturerInfo(capturerInfo, (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
                console.info(`Succeeded in using on function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
            });
            audioRoutingManager.offPreferredInputDeviceChangeForCapturerInfo((data: audio.AudioDeviceDescriptors) => {
            });
            console.info(`AUDIO_ROUTINGMANAGER_ON_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_STATIC_001 SUCCESS`);
        } catch (e) {
            console.error(`AUDIO_ROUTINGMANAGER_ON_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_STATIC_001 ERROR: ${e.message}`);
            expect().assertFail();
            done();
        }
        done();
    })
  })
}
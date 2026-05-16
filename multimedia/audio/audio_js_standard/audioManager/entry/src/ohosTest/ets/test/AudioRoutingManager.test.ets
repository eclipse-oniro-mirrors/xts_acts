/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}


export default function audioRoutingManager() {

  const TAG = "[AudioRoutingManagerJsTest]";
  const stringParameter: ESObject = 'stringParameter';
  const params: ESObject = '';
  const numberParameter = 12345678;
  let audioRoutingManager = audio.getAudioManager().getRoutingManager();

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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(1);
            expect(data[0].deviceType).assertEqual(15);
            expect(data[0].networkId).assertEqual("LocalDevice");
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(1);
            expect(data[0].deviceType).assertEqual(15);
            expect(data[0].networkId).assertEqual("LocalDevice");
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.INVALID);
            expect(data[0].networkId).assertEqual('LocalDevice');

            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(1);
            expect(data[0].deviceType).assertEqual(15);
            expect(data[0].networkId).assertEqual("LocalDevice");
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0001
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.INVALID);
            expect(data[0].networkId).assertEqual('LocalDevice');
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0001 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0002
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
            expect(data[0].networkId).assertEqual('LocalDevice');
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0002 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0003
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
            expect(data[0].networkId).assertEqual('LocalDevice');
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0003 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0004
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
            expect(data[0].networkId).assertEqual('LocalDevice');
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0004 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0005
     * @tc.desc   Get prefer input device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            let data: ESObject = AudioDeviceDescriptors;
            expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(data[0].deviceType).assertEqual(audio.DeviceType.MIC);
            expect(data[0].networkId).assertEqual('LocalDevice');
            done();
          }).catch((err: BusinessError) => {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0005 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
              expect(data[0].deviceType).assertEqual(audio.DeviceType.INVALID);
              expect(data[0].networkId).assertEqual('LocalDevice');
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900
     * @tc.desc   Get prefer input device - error code - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: ESObject = 'abc';
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(false).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`get invalid device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900 return 401 success:${e.code},${e.message}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000
     * @tc.desc   Get prefer input device - error code - invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: 9,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo)
          .then((AudioDeviceDescriptors) => {
            console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(false).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`get invalid device descriptor fail: ${err.code},${err.message}`);
            expect(Number(err.code)).assertEqual(6800101);
            done();
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000 return success:${e}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100
     * @tc.desc   Get prefer input device - error code - null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(params).then((AudioDeviceDescriptors) => {
          console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`get invalid device descriptor fail: ${err.code},${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100 return 401 success:${e.code},${e.message}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1200
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              expect(false).assertTrue();
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1200 ERROR: ${e.message}`);

        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1300
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1300 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1400
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1400 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1500
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1500 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1600
     * @tc.desc   Get prefer input device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo,
          (err, AudioDeviceDescriptors) => {
            if (err) {
              console.error(`get device descriptor fail: ${err.code},${err.message}`);
              expect(Number(err.code)).assertEqual(6800101);
              done();
            } else {
              console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
              let data: ESObject = AudioDeviceDescriptors;
              expect(data[0].deviceRole).assertEqual(1);
              expect(data[0].deviceType).assertEqual(15);
              expect(data[0].networkId).assertEqual("LocalDevice");
              done();
            }
          });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1600 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
     * @tc.desc   Get prefer output device - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS` +
        JSON.stringify(data));
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     * @tc.desc   Get prefer output device no parameter- promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(params);
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 parameter check ERROR: ${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (e) {
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 ERROR: ${e.message}`);
          expect().assertFail();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 check no parameter PASS`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     * @tc.desc   Get prefer output device check number parameter- promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo: audio.AudioRendererInfo = {
        usage: 123,
        rendererFlags: 0
      }
      try {
        await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo).then((desc) => {
          console.info(`device descriptor: ${desc}`);
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 parameter check ERROR: ` +
          JSON.stringify(desc));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 Fass: ${err.message},code:${err.code}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
          done();
        })
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 check number parameter Fail:${e.message},code:${e.code}`);
        expect(Number(e.code)).assertEqual(6800301);
        done();
      }

    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     * @tc.desc   Get prefer output device check string parameter- promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(stringParameter);
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 parameter check ERROR: ` +
        JSON.stringify(data));
        expect().assertFail();
      } catch (e) {
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 ERROR: ${e.message}`);
          expect().assertFail();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 check string parameter PASS`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
     * @tc.desc   Get prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e, data) => {
        if (e) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500 SUCCESS`);
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600
     * @tc.desc   Get prefer output device check number parameter- callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: ESObject = {
        usage: 123,
        rendererFlags: 0
      }

      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e, data) => {
          if (e) {
            console.log(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 Pass: ${e.message},code:${e.code}`);
            expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
            done();
          } else {
            console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 check number parameter fail`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 fail,${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700
     * @tc.desc   Get prefer output device check number parameter- callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.getPreferOutputDeviceForRendererInfo(stringParameter, (e, data) => {
          if (e.code != 401) {
            console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 ERROR: ${e.message}`);
            expect(false).assertTrue();
            done();
          }
          console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 check string parameter fail`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 ERROR: ${error.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 check string parameter PASS,${error.code}`);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
     * @tc.desc   Get prefer output device check number parameter- callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: ESObject = {
        usage: 123,
      }

      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', rendererInfo, (data) => {
        });
        expect(false).assertTrue();
        done();
        routingManager.off('preferOutputDeviceChangeForRendererInfo', (data) => {
        });
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     * @tc.desc   On prefer output device check string parameter- callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();

      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', stringParameter, (data) => {
        });
        expect(false).assertTrue();
        done();
        routingManager.off('preferOutputDeviceChangeForRendererInfo', (data) => {
        });
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 PASS: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     * @tc.desc   On prefer output device check null parameter- callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', params, (data) => {
        });
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 PASS: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     * @tc.desc   On/Off prefer output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let flag: boolean = false;
      try {
        audioRoutingManager.off('preferOutputDeviceChangeForRendererInfo');

        let preferOutputDeviceChangeForRendererInfoCallback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`Succeeded in using on or off function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
        };
        let rendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC, // 音频流使用类型：音乐。根据业务场景配置，参考StreamUsage。
          rendererFlags: 0 // 音频渲染器标志。
        };

        audioRoutingManager.on('preferOutputDeviceChangeForRendererInfo', rendererInfo, preferOutputDeviceChangeForRendererInfoCallback);

        audioRoutingManager.off('preferOutputDeviceChangeForRendererInfo', preferOutputDeviceChangeForRendererInfoCallback);
        flag = true;
      } catch (e) {
        console.info(`$SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 FAIL: ${e.message},Code:${e.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
     * @tc.desc   On/Off prefer output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let flag: boolean = false;
      try {
        let preferOutputDeviceChangeForRendererInfoCallback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`Succeeded in using on or off function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
        };
        let rendererInfo: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC, // 音频流使用类型：音乐。根据业务场景配置，参考StreamUsage。
          rendererFlags: 0 // 音频渲染器标志。
        };

        audioRoutingManager.on('preferOutputDeviceChangeForRendererInfo', rendererInfo, preferOutputDeviceChangeForRendererInfoCallback);

        audioRoutingManager.off('preferOutputDeviceChangeForRendererInfo');
        flag = true;
      } catch (e) {
        console.info(`$SUB_MULTIMEDIA_AUDIO_ON_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0500 FAIL: ${e.message},Code:${e.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
     * @tc.number s
     * @tc.desc   Off prefer output device - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.off('preferOutputDeviceChangeForRendererInfo', (data) => {
        });
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS`);
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0100
     * @tc.desc   Get preferred output device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(2);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200
     * @tc.desc   Get preferred output device - Sync - Null_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(null);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(2);
        expect(data[0].deviceType).assertEqual(2);
        expect(data[0].networkId).assertEqual("LocalDevice");
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300
     * @tc.desc   Get preferred output device - Sync - Number_Invalid_Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let rendererInfo: audio.AudioRendererInfo = {
        usage: 123,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400
     * @tc.desc   Get preferred output device - Sync - String_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo: ESObject = '123'
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(2);
        expect(data[0].deviceType).assertEqual(2);
        expect(data[0].networkId).assertEqual("LocalDevice");
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0500
     * @tc.desc   Get preferred output device - Sync - STREAM_USAGE_GAME_Parameters - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let routingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0500 SUCCESS` +
        JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(2);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0500 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0100
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

        /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0001
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0001 ERROR: ${e.message}`);
        expect(Number(e.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0002
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0002 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0003
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(0);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0003 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0004
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0004 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0005
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0005 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0006
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0006
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0006 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0007
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0007
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0007 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0008
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0008
     * @tc.desc   Get preferred input device - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        let data: ESObject = AudioDeviceDescriptors;
        expect(data[0].deviceRole).assertEqual(1);
        expect(data[0].deviceType).assertEqual(15);
        expect(data[0].networkId).assertEqual("LocalDevice");
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0008 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200
     * @tc.desc   Get preferred input device - Null_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(params);
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();

      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300
     * @tc.desc   Get preferred input device - Number_Invalid_Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: 123,
        capturerFlags: 0
      }
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo);
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();

      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400
     * @tc.desc   Get preferred input device - undefined_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(undefined);
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();

      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0500
     * @tc.desc   Get preferred input device - String_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let data: ESObject = '123';
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(data);
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();

      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100
     * @tc.desc   On preferred input devicechangeinfo - Null_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', undefined, (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo', (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200
     * @tc.desc   On preferred input devicechangeinfo - Number_Invalid_Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: 123,
        capturerFlags: 0
      }
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', capturerInfo, (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo', (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300
     * @tc.desc   On preferred input devicechangeinfo - String_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo: ESObject = '123';
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', rendererInfo, (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo', (desc: ESObject) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0400
     * @tc.desc   On/Off preferred input devicechangeinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let flag: boolean = false;
      try {
        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo');

        let preferredInputDeviceChangeForCapturerInfoCallback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`Succeeded in using on or off function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
        };
        let capturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
          capturerFlags: 0 // 音频采集器标志。
        };

        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', capturerInfo, preferredInputDeviceChangeForCapturerInfoCallback);

        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo', preferredInputDeviceChangeForCapturerInfoCallback);
        flag = true;
      } catch (e) {
        console.info(`$SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0400 FAIL: ${e.message},Code:${e.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0500
     * @tc.desc   On/Off preferred input devicechangeinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let flag: boolean = false;
      try {
        let preferredInputDeviceChangeForCapturerInfoCallback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`Succeeded in using on or off function, AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
        };
        let capturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
          capturerFlags: 0 // 音频采集器标志。
        };

        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', capturerInfo, preferredInputDeviceChangeForCapturerInfoCallback);

        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo');
        flag = true;
      } catch (e) {
        console.info(`$SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0500 FAIL: ${e.message},Code:${e.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.name   AUDIOROUTINGMANAGER_OFF_DEVICECHANGE_1310
     * @tc.number AUDIOROUTINGMANAGER_OFF_DEVICECHANGE_1310
     * @tc.desc   off_deviceChange with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_OFF_DEVICECHANGE_1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.off('deviceChange', undefined);
        console.info(`AUDIOROUTINGMANAGER_OFF_DEVICECHANGE_1310: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_OFF_DEVICECHANGE_1310: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_OFF_AVAILABLEDEVICECHANGE_1312
     * @tc.number AUDIOROUTINGMANAGER_OFF_AVAILABLEDEVICECHANGE_1312
     * @tc.desc   off_availableDeviceChange with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_OFF_AVAILABLEDEVICECHANGE_1312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.off('availableDeviceChange', undefined);
        console.info(`AUDIOROUTINGMANAGER_OFF_AVAILABLEDEVICECHANGE_1312: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_OFF_AVAILABLEDEVICECHANGE_1312: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313
     * @tc.number AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313
     * @tc.desc   getPreferOutputDeviceForRendererInfo with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferOutputDeviceForRendererInfo(null, (err, device) => {
          if (err) {
            console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1313: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314
     * @tc.number AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314
     * @tc.desc   getPreferOutputDeviceForRendererInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferOutputDeviceForRendererInfo(undefined, (err, device) => {
          if (err) {
            console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1314: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1315
     * @tc.number AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1315
     * @tc.desc   getPreferOutputDeviceForRendererInfo with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRoutingManager.getPreferOutputDeviceForRendererInfo(null);
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1315: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1315: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1316
     * @tc.number AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1316
     * @tc.desc   getPreferOutputDeviceForRendererInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRoutingManager.getPreferOutputDeviceForRendererInfo(undefined);
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1316: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFEROUTPUTDEVICEFORRENDERERINFO_1316: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1317
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1317
     * @tc.desc   getPreferredOutputDeviceForRendererInfoSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(null);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1317: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1317: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1318
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1318
     * @tc.desc   getPreferredOutputDeviceForRendererInfoSync with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(undefined);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1318: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_1318: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_OFF_PREFEROUTPUTDEVICECHANGEFORRENDERERINFO_1322
     * @tc.number AUDIOROUTINGMANAGER_OFF_PREFEROUTPUTDEVICECHANGEFORRENDERERINFO_1322
     * @tc.desc   off_preferOutputDeviceChangeForRendererInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_OFF_PREFEROUTPUTDEVICECHANGEFORRENDERERINFO_1322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.off('preferOutputDeviceChangeForRendererInfo', undefined);
        console.info(`AUDIOROUTINGMANAGER_OFF_PREFEROUTPUTDEVICECHANGEFORRENDERERINFO_1322: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_OFF_PREFEROUTPUTDEVICECHANGEFORRENDERERINFO_1322: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323
     * @tc.desc   getPreferredInputDeviceForCapturerInfo with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(null, (err, device) => {
          if (err) {
            console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1323: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324
     * @tc.desc   getPreferredInputDeviceForCapturerInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfo(undefined, (err, device) => {
          if (err) {
            console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1324: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1325
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1325
     * @tc.desc   getPreferredInputDeviceForCapturerInfo with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(null);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1325: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1325: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1326
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1326
     * @tc.desc   getPreferredInputDeviceForCapturerInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(undefined);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1326: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFO_1326: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327
     * @tc.number AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327
     * @tc.desc   on_preferredInputDeviceChangeForCapturerInfo with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327: callback called`);
        };
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', null, callback);
        console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1327: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328
     * @tc.number AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328
     * @tc.desc   on_preferredInputDeviceChangeForCapturerInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback = (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328: callback called`);
        };
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', undefined, callback);
        console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_ON_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1328: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1330
     * @tc.number AUDIOROUTINGMANAGER_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1330
     * @tc.desc   off_preferredInputDeviceChangeForCapturerInfo with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.off('preferredInputDeviceChangeForCapturerInfo', undefined);
        console.info(`AUDIOROUTINGMANAGER_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1330: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_OFF_PREFERREDINPUTDEVICECHANGEFORCAPTURERINFO_1330: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1331
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1331
     * @tc.desc   getPreferredInputDeviceForCapturerInfoSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(null);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1331: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1331: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1332
     * @tc.number AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1332
     * @tc.desc   getPreferredInputDeviceForCapturerInfoSync with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(undefined);
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1332: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`AUDIOROUTINGMANAGER_GETPREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_1332: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });
  })
}
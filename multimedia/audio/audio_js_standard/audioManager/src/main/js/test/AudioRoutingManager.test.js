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

import audio from '@ohos.multimedia.audio';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
export default function audioRoutingManager() {

  const TAG = "[AudioRoutingManagerJsTest]";
  const stringParameter = 'stringParameter';
  const numberParameter = 12345678;

  describe("AudioRoutingManagerJsTest", function () {

    beforeAll(async function () {

      console.info(TAG + "beforeAll called");
    })

    afterAll(function () {
      console.info(TAG + 'afterAll called')
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach called')
    })

    afterEach(function () {
      console.info(TAG + 'afterEach called')
    })

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }



    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100
       *@tc.name      : Get prefer input device - promise
       *@tc.desc      : Get prefer input device - promise
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
          expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
          expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
          done();
        }).catch((err) => {
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
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200
         *@tc.name      : Get prefer input device - promise
         *@tc.desc      : Get prefer input device - promise
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0200", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
          expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
          expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
          done();
        }).catch((err) => {
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300
     *@tc.name      : Get prefer input device - promise
     *@tc.desc      : Get prefer input device - promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0300", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(AudioDeviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.INVALID);
          expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
          done();
        }).catch((err) => {
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400
     *@tc.name      : Get prefer input device - promise
     *@tc.desc      : Get prefer input device - promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0400", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
          expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
          expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
          done();
        }).catch((err) => {
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500
     *@tc.name      : Get prefer input device - callback
     *@tc.desc      : Get prefer input device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0500", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo, (err, AudioDeviceDescriptors) => {
          if (err) {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
            expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
            expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600
     *@tc.name      : Get prefer input device - callback
     *@tc.desc      : Get prefer input device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0600", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo, (err, AudioDeviceDescriptors) => {
          if (err) {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
            expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
            expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700
     *@tc.name      : Get prefer input device - callback
     *@tc.desc      : Get prefer input device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0700", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo, (err, AudioDeviceDescriptors) => {
          if (err) {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            expect(AudioDeviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.INVALID);
            expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800
     *@tc.name      : Get prefer input device - callback
     *@tc.desc      : Get prefer input device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0800", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo, (err, AudioDeviceDescriptors) => {
          if (err) {
            console.error(`get device descriptor fail: ${err.code},${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
            expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
            expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
            expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900
     *@tc.name      : Get prefer input device - error code - promise
     *@tc.desc      : Get prefer input device - error code - promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0900", 0, async function (done) {
      let capturerInfo = 'abc'

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(false).assertTrue();
          done();
        }).catch((err) => {
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
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000
         *@tc.name      : Get prefer input device - error code - invalid parameter
         *@tc.desc      : Get prefer input device - error code - invalid parameter
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1000", 0, async function (done) {
      let capturerInfo = {
        source: 9,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo).then((AudioDeviceDescriptors) => {
          console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(false).assertTrue();
          done();
        }).catch((err) => {
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100
     *@tc.name      : Get prefer input device - error code - null parameter
     *@tc.desc      : Get prefer input device - error code - null parameter
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_1100", 0, async function (done) {

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        await audioRoutingManager.getPreferredInputDeviceForCapturerInfo().then((AudioDeviceDescriptors) => {
          console.log(`get invalid device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
          expect(false).assertTrue();
          done();
        }).catch((err) => {
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
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
       *@tc.name      : Get prefer output device - promise
       *@tc.desc      : Get prefer output device - promise
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_0100", 0, async function (done) {
      let rendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS` + JSON.stringify(data));
        expect(true).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
       *@tc.name      : Get prefer output device no parameter- promise
       *@tc.desc      : Get prefer output device no parameter- promise
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo();
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 parameter check ERROR: ${JSON.stringify(data)}`);
        expect().assertFail();
      } catch (e) {
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 ERROR: ${e.message}`);
          expect().assertFail();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 check no parameter PASS`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
      *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
      *@tc.name      : Get prefer output device check number parameter- promise
      *@tc.desc      : Get prefer output device check number parameter- promise
      *@tc.size      : MEDIUM
      *@tc.type      : Function
      *@tc.level     : Level 0
      */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      let rendererInfo = {
        usage: 123,
        rendererFlags: 0
      }
      try {
        await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo).then((desc) => {
          console.info(`device descriptor: ${desc}`);
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 parameter check ERROR: ` + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 Fass: ${err.message},code:${err.code}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
          done();
        })
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 check number parameter Fail:${e.message},code:${e.code}`);
        expect(false).assertTrue();
        done();
      }

    })


    /**
      *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
      *@tc.name      : Get prefer output device check string parameter- promise
      *@tc.desc      : Get prefer output device check string parameter- promise
      *@tc.size      : MEDIUM
      *@tc.type      : Function
      *@tc.level     : Level 0
      */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo(stringParameter);
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 parameter check ERROR: ` + JSON.stringify(data));
        expect().assertFail();
      } catch (e) {
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 ERROR: ${e.message}`);
          expect().assertFail();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 check string parameter PASS`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
       *@tc.name      : Get prefer output device - callback
       *@tc.desc      : Get prefer output device - callback
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500", 0, async function (done) {
      let rendererInfo = {
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
        expect(true).assertTrue();
        done();
      });
    })

    /**
      *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600
      *@tc.name      : Get prefer output device check number parameter- callback
      *@tc.desc      : Get prefer output device check number parameter- callback
      *@tc.size      : MEDIUM
      *@tc.type      : Function
      *@tc.level     : Level 0
      */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600", 0, async function (done) {
      let rendererInfo = {
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
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700
       *@tc.name      : Get prefer output device check number parameter- callback
       *@tc.desc      : Get prefer output device check number parameter- callback
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700", 0, async function (done) {
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
        expect(true).assertTrue();
        done();
      }

    })

    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
       *@tc.name      : Get prefer output device check number parameter- callback
       *@tc.desc      : Get prefer output device check number parameter- callback
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", 0, async function (done) {
      let rendererInfo = {
        usage: 123,
      }

      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', rendererInfo, (data) => { });
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })

    /**
      *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
      *@tc.name      : On prefer output device check string parameter- callback
      *@tc.desc      : On prefer output device check string parameter- callback
      *@tc.size      : MEDIUM
      *@tc.type      : Function
      *@tc.level     : Level 0
      */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', stringParameter, (data) => { });
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 with string patameter ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 PASS: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
    *@tc.name      : On prefer output device check null parameter- callback
    *@tc.desc      : On prefer output device check null parameter- callback
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.on('preferOutputDeviceChangeForRendererInfo', (data) => { });
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 with number patameter ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 PASS: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
    *@tc.number    : s
    *@tc.name      : Off prefer output device - callback
    *@tc.desc      : Off prefer output device - callback
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        routingManager.off('preferOutputDeviceChangeForRendererInfo', (data) => { });
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0100
       *@tc.name      : Get preferred output device - Sync
       *@tc.desc      : Get preferred output device - Sync
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0100", 0, async function (done) {
      let rendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS` + JSON.stringify(AudioDeviceDescriptors));
        expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(2);
        expect(AudioDeviceDescriptors[0].deviceType).assertEqual(2);
        expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');

        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200
       *@tc.name      : Get preferred output device - Sync - Null_Parameters - 401
       *@tc.desc      : Get preferred output device - Sync - Null_Parameters - 401
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync();
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200 SUCCESS` + JSON.stringify(AudioDeviceDescriptors));
        expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(2);
        expect(AudioDeviceDescriptors[0].deviceType).assertEqual(2);
        expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0200 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300
     *@tc.name      : Get preferred output device - Sync - Number_Invalid_Parameters - 6800101
     *@tc.desc      : Get preferred output device - Sync - Number_Invalid_Parameters - 6800101
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300", 0, async function (done) {
      let rendererInfo = {
        usage: 123,
        rendererFlags: 0
      }
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync(rendererInfo);
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300 SUCCESS` + JSON.stringify(AudioDeviceDescriptors));
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0300 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
           *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400
           *@tc.name      : Get preferred output device - Sync - String_Parameters - 401
           *@tc.desc      : Get preferred output device - Sync - String_Parameters - 401
           *@tc.size      : MEDIUM
           *@tc.type      : Function
           *@tc.level     : Level 0
           */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = routingManager.getPreferredOutputDeviceForRendererInfoSync('123');
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400 SUCCESS` + JSON.stringify(AudioDeviceDescriptors));
        expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(2);
        expect(AudioDeviceDescriptors[0].deviceType).assertEqual(2);
        expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDOUTPUTDEVICEFORRENDERERINFOSYNC_0400 ERROR: ${e.message},ErrorCode:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })
    /**
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0100
    *@tc.name      : Get preferred input device - Sync
    *@tc.desc      : Get preferred input device - Sync
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0100", 0, async function (done) {
      let capturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync(capturerInfo)
        console.log(`get device descriptor success: ` + JSON.stringify(AudioDeviceDescriptors));
        expect(AudioDeviceDescriptors[0].deviceRole).assertEqual(1);
        expect(AudioDeviceDescriptors[0].deviceType).assertEqual(15);
        expect(AudioDeviceDescriptors[0].networkId).assertEqual('LocalDevice');
        done();

      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOTEST_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
      *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200
      *@tc.name      : Get preferred input device - Null_Parameters - 401
      *@tc.desc      : Get preferred input device - Null_Parameters - 401
      *@tc.size      : MEDIUM
      *@tc.type      : Function
      *@tc.level     : Level 0
      */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0200", 0, async function (done) {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync();
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
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300
    *@tc.name      : Get preferred input device - Number_Invalid_Parameters - 6800101
    *@tc.desc      : Get preferred input device - Number_Invalid_Parameters - 6800101
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0300", 0, async function (done) {
      let capturerInfo = {
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
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400
    *@tc.name      : Get preferred input device - String_Parameters - 401
    *@tc.desc      : Get preferred input device - String_Parameters - 401
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_GETREFERREDINPUTDEVICEFORCAPTURERINFOSYNC_0400", 0, async function (done) {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        let AudioDeviceDescriptors = audioRoutingManager.getPreferredInputDeviceForCapturerInfoSync('123');
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
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100
    *@tc.name      : On preferred input devicechangeinfo - Null_Parameters - 401
    *@tc.desc      : On preferred input devicechangeinfo - Null_Parameters - 401
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0100", 0, async function (done) {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', (desc) => {
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
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200
    *@tc.name      : On preferred input devicechangeinfo - Number_Invalid_Parameters - 6800101
    *@tc.desc      : On preferred input devicechangeinfo - Number_Invalid_Parameters - 6800101
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0200", 0, async function (done) {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      let capturerInfo = {
        source: 123,
        capturerFlags: 0
      }
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', capturerInfo, (desc) => {
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
    *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300
    *@tc.name      : On preferred input devicechangeinfo - String_Parameters - 401
    *@tc.desc      : On preferred input devicechangeinfo - String_Parameters - 401
    *@tc.size      : MEDIUM
    *@tc.type      : Function
    *@tc.level     : Level 0
    */
    it("SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300", 0, async function (done) {
      let audioRoutingManager = audio.getAudioManager().getRoutingManager();
      try {
        audioRoutingManager.on('preferredInputDeviceChangeForCapturerInfo', '123', (desc) => {
          console.info(`device descriptor: ${desc}`);
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_PREFERREDINPUTDEVICEFORCAPTURERINFO_0300 ERROR: ${e.message},Code:${e.code}`);
        expect(Number(e.code)).assertEqual(401);
        done();
      }
    })

  })
}
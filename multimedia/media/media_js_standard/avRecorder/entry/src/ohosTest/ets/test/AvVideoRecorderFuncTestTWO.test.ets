/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import Common from './Common';
import AVRecorderBase from './AVRecorderBase.test';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@kit.AbilityKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

let mediaTestBase = new Common();
let avRecorderBase = new AVRecorderBase();


const CREATE_CALLBACK_EVENT = 'createCallback';
const SETONCALLBACK_EVENT = 'setAvRecorderCallback';
const SETPHOTOASSETCALLBACK_EVENT = 'setPhotoAssetCallback';
const PREPARE_CALLBACK_EVENT = 'prepareCallback';
const PREPARE_CALLBACK_ERR_EVENT = 'prepareCallbackErr';
const GETINPUTSURFACE_CALLBACK_EVENT = 'getInputSurfaceCallback';
const INITCAMERA_EVENT = 'initCamera';
const STARTCAMERA_EVENT = 'startCameraOutput';
const STOPCAMERA_EVENT = 'stopCameraOutput';
const STARTRECORDER_CALLBACK_EVENT = 'startCallback';
const PAUSERECORDER_CALLBACK_EVENT = 'pauseCallback';
const RESUMERECORDER_CALLBACK_EVENT = 'resumeCallback';
const STOPRECORDER_CALLBACK_EVENT = 'stopCallback';
const RESETRECORDER_CALLBACK_EVENT = 'resetCallback';
const RELEASECORDER_CALLBACK_EVENT = 'releaseCallback';
const RELEASECAMERA_EVENT = 'releaseCamera';
const CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT = 'audioCapturerInfoCallback';
const ENCODER_INFO_CALLBACK_EVENT = 'availableEncoderCallback';
const MAX_AMPLITUDE_CALLBACK_EVENT = 'maxAmplitudeCallback';
const END_EVENT = 'end';

const CREATE_PROMISE_EVENT = 'createPromise';
const PREPARE_PROMISE_EVENT = 'preparePromise';
const PREPARE_PROMISE_ERR_EVENT = 'preparePromiseERR';
const GETINPUTSURFACE_PROMISE_EVENT = 'getInputSurfacePromise';
const GETINPUTSURFACE_PROMISE_ERR_EVENT = 'getInputSurfacePromiseERR';
const GETAVRECORDERCONFIG_PROMISE_EVENT = 'getAVRecorderConfigPromise';
const STARTRECORDER_PROMISE_EVENT = 'startPromise';
const STARTRECORDER_PROMISE_ERR_EVENT = 'startPromiseErr';
const PAUSERECORDER_PROMISE_EVENT = 'pausePromise';
const PAUSERECORDER_PROMISE_ERR_EVENT = 'pausePromiseErr';
const RESUMERECORDER_PROMISE_EVENT = 'resumePromise';
const STOPRECORDER_PROMISE_EVENT = 'stopPromise';
const RESETRECORDER_PROMISE_EVENT = 'resetPromise';
const RELEASECORDER_PROMISE_EVENT = 'releasePromise';
const CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT = 'audioCapturerInfoPromise';
const ENCODER_INFO_PROMISE_EVENT = 'availableEncoderPromise';
const MAX_AMPLITUDE_PROMISE_EVENT = 'maxAmplitudePromise';

const UPDATE_ROTATION_EVENT = 'updateRotationEvent';

let TAG = "[avVideoRecorderTestTWO] ";

export default function avVideoRecorderTestTWO() {
  describe('avVideoRecorderTestTWO', () => {

    beforeAll(async () => {
      console.info('beforeAll in1');
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA', 'ohos.permission.CAMERA'];
      await mediaTestBase.getPermission(permissionNames);
      await mediaTestBase.driveFn(4)
      avRecorderBase.isSupportCamera()

      avRecorderBase.avConfigH264.profile.videoBitrate = 280000;
      avRecorderBase.avConfigH264Aac.profile.videoBitrate = 280000;
      console.info('beforeAll out');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      if (avRecorderBase.isSupportCameraVideoProfiles) {
        await mediaTestBase.sleep(1000);
        avRecorderBase.fdObject.fileAsset = null;
        avRecorderBase.fdObject.fdNumber = null;
      }
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (avRecorderBase.isSupportCameraVideoProfiles) {
        avRecorderBase.isInitCamera = false
        if (avRecorderBase.avRecorder) {
          avRecorderBase.avRecorder.release().then(() => {
            console.info(TAG + 'this testCase execution completed')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        await mediaTestBase.closeFd(avRecorderBase.fdObject?.fdNumber);
        await mediaTestBase.sleep(1000);
      }
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_MPEG4_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_MPEG4_0100
            * @tc.desc      : Recorder video start-pause-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_MPEG4_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_MPEG4_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_MPEG4_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0400
            * @tc.desc      : Recorder video start-pause-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0500
            * @tc.desc      : Recorder video start-stop-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0600
            * @tc.desc      : Recorder video start-reset-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0800
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-pause-resume-resume-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0400
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0500
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0600
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // RESET
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0800
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0500
            * @tc.desc      : Recorder start-pause-resume-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0500
            * @tc.desc      : Recorder video resume-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        //resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0500
            * @tc.desc      : Recorder video start-resume-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0100
            * @tc.desc      : Recorder video create-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      console.info('avRecorderResumeCallBack1 test start');
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0200
            * @tc.desc      : Recorder video prepare-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0300
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0700
            * @tc.desc      : Recorder create-prepare-getInputSurface-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_CALLBACK_0700 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0100
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0200
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0300
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resume recorder
        RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0700
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // resume recorder
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESUME_PROMISE_0700 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0300
            * @tc.desc      : Recorder video start-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0400
            * @tc.desc      : Recorder video start-pause-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0400 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0600
            * @tc.desc      : Recorder start-reset-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0800
            * @tc.desc      : Recorder start-stop-stop-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_CALLBACK_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0100
            * @tc.desc      : Recorder video create-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0200
            * @tc.desc      : Recorder video prepare-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0300
            * @tc.desc      : Recorder video start-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0300 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0400
            * @tc.desc      : Recorder video pause-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0400 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0600
            * @tc.desc      : Recorder video reset-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0700
            * @tc.desc      : Recorder video getInputSurface-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT,
        // start recorder
        STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // release avRecorder
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0800
            * @tc.desc      : Recorder video start-stop-stop-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_STOP_PROMISE_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0100
            * @tc.desc      : Recorder video create-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      console.info('avRecorderResumeCallBack1 test start');
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0200
            * @tc.desc      : Recorder video prepare-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0300
            * @tc.desc      : Recorder video start-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0400
            * @tc.desc      : Recorder video start-pause-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause recorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0500
            * @tc.desc      : Recorder video start-resume-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // resume recorder
        RESUMERECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0600
            * @tc.desc      : Recorder video start-stop-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop recorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0700
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // getInputSurface
        GETINPUTSURFACE_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder
        RELEASECORDER_CALLBACK_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0800
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_CALLBACK_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_CALLBACK_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0100
            * @tc.desc      : Recorder video create-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0200
            * @tc.desc      : Recorder video prepare-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0300
            * @tc.desc      : Recorder video start-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0400
            * @tc.desc      : Recorder video start-pause-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pause recorder
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0400 end')
    })


    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0600
            * @tc.desc      : Recorder video start-stop-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0700
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0800
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
        // init camera
        GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
        // start recorder
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop recorder
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // reset recorder
        RESETRECORDER_PROMISE_EVENT,
        // release avRecorder and camera
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_RESET_PROMISE_0800 end')
    })

    // promise prepare
    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0100
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2PreparePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0200
            * @tc.desc      : 1.create 2.prepare 3.start 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.start2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0200 end')
    })

    /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0300
           * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0300
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.pause2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0300 end')
    })

    /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0400
           * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0400
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.resume2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0500
            * @tc.desc      : 1.create 2.prepare 3.start 4.stop 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        // ???preparePromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.stop2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0600
            * @tc.desc      : 1.create 2.prepare 3.start 4.reset 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.reset2PreparePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0700
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // releaseRecorderCallBack
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.getInputSurface2PreparePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0800
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let loopTimes = 3;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // preparePromise
          PREPARE_PROMISE_EVENT,
          // AVRecorderTestBase.resetPromise
          RESETRECORDER_PROMISE_EVENT,
        )
      }
      mySteps.push(
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      )
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.prepare3TimesPromise(avConfig, avRecorder, loopTimes, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0900
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0900
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0900 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: -1,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);
      // mediaTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_0900 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1000
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1000
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1000', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1000 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: -1,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
        rotation: 0,
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // prepareErrPromise
        PREPARE_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);

      // mediaTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1000 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1100
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1100 start')
      let avNewProfile: media.AVRecorderProfile = {
        audioBitrate: 48000,
        audioChannels: 2,
        audioCodec: media.CodecMimeType.AUDIO_AAC,
        audioSampleRate: 48000,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: -1, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
        profile: avNewProfile,
        url: 'fd://35',
        rotation: 0,
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // ????preparePromise
        PREPARE_PROMISE_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PREPARE_PROMISE_1100 end')
    })

    // Promise getInputSurface
    /* *
             * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0100
             * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0100
             * @tc.desc      : 1.create 2.getInputSurface
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level 2
         */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0200
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise2(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0300
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? ???getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise3(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0400
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? ????getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise4(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0500
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? ????getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise5(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0600
            * @tc.desc      :1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise6(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0700
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? getInputSurfaceErrPromise
        GETINPUTSURFACE_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2GetInputSurfacePromise7(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0800
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let loopTimes = 3;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // getInputSurfacePromise
          GETINPUTSURFACE_PROMISE_EVENT
        )
      }
      mySteps.push(
        // initCamera
        INITCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        END_EVENT
      )
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.getInputSurface3TimesPromise(avConfig, avRecorder, loopTimes, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_GETSURFACE_PROMISE_0800 end')
    })

    // Promise start
    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0100
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0200
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.prepare2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0300
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.pause2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0400
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        //? ???startErrPromise
        STARTRECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.resume2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0500
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.stop2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0600
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? startErrPromise
        STARTRECORDER_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.reset2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0700
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.getInputSurface2StartPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0800
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let loopTimes = 3;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // startRecordingProcessPromise
          STARTCAMERA_EVENT,
          //
          GETINPUTSURFACE_PROMISE_EVENT,
          //
          STARTRECORDER_PROMISE_EVENT,
          // AVRecorderTestBase.resetPromise
          RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
          // AVRecorderTestBase.preparePromise
          PREPARE_PROMISE_EVENT,
        )
      }
      mySteps.push(
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      )
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_START_PROMISE_0800 end')
    })

    // Promise pause
    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0100
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.create2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0200
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_ERR_EVENT,
        // AVRecorderTestBase.releasePromise
        RELEASECORDER_PROMISE_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.prepare2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0300
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.start2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0400
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        //? resumeRecordingProcessPromise
        STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.resume2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0500
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.stopPromise
        STOPRECORDER_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.stop2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0600
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.resetPromise
        RESETRECORDER_PROMISE_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_ERR_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.reset2PausePromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0700
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        //? pauseErrPromise
        PAUSERECORDER_PROMISE_ERR_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.getInputSurface2PausePromise(avConfig, avRecorder, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0800
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let loopTimes = 3;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT
      );
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          // pauseRecordingProcessPromise
          PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
          //? resumeRecordingProcessPromise
          STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT
        )
      }
      mySteps.push(
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      )
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_PAUSE_PROMISE_0800 end')
    })

    // 状态切换
    // 01.promise回调方式
    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0100
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2ReleaseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0200
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0300
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2ResumeWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0400
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0400 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0500
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0500
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0500 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0500 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0600
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0600
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.stop 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0600 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2Pause2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0600 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0700
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0700
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.reset 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0700 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2Pause2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0700 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0800
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0800
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.stop 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0800 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2Resume2WithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0800 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0900
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0900
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.reset 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0900 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);

      // mediaTestBase.recordStart2reset2WithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_0900 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1000
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1000
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1000', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1000 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1000 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1100
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1100 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // pauseRecordingProcessPromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);

      // mediaTestBase.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1200
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1200 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // AVRecorderTestBase.pausePromise
        PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
        //? AVRecorderTestBase.resumePromise
        RESUMERECORDER_PROMISE_EVENT,
        // stopCameraOutput
        STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1300
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1300 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // stopRecordingProcessPromise
        STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);

      // mediaTestBase.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1400
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1400 start')
      let avNewProfile: media.AVRecorderProfile = {
        fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
        videoBitrate: 280000, // 视频比特率
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
        videoFrameWidth: 640, // 视频分辨率的宽
        videoFrameHeight: 480, // 视频分辨率的高
        videoFrameRate: 30 // 视频帧率
      }
      let avNewConfig: media.AVRecorderConfig = {
        videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
        profile: avNewProfile,
        url: 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
        rotation: 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
        location: {
          latitude: 30, longitude: 130
        }
      }
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avNewConfig.url = avRecorderBase.fdPath;
      avRecorderBase.checkDevice(avNewConfig)
      let mySteps = new Array(
        // setAvRecorderCallback
        CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
        // AVRecorderTestBase.preparePromise
        PREPARE_PROMISE_EVENT,
        // getInputSurfacePromise
        GETINPUTSURFACE_PROMISE_EVENT,
        // initCamera
        INITCAMERA_EVENT,
        // startRecordingProcessPromise
        STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
        // resetRecordingProcessPromise
        RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
        // releaseRecorderPromise
        RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avNewConfig, avRecorderBase.recorderTime, mySteps, done);

      // mediaTestBase.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_PROMISE_1400 end')
    })

    // 02.callback回调
    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0100
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0100
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0100 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0100 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0200
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0200
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0200 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0200 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0300
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0300
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0300 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // pause avRecorder
        PAUSERECORDER_CALLBACK_EVENT,
        // resume avRecorder
        RESUMERECORDER_CALLBACK_EVENT,
        // stop camera
        STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0300 end')
    })

    /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0400
            * @tc.name      : SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0400
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      if (!avRecorderBase.isSupportCameraVideoProfiles) {
        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        expect(avRecorderBase.isSupportCameraVideoProfiles).assertFalse();
        done();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0400 start')
      let fileName = mediaTestBase.resourceName()
      avRecorderBase.fdObject = await mediaTestBase.getFd(fileName);
      avRecorderBase.fdPath = "fd://" + avRecorderBase.fdObject.fdNumber;
      avRecorderBase.avConfig.url = avRecorderBase.fdPath;
      let mySteps = new Array(
        // init avRecorder
        CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        // init camera
        GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        // start avRecorder
        STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        // stop avRecorder
        STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        // release avRecorder and camera
        RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        // end
        END_EVENT
      );
      avRecorderBase.toNextStep(avRecorderBase.avConfig, avRecorderBase.recorderTime,
        mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_TWO_FUNCTION_CALLBACK_0400 end')
    })
  })
}

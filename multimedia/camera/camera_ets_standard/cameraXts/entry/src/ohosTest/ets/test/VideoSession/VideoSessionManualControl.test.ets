/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { indexSurfaceId } from '../../testability/pages/Index';
import {
  cameraErrorCode,
  COMMON_WAIT_DURATION,
  isEmpty,
  sleep,
  checkBackCamera,
  getFd,
  closeFd,
  resourceName
} from '../common';

const TAG = "CameraXts.VideoSessionManualControlTest";
const abnormalValue = -1;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let cameraManager: camera.CameraManager;
let cameraDevices: Array<camera.CameraDevice>;
let supportedModes: Array<camera.SceneMode>;
let outputCapability: camera.CameraOutputCapability;
let session: camera.VideoSession;
let videoSurfaceId: string;
let fdNumber: number;
let avRecorder: media.AVRecorder;
let cameraInput: camera.CameraInput;
let previewOutput: camera.PreviewOutput;
let videoOutput: camera.VideoOutput;


async function createCameraInputAndOutput(): Promise<boolean> {
  try {
    cameraManager = camera.getCameraManager(testContext);
    if (isEmpty(cameraManager)) {
      console.info(TAG, 'cameraManager is null');
      return false;
    }
    cameraDevices = cameraManager.getSupportedCameras();
    if (isEmpty(cameraDevices) || cameraDevices.length < 1) {
      console.info(TAG, 'cameraDevices is empty');
      return false;
    }
    supportedModes = cameraManager.getSupportedSceneModes(cameraDevices[0]);
    let isSupportVideo = false;
    for (let i = 0; i < supportedModes.length; i++) {
      if (supportedModes[i] == camera.SceneMode.NORMAL_VIDEO) {
        isSupportVideo = true;
        break;
      }
    }
    if (!isSupportVideo) {
      console.info(TAG, 'VIDEO not support');
      return false;
    }
    console.info(TAG, 'getSupportedOutputCapability is call');
    outputCapability = cameraManager.getSupportedOutputCapability(cameraDevices[0], camera.SceneMode.NORMAL_VIDEO);
    if (isEmpty(outputCapability)) {
      console.info(TAG, 'outputCapability is null');
      return false;
    }
    console.info(TAG, 'createCameraInput is call');
    cameraInput = cameraManager.createCameraInput(cameraDevices[0]);
    if (isEmpty(cameraInput)) {
      console.info(TAG, 'cameraInput is null');
      return false;
    }
    console.info(TAG, 'cameraInput.open is call');
    await cameraInput.open();
    let previewProfiles = outputCapability.previewProfiles;
    if (isEmpty(previewProfiles) || previewProfiles.length < 1) {
      console.info(TAG, 'previewProfiles is empty');
      return false;
    }
    let videoProfiles = outputCapability.videoProfiles;
    let mPreviewProfile = previewProfiles.find((previewProfile: camera.Profile) => {
      return Math.abs((previewProfile.size.width / previewProfile.size.height) -
        (videoProfiles[0].size.width / videoProfiles[0].size.height)) < Number.EPSILON;
    });
    console.info(TAG, 'createPreviewOutput is call');
    previewOutput = cameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
    if (isEmpty(previewOutput)) {
      console.info(TAG, 'previewOutput is null');
      return false;
    }
    
    if (isEmpty(videoProfiles) || videoProfiles.length < 1) {
      console.info(TAG, 'videoProfiles is empty');
      return false;
    }
    let fileName: string = resourceName();
    fdNumber = await getFd(fileName);
    let mVideoProfile: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 2000000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: videoProfiles[0].size.width,
      videoFrameHeight: videoProfiles[0].size.height,
      videoFrameRate: 30
    };
    let videoConfig: media.AVRecorderConfig = {
      videoSourceType: 0,
      profile: mVideoProfile,
      url: 'file://',
      location: { latitude: 30, longitude: 130 } as camera.Location,
      rotation: 0
    };
    videoConfig.url = "fd://" + fdNumber;
    avRecorder = await media.createAVRecorder();
    await avRecorder.prepare(videoConfig);
    videoSurfaceId = await avRecorder.getInputSurface();
    console.info(TAG, 'createVideoOutput is call');
    videoOutput = cameraManager.createVideoOutput(videoProfiles[0], videoSurfaceId);
    if (isEmpty(videoOutput)) {
      console.info(TAG, 'videoOutput is null');
      return false;
    }
    return false;
  } catch (error) {
    console.info(TAG, 'createCameraInputAndOutput error: ' + JSON.stringify(error));
    return false;
  }
}

async function createCameraSession(): Promise<boolean> {
  try {
    session = cameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
    if (isEmpty(session)) {
      console.info(TAG, 'session is null');
      return false;
    }
    session.beginConfig();
    console.info(TAG, 'createCameraSession success');
    return true;
  } catch (error) {
    console.info(TAG, 'createCameraSession error: ' + JSON.stringify(error));
    return false;
  }
}

async function addInputAndOutput(): Promise<boolean> {
  try {
    session.addInput(cameraInput);
    session.addOutput(previewOutput);
    session.addOutput(videoOutput);
    console.info(TAG, 'addInputAndOutput success');
    return true;
  } catch (error) {
    console.info(TAG, 'addInputAndOutput error: ' + JSON.stringify(error));
    return false;
  }
}

async function startCameraSession(): Promise<boolean> {
  try {
    await session.commitConfig();
    await session.start();
    console.info(TAG, 'startCameraSession success');
    return true;
  } catch (error) {
    console.info(TAG, 'startCameraSession error: ' + JSON.stringify(error));
    return false;
  }
}

async function releaseCameraSession() {
  try {
    if (cameraInput) {
      await cameraInput.close();
    }
    if (previewOutput) {
      await previewOutput.release();
    }
    if (videoOutput) {
      await videoOutput.release();
    }
    if (avRecorder) {
      await avRecorder.release();
    }
    if (session) {
      await session.release();
    }
  } catch (error) {
    console.info(TAG, 'releaseCameraSession error: ' + JSON.stringify(error));
  }
}

export default function VideoSessionManualControlTest() {
  describe('VideoSessionManualControlTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      let isBackCamera = checkBackCamera();
      if (!isBackCamera) {
        console.info(TAG, 'no back camera, skip case');
        return;
      }
    })

    beforeEach(async () => {
      await sleep(COMMON_WAIT_DURATION);
    })

    afterEach(async () => {
      await releaseCameraSession();
      await sleep(COMMON_WAIT_DURATION);
    })

    afterAll(async () => {
      await closeFd(fdNumber);
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100
     * @tc.desc getSupportedPhysicalApertures param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: Array<camera.PhysicalAperture> = session.getSupportedPhysicalApertures();
        console.info(TAG, 'getSupportedPhysicalApertures result: ' + JSON.stringify(result));
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100
     * @tc.desc getSupportedPhysicalApertures errorcode 7400102 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: Array<camera.PhysicalAperture> = session.getSupportedPhysicalApertures();
        console.info(TAG, 'getSupportedPhysicalApertures result: ' + JSON.stringify(result));
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200
     * @tc.desc getSupportedPhysicalApertures errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200 start');
      await createCameraInputAndOutput();
      session = cameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
      try {
        let result: Array<camera.PhysicalAperture> = session.getSupportedPhysicalApertures();
        console.info(TAG, 'getSupportedPhysicalApertures result: ' + JSON.stringify(result));
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDPHYSICALAPERTURES_ERRORCODE_0200 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100
     * @tc.desc getPhysicalAperture param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getPhysicalAperture();
        console.info(TAG, 'getPhysicalAperture result: ' + typeof result);
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200
     * @tc.desc getPhysicalAperture errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      try {
        let result: number = session.getPhysicalAperture();
        console.info(TAG, 'getPhysicalAperture result: ' + typeof result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETPHYSICALAPERTURE_ERRORCODE_0200 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100
     * @tc.desc setPhysicalAperture param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedApertures: Array<camera.PhysicalAperture> = session.getSupportedPhysicalApertures();
        for (let physicalAperture of supportedApertures) {
          let ZoomArr = [physicalAperture.zoomRange.min, physicalAperture.zoomRange.max];
          for (let zoom of ZoomArr) {
            console.info(`setZoomRatio is  ${zoom}`);
            session.setZoomRatio(zoom);
            await sleep(1000);
            for (let Aperture of physicalAperture.apertures) {
              session.setPhysicalAperture(Aperture);
              let currentAperture: number = session.getPhysicalAperture();
              expect(currentAperture).assertEqual(Aperture);
            }
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200
     * @tc.desc setPhysicalAperture param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        session.setPhysicalAperture(-100);
        let currentAperture: number = session.getPhysicalAperture();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200 currentAperture is '+ currentAperture);
        expect(currentAperture).assertEqual(0);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100
     * @tc.desc setPhysicalAperture errorcode 7400102 param is null test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        session.setPhysicalAperture(null);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200
     * @tc.desc setPhysicalAperture errorcode 7400102 param is undefined test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        session.setPhysicalAperture(undefined);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0200 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300
     * @tc.desc setPhysicalAperture errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      try {
        session.setPhysicalAperture(2.2);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETPHYSICALAPERTURE_ERRORCODE_0300 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100
     * @tc.desc getExposureMeteringMode param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result = session.getExposureMeteringMode();
        console.info(TAG, 'getExposureMeteringMode result: ' + result);
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200
     * @tc.desc getExposureMeteringMode errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result = session.getExposureMeteringMode();
        console.info(TAG, 'getExposureMeteringMode result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREMETERINGMODE_ERRORCODE_0200 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100
     * @tc.desc setExposureMeteringMode param test with MATRIX mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100 start: MATRIX');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.MATRIX);
        if (isSupported) {
          session.setExposureMeteringMode(camera.ExposureMeteringMode.MATRIX);
          let result = session.getExposureMeteringMode();
          console.info(TAG, 'setExposureMeteringMode result: ' + result);
          expect(result === camera.ExposureMeteringMode.MATRIX).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200
     * @tc.desc setExposureMeteringMode param test with CENTER mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200 start: CENTER');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.CENTER);
        if (isSupported) {
          session.setExposureMeteringMode(camera.ExposureMeteringMode.CENTER);
          let result = session.getExposureMeteringMode();
          console.info(TAG, 'setExposureMeteringMode result: ' + result);
          expect(result === camera.ExposureMeteringMode.CENTER).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300
     * @tc.desc setExposureMeteringMode param test with SPOT mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300 start: SPOT');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.SPOT);
        if (isSupported) {
          session.setExposureMeteringMode(camera.ExposureMeteringMode.SPOT);
          let result = session.getExposureMeteringMode();
          console.info(TAG, 'setExposureMeteringMode result: ' + result);
          expect(result === camera.ExposureMeteringMode.SPOT).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400
     * @tc.desc setExposureMeteringMode param test with not supported mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400 start: supported mode');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported = session.isExposureMeteringModeSupported(-100);
        if (!isSupported) {
          session.setExposureMeteringMode(-100);
          let result = session.getExposureMeteringMode();
          console.info(TAG, 'setExposureMeteringMode result: ' + result);
          expect(result === 0).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_PARAM_0400 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200
     * @tc.desc setExposureMeteringMode ERRORCODE 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200 start: SPOT');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      // await startCameraSession();
      try {
        session.setExposureMeteringMode(camera.ExposureMeteringMode.MATRIX);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREMETERINGMODE_ERRORCODE_0200 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100
     * @tc.desc isExposureMeteringModeSupported param test with MATRIX mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100 start: MATRIX');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.MATRIX);
        console.info(TAG, 'isExposureMeteringModeSupported result: ' + result);
        expect(typeof result === 'boolean').assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200
     * @tc.desc isExposureMeteringModeSupported param test with CENTER mode.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200 start: CENTER');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.CENTER);
        console.info(TAG, 'isExposureMeteringModeSupported result: ' + result);
        expect(typeof result === 'boolean').assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300
     * @tc.desc isExposureMeteringModeSupported param test with negative value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300 start: negative value');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result = session.isExposureMeteringModeSupported(abnormalValue);
        console.info(TAG, 'isExposureMeteringModeSupported result: ' + result);
        expect(typeof result === 'boolean').assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_PARAM_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300
     * @tc.desc isExposureMeteringModeSupported errorcode 7400103 test .
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300 start: negative value');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result = session.isExposureMeteringModeSupported(camera.ExposureMeteringMode.CENTER);
        console.info(TAG, 'isExposureMeteringModeSupported result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISEXPOSUREMETERINGMODE_SUPPORTED_ERRORCODE_0300 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })


    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100
     * @tc.desc onFlashStateChange event test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (state: camera.FlashState) => {
          console.info(TAG, 'onFlashStateChange callback state: ' + state);
        }
        session.onFlashStateChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONFLASHSTATECHANGE_EVENT_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100
     * @tc.desc offFlashStateChange event test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (state: camera.FlashState) => {
          console.info(TAG, 'offFlashStateChange callback state: ' + state);
        }
        session.onFlashStateChange(callback);
        session.offFlashStateChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200
     * @tc.desc offFlashStateChange event test without callback.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200 start: without callback');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        session.offFlashStateChange();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300
     * @tc.desc offFlashStateChange event test with callback parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300 start: with callback parameter');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (state: camera.FlashState) => {
          console.info(TAG, 'offFlashStateChange callback state: ' + state);
        }
        session.offFlashStateChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFFLASHSTATECHANGE_EVENT_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100
     * @tc.desc getExposureDuration param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getExposureDuration();
        console.info(TAG, 'getExposureDuration result: ' + result);
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100
     * @tc.desc getExposureDuration errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: number = session.getExposureDuration();
        console.info(TAG, 'getExposureDuration result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREDURATION_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100
     * @tc.desc setExposureDuration param test with min value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedExposureDurationRange();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100 supportedRange ' + supportedRange);
        let isSupportExposure = session.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_MANUAL)
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100 isSupportExposure ' + isSupportExposure);
        if (isSupportExposure) {
          session.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_MANUAL);
          if (supportedRange.length >= 2) {
            let minExposure: number = supportedRange[0];
            session.setExposureDuration(minExposure);
            let result: number = session.getExposureDuration();
            console.info(TAG, 'setExposureDuration result: ' + result + ' expected: ' + minExposure);
            expect(result === minExposure).assertTrue();
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200
     * @tc.desc setExposureDuration param test with max value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200 start: max value');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedExposureDurationRange();
        let isSupportExposure = session.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_MANUAL)
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200 isSupportExposure ' + isSupportExposure);
        if (isSupportExposure) {
          session.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_MANUAL);
          if (supportedRange.length >= 2) {
            let maxExposure: number = supportedRange[1];
            session.setExposureDuration(maxExposure);
            let result: number = session.getExposureDuration();
            console.info(TAG, 'setExposureDuration result: ' + result + ' expected: ' + maxExposure);
            expect(result === maxExposure).assertTrue();
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300
     * @tc.desc setExposureDuration param test with below min value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedExposureDurationRange();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300 supportedRange ' + supportedRange);
        let isSupportExposure = session.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_MANUAL)
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300 isSupportExposure ' + isSupportExposure);
        if (isSupportExposure) {
          session.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_MANUAL);
          if (supportedRange.length >= 2) {
            let minExposure: number = supportedRange[0];
            session.setExposureDuration(minExposure - 100);
            let result: number = session.getExposureDuration();
            console.info(TAG, 'setExposureDuration result: ' + result + ' expected: ' + minExposure);
            expect(result === minExposure).assertTrue();
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400
     * @tc.desc setExposureDuration param test with higher than max value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400 start: max value');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedExposureDurationRange();
        let isSupportExposure = session.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_MANUAL)
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400 isSupportExposure ' + isSupportExposure);
        if (isSupportExposure) {
          session.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_MANUAL);
          if (supportedRange.length >= 2) {
            let maxExposure: number = supportedRange[1];
            session.setExposureDuration(maxExposure + 100);
            let result: number = session.getExposureDuration();
            console.info(TAG, 'setExposureDuration result: ' + result + ' expected: ' + maxExposure);
            expect(result === maxExposure).assertTrue();
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_PARAM_0400 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100
     * @tc.desc setExposureDuration errorcode 7400103 test .
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100 start: max value');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        session.setExposureDuration(100);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETEXPOSUREDURATION_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100
     * @tc.desc onExposureInfoChange event test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (info: camera.ExposureInfo) => {
          console.info(TAG, 'onExposureInfoChange callback info: ' + JSON.stringify(info));
        }
        session.onExposureInfoChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ONEXPOSUREINFOCHANGE_EVENT_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100
     * @tc.desc offExposureInfoChange event test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (info: camera.ExposureInfo) => {
          console.info(TAG, 'offExposureInfoChange callback info: ' + JSON.stringify(info));
        }
        session.onExposureInfoChange(callback);
        session.offExposureInfoChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200
     * @tc.desc offExposureInfoChange event test without callback.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200 start: without callback');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        session.offExposureInfoChange();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300
     * @tc.desc offExposureInfoChange event test with callback parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300 start: with callback parameter');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let callback = (info: camera.ExposureInfo) => {
          console.info(TAG, 'offExposureInfoChange callback info: ' + JSON.stringify(info));
        }
        session.offExposureInfoChange(callback);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_OFFEXPOSUREINFOCHANGE_EVENT_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100
     * @tc.desc getSupportedExposureDurationRange param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: Array<number> = session.getSupportedExposureDurationRange();
        console.info(TAG, 'getSupportedExposureDurationRange result: ' + JSON.stringify(result));
        expect(result != null).assertTrue();
        if (result.length > 0) {
          expect(result.length == 2).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100
     * @tc.desc getSupportedExposureDurationRange errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: Array<number> = session.getSupportedExposureDurationRange();
        console.info(TAG, 'getSupportedExposureDurationRange result: ' + JSON.stringify(result));
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDEXPOSUREDURATIONRANGE_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100
     * @tc.desc getExposureBiasStep param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getExposureBiasStep();
        console.info(TAG, 'getExposureBiasStep result: ' + result);
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100
     * @tc.desc getExposureBiasStep errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: number = session.getExposureBiasStep();
        console.info(TAG, 'getExposureBiasStep result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200
     * @tc.desc getExposureBiasStep param test verify value is positive.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200 start: verify value is positive');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getExposureBiasStep();
        console.info(TAG, 'getExposureBiasStep result: ' + result);
        expect(result > 0).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETEXPOSUREBIASSTEP_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100
     * @tc.desc isFocusDistanceSupported param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: boolean = session.isFocusDistanceSupported();
        console.info(TAG, 'isFocusDistanceSupported result: ' + result);
        expect(typeof result === 'boolean').assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100
     * @tc.desc isFocusDistanceSupported errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: boolean = session.isFocusDistanceSupported();
        console.info(TAG, 'isFocusDistanceSupported result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_ISFOCUSDISTANCESUPPORTED_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100
     * @tc.desc getFocusDistance param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported: boolean = session.isFocusDistanceSupported();
        if (isSupported) {
          let result: number = session.getFocusDistance();
          console.info(TAG, 'getFocusDistance result: ' + result);
          expect(result != null).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100
     * @tc.desc getFocusDistance param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: number = session.getFocusDistance();
        console.info(TAG, 'getFocusDistance result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETFOCUSDISTANCE_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100
     * @tc.desc setFocusDistance param test min.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported: boolean = session.isFocusDistanceSupported();
        if (isSupported) {
          session.setFocusDistance(0);
          let result: number = session.getFocusDistance();
          console.info(TAG, 'setFocusDistance result: ' + result);
          expect(result == 0).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200
     * @tc.desc setFocusDistance param test max.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let isSupported: boolean = session.isFocusDistanceSupported();
        if (isSupported) {
          session.setFocusDistance(1);
          let result: number = session.getFocusDistance();
          console.info(TAG, 'setFocusDistance result: ' + result);
          expect(result == 1).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETFOCUSDISTANCE_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100
     * @tc.desc getIso param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getIso();
        console.info(TAG, 'getIso result: ' + result);
        expect(result != null).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200
     * @tc.desc getIso param test verify value is positive.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200 start: verify value is positive');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: number = session.getIso();
        console.info(TAG, 'getIso result: ' + result);
        expect(result >= 0).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100
     * @tc.desc getIso ERRORCODE test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: number = session.getIso();
        console.info(TAG, 'getIso result: ' + result);
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETISO_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100
     * @tc.desc setIso param test with min value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedIsoRange();
        if (supportedRange.length > 0) {
          let minIso: number = supportedRange[0];
          session.setIso(minIso);
          let result: number = session.getIso();
          console.info(TAG, 'setIso result: ' + result + ' expected: ' + minIso);
          expect(result === minIso).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200
     * @tc.desc setIso param test with max value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200 start: max value');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedIsoRange();
        if (supportedRange.length > 0) {
          let maxIso: number = supportedRange[supportedRange.length - 1];
          session.setIso(maxIso);
          let result: number = session.getIso();
          console.info(TAG, 'setIso result: ' + result + ' expected: ' + maxIso);
          expect(result === maxIso).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300
     * @tc.desc setIso param test with below min value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedIsoRange();
        if (supportedRange.length > 0) {
          let minIso: number = supportedRange[0];
          session.setIso(minIso - 100);
          let result: number = session.getIso();
          console.info(TAG, 'setIso result: ' + result + ' expected: ' + minIso);
          expect(result === minIso).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400
     * @tc.desc setIso param test with higher than max value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400 start: max value');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let supportedRange: Array<number> = session.getSupportedIsoRange();
        if (supportedRange.length > 0) {
          let maxIso: number = supportedRange[supportedRange.length - 1];
          session.setIso(maxIso + 100);
          let result: number = session.getIso();
          console.info(TAG, 'setIso result: ' + result + ' expected: ' + maxIso);
          expect(result === maxIso).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_SETISO_PARAM_0400 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100
     * @tc.desc getSupportedIsoRange param test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100 start');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: Array<number> = session.getSupportedIsoRange();
        console.info(TAG, 'getSupportedIsoRange result: ' + JSON.stringify(result));
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0100 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200
     * @tc.desc getSupportedIsoRange param test with non-empty array.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200 start: non-empty array');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: Array<number> = session.getSupportedIsoRange();
        console.info(TAG, 'getSupportedIsoRange result length: ' + result.length);
        if (result.length > 0) {
          expect(result.length == 2).assertTrue();
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0200 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300
     * @tc.desc getSupportedIsoRange param test verify values are positive.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300 start: verify values are positive');
      await createCameraInputAndOutput();
      await createCameraSession();
      await addInputAndOutput();
      await startCameraSession();
      try {
        let result: Array<number> = session.getSupportedIsoRange();
        console.info(TAG, 'getSupportedIsoRange result: ' + JSON.stringify(result));
        if (result.length > 0) {
          for (let i = 0; i < result.length; i++) {
            expect(result[i] >= 0).assertTrue();
          }
        }
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300 end');
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_PARAM_0300 error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100
     * @tc.number SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100
     * @tc.desc getSupportedIsoRange errorcode 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100 start: verify values are positive');
      await createCameraInputAndOutput();
      await createCameraSession();
      try {
        let result: Array<number> = session.getSupportedIsoRange();
        console.info(TAG, 'getSupportedIsoRange result: ' + JSON.stringify(result));
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100 end');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, 'SUB_CAMERA_VIDEOSESSION_MANUALCONTROL_GETSUPPORTEDISORANGE_ERRORCODE_0100 error: ' + JSON.stringify(error));
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        done();
      }
    })
  })
}

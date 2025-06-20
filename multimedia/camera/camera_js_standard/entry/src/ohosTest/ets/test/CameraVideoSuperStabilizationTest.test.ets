/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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


import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { surfaceIds } from '../testability/pages/Index';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = "CameraVideoSuperStabilizationTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.CaptureSession;

// CAMERA-0 letiables

let mCameraInput: cameraObj.CameraInput;
let mVideoOutput: cameraObj.VideoOutput | undefined;
let superStabVideoProfile: superStabVideoProfileType = {
  size: {
    width: 1920,
    height: 1080
  },
  frameRateRange: {
    min: 30,
    max: 30
  }
}

interface superStabVideoProfileType {
  size: sizeType;
  frameRateRange: frameRateRangeType;
}

interface sizeType {
  width: number,
  height: number
}

interface frameRateRangeType {
  min: number,
  max: number
}

let context = getContext();

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];
let power: ESObject;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

export default function CameraVideoSuperStabilizationTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');

    mCameraManager = cameraObj.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    console.info('Exit getCameraManagerInstance');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createCaptureSession();
    } catch {
      console.info('createCaptureSession FAILED');
    }

    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    mCameraSession.beginConfig();

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');
    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');
    if (!isEmpty(mVideoOutput)) {
      await mVideoOutput?.stop();
      await mVideoOutput?.release();
      mVideoOutput = undefined;
    }
    console.info('Exit releaseOutput');

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");
    await releaseOutput();
    await releaseInput();
    console.info(TAG + "Exit stopCameraSession");
    return true;
  }

  describe('CameraVideoSuperStabilization', () => {
    console.info(TAG + '----------CameraVideoSuperStabilization--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(100);
      getCameraManagerInstance();
      createCameraSessionInstance();
      console.info('beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
    })

    beforeEach(() => {
      sleep(5000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      releaseCameraSessionInstance();
      sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100
     * @tc.name      : Check capture session support video stabilization high mode with promise or not
     * @tc.desc      : Check capture session support video stabilization high mode with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100--------------");

      if (mCameraDevicesArray.length == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        if (isEmpty(mCameraDevicesArray)) {
          expect().assertFail();
        }
        mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        await mCameraInput.open();
        let capability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        let videoProfiles = capability.videoProfiles;
        if (isEmpty(videoProfiles)) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 no videoProfiles");
          expect().assertFail();
        }
        let profile = videoProfiles.find((profile) => {
          return profile.size.height === superStabVideoProfile.size.height &&
            profile.size.width === superStabVideoProfile.size.width &&
            profile.frameRateRange.min === superStabVideoProfile.frameRateRange.min &&
            profile.frameRateRange.max === superStabVideoProfile.frameRateRange.max;
        })
        if (profile) {
          mVideoOutput = mCameraManager.createVideoOutput(profile, surfaceIds);
          mCameraSession.addInput(mCameraInput);
          mCameraSession.addOutput(mVideoOutput);
          await mCameraSession.commitConfig();
          await mCameraSession.start();
          await mVideoOutput.start();
          let isVideoStabilizationModeSupported: boolean =
            mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.HIGH);
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 finish");
          if (isVideoStabilizationModeSupported) {
            mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.HIGH);
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 PASSED with VideoStabilizationMode is: " +
            cameraObj.VideoStabilizationMode.HIGH);

            let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 finish");
            if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.HIGH) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 PASSED with VideoStabilizationMode is: " +
                vdeoStabilizationMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 FAILED with VideoStabilizationMode is: " +
                vdeoStabilizationMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 FAILED with isVideoStabilizationModeSupported is: " +
              isVideoStabilizationModeSupported);
          }
          await stopCameraSession();
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_SUPER_STABILIZATION_MODE_SUPPORT_PROMISE_0100 ends here");
        done();
      }
    })
  })
}
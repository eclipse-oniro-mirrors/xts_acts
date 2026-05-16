/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraPhotoSessionTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string = '';
let surfaceId: string = '';
let mCameraNum: number;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let isSessionCreated: boolean = false;

let receiver: image.ImageReceiver | undefined;

let getPreviewOutputSurface = () => {
  console.log(TAG + 'Entering getPreviewOutputSurface')
  try {
    surfaceId = Hypium.get('SurfaceId') as string;
  } catch(err) {
    console.info(TAG +
      "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
  }
  if (surfaceId == '') {
    console.error(TAG + ' getPreviewOutputSurface surfaceId failed, surfaceId is null')
    expect().assertFail();
  }
  console.info(TAG + 'getPreviewOutputSurface surfaceId: ' + surfaceId)
}

export default function cameraPhotoSessionTest() {

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({height:640, width:480} as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + mPhotoSurface)
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = camera.getCameraManager(appContext);
    if (mCameraManager == null) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch(err) {
      console.info('createPhotoSession FAILED');
    }
    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    } else {
      isSessionCreated = true;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    console.info('Enter releaseCameraSessionInstance');
    if (isSessionCreated && mCameraSession != undefined) {
      await mCameraSession.release();
      isSessionCreated = false;
    }
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput.open();
    await Utils.msSleep(100);
    console.info(idx + 'CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');
    if (mCameraInput != undefined && mCameraInput != null) {
      await mCameraInput.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], camera.SceneMode.NORMAL_PHOTO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput != undefined) {
            break;
          }
        }

        if (mPreviewOutput == undefined) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (cameraOutputCap.photoProfiles != null) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (mPhotoOutput != undefined) {
            break;
          }
        }

        if (mPhotoOutput == undefined) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined && mPreviewOutput != null) {
      await mPreviewOutput.release();
    }

    if (mPhotoOutput != undefined && mPhotoOutput != null) {
      await mPhotoOutput.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await Utils.msSleep(1000);

    mCameraSession.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession.addOutput(mPhotoOutput);
    }

    await Utils.msSleep(300);

    await mCameraSession.commitConfig();
    console.info(TAG + "commitConfig end");
    await Utils.msSleep(50);

    await mCameraSession.start();

    await Utils.msSleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");
    await mCameraSession.stop();
    await Utils.msSleep(100);
    mCameraSession.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession.removeOutput(mPhotoOutput);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraPhotoSessionTest', () => {
    console.info(TAG + '----------CameraPhotoSessionTest--------------')

    beforeAll(() => {
      console.info('beforeAll case');
      await getPhotoReceiverSurface();
      getPreviewOutputSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await Utils.msSleep(500);
    })

    beforeEach(() => {
      console.info('beforeEach case');
      await Utils.msSleep(100);
    })

    afterEach(() => {
      console.info('afterEach case');
      await Utils.msSleep(100);
      await releaseCameraSessionInstance();
    })

    afterAll(() => {
      console.info('afterAll case');
      await releaseCameraSessionInstance();
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100
     * @tc.desc   white balance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try{
          createCameraSessionInstance();
          await startCameraSession(0);
          let flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          let range = mCameraSession.getWhiteBalanceRange();
          mCameraSession.setWhiteBalanceMode(camera.WhiteBalanceMode.DAYLIGHT);
          let mode = mCameraSession.getWhiteBalanceMode();
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.AUTO);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.INCANDESCENT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.FLUORESCENT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.DAYLIGHT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.MANUAL);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.LOCKED);
          let value: int = 5000;
          mCameraSession.setWhiteBalance(value);
          let whiteBalance: int = mCameraSession.getWhiteBalance();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 start PASSED");
          await stopCameraSession();
        } catch (err: BusinessError) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 FAILED" + err.code);
          expect(true).assertFalse();
        }
        done();
      }
    })
  })
}
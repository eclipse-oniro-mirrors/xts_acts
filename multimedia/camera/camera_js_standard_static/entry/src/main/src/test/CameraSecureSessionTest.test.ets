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

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraSecureSessionTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.SecureSession;
let isCameraSessionCreated: boolean = false;
let mPhotoSurface: string;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let receiver: image.ImageReceiver | undefined;
let secureSeqId: bigint;
let surfaceId: string = '';

export default function cameraSecureSessionTest() {

  let isEmpty01 = (data: cameraObj.CameraManager) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty02 = (data: Array<cameraObj.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty03 = (data: cameraObj.SecureSession) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty04 = (data: cameraObj.CameraInput) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty05 = (data: cameraObj.CameraOutputCapability) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty06 = (data: Array<cameraObj.Profile>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty07 = (data: cameraObj.PreviewOutput) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

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

  let getSecurePreviewOutput = async () => {
    console.log(TAG + 'Entering getSecurePreviewOutput')
    receiver = image.createImageReceiver({ width: 640, height: 480 }, image.ImageFormat.JPEG, 4,)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Secure receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Secure received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Secure receiver is created failed')
    }
    console.log(TAG + 'Exit getSecurePreviewOutput')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }

    console.info('Exit getCameraManagerInstance');

    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');

    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);

    if (isEmpty04(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    secureSeqId = await mCameraInput.open(true);

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput + 'secureSeqId = ' + secureSeqId);

    console.info('Exit createInput');

    return true;
  }

  let createOutput = async (idx: int): Promise<boolean> => {
    console.info('Enter createOutput');
    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()],
      cameraObj.SceneMode.SECURE_PHOTO);
    if (!isEmpty05(cameraOutputCap)) {
      if (!isEmpty06(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput =
            mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (!isEmpty07(mPreviewOutput)) {
            break;
          }
        }

        if (isEmpty07(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let createSecureSessionInstance = () => {
    console.info('Enter createSecureSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession<cameraObj.SecureSession>(cameraObj.SceneMode.SECURE_PHOTO);
    } catch (error:BusinessError) {
      console.info('createSecureSessionInstance FAILED');
    }
    isCameraSessionCreated = true;

    if (isEmpty03(mCameraSession)) {
      console.info(TAG + "createSecureSessionInstance FAILED");
      return false;
    }

    mCameraSession.beginConfig();
    console.info('Exit createSecureSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    if (isCameraSessionCreated) {
      console.info(TAG + "Enter releaseCameraSessionInstance");
      await mCameraSession.release();
      isCameraSessionCreated = false;
    }
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');

    if (!isEmpty04(mCameraInput)) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');

    return true;
  }


  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (!isEmpty07(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    await createOutput(idx);

    console.info(TAG + "Start to addInput");


    await Utils.msSleep(1);

    if (!isEmpty04(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty07(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    await Utils.msSleep(1);

    await mCameraSession.commitConfig();

    console.info(TAG + "Entering startCameraSession start session begin");

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");
    await releaseOutput();
    await releaseInput();
    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  let startSecureCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter startSecureCameraSession" + cameraObj.SceneMode.SECURE_PHOTO);
    for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
      let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
      console.info(TAG + "cameraModeTmp = " + JSON.stringify(cameraMode));
      if (cameraMode != null && cameraMode.length > 0) {
        for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
          let cameraModeTmp = cameraMode[modeIndex];
          console.info(TAG + "cameraModeTmp = " + cameraModeTmp);
          if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
            console.info(TAG + "Enter startSecureCameraSession %d" + cameraObj.SceneMode.SECURE_PHOTO);
            createSecureSessionInstance();
            startCameraSession(cameraIndex);
            return true;
          }
        }
      }
    }
    console.info(TAG + "Exit startSecureCameraSession");
    return false;
  }

  describe('cameraSecureSessionTest', () => {
    console.info(TAG + '----------CameraSecureSessionTest--------------')

    beforeAll(() => {
      Utils.msSleep(100);
      getPreviewOutputSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await getSecurePreviewOutput();
      console.info('Device type = ' + deviceInfo.deviceType);
      secureSeqId = 0n;
      console.info('beforeAll case');
    })

    beforeEach(() => {
      Utils.msSleep(1000);
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      Utils.msSleep(500);
    })

    afterAll(() => {
      await releaseCameraSessionInstance();
      Utils.msSleep(500);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100
     * @tc.desc   Check open secure cameraid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
          let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
          for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
            let cameraModeTmp = cameraMode[modeIndex];
            if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
              createSecureSessionInstance();
              createOutput(cameraIndex);
              mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[cameraIndex]);
              if (isEmpty04(mCameraInput)) {
                console.info(TAG + "createCameraInput FAILED");
                expect().assertFail();
                done();
              }
              await Utils.msSleep(5000);
              secureSeqId = await mCameraInput.open(true);
              console.info('th CameraInput is: ' + mCameraInput + 'secureSeqId = ' + secureSeqId);
              if (secureSeqId == 0n) {
                expect().assertFail();
                done();
              }
              await releaseInput();
              await releaseCameraSessionInstance();
              await Utils.msSleep(1000);
            }
          }
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_STATIC_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100
     * @tc.desc   Check add secure output flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        console.info("SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100 start ");
        for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
          let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
          if (cameraMode != null && cameraMode.length > 0) {
            for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
              let cameraModeTmp = cameraMode[modeIndex];
              console.info(TAG + "cameraModeTmp = " + cameraModeTmp);
              if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
                await Utils.msSleep(500);
                createSecureSessionInstance();
                await startCameraSession(cameraIndex);
                await releaseOutput();
                await releaseCameraSessionInstance();
                await releaseInput();
                await Utils.msSleep(500);
              }
            }
          }
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_STATIC_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_STATIC_0100
     * @tc.desc   Test secure session addSecureOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_STATIC_0100--------------");
      if (mCameraNum < 2) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 Pass with NoCamera Support Secure Session");
        expect(mCameraNum < 2).assertTrue();
        done();
      } else {
        createSecureSessionInstance();
        await createInput(1);
        await createOutput(1);

        if (!isEmpty04(mCameraInput)) {
          console.info(TAG + "Start to addInput");
          mCameraSession.addInput(mCameraInput);
        }

        if (!isEmpty07(mPreviewOutput)) {
          console.info(TAG + "Start to addOutput mPreviewOutput");
          mCameraSession.addOutput(mPreviewOutput);
        }

        console.info(TAG + "Start to addSecureOutput");
        try {
          mCameraSession.addSecureOutput(mPreviewOutput);
          console.info(TAG + "Success to addSecureOutput mPreviewOutput");
        } catch (err: BusinessError) {
          console.info(TAG + "Failed to addSecureOutput mPreviewOutput, error code: " + err.code);
          expect().assertFail()
        }
        await mCameraSession.commitConfig();
        console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_STATIC_0100--------------");
        await Utils.msSleep(1000);
        await releaseCameraSessionInstance()
      }
      done()
    })
  })
}

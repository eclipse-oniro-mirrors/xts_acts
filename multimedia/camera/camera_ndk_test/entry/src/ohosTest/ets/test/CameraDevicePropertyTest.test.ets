/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import cameraObj from 'libentry.so'
import image from '@ohos.multimedia.image';
import { Camera_SceneMode, Parameter_Setting } from './Constants';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

function setSceneMode(index_sceneMode: number) {
  let ret = cameraObj.oHCameraManagerSetSceneMode(index_sceneMode);
  if (ret != 0) {
    console.error(TAG + "setSceneMode FAILED");
    expect().assertFail();
  }
  if (index_sceneMode == Camera_SceneMode.NORMAL_PHOTO) {
    console.info(TAG + "set sceneMode: NORMAL_PHOTO");
  } else if (index_sceneMode == Camera_SceneMode.NORMAL_VIDEO) {
    console.info(TAG + "set sceneMode: NORMAL_VIDEO");
  } else if (index_sceneMode == Camera_SceneMode.SECURE_PHOTO) {
    console.info(TAG + "set sceneMode: SECURE_PHOTO");
  }
}

async function getPhotoReceiverSurface() {
  console.info(TAG + 'createImageReceiver start.');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.error(TAG + 'createImageReceiver successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.info(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + 'createImageReceiver failed');
  }
}

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function createCaptureSession() {
  console.info(TAG + "createCaptureSession start.");
  let ret = cameraObj.createSession();
  if (ret != 0) {
    console.error(TAG + "createCaptureSession FAILED");
    expect().assertFail();
  }
  let registerCallback = cameraObj.oHCaptureSessionRegisterCallback(Parameter_Setting.ALL_PARAMETER_OK);
  if (registerCallback != 0) {
    console.error(TAG + "SessionRegisterCallback FAILED");
    expect().assertFail();
  }
}

function createCameraInput() {
  console.info(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.error(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
  cameraObj.cameraInputOpen();
}

function getSupportedSceneModes(index: number) {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(index);
  if (supportedSceneModes.errorCode != 0) {
    console.error(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  if (supportedSceneModes.isNormalPhoto) {
    console.info(TAG + "NORMAL_PHOTO is supported.");
  }
  if (supportedSceneModes.isNormalVideo) {
    console.info(TAG + "NORMAL_VIDEO is supported.");
  }
  if (supportedSceneModes.isSecurePhoto) {
    console.info(TAG + "SECURE_PHOTO is supported.");
  }
  cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  return supportedSceneModes;
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.error(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function getCameraDevicesInstance() {
  let cameraInfo = cameraObj.getCameraDevices();
  if (isEmpty(cameraInfo)) {
    console.error(TAG + "getSupportedCamerasInstance FAILED");
    return false;
  }
  return true;
}

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function getSupportedCameraFullOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedFullOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function setSessionMode() {
  let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "setSessionMode FAILED");
    expect().assertFail();
  }
}
function sessionFlow() {
  let begin = cameraObj.sessionBegin();
  if (begin != 0) {
    console.error(TAG + "beginConfig FAILED");
    expect().assertFail();
  }

  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.error(TAG + "CanAddInput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);

  if (canAddInput.isAddInput) {
    let addInput = cameraObj.sessionAddInput();
    if (addInput != 0) {
      console.error(TAG + "addInput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }

  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "CanAddPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);

  if (canAddPreviewOutput.isAddPreviewOutput) {
    let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
    if (addPreviewOutput != 0) {
      console.error(TAG + "AddPreviewOutput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function sessionCommitConfig() {
  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.error(TAG + "commitConfig FAILED");
    expect().assertFail();
  }
}

function addPhotoOutput() {
  let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPhotoOutput.errorCode != 0) {
    console.error(TAG + "canAddPhotoOutput FAILED" + canAddPhotoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
  if (!canAddPhotoOutput.isAddPhotoOutput) {
    console.error(TAG + "addPhotoOutput FAILED");
  } else {
    let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
    if (addPhotoOutput != 0) {
      console.error(TAG + "addPhotoOutput FAILED" + addPhotoOutput);
      expect().assertFail();
    }
  }
}

function PhysicalcaptureSessionstart() {
  getCameraManagerInstance();
  createCaptureSession();
  if(getCameraDevicesInstance()){
    getSupportedCameraFullOutputCapability();
    getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
    setSessionMode();
    createPreviewOutput();
    createCameraInput();
    sessionFlow();
    return true;
  }
  return false;
}

function createPreviewOutput() {

  cameraObj.getSupportedFullOutputCapability();

  let previewProfiles = cameraObj.getPreviewProfiles();
  console.info("previewProfiles is "+ JSON.stringify(previewProfiles));
  let previewProfileIndex = 0;
  let previewProfileHeigth = 1080;
  let previewProfileWidth = 1920;
  //View the previewprofile with an aspect ratio of 4:3
  for (let i = 0; i < previewProfiles.length; i++) {
    if (Math.abs((previewProfiles[i].width / previewProfiles[i].height) - (4 / 3)) < 0.1) {
      previewProfileWidth = previewProfiles[i].width;
      previewProfileHeigth = previewProfiles[i].height;
      previewProfileIndex = i;
      break;
    }
  }
  if (cameraObj.createPreviewOutputByIndex(previewProfileIndex)) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
}

function createPhotoOutput() {
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

let getPermissions1 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let getPermissions2 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(500);
  let power1 = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  let power2 = await dr?.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
  await sleep(500);
  await power1?.click();
  await power2?.click();
  await sleep(500);
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

export default function CameraDevicePropertyTest() {
  describe('CameraDevicePropertyTest', () => {
    beforeAll(async (done: Function) => {
      await sleep(10000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
      await sleep(10000);
      done();
    })
    beforeEach(() => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
    })
    afterEach(async (done: Function) => {
      releaseCamera();
      await sleep(300);
      done();
    })
    afterAll(() => {
    })
    /**
     * @tc.name   testOHPhysicalAperture_0200
     * @tc.number SUB_Multimedia_Camera_PhysicalAperture_Func_0200
     * @tc.desc   Test OH_CaptureSession_GetSupportedPhysicalApertures with null session,
     *            return CAMERA_INVALID_ARGUMENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPhysicalAperture_0200', Level.LEVEL0, () => {
      if (PhysicalcaptureSessionstart()) {
        let ret: number = cameraObj.oHCaptureSessionTestPhyAptNullSession();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testOHPhysicalAperture_0300
     * @tc.number SUB_Multimedia_Camera_PhysicalAperture_Func_0300
     * @tc.desc   Test OH_CaptureSession_GetSupportedPhysicalApertures with null apertures,
     *            return CAMERA_INVALID_ARGUMENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPhysicalAperture_0300', Level.LEVEL0, () => {
      if (PhysicalcaptureSessionstart()) {
        let ret: number = cameraObj.oHCaptureSessionTestPhyAptNullApts();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testOHPhysicalAperture_0400
     * @tc.number SUB_Multimedia_Camera_PhysicalAperture_Func_0400
     * @tc.desc   Test OH_CaptureSession_GetSupportedPhysicalApertures without inputDevice,
     *            return CAMERA_OPERATION_NOT_ALLOWED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPhysicalAperture_0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret: number = cameraObj.oHCaptureSessionTestPhyAptNoInput();
      expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
    })

    /**
     * @tc.name   testOHPhysicalAperture_0500
     * @tc.number SUB_Multimedia_Camera_PhysicalAperture_Func_0500
     * @tc.desc   Test OH_CaptureSession_GetSupportedPhysicalApertures without configured stream,
     *            return CAMERA_SESSION_NOT_CONFIG.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPhysicalAperture_0500', Level.LEVEL0, () => {
        getCameraManagerInstance();
        let ret: number = cameraObj.oHCaptureSessionTestPhyAptNoOutput();
        expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG);
    })

    /**
     * @tc.name   testOHDeletePhysicalApertures_0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHDeletePhysicalApertures_0100
     * @tc.desc   Test OH_CaptureSession_DeletePhysicalApertures in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDeletePhysicalApertures_0100', Level.LEVEL0, () => {
      if (PhysicalcaptureSessionstart()) {
        createPhotoOutput();
        addPhotoOutput();
        sessionCommitConfig();
        let ret: number = cameraObj.oHCaptureSessionTestDelPhyApts();
        expect(ret).assertEqual(CAMERA_OK);
      }
    })

    /**
     * @tc.name   testOHDeletePhysicalApertures_0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHDeletePhysicalApertures_0200
     * @tc.desc   Test OH_CaptureSession_DeletePhysicalApertures with null session, return CAMERA_INVALID_ARGUMENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDeletePhysicalApertures_0200', Level.LEVEL0, () => {
        if (PhysicalcaptureSessionstart()) {
          createPhotoOutput();
          addPhotoOutput();
          sessionCommitConfig();
          let ret: number =cameraObj.oHCaptureSessionTestDelPhyAptsNullSession();
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })

    /**
     * @tc.name   testOHDeletePhysicalApertures_0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHDeletePhysicalApertures_0300
     * @tc.desc   Test OH_CaptureSession_DeletePhysicalApertures with null apertures, return CAMERA_INVALID_ARGUMENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDeletePhysicalApertures_0300', Level.LEVEL0, () => {
        if (PhysicalcaptureSessionstart()) {
          createPhotoOutput();
          addPhotoOutput();
          sessionCommitConfig();
          let ret: number =cameraObj.oHCaptureSessionTestDelPhyAptsNullApts();
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })

    /**
     * @tc.name   testLensDist_0100
     * @tc.number SUB_Multimedia_Camera_LensDistortion_Func_0100
     * @tc.desc   Test OH_CameraDevice_GetLensDistortion with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLensDist_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestLensDistNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testLensDist_0200
     * @tc.number SUB_Multimedia_Camera_LensDistortion_Func_0200
     * @tc.desc   Test OH_CameraDevice_GetLensDistortion with null lens.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLensDist_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestLensDistNullLens();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testLensDist_0300
     * @tc.number SUB_Multimedia_Camera_LensDistortion_Func_0300
     * @tc.desc   Test OH_CameraDevice_GetLensDistortion with null size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLensDist_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestLensDistNullSize();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testIntrinsic_0100
     * @tc.number SUB_Multimedia_Camera_IntrinsicCalibration_Func_0100
     * @tc.desc   Test OH_CameraDevice_GetIntrinsicCalibration with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIntrinsic_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestIntrinsicNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testIntrinsic_0200
     * @tc.number SUB_Multimedia_Camera_IntrinsicCalibration_Func_0200
     * @tc.desc   Test OH_CameraDevice_GetIntrinsicCalibration with null data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIntrinsic_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestIntrinsicNullData();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testIntrinsic_0300
     * @tc.number SUB_Multimedia_Camera_IntrinsicCalibration_Func_0300
     * @tc.desc   Test OH_CameraDevice_GetIntrinsicCalibration with null size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIntrinsic_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestIntrinsicNullSize();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testSensorSize_0100
     * @tc.number SUB_Multimedia_Camera_SensorPhysicalSize_Func_0100
     * @tc.desc   Test OH_CameraDevice_GetSensorPhysicalSize with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSensorSize_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestSensorSizeNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testSensorSize_0200
     * @tc.number SUB_Multimedia_Camera_SensorPhysicalSize_Func_0200
     * @tc.desc   Test OH_CameraDevice_GetSensorPhysicalSize with null width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSensorSize_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestSensorSizeNullW();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testSensorSize_0300
     * @tc.number SUB_Multimedia_Camera_SensorPhysicalSize_Func_0300
     * @tc.desc   Test OH_CameraDevice_GetSensorPhysicalSize with null height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSensorSize_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestSensorSizeNullH();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

        /**
     * @tc.name   testEqFocal_0100
     * @tc.number SUB_Multimedia_Camera_EquivalentFocalLengths_Func_0100
     * @tc.desc   Test OH_CameraDevice_GetLensEquivalentFocalLengths with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqFocal_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestEqFocalNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testEqFocal_0200
     * @tc.number SUB_Multimedia_Camera_EquivalentFocalLengths_Func_0200
     * @tc.desc   Test OH_CameraDevice_GetLensEquivalentFocalLengths with null data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqFocal_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestEqFocalNullData();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testEqFocal_0300
     * @tc.number SUB_Multimedia_Camera_EquivalentFocalLengths_Func_0300
     * @tc.desc   Test OH_CameraDevice_GetLensEquivalentFocalLengths with null size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqFocal_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestEqFocalNullSize();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testEqFocal_0400
     * @tc.number SUB_Multimedia_Camera_EquivalentFocalLengths_Func_0400
     * @tc.desc   Test OH_CameraDevice_GetLensEquivalentFocalLengths in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqFocal_0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestEqFocal();
        expect(ret).assertEqual(CAMERA_OK);
      }
    })

        /**
     * @tc.name   testIsLogic_0100
     * @tc.number SUB_Multimedia_Camera_IsLogicalCamera_Func_0100
     * @tc.desc   Test OH_CameraDevice_IsLogicalCamera with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsLogic_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestIsLogicNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testIsLogic_0200
     * @tc.number SUB_Multimedia_Camera_IsLogicalCamera_Func_0200
     * @tc.desc   Test OH_CameraDevice_IsLogicalCamera with null flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsLogic_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestIsLogicNullFlag();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testIsLogic_0300
     * @tc.number SUB_Multimedia_Camera_IsLogicalCamera_Func_0300
     * @tc.desc   Test OH_CameraDevice_IsLogicalCamera in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsLogic_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestIsLogic();
        expect(ret).assertEqual(CAMERA_OK);
      }
    })

    /**
     * @tc.name   testLogicCamDevs_0100
     * @tc.number SUB_Multimedia_Camera_ConstituentCameraDevices_Func_0100
     * @tc.desc   Test OH_CameraDevice_GetLogicalCameraConstituentCameraDevices with null camera.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogicCamDevs_0100', Level.LEVEL0, () => {
      let ret: number = cameraObj.oHCameraTestLogicCamDevsNullCam();
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testLogicCamDevs_0200
     * @tc.number SUB_Multimedia_Camera_ConstituentCameraDevices_Func_0200
     * @tc.desc   Test OH_CameraDevice_GetLogicalCameraConstituentCameraDevices with null data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogicCamDevs_0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestLogicCamDevsNullData();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testLogicCamDevs_0300
     * @tc.number SUB_Multimedia_Camera_ConstituentCameraDevices_Func_0300
     * @tc.desc   Test OH_CameraDevice_GetLogicalCameraConstituentCameraDevices with null size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogicCamDevs_0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestLogicCamDevsNullSize();
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testLogicCamDevs_0400
     * @tc.number SUB_Multimedia_Camera_ConstituentCameraDevices_Func_0400
     * @tc.desc   Test OH_CameraDevice_GetLogicalCameraConstituentCameraDevices in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogicCamDevs_0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      if (getCameraDevicesInstance()) {
        let ret: number = cameraObj.oHCameraTestLogicCamDevs();
        expect(ret).assertEqual(CAMERA_OK);
      }
    })

  })
}
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
import { Camera_PreconfigType, Camera_PreconfigRatio, Camera_MediaType, Camera_SceneMode,
  Parameter_Setting } from './Constants';
//import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import MediaUtils from './MediaUtils';
import media from '@ohos.multimedia.media';
import { ability } from '@kit.AbilityKit';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const ALL_CALLBACK_IS_NULL = 1;
const ONLY_ON_ERROR = 2;
const ONLY_ON_FOCUS_STATE_CHANGE = 3;
const INVALID_SURFACE_ID = 4;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: Context = getContext(this) as common.UIAbilityContext;

let mediaUtil = MediaUtils.getInstance();
let videoSurfaceId: string;
let videoRecorder: media.AVRecorder;
let videoConfig: media.AVRecorderConfig = {
  audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
  profile : {
    audioBitrate : 48000,
    audioChannels : 2,
    audioCodec : media.CodecMimeType.AUDIO_AAC,
    audioSampleRate : 48000,
    fileFormat : media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate : 512000,
    videoCodec : media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth : 640,
    videoFrameHeight : 480,
    videoFrameRate : 30
    },
  url : 'fd://',
  rotation : 0,
}

async function getVideoSurfaceId() {
  const mContext: Context = getContext();
  console.info(TAG + 'start getVideoSurfaceID ');
  try {
    videoRecorder = await media.createAVRecorder();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`createAVRecorder call failed error code: ${err.code}`);
  }
  if (videoRecorder === undefined) {
    console.error(`createAVRecorder call failed`);
  }
  console.info(TAG + 'createAVRecorder videoRecorder : ' + JSON.stringify(videoRecorder));
  videoConfig.url = `fd://${await mediaUtil.createAndGetUriVideoNew(Camera_MediaType.VIDEO, mContext)}`;
  console.info(TAG + 'getVideoSurfaceID videoConfig.url : ' + JSON.stringify(videoConfig.url));
  try {
    await videoRecorder.prepare(videoConfig);
    console.info(TAG + 'getVideoSurfaceID  videoRecorder.prepare');
  } catch (err) {
    console.error(TAG + 'prepare failed with err: ' + err);
  }
  videoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(videoSurfaceId));
}

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

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
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

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.error(TAG + "createPreviewOutput FAILED");
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
      console.error(TAG + "addPreviewOutput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function createPhotoOutput() {
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.error(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}

function createVideoOutput() {
  let ret = cameraObj.createVideoOutput(videoSurfaceId);
  if (ret != 0) {
    console.error(TAG + "createVideoOutput FAILED");
    expect().assertFail();
  }
}

function sessionBeginConfig() {
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.error(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function addInput() {
  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.info(TAG + "canAddInput FAILED" + canAddInput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  if (canAddInput.isAddInput) {
    let ret = cameraObj.sessionAddInput();
    if (ret != 0) {
      console.error(TAG + "addInput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function addPreviewOutput() {
  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "canAddPreviewOutput FAILED" + canAddPreviewOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
  if (canAddPreviewOutput.isAddPreviewOutput) {
    let ret = cameraObj.sessionAddPreviewOutput();
    if (ret != 0) {
      console.error(TAG + "addPreviewOutput FAILED" + ret);
      expect().assertFail();
    }
  } else {
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

function sleep1(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep1(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep1(500);
  await power?.click();
  await sleep1(500);
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getPreviewOutputActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionBeginConfig();
  addInput();
  addPreviewOutput();
  let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "getPreviewOutputActiveProfile FAILED");
    expect().assertFail();
  }
}

function getPhotoOutputActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  createPreviewOutput();
  createCameraInput();
  sessionFlow();
  createPhotoOutput();
  addPhotoOutput();
  let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "getPhotoOutputActiveProfile FAILED");
    expect().assertFail();
  }
}

function getVideoOutputGetActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionFlow();
  createPhotoOutput();
  addPhotoOutput();
  createVideoOutput();
  addVideoOutput();
  let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "oHVideoOutputGetActiveProfile FAILED");
    expect().assertFail();
  }
}

function captureSessionPreconfig() {
  getCameraManagerInstance();
  getSupportedCamerasInstance();
  createCaptureSession();
  getSupportedCameraOutputCapability();
  let canPreconfig = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
      Parameter_Setting.ALL_PARAMETER_OK);
  console.info(TAG+"canPreconfig: " + canPreconfig.canPreconfig);
  if (!canPreconfig.canPreconfig) {
    expect(canPreconfig.canPreconfig).assertEqual(false);
  } else {
    let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P,
        Parameter_Setting.ALL_PARAMETER_OK);
    console.info(TAG+"captureSessionPreconfig:"+preconfig)
    expect(preconfig).assertEqual(CAMERA_OK);
  }
  return canPreconfig.canPreconfig;
}

function createPhotoOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createPhotoOutput();
  } else {
    let photoOutput = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
        Parameter_Setting.ALL_PARAMETER_OK);
    if (photoOutput != 0) {
      console.error(TAG + "createPhotoOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  }
}

function createPreviewOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createPreviewOutput();
  } else {
    let previewOutput =
        cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.ALL_PARAMETER_OK);
    if (previewOutput != 0) {
      console.error(TAG + "createPreviewOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  }
}

function createVideoOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createVideoOutput();
  } else {
    let videoOutput = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
        Parameter_Setting.ALL_PARAMETER_OK);
    if (videoOutput != 0) {
      console.error(TAG + "createVideoOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
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

function addVideoOutput() {
  let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddVideoOutput.errorCode != 0) {
    console.error(TAG + "canAddVideoOutput FAILED" + canAddVideoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
  if (!canAddVideoOutput.isAddVideoOutput) {
    console.error(TAG + "addVideoOutput FAILED");
  } else {
    let addVideoOutput = cameraObj.sessionAddVideoOutput();
    if (addVideoOutput != 0) {
      console.error(TAG + "addVideoOutput FAILED" + addVideoOutput);
      expect().assertFail();
    }
  }
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function SessionTest() {
  describe('SessionTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      await sleep(3000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
      await getVideoSurfaceId();
      await sleep(10000);
      done();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
      releaseCamera();
      await sleep(300);
      done();
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallback0100
     * @tc.name       : testOHCaptureSessionRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallback0200
     * @tc.name       : testOHCaptureSessionRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallback0300
     * @tc.name       : testOHCaptureSessionRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallback0100
     * @tc.name       : testOHCaptureSessionUnregisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      cameraObj.oHCaptureSessionRegisterCallback(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionUnregisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallback0200
     * @tc.name       : testOHCaptureSessionUnregisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallback0300
     * @tc.name       : testOHCaptureSessionUnregisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterSmoothZoomInfoCallback0100
     * @tc.name       : testOHCaptureSessionRegisterSmoothZoomInfoCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterSmoothZoomInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterSmoothZoomInfoCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionRegisterSmoothZoomInfoCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterSmoothZoomInfoCallback0200
     * @tc.name       : testOHCaptureSessionRegisterSmoothZoomInfoCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterSmoothZoomInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterSmoothZoomInfoCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionRegisterSmoothZoomInfoCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterSmoothZoomInfoCallback0300
     * @tc.name       : testOHCaptureSessionRegisterSmoothZoomInfoCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterSmoothZoomInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterSmoothZoomInfoCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionRegisterSmoothZoomInfoCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterSmoothZoomInfoCallback0100
     * @tc.name       : testOHCaptureSessionUnregisterSmoothZoomInfoCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterSmoothZoomInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterSmoothZoomInfoCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      // cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(0);
      let ret = cameraObj.oHCaptureSessionUnregisterSmoothZoomInfoCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionUnregisterSmoothZoomInfoCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterSmoothZoomInfoCallback0200
     * @tc.name       : testOHCaptureSessionUnregisterSmoothZoomInfoCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterSmoothZoomInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterSmoothZoomInfoCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      // cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(0);
      let ret = cameraObj.oHCaptureSessionUnregisterSmoothZoomInfoCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionUnregisterSmoothZoomInfoCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterSmoothZoomInfoCallback0300
     * @tc.name       : testOHCaptureSessionUnregisterSmoothZoomInfoCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterSmoothZoomInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterSmoothZoomInfoCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      // cameraObj.oHCaptureSessionRegisterSmoothZoomInfoCallback(0);
      let ret = cameraObj.oHCaptureSessionUnregisterSmoothZoomInfoCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionUnregisterSmoothZoomInfoCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0100
     * @tc.name       : testOHCaptureSessionSetSessionMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSessionMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionSetSessionMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0200
     * @tc.name       : testOHCaptureSessionSetSessionMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSessionMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionSetSessionMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0300
     * @tc.name       : testOHCaptureSessionSetSessionMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSessionMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionSetSessionMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
      console.info(TAG+"testOHCaptureSessionSetSessionMode0300 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0400
     * @tc.name       : testOHCaptureSessionSetSessionMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSessionMode in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionSetSessionMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0500
     * @tc.name       : testOHCaptureSessionSetSessionMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSessionMode in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionSetSessionMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0100
     * @tc.name       : testOHCaptureSessionCanAddInput0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddInput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.info(TAG+"testOHCaptureSessionCanAddInput0100:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0200
     * @tc.name       : testOHCaptureSessionCanAddInput0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddInput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.info(TAG+"testOHCaptureSessionCanAddInput0200:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0300
     * @tc.name       : testOHCaptureSessionCanAddInput0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddInput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.info(TAG+"testOHCaptureSessionCanAddInput0300:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0400
     * @tc.name       : testOHCaptureSessionCanAddInput0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddInput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.info(TAG+"testOHCaptureSessionCanAddInput0400:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0100
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0100:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0200
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0200:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0300
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput =
          cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0300:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0400
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0400:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0500
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0500:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0600
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0600:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0700
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput =
          cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0700:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0800
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0800
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0800:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0900
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0900
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionBeginConfig();
        addInput();
        let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
        console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0900:"+canAddPreviewOutput.errorCode);
        expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_OK);
      }
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput0900 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput1000
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput1000
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput1000', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionBeginConfig();
        addInput();
        let canAddPreviewOutput =
            cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
        console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1000:"+canAddPreviewOutput.errorCode);
        expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1000 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput1100
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput1100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput1100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionBeginConfig();
        addInput();
        let canAddPreviewOutput =
            cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
        console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1100:"+canAddPreviewOutput.errorCode);
        expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1100 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput1200
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput1200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPreviewOutput in abnormal condition, the third parameter is null.
     */
    it('testOHCaptureSessionCanAddPreviewOutput1200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionBeginConfig();
        addInput();
        let canAddPreviewOutput =
            cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
        console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
        console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1200:"+canAddPreviewOutput.errorCode);
        expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionCanAddPreviewOutput1200 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0100
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0100:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0200
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0200:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0300
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0300:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0400
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0400:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0500
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0500:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0600
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0600:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0700
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0700:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0800
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0800
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0800:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0900
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0900
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddPhotoOutput in abnormal condition, scene mode is secure photo.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionFlow();
        createPhotoOutput();
        let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
        console.info(TAG+"testOHCaptureSessionCanAddPhotoOutput0900:"+canAddPhotoOutput.errorCode);
        expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_OK);
        expect(canAddPhotoOutput.isAddPhotoOutput).assertEqual(false);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0100
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0100', Level.LEVEL0, () => {
      console.info(TAG + "guocheng1 ");
      getCameraManagerInstance();
      console.info(TAG + "guocheng2 ");
      createCaptureSession();
      console.info(TAG + "guocheng3 ");
      getSupportedCamerasInstance();
      console.info(TAG + "guocheng4 ");
      getSupportedCameraOutputCapability();
      console.info(TAG + "guocheng5 ");
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "guocheng6 ");
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      console.info(TAG + "guocheng7 ");
      setSessionMode();
      console.info(TAG + "guocheng8 ");
      createPreviewOutput();
      console.info(TAG + "guocheng9 ");
      createCameraInput();
      console.info(TAG + "guocheng10 ");
      sessionFlow();
      console.info(TAG + "guocheng111 ");
      createVideoOutput();
      console.info(TAG + "guocheng12 ");
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      expect(canAddVideoOutput.isAddVideoOutput).assertEqual(true);
      console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0100:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0200
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0200:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0300
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0300:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0400
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0400:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0500
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in abnormal condition, scene mode is normal photo.
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0500:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_OK);
      expect(canAddVideoOutput.isAddVideoOutput).assertEqual(false);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0600
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanAddVideoOutput in abnormal condition, scene mode is secure photo.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionFlow();
        createVideoOutput();
        let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
        console.info(TAG+"testOHCaptureSessionCanAddVideoOutput0600:"+canAddVideoOutput.errorCode);
        expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_OK);
        expect(canAddVideoOutput.isAddVideoOutput).assertEqual(false);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0100
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in normal condition, all callback is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(ALL_CALLBACK_IS_NULL);
      console.info(TAG+"testOHCaptureSessionRegisterCallbackOn0100:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0200
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in normal condition, only on error.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(ONLY_ON_ERROR);
      console.info(TAG+"testOHCaptureSessionRegisterCallbackOn0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0300
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_RegisterCallback in normal condition, only on focus state change.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(ONLY_ON_FOCUS_STATE_CHANGE);
      console.info(TAG+"testOHCaptureSessionRegisterCallbackOn0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0100
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in normal condition, all callback is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(ALL_CALLBACK_IS_NULL);
      console.info(TAG+"testOHCaptureSessionUnregisterCallbackOff0100:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0200
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in normal condition, only on error.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      cameraObj.oHCaptureSessionRegisterCallbackOn(ONLY_ON_ERROR);
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(ONLY_ON_ERROR);
      console.info(TAG+"testOHCaptureSessionUnregisterCallbackOff0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0300
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_UnregisterCallback in normal condition, only on focus state change.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      cameraObj.oHCaptureSessionRegisterCallbackOn(ONLY_ON_FOCUS_STATE_CHANGE);
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(ONLY_ON_FOCUS_STATE_CHANGE);
      console.info(TAG+"testOHCaptureSessionUnregisterCallbackOff0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0100
     * @tc.name       : testOHCaptureSessionCanPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfig0100 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0100:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0200
     * @tc.name       : testOHCaptureSessionCanPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_1080P,
          Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfig0200 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0200:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0300
     * @tc.name       : testOHCaptureSessionCanPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_4K,
          Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfig0300 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0300:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0400
     * @tc.name       : testOHCaptureSessionCanPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfig0400 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0400:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0500
     * @tc.name       : testOHCaptureSessionCanPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.FIRST_PARAMETER_ERROR);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0500 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0500:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0600
     * @tc.name       : testOHCaptureSessionCanPreconfig0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in abnormal condition, preconfigType is an exceptional
     *                  value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
          Parameter_Setting.ALL_PARAMETER_OK);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0600 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0600:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfig0700
     * @tc.name       : testOHCaptureSessionCanPreconfig0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfig in abnormal condition, the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.THIRD_PARAMETER_ERROR);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0700 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfig0700:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0100
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0100 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0100:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0200
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0200 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0200:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0300
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0300 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0300:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0400
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0400 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0400:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0500
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0500 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0500:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0600
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0600 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0600:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0700
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0700 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0700:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0800
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0800
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0800 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0800:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio0900
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0900
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0900 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio0900:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1000
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1000
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1000', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1000 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1000:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1100
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1100 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1100:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1200
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        expect(ret.canPreconfig).assertEqual(true);
      }
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1200 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1200:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1300
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in abnormal condition, the first parameter is
     *                  null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.FIRST_PARAMETER_ERROR);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1300 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1300:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1400
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in abnormal condition, preconfigType is an
     *                  exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1400 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1400:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1500
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in abnormal condition, preconfigRatio is an
     *                  exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.EXCEPTION_ENUMERATION_VALUE, Parameter_Setting.ALL_PARAMETER_OK);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1500 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1500:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanPreconfigWithRatio1600
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_CanPreconfigWithRatio in abnormal condition, the fourth parameter is
     *                  null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.FOURTH_PARAMETER_ERROR);
      expect(ret.canPreconfig).assertEqual(false);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1600 canPreconfig: " + ret.canPreconfig);
      console.info(TAG+"testOHCaptureSessionCanPreconfigWithRatio1600:" + ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0100
     * @tc.name       : testOHCaptureSessionPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0100 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfig0100:"+preconfig)
        expect(preconfig).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0200
     * @tc.name       : testOHCaptureSessionPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_1080P,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0200 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_1080P,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfig0200:"+preconfig)
        expect(preconfig).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0300
     * @tc.name       : testOHCaptureSessionPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_4K,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0300 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_4K,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfig0300:"+preconfig)
        expect(preconfig).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0400
     * @tc.name       : testOHCaptureSessionPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0400 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfig0400:"+preconfig)
        expect(preconfig).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0500
     * @tc.name       : testOHCaptureSessionPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0500 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P,
            Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionPreconfig0500:"+preconfig);
        expect(preconfig).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfig0600
     * @tc.name       : testOHCaptureSessionPreconfig0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_Preconfig in abnormal condition, preconfigType is an exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
          Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionPreconfig0600 canPreconfig: " + ret.canPreconfig);
      if (ret.canPreconfig) {
        let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfig0600:"+preconfig);
        expect(preconfig).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0100
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0100:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0200
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0200:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0300
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0300:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0400
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio =
            cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0400:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0500
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0500:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0600
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0600:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0700
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
            Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0700:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0800
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0800
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio =
            cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
            Camera_PreconfigRatio.PRECONFIG_RATIO_4, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0800:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio0900
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0900
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio0900:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1000
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1000
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1000', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_1080P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1000:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1100
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_4K,
            Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1100:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1200
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
          Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio =
            cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_HIGH_QUALITY,
            Camera_PreconfigRatio.PRECONFIG_RATIO_16, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1200:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1300
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1300:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1400
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in abnormal condition, preconfigType an exceptional
     *                  value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio =
            cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
            Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1400:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionPreconfigWithRatio1500
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_PreconfigWithRatio in abnormal condition, preconfigRatio an exceptional
     *                  value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.canPreconfig) {
        let preconfigWithRatio = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
            Camera_PreconfigRatio.EXCEPTION_ENUMERATION_VALUE, Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionPreconfigWithRatio1500:"+preconfigWithRatio);
        expect(preconfigWithRatio).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePreviewOutputUsedInPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePreviewOutputUsedInPreconfig in abnormal condition, the first
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePreviewOutputUsedInPreconfig in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      if (canPreconfig) {
        let ret =
            cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePreviewOutputUsedInPreconfig in abnormal condition, the surfaceId is
     *                  an invalid value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(INVALID_SURFACE_ID);
        console.info(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0500
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePreviewOutputUsedInPreconfig in abnormal condition, the third
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      if (canPreconfig) {
        let ret =
            cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.THIRD_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the first
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
            Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
            Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the surfaceId is
     *                  an invalid value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, INVALID_SURFACE_ID);
        console.info(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0500
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the third
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
            Parameter_Setting.THIRD_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
     /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreateVideoOutputUsedInPreconfig in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0100', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
            Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the first
     *                  parameter is null.
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0200', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
            Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0200:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0300', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
            Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the surfaceId is
     *                  an invalid value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId, INVALID_SURFACE_ID);
        console.info(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0500
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputUsedInPreconfig in abnormal condition, the third
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (canPreconfig) {
        let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
            Parameter_Setting.THIRD_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0100
     * @tc.name       : testOHPreviewOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHPreviewOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0200
     * @tc.name       : testOHPreviewOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0300
     * @tc.name       : testOHPreviewOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0400
     * @tc.name       : testOHPreviewOutputGetActiveProfile0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHPreviewOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0500
     * @tc.name       : testOHPreviewOutputGetActiveProfile0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputGetActiveProfile0600
     * @tc.name       : testOHPreviewOutputGetActiveProfile0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0600', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionBeginConfig();
      addInput();
      addPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputGetActiveProfile0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputDeleteProfile0100
     * @tc.name       : testOHPreviewOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_DeleteProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteProfile0100', Level.LEVEL0, () => {
      getPreviewOutputActiveProfile();
      let ret = cameraObj.oHPreviewOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPreviewOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPreviewOutputDeleteProfile0200
     * @tc.name       : testOHPreviewOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_DeleteProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteProfile0200', Level.LEVEL0, () => {
      getPreviewOutputActiveProfile();
      let ret = cameraObj.oHPreviewOutputDeleteProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHPreviewOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0100
     * @tc.name       : testOHVideoOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHVideoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0200
     * @tc.name       : testOHVideoOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0300
     * @tc.name       : testOHVideoOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0400
     * @tc.name       : testOHVideoOutputGetActiveProfile0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      createVideoOutputUsedInPreconfig(canPreconfig);
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHVideoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0500
     * @tc.name       : testOHVideoOutputGetActiveProfile0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      createVideoOutputUsedInPreconfig(canPreconfig);
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputGetActiveProfile0600
     * @tc.name       : testOHVideoOutputGetActiveProfile0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0600', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      createVideoOutputUsedInPreconfig(canPreconfig);
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputGetActiveProfile0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputDeleteProfile0100
     * @tc.name       : testOHVideoOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_DeleteProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteProfile0100', Level.LEVEL0, () => {
      getVideoOutputGetActiveProfile();
      let ret = cameraObj.oHVideoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHVideoOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputDeleteProfile0200
     * @tc.name       : testOHVideoOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_DeleteProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteProfile0200', Level.LEVEL0, () => {
      getVideoOutputGetActiveProfile();
      let ret = cameraObj.oHVideoOutputDeleteProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHVideoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0100
     * @tc.name       : testOHPhotoOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHPhotoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0200
     * @tc.name       : testOHPhotoOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0300
     * @tc.name       : testOHPhotoOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0400
     * @tc.name       : testOHPhotoOutputGetActiveProfile0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0400', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHPhotoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0500
     * @tc.name       : testOHPhotoOutputGetActiveProfile0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0500', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputGetActiveProfile0600
     * @tc.name       : testOHPhotoOutputGetActiveProfile0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_GetActiveProfile in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0600', Level.LEVEL0, () => {
      let canPreconfig = captureSessionPreconfig();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputGetActiveProfile0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputDeleteProfile0100
     * @tc.name       : testOHPhotoOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_DeleteProfile in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputDeleteProfile0100', Level.LEVEL0, () => {
      getPhotoOutputActiveProfile();
      let ret = cameraObj.oHPhotoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHPhotoOutputDeleteProfile0200
     * @tc.name       : testOHPhotoOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_DeleteProfile in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputDeleteProfile0200', Level.LEVEL0, () => {
      getPhotoOutputActiveProfile();
      let ret = cameraObj.oHPhotoOutputDeleteProfile(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHPhotoOutputDeleteProfile(Parameter_Setting.ALL_PARAMETER_OK);
    })
  })
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cameraObj from 'libentry.so'
import image from '@ohos.multimedia.image';
import { Camera_PreconfigType, Camera_SceneMode, Camera_MediaType, Parameter_Setting } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import MediaUtils from './MediaUtils';
import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
const COLOR_SPACE_NOT_SUPPORTED = 3;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

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
  let mContext = AppStorage.get('context') as Context;
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

function getSupportedFrameRates() {
  let ret = cameraObj.oHPreviewOutputGetSupportedFrameRates(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret.errorCode != 0) {
    console.error(TAG + "getSupportedFrameRates FAILED");
    expect().assertFail();
  }
  return ret.frameRatesSize;
}

function getActiveFrameRate() {
  let ret = cameraObj.oHPreviewOutputGetActiveFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret.errorCode != 0) {
    console.error(TAG + "getActiveFrameRate FAILED");
    expect().assertFail();
  }
  return ret;
}

function createVideoOutput() {
  let ret = cameraObj.createVideoOutput(videoSurfaceId);
  if (ret != 0) {
    console.error(TAG + "createVideoOutput FAILED");
    expect().assertFail();
  }
}

function getVideoOutputSupportedFrameRates() {
  let ret = cameraObj.oHVideoOutputGetSupportedFrameRates(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret.errorCode != 0) {
    console.error(TAG + "getSupportedFrameRates FAILED");
    expect().assertFail();
  }
  return ret.videoFrameRatesSize;
}

function getVideoOutputActiveFrameRate() {
  let ret = cameraObj.oHVideoOutputGetActiveFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret.errorCode != 0) {
    console.error(TAG + "getActiveFrameRate FAILED");
    expect().assertFail();
  }
  return ret;
}

function getActiveColorSpace() {
  let cameraInfo = cameraObj.oHCaptureSessionGetActiveColorSpace(Parameter_Setting.ALL_PARAMETER_OK);
  if (cameraInfo.errorCode != 0) {
    console.error(TAG + "getActiveColorSpace FAILED");
    expect().assertFail();
  }
  return cameraInfo.activeColorSpace;
}

function getSupportedColorSpaces() {
  let mPhotoOutput = cameraObj.oHCaptureSessionGetSupportedColorSpaces(Parameter_Setting.ALL_PARAMETER_OK);
  if (mPhotoOutput.errorCode != 0) {
    console.error(TAG + "getSupportedColorSpaces FAILED");
    expect().assertFail();
  }
  return mPhotoOutput.colorSpacesSize;
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

function createCameraInput() {
  console.info(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.error(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
  cameraObj.cameraInputOpen();
}

function getSupportedSceneModes() {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
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

function createPhotoOutputUsedInPreconfig(canPreconfig: boolean) {
  if (canPreconfig) {
    let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 0);
    if (ret != 0) {
      console.error(TAG + "createPhotoOutputUsedInPreconfig FAILED");
      expect().assertFail();
    } 
  } else {
    createPhotoOutput();
  }
}

function createPhotoOutputWithoutSurface() {
  let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "createPhotoOutputWithoutSurface FAILED");
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

function videoOutputFrameRate() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionFlow();
  createPhotoOutput();
  addPhotoOutput();
  createVideoOutput();
  addVideoOutput();
  sessionCommitConfig();
}

function captureSessionstart() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes();
  setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionFlow();
}

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
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

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"|
      "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
      'ohos.permission.MICROPHONE'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo =
        await bundleManager.getApplicationInfoSync('com.example.camerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.error(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function preconfig() {
  let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
  if (ret.errorCode != 0) {
    console.error(TAG + "canPreconfig FAILED");
    expect().assertFail();
  }
  console.info(TAG+"canPreconfig: " + ret.canPreconfig);
  if (ret.canPreconfig) {
    cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
  }
  return ret.canPreconfig;
}

function createPreviewOutputUsedInPreconfig(canPreconfig: boolean) {
  if (canPreconfig) {
    let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.ALL_PARAMETER_OK);
    if (ret != 0) {
      console.error(TAG + "createPreviewOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  } else {
    createPreviewOutput();
  }
}

function photoOutputRegisterPhotoAvailableCallback() {
  let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "photoOutputRegisterPhotoAvailableCallback FAILED");
    expect().assertFail();
  }
}

function photoOutputRegisterPhotoAssetAvailableCallback() {
  let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "photoOutputRegisterPhotoAssetAvailableCallback FAILED");
    expect().assertFail();
  }
}

function isMovingPhotoSupported() {
  let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret.errorCode != 0) {
    console.error(TAG + "isMovingPhotoSupported FAILED");
    expect().assertFail();
  }
  console.info(TAG+ "IsMovingPhotoSupported: " + ret.isMovingPhotoSupported);
  return ret.isMovingPhotoSupported;
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

function sessionStart() {
  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.error(TAG + "commitConfig FAILED");
    expect().assertFail();
  }

  let start = cameraObj.sessionStart();
  if (start != 0) {
    console.error(TAG + "start FAILED");
    expect().assertFail();
  }
}

export default function PhotoTest() {
  describe('PhotoTest', () => {
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      await getVideoSurfaceId() 
    })
    beforeEach(() => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
    })
    afterEach(() => {
      releaseCamera();
    })
    afterAll(() => {
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputWithoutSurface0100
     * @tc.name       : testOHCameraManagerCreatePhotoOutputWithoutSurface0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputWithoutSurface in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputWithoutSurface0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerCreatePhotoOutputWithoutSurface0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputWithoutSurface0200
     * @tc.name       : testOHCameraManagerCreatePhotoOutputWithoutSurface0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputWithoutSurface in abnormal condition, the first
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputWithoutSurface0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerCreatePhotoOutputWithoutSurface0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputWithoutSurface0300
     * @tc.name       : testOHCameraManagerCreatePhotoOutputWithoutSurface0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputWithoutSurface in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputWithoutSurface0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerCreatePhotoOutputWithoutSurface0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputWithoutSurface0400
     * @tc.name       : testOHCameraManagerCreatePhotoOutputWithoutSurface0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_CreatePhotoOutputWithoutSurface in abnormal condition, the third
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputWithoutSurface0400', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerCreatePhotoOutputWithoutSurface0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAvailableCallback0100
     * @tc.name       : testOHPhotoOutputRegisterPhotoAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAvailableCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAvailableCallback0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAvailableCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAvailableCallback0200
     * @tc.name       : testOHPhotoOutputRegisterPhotoAvailableCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAvailableCallback in abnormal condition, the first parameter
     *                  is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAvailableCallback0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAvailableCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAvailableCallback0300
     * @tc.name       : testOHPhotoOutputRegisterPhotoAvailableCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAvailableCallback in abnormal condition, the second parameter
     *                  is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAvailableCallback0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAvailableCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAvailableCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAvailableCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAvailableCallback0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAvailableCallback0100: "+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAvailableCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAvailableCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAvailableCallback in abnormal condition, the first parameter
     *                  is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAvailableCallback0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAvailableCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAvailableCallback0200: "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAvailableCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAvailableCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAvailableCallback in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAvailableCallback0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAvailableCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAvailableCallback0300: "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAssetAvailableCallback0100
     * @tc.name       : testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAssetAvailableCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAssetAvailableCallback0200
     * @tc.name       : testOHPhotoOutputRegisterPhotoAssetAvailableCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAssetAvailableCallback in abnormal condition, the first
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAssetAvailableCallback0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAssetAvailableCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAssetAvailableCallback0300
     * @tc.name       : testOHPhotoOutputRegisterPhotoAssetAvailableCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterPhotoAssetAvailableCallback in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAssetAvailableCallback0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterPhotoAssetAvailableCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAssetAvailableCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAssetAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAssetAvailableCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100: "+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAssetAvailableCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback in abnormal condition, the first
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAssetAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAssetAvailableCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0200: "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAssetAvailableCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback in abnormal condition, the second
     *                  parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAssetAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAssetAvailableCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0300: "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputIsMovingPhotoSupported0100
     * @tc.name       : testOHPhotoOutputIsMovingPhotoSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_IsMovingPhotoSupported in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMovingPhotoSupported0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.isMovingPhotoSupported) {
        expect(ret.isMovingPhotoSupported).assertEqual(true);
      } else {
        expect(ret.isMovingPhotoSupported).assertEqual(false);
      }
      console.info(TAG+"isMovingPhotoSupported: "+ret.isMovingPhotoSupported);
      console.info(TAG+"testOHPhotoOutputIsMovingPhotoSupported0100:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputIsMovingPhotoSupported0200
     * @tc.name       : testOHPhotoOutputIsMovingPhotoSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_IsMovingPhotoSupported in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMovingPhotoSupported0200', 0, () => {
      let canPreconfig = preconfig();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(Parameter_Setting.ALL_PARAMETER_OK);
      if (ret.isMovingPhotoSupported) {
        expect(ret.isMovingPhotoSupported).assertEqual(true);
      } else {
        expect(ret.isMovingPhotoSupported).assertEqual(false);
      }
      console.info(TAG+"isMovingPhotoSupported: "+ret.isMovingPhotoSupported);
      console.info(TAG+"testOHPhotoOutputIsMovingPhotoSupported0200:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputIsMovingPhotoSupported0300
     * @tc.name       : testOHPhotoOutputIsMovingPhotoSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_IsMovingPhotoSupported in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMovingPhotoSupported0300', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(Parameter_Setting.FIRST_PARAMETER_ERROR);
      expect(ret.isMovingPhotoSupported).assertEqual(false);
      console.info(TAG+"isMovingPhotoSupported: "+ret.isMovingPhotoSupported);
      console.info(TAG+"testOHPhotoOutputIsMovingPhotoSupported0300:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputIsMovingPhotoSupported0400
     * @tc.name       : testOHPhotoOutputIsMovingPhotoSupported0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_IsMovingPhotoSupported in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMovingPhotoSupported0400', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(Parameter_Setting.SECOND_PARAMETER_ERROR);
      expect(ret.isMovingPhotoSupported).assertEqual(false);
      console.info(TAG+"isMovingPhotoSupported: "+ret.isMovingPhotoSupported);
      console.info(TAG+"testOHPhotoOutputIsMovingPhotoSupported0400:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0100
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_EnableMovingPhoto in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0100', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        let ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, true);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0100 EnableMovingPhoto(true): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
        ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, false);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0100 EnableMovingPhoto(false): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+ "MovingPhoto is not supported.");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0200
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_EnableMovingPhoto in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0200', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        let ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, false);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0200 EnableMovingPhoto(false): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
        ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, true);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0200 EnableMovingPhoto(true): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+ "MovingPhoto is not supported.");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0300
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_EnableMovingPhoto in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0300', 0, () => {
      let canPreconfig = preconfig();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        let ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, true);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0300 EnableMovingPhoto(true): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
        ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, false);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0300 EnableMovingPhoto(false): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+ "MovingPhoto is not supported.");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0400
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_EnableMovingPhoto in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0400', 0, () => {
      let canPreconfig = preconfig();
      createPreviewOutputUsedInPreconfig(canPreconfig);
      createCameraInput();
      sessionFlow();
      createPhotoOutputUsedInPreconfig(canPreconfig);
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        let ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, false);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0400 EnableMovingPhoto(false): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
        ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.ALL_PARAMETER_OK, true);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0400 EnableMovingPhoto(true): " + ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+ "MovingPhoto is not supported.");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0500
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_EnableMovingPhoto in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0500', 0, () => {
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        let ret = cameraObj.oHPhotoOutputEnableMovingPhoto(Parameter_Setting.FIRST_PARAMETER_ERROR, true);
        console.info(TAG+ "testOHPhotoOutputEnableMovingPhoto0500 EnableMovingPhoto(true): " + ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.error(TAG+ "MovingPhoto is not supported.");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoNativeGetMain0200
     * @tc.name       : testOHPhotoNativeGetMain0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoNative_GetMainImage in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoNativeGetMain0200', 0, () => {
      let ret = cameraObj.oHPhotoNativeGetMainImage(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoNativeGetMain0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoNativeRelease0100
     * @tc.name       : testOHPhotoNativeRelease0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoNative_Release in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoNativeRelease0200', 0, () => {
      let ret = cameraObj.oHPhotoNativeRelease(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoNativeRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureStartWithInfoCallback0100
     * @tc.name       : testOHPhotoOutputRegisterCaptureStartWithInfoCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureStartWithInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureStartWithInfoCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureStartWithInfoCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureStartWithInfoCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureStartWithInfoCallback0200
     * @tc.name       : testOHPhotoOutputRegisterCaptureStartWithInfoCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureStartWithInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureStartWithInfoCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureStartWithInfoCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureStartWithInfoCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureStartWithInfoCallback0300
     * @tc.name       : testOHPhotoOutputRegisterCaptureStartWithInfoCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureStartWithInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureStartWithInfoCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureStartWithInfoCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureStartWithInfoCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureStartWithInfoCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureStartWithInfoCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureStartWithInfoCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureStartWithInfoCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureStartWithInfoCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0300', 0, () => {
      createPhotoOutput();
      let ret =
        cameraObj.oHPhotoOutputUnregisterCaptureStartWithInfoCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureStartWithInfoCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureEndCallback0100
     * @tc.name       : testOHPhotoOutputRegisterCaptureEndCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureEndCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureEndCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureEndCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureEndCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureEndCallback0200
     * @tc.name       : testOHPhotoOutputRegisterCaptureEndCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureEndCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureEndCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureEndCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureEndCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureEndCallback0300
     * @tc.name       : testOHPhotoOutputRegisterCaptureEndCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureEndCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureEndCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureEndCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureEndCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureEndCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterCaptureEndCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureEndCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureEndCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureEndCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureEndCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureEndCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterCaptureEndCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureEndCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureEndCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureEndCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureEndCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureEndCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterCaptureEndCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureEndCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureEndCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureEndCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureEndCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterFrameShutterEndCallback0100
     * @tc.name       : testOHPhotoOutputRegisterFrameShutterEndCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterFrameShutterEndCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterFrameShutterEndCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterFrameShutterEndCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterFrameShutterEndCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterFrameShutterEndCallback0200
     * @tc.name       : testOHPhotoOutputRegisterFrameShutterEndCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterFrameShutterEndCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterFrameShutterEndCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterFrameShutterEndCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterFrameShutterEndCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterFrameShutterEndCallback0300
     * @tc.name       : testOHPhotoOutputRegisterFrameShutterEndCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterFrameShutterEndCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterFrameShutterEndCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterFrameShutterEndCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterFrameShutterEndCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterFrameShutterEndCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterFrameShutterEndCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterFrameShutterEndCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterFrameShutterEndCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterFrameShutterEndCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterFrameShutterEndCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterFrameShutterEndCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterFrameShutterEndCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterFrameShutterEndCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterFrameShutterEndCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterFrameShutterEndCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterFrameShutterEndCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterFrameShutterEndCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterFrameShutterEndCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterFrameShutterEndCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterFrameShutterEndCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterFrameShutterEndCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterFrameShutterEndCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureReadyCallback0100
     * @tc.name       : testOHPhotoOutputRegisterCaptureReadyCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureReadyCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureReadyCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureReadyCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureReadyCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureReadyCallback0200
     * @tc.name       : testOHPhotoOutputRegisterCaptureReadyCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureReadyCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureReadyCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureReadyCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureReadyCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCaptureReadyCallback0300
     * @tc.name       : testOHPhotoOutputRegisterCaptureReadyCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterCaptureReadyCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCaptureReadyCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterCaptureReadyCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterCaptureReadyCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureReadyCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterCaptureReadyCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureReadyCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureReadyCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureReadyCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureReadyCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureReadyCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterCaptureReadyCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureReadyCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureReadyCallback0200', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureReadyCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureReadyCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCaptureReadyCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterCaptureReadyCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterCaptureReadyCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCaptureReadyCallback0300', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterCaptureReadyCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterCaptureReadyCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterEstimatedCaptureDurationCallback0100
     * @tc.name       : testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputRegisterEstimatedCaptureDurationCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterEstimatedCaptureDurationCallback0200
     * @tc.name       : testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0200', 0, () => {
      createPhotoOutput();
      let ret =
        cameraObj.oHPhotoOutputRegisterEstimatedCaptureDurationCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterEstimatedCaptureDurationCallback0300
     * @tc.name       : testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0300', 0, () => {
      createPhotoOutput();
      let ret =
        cameraObj.oHPhotoOutputRegisterEstimatedCaptureDurationCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputRegisterEstimatedCaptureDurationCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterEstimatedCaptureDurationCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0100', 0, () => {
      createPhotoOutput();
      let ret = cameraObj.oHPhotoOutputUnregisterEstimatedCaptureDurationCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterEstimatedCaptureDurationCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0200', 0, () => {
      createPhotoOutput();
      let ret =
        cameraObj.oHPhotoOutputUnregisterEstimatedCaptureDurationCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterEstimatedCaptureDurationCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0300', 0, () => {
      createPhotoOutput();
      let ret =
        cameraObj.oHPhotoOutputUnregisterEstimatedCaptureDurationCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPhotoOutputUnregisterEstimatedCaptureDurationCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetSupportedFrameRates0100
     * @tc.name       : testOHVideoOutputGetSupportedFrameRates0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetSupportedFrameRates in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetSupportedFrameRates0100', 0, () => {
      videoOutputFrameRate();
      let ret = cameraObj.oHVideoOutputGetSupportedFrameRates(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHVideoOutputGetSupportedFrameRates0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetSupportedFrameRates0200
     * @tc.name       : testOHVideoOutputGetSupportedFrameRates0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetSupportedFrameRates in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetSupportedFrameRates0200', 0, () => {
      videoOutputFrameRate();
      let ret = cameraObj.oHVideoOutputGetSupportedFrameRates(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHVideoOutputGetSupportedFrameRates0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetSupportedFrameRates0300
     * @tc.name       : testOHVideoOutputGetSupportedFrameRates0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetSupportedFrameRates in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetSupportedFrameRates0300', 0, () => {
      videoOutputFrameRate();
      let ret = cameraObj.oHVideoOutputGetSupportedFrameRates(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHVideoOutputGetSupportedFrameRates0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputDeleteFrameRates0100
     * @tc.name       : testOHVideoOutputDeleteFrameRates0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_DeleteFrameRates in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteFrameRates0100', 0, () => {
      videoOutputFrameRate();
      if (getVideoOutputSupportedFrameRates() != 0) {
        let ret = cameraObj.oHVideoOutputDeleteFrameRates(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHVideoOutputDeleteFrameRates0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"getSupportedFrameRates not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputDeleteFrameRates0200
     * @tc.name       : testOHVideoOutputDeleteFrameRates0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_DeleteFrameRates in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteFrameRates0200', 0, () => {
      videoOutputFrameRate();
      getVideoOutputSupportedFrameRates();
      let ret = cameraObj.oHVideoOutputDeleteFrameRates(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputDeleteFrameRates0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputDeleteFrameRates0300
     * @tc.name       : testOHVideoOutputDeleteFrameRates0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_DeleteFrameRates in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteFrameRates0300', 0, () => {
      videoOutputFrameRate();
      getVideoOutputSupportedFrameRates();
      let ret = cameraObj.oHVideoOutputDeleteFrameRates(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputDeleteFrameRates0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveFrameRate0100
     * @tc.name       : testOHVideoOutputGetActiveFrameRate0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveFrameRate in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveFrameRate0100', 0, () => {
      videoOutputFrameRate();
      if (getVideoOutputSupportedFrameRates() != 0) {
        let ret = cameraObj.oHVideoOutputGetActiveFrameRate(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHVideoOutputGetActiveFrameRate0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveFrameRate0200
     * @tc.name       : testOHVideoOutputGetActiveFrameRate0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveFrameRate in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveFrameRate0200', 0, () => {
      videoOutputFrameRate();
      getVideoOutputSupportedFrameRates();
      let ret = cameraObj.oHVideoOutputGetActiveFrameRate(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHVideoOutputGetActiveFrameRate0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveFrameRate0300
     * @tc.name       : testOHVideoOutputGetActiveFrameRate0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_GetActiveFrameRate in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveFrameRate0300', 0, () => {
      videoOutputFrameRate();
      getVideoOutputSupportedFrameRates();
      let ret = cameraObj.oHVideoOutputGetActiveFrameRate(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHVideoOutputGetActiveFrameRate0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputSetFrameRate0100
     * @tc.name       : testOHVideoOutputSetFrameRate0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_SetFrameRate in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputSetFrameRate0100', 0, () => {
      videoOutputFrameRate();
      if (getVideoOutputSupportedFrameRates() != 0) {
        if (getVideoOutputActiveFrameRate().min != 0 && getVideoOutputActiveFrameRate().max != 0) {
          let ret = cameraObj.oHVideoOutputSetFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHVideoOutputSetFrameRate0100:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputSetFrameRate0200
     * @tc.name       : testOHVideoOutputSetFrameRate0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_SetFrameRate in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputSetFrameRate0200', 0, () => {
      videoOutputFrameRate();
      getVideoOutputSupportedFrameRates();
      getVideoOutputActiveFrameRate();
      let ret = cameraObj.oHVideoOutputSetFrameRate(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHVideoOutputSetFrameRate0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputSetFrameRate0300
     * @tc.name       : testOHVideoOutputSetFrameRate0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_SetFrameRate in abnormal condition,
     *                  FrameRates is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputSetFrameRate0300', 0, () => {
      videoOutputFrameRate();
      if (getVideoOutputSupportedFrameRates() == 0) {
        if (getVideoOutputActiveFrameRate().min != 0 && getVideoOutputActiveFrameRate().max != 0) {
          let ret = cameraObj.oHVideoOutputSetFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHVideoOutputSetFrameRate0300:"+ret);
          expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG);
        }
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputSetFrameRate0400
     * @tc.name       : testOHVideoOutputSetFrameRate0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_SetFrameRate in abnormal condition,
     *                  the second and third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputSetFrameRate0400', 0, () => {
      videoOutputFrameRate();
      if (getVideoOutputSupportedFrameRates() != 0) {
          getVideoOutputActiveFrameRate();
          let ret = cameraObj.oHVideoOutputSetFrameRate(Parameter_Setting.SECOND_PARAMETER_ERROR);
          console.info(TAG+"testOHVideoOutputSetFrameRate0400:"+ret);
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetSupportedFrameRates0100
     * @tc.name       : testOHPreviewOutputGetSupportedFrameRates0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetSupportedFrameRates in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetSupportedFrameRates0100', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetSupportedFrameRates(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHPreviewOutputGetSupportedFrameRates0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetSupportedFrameRates0200
     * @tc.name       : testOHPreviewOutputGetSupportedFrameRates0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetSupportedFrameRates in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetSupportedFrameRates0200', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetSupportedFrameRates(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHPreviewOutputGetSupportedFrameRates0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetSupportedFrameRates0300
     * @tc.name       : testOHPreviewOutputGetSupportedFrameRates0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetSupportedFrameRates in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetSupportedFrameRates0300', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetSupportedFrameRates(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHPreviewOutputGetSupportedFrameRates0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetSupportedFrameRates0400
     * @tc.name       : testOHPreviewOutputGetSupportedFrameRates0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetSupportedFrameRates in abnormal condition,
     *                  the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetSupportedFrameRates0400', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetSupportedFrameRates(Parameter_Setting.THIRD_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHPreviewOutputGetSupportedFrameRates0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputDeleteFrameRates0100
     * @tc.name       : testOHPreviewOutputDeleteFrameRates0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_DeleteFrameRates in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteFrameRates0100', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      if (getSupportedFrameRates() != 0) {
        let ret = cameraObj.oHPreviewOutputDeleteFrameRates(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHPreviewOutputDeleteFrameRates0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"getSupportedFrameRates not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputDeleteFrameRates0200
     * @tc.name       : testOHPreviewOutputDeleteFrameRates0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_DeleteFrameRates in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteFrameRates0200', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      getSupportedFrameRates();
      let ret = cameraObj.oHPreviewOutputDeleteFrameRates(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputDeleteFrameRates0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputDeleteFrameRates0300
     * @tc.name       : testOHPreviewOutputDeleteFrameRates0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_DeleteFrameRates in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteFrameRates0300', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      getSupportedFrameRates();
      let ret = cameraObj.oHPreviewOutputDeleteFrameRates(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHPreviewOutputDeleteFrameRates0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveFrameRate0100
     * @tc.name       : testOHPreviewOutputGetActiveFrameRate0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveFrameRate in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveFrameRate0100', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      if (getSupportedFrameRates() != 0) {
        let ret = cameraObj.oHPreviewOutputGetActiveFrameRate(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHPreviewOutputGetActiveFrameRate0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"getSupportedFrameRates not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveFrameRate0200
     * @tc.name       : testOHPreviewOutputGetActiveFrameRate0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveFrameRate in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveFrameRate0200', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      getSupportedFrameRates();
      let ret = cameraObj.oHPreviewOutputGetActiveFrameRate(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHPreviewOutputGetActiveFrameRate0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveFrameRate0300
     * @tc.name       : testOHPreviewOutputGetActiveFrameRate0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_GetActiveFrameRate in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveFrameRate0300', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      getSupportedFrameRates();
      let ret = cameraObj.oHPreviewOutputGetActiveFrameRate(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHPreviewOutputGetActiveFrameRate0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputSetFrameRate0100
     * @tc.name       : testOHPreviewOutputSetFrameRate0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_SetFrameRate in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputSetFrameRate0100', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      if (getSupportedFrameRates() != 0) {
        getActiveFrameRate();
        let ret = cameraObj.oHPreviewOutputSetFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHPreviewOutputSetFrameRate0100:"+ret);
        console.info(TAG+"testOHPreviewOutputSetFrameRate0100.min"+getActiveFrameRate().min);
        console.info(TAG+"testOHPreviewOutputSetFrameRate0100.max"+getActiveFrameRate().max);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"getSupportedFrameRates not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputSetFrameRate0200
     * @tc.name       : testOHPreviewOutputSetFrameRate0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_SetFrameRate in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputSetFrameRate0200', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      getSupportedFrameRates();
      getActiveFrameRate();
      let ret = cameraObj.oHPreviewOutputSetFrameRate(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.log(TAG+"testOHPreviewOutputSetFrameRate0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputSetFrameRate0300
     * @tc.name       : testOHPreviewOutputSetFrameRate0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_SetFrameRate in abnormal condition,
     *                  FrameRates is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputSetFrameRate0300', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      if (getSupportedFrameRates() == 0) {
        getActiveFrameRate();
        let ret = cameraObj.oHPreviewOutputSetFrameRate(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHPreviewOutputSetFrameRate0300:"+ret);
        expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG);
      } else {
        console.error(TAG+"getSupportedFrameRates supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputSetFrameRate0400
     * @tc.name       : testOHPreviewOutputSetFrameRate0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_PreviewOutput_SetFrameRate in abnormal condition,
     *                  the second and third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputSetFrameRate0400', 0, () => {
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      if (getSupportedFrameRates() != 0) {
        getActiveFrameRate();
        let ret = cameraObj.oHPreviewOutputSetFrameRate(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHPreviewOutputSetFrameRate0400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.error(TAG+"getSupportedFrameRates supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureValue0100
     * @tc.name       : testOHCaptureSessionGetExposureValue0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetExposureValue in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureValue0100', 0, () => {
      captureSessionstart();
      sessionStart();
      let ret = cameraObj.oHCaptureSessionGetExposureValue(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionGetExposureValue0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureValue0200
     * @tc.name       : testOHCaptureSessionGetExposureValue0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetExposureValue in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureValue0200', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetExposureValue(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionGetExposureValue0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureValue0300
     * @tc.name       : testOHCaptureSessionGetExposureValue0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetExposureValue in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureValue0300', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetExposureValue(Parameter_Setting.SECOND_PARAMETER_ERROR)
      console.info(TAG+"testOHCaptureSessionGetExposureValue0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocalLength0100
     * @tc.name       : testOHCaptureSessionGetFocalLength0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetFocalLength in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocalLength0100', 0, () => {
      captureSessionstart();
      sessionStart();
      let ret = cameraObj.oHCaptureSessionGetFocalLength(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCaptureSessionGetFocalLength0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocalLength0200
     * @tc.name       : testOHCaptureSessionGetFocalLength0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetFocalLength in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocalLength0200', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetFocalLength(Parameter_Setting.FIRST_PARAMETER_ERROR)
      console.info(TAG+"testOHCaptureSessionGetFocalLength0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocalLength0300
     * @tc.name       : testOHCaptureSessionGetFocalLength0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetFocalLength in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocalLength0300', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetFocalLength(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionGetFocalLength0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetSmoothZoom0100
     * @tc.name       : testOHCaptureSessionSetSmoothZoom0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSmoothZoom in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSmoothZoom0100', 0, () => {
      captureSessionstart();
      sessionStart();
      let ret = cameraObj.oHCaptureSessionSetSmoothZoom(Parameter_Setting.ALL_PARAMETER_OK)
      console.info(TAG+"testOHCaptureSessionSetSmoothZoom0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetSmoothZoom0200
     * @tc.name       : testOHCaptureSessionSetSmoothZoom0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetSmoothZoom in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSmoothZoom0200', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionSetSmoothZoom(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionSetSmoothZoom0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetSupportedColorSpaces0100
     * @tc.name       : testOHCaptureSessionGetSupportedColorSpaces0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetSupportedColorSpaces in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetSupportedColorSpaces0100', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetSupportedColorSpaces(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHCaptureSessionGetSupportedColorSpaces0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetSupportedColorSpaces0200
     * @tc.name       : testOHCaptureSessionGetSupportedColorSpaces0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetSupportedColorSpaces in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetSupportedColorSpaces0200', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetSupportedColorSpaces(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCaptureSessionGetSupportedColorSpaces0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetSupportedColorSpaces0300
     * @tc.name       : testOHCaptureSessionGetSupportedColorSpaces0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetSupportedColorSpaces in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetSupportedColorSpaces0300', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetSupportedColorSpaces(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCaptureSessionGetSupportedColorSpaces0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetSupportedColorSpaces0400
     * @tc.name       : testOHCaptureSessionGetSupportedColorSpaces0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetSupportedColorSpaces in abnormal condition,
     *                  the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetSupportedColorSpaces0400', 0, () => {
      captureSessionstart();
      let ret = cameraObj.oHCaptureSessionGetSupportedColorSpaces(Parameter_Setting.THIRD_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCaptureSessionGetSupportedColorSpaces0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionDeleteColorSpaces0100
     * @tc.name       : testOHCaptureSessionDeleteColorSpaces0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_DeleteColorSpaces in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionDeleteColorSpaces0100', 0, () => {
      captureSessionstart();
      if (getSupportedColorSpaces() != 0) {
        let ret = cameraObj.oHCaptureSessionDeleteColorSpaces(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCaptureSessionDeleteColorSpaces0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"GetSupportedColorSpaces not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionDeleteColorSpaces0200
     * @tc.name       : testOHCaptureSessionDeleteColorSpaces0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_DeleteColorSpaces in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionDeleteColorSpaces0200', 0, () => {
      captureSessionstart();
      getSupportedColorSpaces();
      let ret = cameraObj.oHCaptureSessionDeleteColorSpaces(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionDeleteColorSpaces0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionDeleteColorSpaces0300
     * @tc.name       : testOHCaptureSessionDeleteColorSpaces0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_DeleteColorSpaces in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionDeleteColorSpaces0300', 0, () => {
      captureSessionstart();
      getSupportedColorSpaces();
      let ret = cameraObj.oHCaptureSessionDeleteColorSpaces(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionDeleteColorSpaces0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**ret
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetActiveColorSpace0100
     * @tc.name       : testOHCaptureSessionGetActiveColorSpace0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetActiveColorSpace in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetActiveColorSpace0100', 0, () => {
      captureSessionstart();
      if (getSupportedColorSpaces() != 0) {
        let ret = cameraObj.oHCaptureSessionGetActiveColorSpace(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCaptureSessionGetActiveColorSpace0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"GetSupportedColorSpaces not supported!");
      }
    })
    /**ret
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetActiveColorSpace0200
     * @tc.name       : testOHCaptureSessionGetActiveColorSpace0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetActiveColorSpace in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetActiveColorSpace0200', 0, () => {
      captureSessionstart();
      getSupportedColorSpaces();
      let ret = cameraObj.oHCaptureSessionGetActiveColorSpace(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCaptureSessionGetActiveColorSpace0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**ret
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetActiveColorSpace0300
     * @tc.name       : testOHCaptureSessionGetActiveColorSpace0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_GetActiveColorSpace in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetActiveColorSpace0300', 0, () => {
      captureSessionstart();
      getSupportedColorSpaces();
      let ret = cameraObj.oHCaptureSessionGetActiveColorSpace(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCaptureSessionGetActiveColorSpace0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetActiveColorSpace0100
     * @tc.name       : testOHCaptureSessionSetActiveColorSpace0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetActiveColorSpace in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetActiveColorSpace0100', 0, () => {
      captureSessionstart();
      if (getSupportedColorSpaces() != 0) {
        if (getActiveColorSpace() != 0) {
          let ret = cameraObj.oHCaptureSessionSetActiveColorSpace(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCaptureSessionSetActiveColorSpace0100:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      } else {
        console.error(TAG+"GetSupportedColorSpaces not supported!");
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetActiveColorSpace0200
     * @tc.name       : testOHCaptureSessionSetActiveColorSpace0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetActiveColorSpace in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetActiveColorSpace0200', 0, () => {
      captureSessionstart();
      getActiveColorSpace();
      let ret = cameraObj.oHCaptureSessionSetActiveColorSpace(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCaptureSessionSetActiveColorSpace0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetActiveColorSpace0300
     * @tc.name       : testOHCaptureSessionSetActiveColorSpace0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetActiveColorSpace in abnormal condition,
     *                  the second parameter is an exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetActiveColorSpace0300', 0, () => {
      captureSessionstart();
      getActiveColorSpace();
      let ret = cameraObj.oHCaptureSessionSetActiveColorSpace(Parameter_Setting.SECOND_PARAMETER_ERROR)
      console.info(TAG+"testOHCaptureSessionSetActiveColorSpace0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetActiveColorSpace0500
     * @tc.name       : testOHCaptureSessionSetActiveColorSpace0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CaptureSession_SetActiveColorSpace in abnormal condition,
     *                  ActiveColorSpace is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetActiveColorSpace0500', 0, () => {
      captureSessionstart();
      if (getSupportedColorSpaces() != 0) {
        let ret = cameraObj.oHCaptureSessionSetActiveColorSpace(COLOR_SPACE_NOT_SUPPORTED);
        console.info(TAG+"testOHCaptureSessionSetActiveColorSpace0500:"+ret);
        expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG);
      } else {
        console.error(TAG+"GetSupportedColorSpaces not supported!");
      }
    })
  })
}

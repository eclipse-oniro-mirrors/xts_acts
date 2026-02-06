/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import cameraObj from 'libentry.so';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { GlobalThis } from './Constants';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import media from '@ohos.multimedia.media';
import MediaUtils from './MediaUtils';
import { BusinessError } from '@kit.BasicServicesKit';
import { Camera_MediaType } from './Constants';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'

const TAG = "CameraXts VideoMirrorTest: ";

let mVideoSurfaceId: string;

let mediaUtil = MediaUtils.getInstance();
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

function getCameraManagerInstance() {
  console.info(TAG + 'Enter getCameraManagerInstance');
  console.info(TAG + 'mSurfaceId : ' + GlobalThis.getInstance().getValue());
  let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  let cameraInfo = cameraObj.getSupportedCameras();
  if (cameraInfo.cameraId == null) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
  return true;
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
  mVideoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(mVideoSurfaceId));
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  cameraObj.getSupportedOutputCapability();
  if (cameraObj.createVideoOutput(mVideoSurfaceId)) {
    console.info(TAG + "createVideoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit createVideoOutput');

  if (cameraObj.createPreviewOutput()) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info('Exit createOutputs');
  return true;
}

async function stopCameraSession() {
  console.info(TAG + "Enter stopCameraSession");
  if (await cameraObj.sessionStop()) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
  if (await cameraObj.cameraInputClose()) {
    console.info(TAG + "cameraInputClose FAILED");
    expect().assertFail();
  }
  //await removeOutput();
  await releaseOutput();
  if (await cameraObj.sessionRelease()) {
    console.info(TAG + "cameraInputClose FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit stopCameraSession");
}

async function removeOutput() {
  console.info(TAG + "Enter removeOutput");
  if (cameraObj.sessionRemovePreviewOutput()) {
    console.info(TAG + "sessionRemovePreviewOutput FAILED");
    expect().assertFail();
  }
  if (cameraObj.sessionRemoveVideoOutput()) {
    console.info(TAG + "sessionRemoveVideoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit removeOutput");
}

async function releaseOutput() {
  console.info(TAG + 'Enter releaseOutput');
  if (cameraObj.previewOutputRelease()) {
    console.info(TAG + "previewOutputRelease FAILED");
    expect().assertFail();
  }
  if (cameraObj.videoOutputRelease()) {
    console.info(TAG + "videoOutputRelease FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit releaseOutput');
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

let getPermissions3 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.READ_MEDIA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let getPermissions4 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.WRITE_MEDIA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(500);
  await power?.click();
  await sleep(500);
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

function isVideoMirrorSupported() {
  let isSupport: boolean | null = null;
  try {
    isSupport = cameraObj.isVideoMirrorSupported();
    if (isSupport === null) {
      console.error(TAG + "isSupport null");
      expect().assertFail();
    }
  } catch (error) {
    console.error(TAG + "enableMirror FAILED");
    expect().assertFail();
  }
  return (isSupport !== null) && isSupport;
}

function enableVideoMirror() {
  let ret = cameraObj.enableVideoMirror(true);
  if (ret != 0) {
    console.error(TAG + "enableMirror FAILED" + ret);
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

function beginConfig() {
  console.info(TAG + "Entering beginConfig start");
  cameraObj.sessionBegin();
  console.info(TAG + "Entering beginConfig end");
  return true;
}

async function createCameraInput() {
  console.info(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.error(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "cameraInputOpen start.");
  cameraObj.cameraInputOpen();
  console.info(TAG + "cameraInputOpen end.");
}

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  if (cameraObj.sessionAddInput()) {
    console.info(TAG + "addInput FAILED");
    expect().assertFail();
  }

  if (cameraObj.sessionAddPreviewOutput()) {
    console.info(TAG + "addPreviewOutput FAILED");
    expect().assertFail();
  }

  if (cameraObj.sessionAddVideoOutput()) {
    console.info(TAG + "addVideoOutput FAILED");
    expect().assertFail();
  }

  if (cameraObj.sessionCommitConfig()) {
    console.info(TAG + "CommitConfig FAILED");
    expect().assertFail();
  }

  if (cameraObj.sessionStart()) {
    console.info(TAG + "sessionStart FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit startCameraSession");

  return true;
}

export default function VideoMirrorTest() {
  describe('VideoMirrorTest', () => {
    console.info(TAG + '----------VideoMirrorTest--------------');
    beforeAll(async () => {
      await sleep(10000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await sleep(10000);
      console.info(TAG + 'Device type = ' + deviceInfo.deviceType);
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(async () => {
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCaptureSession();
      beginConfig();
      await createCameraInput();
      await getVideoSurfaceId();
      await createOutput();
      await startCameraSession();
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHVideoOutputEnableMirror001
     * @tc.name      : Check videoOutput Mirror enable
     * @tc.desc      : Check videoOutput Mirror enable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHVideoOutputEnableMirror001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHVideoOutputEnableMirror001--------------");
      if (isVideoMirrorSupported()) {
        enableVideoMirror();
      }
      try {
        await stopCameraSession();
      } catch (error) {
        console.error(TAG + "stopCameraSession FAILED");
      }
      console.info(TAG + "testOHVideoOutputEnableMirror001 success");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHVideoOutputIsMirrorSupported001
     * @tc.name      : Check whether videoOutput mirror is supported
     * @tc.desc      : Check whether videoOutput mirror is supported
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHVideoOutputIsMirrorSupported001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHVideoOutputIsMirrorSupported001--------------");
      let isSupported = isVideoMirrorSupported();
      console.info(TAG + "testOHVideoOutputIsMirrorSupported001 isMirrorSupported:" + isSupported);
      try {
        await stopCameraSession();
      } catch (error) {
        console.error(TAG + "stopCameraSession FAILED");
      }
      console.info(TAG + "testOHVideoOutputIsMirrorSupported001 success");
    });
  })
}
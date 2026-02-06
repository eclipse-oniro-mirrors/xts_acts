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

import cameras from 'libentry.so'
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import MediaUtils from './MediaUtils';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Context } from '@kit.AbilityKit';

const TAG = "CAMERA_LOGTAG_JS";
const CAMERA_OK = 0;
const CAMERA_ERROR_7400101 = 7400101; //参数错误
const VIDEO = 1;
let mediaUtil = MediaUtils.getInstance()
let videoRecorder: media.AVRecorder;
let videoSurfaceId: string;
let videoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 512000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  },
  url: 'fd://',
  rotation: 0
}

async function getVideoSurfaceID() {
  console.info(TAG + 'start getVideoSurfaceID ');
  const mContext: Context = getContext();
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
  videoConfig.url = `fd://${await mediaUtil.createAndGetUriVideoNew(VIDEO, mContext)}`;
  console.info(TAG + 'getVideoSurfaceID videoConfig.url : ' + JSON.stringify(videoConfig.url));
  videoConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES;
  console.info(TAG + 'getVideoSurfaceID videoConfig.videoSourceType : ' + videoConfig.videoSourceType);
  try {
    await videoRecorder.prepare(videoConfig);
    console.info(TAG + 'getVideoSurfaceID  videoRecorder.prepare');
  } catch (err) {
    console.error(TAG + 'prepare failed with err: ' + err);
  }
  videoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(videoSurfaceId));
}

let receiver: image.ImageReceiver;
let mPhotoSurface: string;

async function getPhotoReceiverSurface() {
  console.log(TAG + '通过宽、高、图片格式、容量创建ImageReceiver实例。');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + '创建ImageReceiver实例 successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + '创建ImageReceiver实例 failed');
  }
}

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameras.initCamera(mPhotoSurface, 0);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(0);
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function getSupportedCameraOutputCapabilityInstance() {
  let ret = cameras.oHGetSupportedCameraOutputCapability(0);
  if (ret != 0) {
    console.info(TAG + "getSupportedCameraOutputCapabilityInstance FAILED");
    expect().assertFail();
  }
  let output = cameras.oHCameraManagerCreatePreviewOutput(0);
  if (output != 0) {
    console.info(TAG + "createPreviewOutputInstance FAILED");
    expect().assertFail();
  }
  let callback = cameras.oHPreviewOutputRegisterCallback(0)
  if (callback != 0) {
    console.info(TAG + "outputRegisterCallback FAILED");
    expect().assertFail();
  }
  let mPhotoOutput = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 0);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}

function createCaptureSession() {
  console.log(TAG + "创建捕获会话实例");
  let ret = cameras.oHCameraManagerCreateCaptureSession(0);
  if (ret != 0) {
    console.log(TAG + "createCaptureSession FAILED");
    expect().assertFail();
  }

}

function sessionBeginConfig() {
  let ret = cameras.oHCaptureSessionBeginConfig(0);
  if (ret != 0) {
    console.info(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function CreateVideoOutput() {
  let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId, 0);
  if (ret != 0) {
    console.info(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function createCameraInput() {
  console.log(TAG + "创建相机输入实例。");
  let ret = cameras.oHCameraManagerCreateCameraInput(0);
  cameras.oHCameraInputOpen(0);
  if (ret != 0) {
    console.log(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
}

function startCameraSession() {
  createCaptureSession();
  sessionBeginConfig();

  createCameraInput();

  console.log(TAG + "添加相机输入");
  let ret = cameras.oHCaptureSessionAddInput(0);
  if (ret != 0) {
    console.log(TAG + "sessionAddInput FAILED" + ret);
    expect().assertFail();
  }

  let addPreviewOutput = cameras.oHCaptureSessionAddPreviewOutput(0);
  if (addPreviewOutput != 0) {
    console.info(TAG + "captureSessionAddPreviewOutput FAILED");
    expect().assertFail();
  }

  let addPhotoOutput = cameras.oHCaptureSessionAddPhotoOutput(0);
  if (addPhotoOutput != 0) {
    console.info(TAG + "captureSessionAddPhotoOutput FAILED:" + ret);
    expect().assertFail();
  }
  CreateVideoOutput();
  cameras.oHCaptureSessionAddVideoOutput(0);
  let commitConfig = cameras.oHCaptureSessionCommitConfig(0);
  if (commitConfig != 0) {
    console.info(TAG + "captureSessionCommitConfig FAILED");
    expect().assertFail();
  }
}

function isEmpty(data: cameras.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"| "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.MICROPHONE'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.ohcamerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
};

export default function Demo1() {
  describe('DemoTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      await getVideoSurfaceID();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapabilityInstance();


      startCameraSession()
    })
    beforeEach(() => {



      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      cameras.oHCaptureSessionStop(0);
      cameras.oHPhotoOutputRelease(0);
      cameras.oHVideoOutputRelease(0);
      cameras.oHPreviewOutputRelease(0);
      cameras.oHCameraInputClose(0);
      cameras.oHCameraInputRelease(0);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_CameraCuttingAndVideo0100
     * @tc.name       : testCameraCuttingAndVideo0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testCameraCuttingAndVideo0100', Level.LEVEL0, () => {
      //拍照
      let capture =cameras.oHPhotoOutputCapture(0);
      console.log(TAG+"testCameraCuttingAndVideo0100:"+capture);
      expect(capture).assertEqual(CAMERA_OK);
      //录像
      let ret = cameras.oHVideoOutputStart(0);
      console.log(TAG+"testCameraCuttingAndVideo0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
  })
}
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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Context } from '@kit.AbilityKit';

const TAG = "CAMERA_LOGTAG_JS_VIDEO";
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
const mContext: Context = getContext();
  console.info(TAG + 'start getVideoSurfaceID ' + videoSurfaceId);
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
function captureSessionCommitConfig() {
  sessionBeginConfig();


  console.log(TAG + "添加相机输入");
  let ret = cameras.oHCaptureSessionAddInput(0);
  if (ret != 0) {
    console.log(TAG + "sessionAddInput FAILED" + ret);
    expect().assertFail();
  }

  let addPreviewOutput = cameras.oHCaptureSessionAddPreviewOutput(0);
  if (addPreviewOutput != 0) {
    console.info(TAG + "captureSessionAddPreviewOutput FAILED"+addPreviewOutput);
    //expect().assertFail();
  }

  let addPhotoOutput = cameras.oHCaptureSessionAddPhotoOutput(0);
  if (addPhotoOutput != 0) {
    console.info(TAG + "captureSessionAddPhotoOutput FAILED:" + ret);
    //expect().assertFail();
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

export default function VideoTest() {
  describe('VideoTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      await getVideoSurfaceID();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapabilityInstance();
    })
    beforeEach(() => {
      createCameraInput();
      createCaptureSession();

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
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testOHCameraManagerCreateVideoOutput0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutput0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerCreateVideoOutput0100', Level.LEVEL0, () => {

      let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId,0);
      console.log(TAG+"testOHCameraManagerCreateVideoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerCreateVideoOutput0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutput0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerCreateVideoOutput0200', Level.LEVEL0, () => {

      let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId,1);
      console.log(TAG+"testOHCameraManagerCreateVideoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCameraManagerCreateVideoOutput0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutput0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerCreateVideoOutput0300', Level.LEVEL0, () => {

      let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId,2);
      console.log(TAG+"testOHCameraManagerCreateVideoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCameraManagerCreateVideoOutput0400
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutput0400
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerCreateVideoOutput0400', Level.LEVEL0, () => {

      let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId,3);
      console.log(TAG+"testOHCameraManagerCreateVideoOutput0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCameraManagerCreateVideoOutput0500
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutput0500
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerCreateVideoOutput0500', Level.LEVEL0, () => {

      let ret = cameras.oHCameraManagerCreateVideoOutput(videoSurfaceId,4);
      console.log(TAG+"testOHCameraManagerCreateVideoOutput0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCaptureSessionAddVideoOutput0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddVideoOutput0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddVideoOutput0100', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();

      let ret = cameras.oHCaptureSessionAddVideoOutput(0);
      console.log(TAG+"testOHCaptureSessionAddVideoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCaptureSessionAddVideoOutput0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddVideoOutput0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddVideoOutput0200', Level.LEVEL0, () => {
      CreateVideoOutput();
      let ret = cameras.oHCaptureSessionAddVideoOutput(1);
      console.log(TAG+"testOHCaptureSessionAddVideoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCaptureSessionAddVideoOutput0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddVideoOutput0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddVideoOutput0300', Level.LEVEL0, () => {
      CreateVideoOutput();
      let ret = cameras.oHCaptureSessionAddVideoOutput(2);
      console.log(TAG+"testOHCaptureSessionAddVideoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputRegisterCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRegisterCallback0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRegisterCallback0100', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputRegisterCallback(0);
      console.log(TAG+"testOHVideoOutputRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHVideoOutputRegisterCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRegisterCallback0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRegisterCallback0200', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputRegisterCallback(1);
      console.log(TAG+"testOHVideoOutputRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputRegisterCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRegisterCallback0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRegisterCallback0300', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputRegisterCallback(2);
      console.log(TAG+"testOHVideoOutputRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputUnregisterCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputUnregisterCallback0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputUnregisterCallback0100', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputUnregisterCallback(0);
      console.log(TAG+"testOHVideoOutputUnregisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHVideoOutputUnregisterCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputUnregisterCallback0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputUnregisterCallback0200', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputUnregisterCallback(1);
      console.log(TAG+"testOHVideoOutputUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputUnregisterCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputUnregisterCallback0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputUnregisterCallback0300', Level.LEVEL0, () => {

      CreateVideoOutput();
      let ret = cameras.oHVideoOutputUnregisterCallback(2);
      console.log(TAG+"testOHVideoOutputUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputStart0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStart0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStart0100', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);

      let ret = cameras.oHVideoOutputStart(0);
      console.log(TAG+"testOHVideoOutputStart0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);

    })
    /**
     * @tc.name   testOHVideoOutputStart0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStart0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStart0200', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);
      let ret = cameras.oHVideoOutputStart(1);
      console.log(TAG+"testOHVideoOutputStart0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputStart0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStart0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStart0300', Level.LEVEL0, () => {

      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);
      let ret = cameras.oHVideoOutputStart(2);
      console.log(TAG+"testOHVideoOutputStart0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputStop0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStop0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStop0100', Level.LEVEL0, () => {

      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);
      cameras.oHVideoOutputStart(0);
      let ret = cameras.oHVideoOutputStop(0);
      console.log(TAG+"testOHVideoOutputStop0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHVideoOutputStop0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStop0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStop0200', Level.LEVEL0, () => {

      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);
      cameras.oHVideoOutputStart(0);
      let ret = cameras.oHVideoOutputStop(1);
      console.log(TAG+"testOHVideoOutputStop0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputStop0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputStop0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputStop0300', Level.LEVEL0, () => {

      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);
      cameras.oHCaptureSessionStart(0);
      cameras.oHCaptureSessionCommitConfig(0);
      cameras.oHVideoOutputStart(0);
      let ret = cameras.oHVideoOutputStop(2);
      console.log(TAG+"testOHVideoOutputStop0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputRelease0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRelease0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRelease0100', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();

      let ret = cameras.oHVideoOutputRelease(0);
      console.log(TAG+"testOHVideoOutputRelease0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHVideoOutputRelease0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRelease0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRelease0200', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();

      let ret = cameras.oHVideoOutputRelease(1);
      console.log(TAG+"testOHVideoOutputRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHVideoOutputRelease0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputRelease0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoOutputRelease0300', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();

      let ret = cameras.oHVideoOutputRelease(2);
      console.log(TAG+"testOHVideoOutputRelease0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCaptureSessionRemoveVideoOutput0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveVideoOutput0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionRemoveVideoOutput0100', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);

      let ret = cameras.oHCaptureSessionRemoveVideoOutput(0);
      console.log(TAG+"testOHCaptureSessionRemoveVideoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCaptureSessionRemoveVideoOutput0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveVideoOutput0200
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionRemoveVideoOutput0200', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);

      let ret = cameras.oHCaptureSessionRemoveVideoOutput(1);
      console.log(TAG+"testOHCaptureSessionRemoveVideoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.name   testOHCaptureSessionRemoveVideoOutput0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveVideoOutput0300
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionRemoveVideoOutput0300', Level.LEVEL0, () => {
      captureSessionCommitConfig()
      CreateVideoOutput();
      cameras.oHCaptureSessionAddVideoOutput(0);

      let ret = cameras.oHCaptureSessionRemoveVideoOutput(2);
      console.log(TAG+"testOHCaptureSessionRemoveVideoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
  })
}
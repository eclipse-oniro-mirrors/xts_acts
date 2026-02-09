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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  cameraErrorCode,
  closeFd,
  COMMON_WAIT_DURATION,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sceneMode,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { tag } from '@kit.ConnectivityKit';

const TAG = "CameraXtscreateCameraInput";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

let CameraVideoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
};

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray.length) {
    mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
    if (isEmpty(mCameraInput)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmpty(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder.state);
  await mAVRecorder.prepare(videoConfig).then(() => {
    console.info('prepare success');
  }).catch((error: BusinessError) => {
    console.error(TAG, 'failed to prepare, err: ' + error.code + ', msg: ' + error.message);
  });
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder.state);
  mVideoSurfaceId = await mAVRecorder.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

export default function createCameraInput() {
  describe('createCameraInput', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('string1')
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_001
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_001
     * @tc.desc   createCameraInput camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_001', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_001';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_002
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_002
     * @tc.desc   createCameraInput camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_002', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_002';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_003
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_003
     * @tc.desc   createCameraInput camera CameraPosition CAMERA_POSITION_FOLD_INNER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_003', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_003';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_004
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_004
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_004', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_004';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_005
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_005
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_005', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_005';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_006
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_006
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_006', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_006';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_007
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_007
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_007', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_007';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_008
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_008
     * @tc.desc   createCameraInput camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_008', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_008';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_009
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_009
     * @tc.desc   createCameraInput camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_009', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_009';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_010
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_010
     * @tc.desc   createCameraInput camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_010', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_010';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let hosDeviceType = camera.HostDeviceType.PHONE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hosDeviceType == mCameraDeviceArray[i].hostDeviceType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_011
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_011
     * @tc.desc   createCameraInput camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_011', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_011';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let hosDeviceType = camera.HostDeviceType.TABLET;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hosDeviceType == mCameraDeviceArray[i].hostDeviceType) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_001
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_001
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_UNSPECIFIED and CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_001', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_001';
      try {
        console.info(TAG,testName,"start :");
        if(mCameraDeviceArray.length > 0){
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        for (let i = 0; i < mCameraDeviceArray.length; i++) {
          if(position == mCameraDeviceArray[i].cameraPosition){
            if(type == mCameraDeviceArray[i].cameraType){
              mCameraInput = mCameraManager.createCameraInput(position, type);
              console.info(TAG, testName, "createCameraInput ok:");
              expect(mCameraInput != null).assertTrue();
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }else{
            console.info(TAG, testName, "该设备不支持:");
          }
        }}
        done();
      } catch (error) {
        console.error(TAG, testName, "fail,errorCode :", error.code);
        expect().assertFail();
        done();
      }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_002
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_002
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_002', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_002';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_003
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_003
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_BACK and CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_003', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_003';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_BACK;
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_004
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_004
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_BACK and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_004', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_004';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_BACK;
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_005
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_005
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_005', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_005';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_006
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_006
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_006', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_006';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_007
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_007
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_007', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_007';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_008
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_008
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_008', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_008';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_009
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_009
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FOLD_INNER and CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_009', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_009';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_010
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_010
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FOLD_INNER and CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_010', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_010';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_011
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_011
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FOLD_INNER and CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_011', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_011';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_012
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_012
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FOLD_INNER and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_012', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_012';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if(position == mCameraDeviceArray[i].cameraPosition){
              if(type == mCameraDeviceArray[i].cameraType){
                mCameraInput = mCameraManager.createCameraInput(position, type);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
              }else{
                console.info(TAG, testName, "该设备不支持:");
              }
            }else{
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_013
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_013
     * @tc.desc   createCameraInput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_013', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_013';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0){
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          mCameraInput = mCameraManager.createCameraInput(null, type);
          console.info(TAG,testName,"createCameraInput :");
          expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101)
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_014
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_014
     * @tc.desc   createCameraInput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_014', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_014';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_BACK;
            mCameraInput = mCameraManager.createCameraInput(position, null);
            console.info(TAG, testName, "createCameraInput :");
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_015
     * @tc.number SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_015
     * @tc.desc   createCameraInput Camera service fatal error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_015', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_CAMERA_INPUT_015';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            mCameraInput = mCameraManager.createCameraInput(position, type);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400201);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_001
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_001
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_001', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_001';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_002
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_002
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_BACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_002', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_002';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_BACK;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_003
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_003
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_003', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_003';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_004
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_004
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FOLD_INNER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_004', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_004';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_005
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_005
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_005', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_005';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_006
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_006
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_006', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_006';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_007
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_007
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_007', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_007';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_008
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_008
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_008', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_008';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_009
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_009
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_009', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_009';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_010
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_010
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_BUILT_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_010', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_010';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_011
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_011
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_011', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_011';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_012
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_012
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_012', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_012';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_013
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_013
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType UNKNOWN_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_013', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_013';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.UNKNOWN_TYPE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_014
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_014
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_014', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_014';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.PHONE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_015
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_015
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_015', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_015';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.TABLET;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_016
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_016
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_016', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_016';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if ("" == mCameraDeviceArray[i].cameraId) {
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              expect().assertFail();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_017
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_017
     * @tc.desc   getSupportedOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_017', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_017';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if ("" == mCameraDeviceArray[i].hostDeviceName) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_018
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_018
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_018', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_018';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.getSupportedOutputCapability(null, camera.SceneMode.NORMAL_PHOTO);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_019
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_019
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_019', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_019';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.getSupportedOutputCapability(undefined, camera.SceneMode.NORMAL_PHOTO);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_020
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_020
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_020', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_020';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_021
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_021
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_BACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_021', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_021';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_BACK;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_022
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_022
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_022', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_022';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_023
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_023
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FOLD_INNER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_023', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_023';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (position == mCameraDeviceArray[i].cameraPosition) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_024
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_024
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_024', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_024';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_025
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_025
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_025', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_025';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_026
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_026
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_026', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_026';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_027
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_027
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_027', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_027';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_028
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_028
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_028', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_028';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (type == mCameraDeviceArray[i].cameraType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_029
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_029
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_BUILT_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_029', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_029';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_030
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_030
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_030', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_030';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_031
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_031
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_031', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_031';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (connectType == mCameraDeviceArray[i].connectionType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_032
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_032
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType UNKNOWN_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_032', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_032';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.UNKNOWN_TYPE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_033
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_033
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_033', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_033';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.PHONE;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_034
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_034
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_034', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_034';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          let hostType = camera.HostDeviceType.TABLET;
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if (hostType == mCameraDeviceArray[i].hostDeviceType) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_035
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_035
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_035', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_035';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if ("" == mCameraDeviceArray[i].cameraId) {
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              expect().assertFail();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_036
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_036
     * @tc.desc   getSupportedOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_036', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_036';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            if ("" == mCameraDeviceArray[i].hostDeviceName) {
              let cameraOutputCapability =
                mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_VIDEO);
              console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
              expect(cameraOutputCapability != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }}
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_037
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_037
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_037', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_037';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.getSupportedOutputCapability(null, camera.SceneMode.NORMAL_VIDEO);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_038
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_038
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_038', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_038';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.getSupportedOutputCapability(undefined, camera.SceneMode.NORMAL_VIDEO);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_041
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_041
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability photoProfiles format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_041', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_041';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
            expect(cameraOutputCapability.photoProfiles[0].format != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_042
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_042
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability photoProfiles size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_042', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_042';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
            expect(cameraOutputCapability.photoProfiles[0].size != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_043
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_043
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles frameRateRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_043', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_043';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].frameRateRange != null).assertTrue();
            console.info(TAG, testName, "done ok:");
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_044
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_044
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_044', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_044';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_045
     * @tc.number SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_045
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_045', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_GET_SUPPORTED_OUTPUT_CAPABILITY_045';
        try {
          console.info(TAG,testName,"start :");
          if(mCameraDeviceArray.length > 0) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:",cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].size != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_001
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_001
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_001', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_001';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            mCameraManager.createPreviewOutput(undefined, indexSurfaceId);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_002
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_002
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_002', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_002';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            mCameraManager.createPreviewOutput(null, indexSurfaceId);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_004
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_004
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_004', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_004';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let cameraOutputCap =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
            let previewProfile = cameraOutputCap.previewProfiles[0];
            mCameraManager.createPreviewOutput(previewProfile, null);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_005
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_005
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_005', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_005';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let cameraOutputCap =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
            let previewProfile = cameraOutputCap.previewProfiles[0];
            mCameraManager.createPreviewOutput(previewProfile, undefined);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_006
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_006
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_006', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_006';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let profile: camera.Profile = {
              format: camera.CameraFormat.CAMERA_FORMAT_RGBA_8888,
              size: { height: 720, width: 1280 }
            }
            mPreviewOutput = mCameraManager.createPreviewOutput(profile, indexSurfaceId);
            let newProfile = mPreviewOutput.getActiveProfile();
            expect(newProfile.format).assertEqual(profile.format);
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_007
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_007
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_007', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_007';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let profile: camera.Profile = {
              format: camera.CameraFormat.CAMERA_FORMAT_JPEG,
              size: { height: 720, width: 1280 }
            }
            mPreviewOutput = mCameraManager.createPreviewOutput(profile, indexSurfaceId);
            let newProfile = mPreviewOutput.getActiveProfile();
            expect(newProfile.format).assertEqual(profile.format);
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_008
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_008
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_008', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_008';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let profile: camera.Profile = {
              format: camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010,
              size: { height: 720, width: 1280 }
            }
            mPreviewOutput = mCameraManager.createPreviewOutput(profile, indexSurfaceId);
            let newProfile = mPreviewOutput.getActiveProfile();
            expect(newProfile.format).assertEqual(profile.format);
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_009
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_009
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_009', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_009';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let profile: camera.Profile = {
              format: camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010,
              size: { height: 720, width: 1280 }
            }
            mPreviewOutput = mCameraManager.createPreviewOutput(profile, indexSurfaceId);
            let newProfile = mPreviewOutput.getActiveProfile();
            expect(newProfile.format).assertEqual(profile.format);
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_010
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_010
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_HEIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_010', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_010';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            await getVideoSurfaceId();
            let profile: camera.Profile = {
              format: camera.CameraFormat.CAMERA_FORMAT_HEIC,
              size: { height: 720, width: 1280 }
            }
            mPreviewOutput = mCameraManager.createPreviewOutput(profile, indexSurfaceId);
            let newProfile = mPreviewOutput.getActiveProfile();
            expect(newProfile.format).assertEqual(profile.format);
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_011
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_011
     * @tc.desc   createPreviewOutput surfaceId ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_011', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_011';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mPreviewOutput = mCameraManager.createPreviewOutput("");
            console.info(TAG, testName, "end :");
            expect(mPreviewOutput).assertUndefined()
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_012
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_012
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_012', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_012';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.createPreviewOutput(undefined);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_013
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_013
     * @tc.desc   createPreviewOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_013', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_013';
        try {
          console.info(TAG, testName, "start :");
          if(mCameraDeviceArray.length > 0) {
            mCameraManager.createPreviewOutput(null);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
  })
}
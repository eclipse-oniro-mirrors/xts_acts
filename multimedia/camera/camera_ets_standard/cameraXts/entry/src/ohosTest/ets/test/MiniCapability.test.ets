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
import { camera } from '@kit.CameraKit';
import { media } from '@kit.MediaKit';
import image from '@ohos.multimedia.image';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { common } from '@kit.AbilityKit';
import { cameraErrorCode, driveFn, getPermission, isEmpty, resourceName, getFd, sleep } from './common';
import { indexSurfaceId } from '../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import fs from '@ohos.file.fs';
import { abilityDelegatorRegistry } from "@kit.TestKit";

const TAG = "CameraXts.MiniCapabilityTest";

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mCameraFullOutputCap: camera.CameraOutputCapability;
let mFullCameraOutputCap: camera.CameraOutputCapability;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mPhotoSession: camera.PhotoSession;
let mVideoSurfaceId: string;
let mVideoProfile: camera.VideoProfile;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let isSupportHdrbyVPE: Boolean;
let isSupportHdrbyScreen: Boolean;
let isSupportHEICEncode: boolean;

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
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i = 0; i < mCameraDeviceArray.length; i++) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
    if (isEmpty(mSupportedModes)) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  }
  return true;
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
}

function getFullOutputCapability() {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap));
}

let videoProfile: media.AVRecorderProfile = {
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
}

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};

let waitForTrigger = async (check: () => boolean, timeoutMs: number = 15000, intervalMs: number = 100): Promise<boolean> => {
  let elapsed: number = 0;
  while (elapsed < timeoutMs) {
    if (check()) {
      return true;
    }
    await sleep(intervalMs);
    elapsed += intervalMs;
  }
  return check();
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

export default function MiniCapabilityTest() {
  describe('MiniCapabilityTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      getOutputCapability();
      getFullOutputCapability();
      await getPermission();
      await driveFn();
      getCameraInput();
      await getVideoSurfaceId();
      isSupportHdrbyScreen =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      console.info('isSupportHdrbyScreen is ' + isSupportHdrbyScreen);
      isSupportHdrbyVPE = await fs.accessSync("/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so");
      console.info('isSupportHdrbyVPE is ' + isSupportHdrbyVPE);
      isSupportHEICEncode = image.createImagePacker().supportedFormats.includes("image/heic");
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0100
     * @tc.desc   must contain SceneMode.NORMAL_PHOTO and SceneMode.NORMAL_VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
            expect(mSupportedModes.includes(camera.SceneMode.NORMAL_PHOTO)).assertTrue();
            expect(mSupportedModes.includes(camera.SceneMode.NORMAL_VIDEO)).assertTrue();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0200
     * @tc.desc   HDR device, photoSession must support DISPLAY_P3 or BT2020_HLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0200';
      if (!isSupportHdrbyVPE) {
        console.info(testName + 'VPE does not support HDR');
        done();
        return;
      }
      if (!isSupportHdrbyScreen) {
        console.info(testName + 'Screen does not support HDR');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          // 检查NORMAL_PHOTO模式下PhotoSession接口ColorManagement->getSupportedColorSpaces返回的颜色空间DISPLAY_P3或BT2020_HLG
          // 获取第一个相机设备
          const cameraDevice = mCameraDeviceArray[0];
          // 获取相机视频能力
          const cameraPhotoOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          // 创建会话
          const session: camera.PhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入输出
          const cameraInput = mCameraManager.createCameraInput(cameraDevice);
          await cameraInput.open();
          await session.addInput(cameraInput);
          const previewOutput = mCameraManager.createPreviewOutput(cameraPhotoOutputCap.previewProfiles[0], indexSurfaceId);
          const photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          // 添加输出流到会话
          await session.addOutput(previewOutput);
          await session.addOutput(photoOutput);
          await session.commitConfig();
          await session.start();
          const supportedColorSpacesPhoto: Array<colorSpaceManager.ColorSpace> = session.getSupportedColorSpaces();
          console.info(TAG, testName + ' supportedColorSpacesPhoto is ' + JSON.stringify(supportedColorSpacesPhoto));
          let foundColorSpacePhoto = false;
          for (let colorSpace of supportedColorSpacesPhoto) {
            if (colorSpace === colorSpaceManager.ColorSpace.DISPLAY_P3 || colorSpace === colorSpaceManager.ColorSpace.BT2020_HLG) {
              foundColorSpacePhoto = true;
              break;
            }
          }
          console.info(TAG, testName + ' foundColorSpacePhoto is ' + foundColorSpacePhoto);
          expect(foundColorSpacePhoto).assertTrue();
          await previewOutput.release();
          await photoOutput.release();
          await session.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0300
     * @tc.desc   HDR device, videoSession must support BT2020_HLG or BT2020_HLG_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0300';
      if (!isSupportHdrbyVPE) {
        console.info(testName + 'VPE does not support HDR');
        done();
        return;
      }
      if (!isSupportHdrbyScreen) {
        console.info(testName + 'Screen does not support HDR');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          // 检查NORMAL_VIDEO模式下VideoSession接口ColorManagement->getSupportedColorSpaces返回的颜色空间BT2020_HLG或BT2020_HLG_LIMIT
          // 获取第一个相机设备
          const cameraDevice = mCameraDeviceArray[0];
          // 获取相机视频能力
          const cameraVideoOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_VIDEO);
          // 创建会话
          const session: camera.VideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入输出
          const cameraInput = mCameraManager.createCameraInput(cameraDevice);
          await cameraInput.open();
          await session.addInput(cameraInput);
          const previewOutput = mCameraManager.createPreviewOutput(cameraVideoOutputCap.previewProfiles[0], indexSurfaceId);
          const videoOutput = mCameraManager.createVideoOutput(cameraVideoOutputCap.videoProfiles[0], mVideoSurfaceId);
          // 添加输出流到会话
          await session.addOutput(previewOutput);
          await session.addOutput(videoOutput);
          await session.commitConfig();
          await session.start();
          const supportedColorSpacesVideo: Array<colorSpaceManager.ColorSpace> = session.getSupportedColorSpaces();
          console.info(TAG, testName + ' supportedColorSpacesVideo is ' + JSON.stringify(supportedColorSpacesVideo));
          let foundColorSpaceVideo = false;
          for (let colorSpace of supportedColorSpacesVideo) {
            if (colorSpace === colorSpaceManager.ColorSpace.BT2020_HLG || colorSpace === colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT) {
              foundColorSpaceVideo = true;
              break;
            } else if (colorSpace === colorSpaceManager.ColorSpace.BT709_LIMIT) {
              // PC support BT709_LIMIT
              foundColorSpaceVideo = true;
              break;
            }
          }
          console.info(TAG, testName + ' foundColorSpaceVideo is ' + foundColorSpaceVideo);
          expect(foundColorSpaceVideo).assertTrue();
          await previewOutput.release();
          await videoOutput.release();
          await session.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0400
     * @tc.desc   check support session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0400';
      console.info(TAG, testName + ' begin.');
      let session: ESObject;
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            // 必须支持PhotoSession
            session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
            console.info(testName + 'photo session is ' + isEmpty(session));
            expect(isEmpty(session)).assertFalse();
            await session.release();
            // 必须支持VideoSession
            session = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
            console.info(testName + 'video session is ' + isEmpty(session));
            expect(isEmpty(session)).assertFalse();
            await session.release();
            // Phone/tablet形态必须支持SecureSession
            if (mSupportedModes.includes(camera.SceneMode.SECURE_PHOTO)) {
              session = mCameraManager.createSession(camera.SceneMode.SECURE_PHOTO);
              console.info(testName + 'secure session is ' + isEmpty(session));
              expect(isEmpty(session)).assertFalse();
              await session.release();
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0500
     * @tc.desc   photoSession must support 4 streams: 2 previews, 1 photo, 1 metadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0500';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 获取第一个相机设备
          const cameraDevice = mCameraDeviceArray[0];
          mSupportedModes = mCameraManager.getSupportedSceneModes(cameraDevice);
          // 获取相机视频能力
          mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[0]);
          // 创建会话
          const session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          expect(isEmpty(session)).assertFalse();
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入
          mCameraInput = mCameraManager.createCameraInput(cameraDevice);
          expect(isEmpty(mCameraInput)).assertFalse();
          await mCameraInput.open();
          await session.addInput(mCameraInput);
          // 创建两个预览输出（使用相同的Surface ID）
          const previewOutput1 = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          const previewOutput2 = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          // 创建拍照输出
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          // 创建Metadata输出
          const metadataObjectOutput = mCameraManager.createMetadataOutput(mCameraOutputCap.supportedMetadataObjectTypes);
          // 添加输出流到会话
          await session.addOutput(previewOutput1);
          await session.addOutput(previewOutput2);
          await session.addOutput(mPhotoOutput);
          await session.addOutput(metadataObjectOutput);
          // 提交配置并验证
          await session.commitConfig();
          console.info(TAG, testName + ' successfully configured 4 streams: 2 previews, 1 photo, 1 metadata');
          // 清理资源
          await previewOutput1.release();
          await previewOutput2.release();
          await mPhotoOutput.release();
          await metadataObjectOutput.release();
          await session.release();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0600
     * @tc.desc   videoSession must support 4 streams: 2 previews, 1 video, 1 metadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0600';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 获取第一个相机设备
          const cameraDevice = mCameraDeviceArray[0];
          mSupportedModes = mCameraManager.getSupportedSceneModes(cameraDevice);
          // 获取相机视频能力
          mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[1]);
          // 创建视频会话
          const session = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
          expect(isEmpty(session)).assertFalse();
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入
          mCameraInput = mCameraManager.createCameraInput(cameraDevice);
          expect(isEmpty(mCameraInput)).assertFalse();
          await mCameraInput.open();
          await session.addInput(mCameraInput);
          // 创建两个预览输出（使用相同的Surface ID）
          const previewOutput1 = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          const previewOutput2 = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          // 创建视频输出
          const videoOutput = mCameraManager.createVideoOutput(mCameraOutputCap.videoProfiles[0], mVideoSurfaceId);
          // 创建Metadata输出
          const metadataObjectOutput = mCameraManager.createMetadataOutput(mCameraOutputCap.supportedMetadataObjectTypes);
          // 添加输出流到会话
          await session.addOutput(previewOutput1);
          await session.addOutput(previewOutput2);
          await session.addOutput(videoOutput);
          await session.addOutput(metadataObjectOutput);
          // 提交配置并验证
          await session.commitConfig();
          console.info(TAG, testName + ' successfully configured 4 streams: 2 previews, 1 video, 1 metadata');
          // 清理资源
          await previewOutput1.release();
          await previewOutput2.release();
          await videoOutput.release();
          await metadataObjectOutput.release();
          await session.release();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0700
     * @tc.desc   check support CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0700';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            const cameraDevice = mCameraDeviceArray[i];
            console.info(TAG, `${testName} Checking camera device ${i}`);
            // 获取该设备支持的所有场景模式
            mSupportedModes = mCameraManager.getSupportedSceneModes(cameraDevice);
            // 检查普通输出能力
            mCameraOutputCap = mCameraManager.getSupportedOutputCapability(cameraDevice, mSupportedModes[0]);
            // 检查photoProfiles中是否包含CAMERA_FORMAT_JPEG
            let foundFormat_1 = false;
            for (let i = 0; i < mCameraOutputCap.photoProfiles.length; i++) {
              console.info(TAG, testName, ' mCameraOutputCap.photoProfiles.format is ' + JSON.stringify(mCameraOutputCap.photoProfiles[i].format));
              if (mCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_JPEG) {
                  foundFormat_1 = true;
                  break;
              }
            }
            console.info(TAG, testName + ' foundFormat_1 is ' + foundFormat_1);
            expect(foundFormat_1).assertTrue();
            // 检查全输出能力
            mCameraFullOutputCap = mCameraManager.getSupportedFullOutputCapability(cameraDevice, mSupportedModes[0]);
            // 检查photoProfiles中是否包含CAMERA_FORMAT_JPEG
            let foundFormat_2 = false;
            for (let i = 0; i < mCameraFullOutputCap.photoProfiles.length; i++) {
              console.info(TAG, testName, ' mCameraFullOutputCap.photoProfiles.format is ' + JSON.stringify(mCameraFullOutputCap.photoProfiles[i].format));
              if (mCameraFullOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_JPEG) {
                foundFormat_2 = true;
                  break;
              }
            }
            console.info(TAG, testName + ' foundFormat_2 is ' + foundFormat_2);
            expect(foundFormat_2).assertTrue();
          }
        }
        console.info(TAG, testName + ' successfully verified JPEG support for all devices and modes');
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0800
     * @tc.desc   check fullOutputCapability support CAMERA_FORMAT_YUV_420_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0800';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            console.info(TAG, `${testName} Checking camera device ${i}`);
            // 获取该设备支持的所有场景模式
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            // 检查全输出能力
            mCameraFullOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[i], mSupportedModes[0]);
            // 检查photoProfiles中是否包含YCbCr_420_SP(NV21)
            let foundFormat = false;
            for (let i = 0; i < mCameraFullOutputCap.photoProfiles.length; i++) {
              console.info(TAG, testName, ' mCameraFullOutputCap.photoProfiles.format is ' + JSON.stringify(mCameraFullOutputCap.photoProfiles[i].format));
              if (mCameraFullOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
                  foundFormat = true;
                  break;
              }
            }
            console.info(TAG, testName + ' foundFormat is ' + foundFormat);
            expect(foundFormat).assertTrue();
          }
        }
        console.info(TAG, testName + ' successfully verified YUV_420_SP support for all devices and modes');
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0900
     * @tc.desc   check support CAMERA_FORMAT_YUV_420_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_0900';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 获取第一个相机设备
          mFullCameraOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          // 创建拍照会话
          const session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          expect(isEmpty(session)).assertFalse();
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入
          mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(mCameraInput)).assertFalse();
          await mCameraInput.open();
          await session.addInput(mCameraInput);
          // 创建预览输出
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await session.addOutput(mPreviewOutput);
          // 测试CAMERA_FORMAT_YUV_420_SP格式
          // 创建YUV格式的拍照输出
          let foundYuvProfile = false;
          let yuvTargetProfile = mFullCameraOutputCap.photoProfiles[0];
          for (let i = 0; i < mFullCameraOutputCap.photoProfiles.length; i++) {
            if (mFullCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
              yuvTargetProfile = mFullCameraOutputCap.photoProfiles[i];
              foundYuvProfile = true;
              break;
            }
          }
          console.info(TAG, testName + 'foundYuvProfile is: ' + JSON.stringify(foundYuvProfile));
          expect(foundYuvProfile).assertTrue();
          console.info(TAG, testName + 'yuv test, photo profile: ' + JSON.stringify(yuvTargetProfile));
          // 创建YUV格式的拍照输出
          const yuvPhotoOutput = mCameraManager.createPhotoOutput(yuvTargetProfile);
          await session.addOutput(yuvPhotoOutput);
          // 提交配置并验证
          await session.commitConfig();
          await session.start();
          let triggered: boolean = false;
          let receivedAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
          yuvPhotoOutput.on('photoAssetAvailable', (err: BusinessError, asset: photoAccessHelper.PhotoAsset) => {
            console.info(TAG + " start triggered");
            triggered = true;
            receivedAsset = asset;
          });
          // 捕获YUV格式照片
          await yuvPhotoOutput.capture();
          console.info(TAG, testName + ' YUV_420_SP format capture success');
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + " triggered is " + result);
          expect(result).assertTrue();
          // 获取文件URI
          const fileUri = receivedAsset!.uri;
          // 检查URI是否以.jpg结尾（不区分大小写）（YUV拍照不一定是jpg，暂无手段）
          const isJpg: boolean = fileUri.toLowerCase().endsWith('.jpg');
          expect(isJpg).assertTrue();
          // 清理YUV输出
          await yuvPhotoOutput.release();
          // 清理资源
          await mPreviewOutput.release();
          await session.release();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1000
     * @tc.desc   check support CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1000';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 获取第一个相机设备
          mFullCameraOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          // 创建拍照会话
          const session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          expect(isEmpty(session)).assertFalse();
          // 开始配置会话
          await session.beginConfig();
          // 创建相机输入
          mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(mCameraInput)).assertFalse();
          await mCameraInput.open();
          await session.addInput(mCameraInput);
          // 创建预览输出
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await session.addOutput(mPreviewOutput);
          // 测试CAMERA_FORMAT_YUV_420_SP格式
          // 创建YUV格式的拍照输出
          let foundJpgProfile = false;
          let jpgTargetProfile = mFullCameraOutputCap.photoProfiles[0];
          for (let i = 0; i < mFullCameraOutputCap.photoProfiles.length; i++) {
            if (mFullCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_JPEG) {
              jpgTargetProfile = mFullCameraOutputCap.photoProfiles[i];
              foundJpgProfile = true;
              break;
            }
          }
          console.info(TAG, testName + 'foundJpgProfile is: ' + JSON.stringify(foundJpgProfile));
          expect(foundJpgProfile).assertTrue();
          console.info(TAG, testName + 'jpg test, photo profile: ' + JSON.stringify(jpgTargetProfile));
          // 创建JPG格式的拍照输出
          const jpgPhotoOutput = mCameraManager.createPhotoOutput(jpgTargetProfile);
          await session.addOutput(jpgPhotoOutput);
          // 提交配置并验证
          await session.commitConfig();
          await session.start();
          let triggered: boolean = false;
          let receivedAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
          jpgPhotoOutput.on('photoAssetAvailable', (err: BusinessError, asset: photoAccessHelper.PhotoAsset) => {
            console.info(TAG + " start triggered");
            triggered = true;
            receivedAsset = asset;
          });
          // 捕获JPG格式照片
          await jpgPhotoOutput.capture();
          console.info(TAG, testName + ' JPEG format capture success');
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + " triggered is " + result);
          expect(result).assertTrue();
          // 获取文件URI
          const fileUri = receivedAsset!.uri;
          console.info(TAG, testName + " fileUri is " + fileUri);
          // 检查URI是否以.jpg结尾（不区分大小写）
          const isJpg: boolean = fileUri.toLowerCase().endsWith('.jpg');
          console.info(TAG, testName + " isJpg is " + isJpg);
          expect(isJpg).assertTrue();
          // 清理JPG输出
          await jpgPhotoOutput.release();
          // 清理资源
          await mPreviewOutput.release();
          await session.release();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1100
     * @tc.desc   支持拍摄CAMERA_FORMAT_HEIC格式照片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1100';
      console.info(TAG, testName + ' begin.');
      if (!isSupportHEICEncode) {
        console.info(TAG, testName, 'device does not support HEIC');
        done();
        return
      }
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 遍历所有支持的相机设备
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            console.info(TAG, `${testName} Checking camera device ${i}`);
            mFullCameraOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[i], camera.SceneMode.NORMAL_PHOTO);
            // 获取支持的场景模式
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);     
            // 创建拍照会话
            const session = mCameraManager.createSession(mSupportedModes[0]);
            // 开始配置会话
            await session.beginConfig();
            // 创建相机输入
            const cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(mCameraInput)).assertFalse();
            await cameraInput.open();
            await session.addInput(cameraInput);
            // 创建预览输出
            const previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
            await session.addOutput(previewOutput);
            // 创建HEIC格式的拍照输出
            let foundHeicProfile = false;
            let heicTargetProfile = mFullCameraOutputCap.photoProfiles[0];
            for (let i = 0; i < mFullCameraOutputCap.photoProfiles.length; i++) {
              if (mFullCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_HEIC) {
                heicTargetProfile = mFullCameraOutputCap.photoProfiles[i];
                foundHeicProfile = true;
                break;
              }
            }
            console.info(TAG, testName + 'foundHeicProfile is: ' + JSON.stringify(foundHeicProfile));
            if (!foundHeicProfile) {
              console.info(TAG, testName + 'does not support HEIF, skip');
              await previewOutput.release();
              await session.release();
              done();
              return
            }
            expect(foundHeicProfile).assertTrue();
            console.info(TAG, testName + 'heif test, photo profile: ' + JSON.stringify(heicTargetProfile));
            const heicPhotoOutput = mCameraManager.createPhotoOutput(heicTargetProfile);
            await session.addOutput(heicPhotoOutput);
            // 提交配置
            await session.commitConfig();
            await session.start();
            let triggered: boolean = false;
            let receivedAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
            heicPhotoOutput.on('photoAssetAvailable', (err: BusinessError, asset: photoAccessHelper.PhotoAsset) => {
              console.info(TAG + " start triggered");
              triggered = true;
              receivedAsset = asset;
            });
            // 捕获HEIC照片
            await heicPhotoOutput.capture();
            console.info(TAG, testName + ' heif format capture success');
            let result: boolean = await waitForTrigger((): boolean => triggered);
            console.info(TAG, testName + " triggered is " + result);
            expect(result).assertTrue();
            // 获取文件URI
            const fileUri = receivedAsset!.uri;
            console.info(TAG, testName + " fileUri is " + fileUri);
            // 检查URI是否以.heic结尾（不区分大小写）
            const isHeif: boolean = fileUri.toLowerCase().endsWith('.heic');
            console.info(TAG, testName + " isHeif is " + isHeif);
            expect(isHeif).assertTrue();
            // 释放资源
            await heicPhotoOutput.release();
            await previewOutput.release();
            await session.release();
          }
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1200
     * @tc.desc   support movingPhoto、encoding is AVC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1200';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 遍历所有支持的相机设备
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            console.info(TAG, `${testName} Checking camera device ${i}`);
            // 获取支持的场景模式
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            // 获取相机能力
            mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], mSupportedModes[0]);
            // 创建拍照会话
            const session = mCameraManager.createSession(mSupportedModes[0]);
            // 开始配置会话
            await session.beginConfig();
            // 创建相机输入
            const cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(mCameraInput)).assertFalse();
            await cameraInput.open();
            await session.addInput(cameraInput);
            // 创建预览输出
            const previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
            await session.addOutput(previewOutput);
            // 创建照片输出
            const photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
            await session.addOutput(photoOutput);
            // 提交配置
            await session.commitConfig();
            // 启动会话
            await session.start();
            // 检查是否支持动态照片
            const isMovingPhotoSupported = photoOutput.isMovingPhotoSupported();
            if (!isMovingPhotoSupported) {
              console.error(TAG, testName + ' does not support moving photo');
            } else {
              // 启用动态照片功能
              photoOutput.enableMovingPhoto(true);
              // 设置视频编码类型为AVC
              photoOutput.setMovingPhotoVideoCodecType(camera.VideoCodecType.AVC);
              console.info(TAG, testName + ' set encoding AVC success');
              // 验证编码类型设置
              const currentCodecType: Array<camera.VideoCodecType> = photoOutput.getSupportedMovingPhotoVideoCodecTypes();
              expect(currentCodecType.includes(camera.VideoCodecType.AVC)).assertTrue();
              console.info(TAG, testName + ' check endoding is AVC success');
              // 监听
              let triggered: boolean = false;
              let receivedAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
              photoOutput.on('photoAssetAvailable', (err: BusinessError, asset: photoAccessHelper.PhotoAsset) => {
                console.info(TAG + " start triggered");
                triggered = true;
                receivedAsset = asset;
              });
              // 拍照
              await photoOutput.capture();
              console.info(TAG, testName + ' HEVC encoding capture success');
              let result: boolean = await waitForTrigger((): boolean => triggered);
              console.info(TAG, testName + " triggered is " + result);
              expect(result).assertTrue();
              // 获取文件URI
              const fileUri = receivedAsset!.uri;
              console.info(TAG, testName + " fileUri is " + fileUri);
              // 检查URI是否以.jpg结尾（不区分大小写）
              const isJpg: boolean = fileUri.toLowerCase().endsWith('.jpg');
              console.info(TAG, testName + " isJpg is " + isJpg);
              expect(isJpg).assertTrue();
            }
            // 释放资源
            await photoOutput.release();
            await previewOutput.release();
            await session.release();
            }
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1300
     * @tc.desc   support movingPhoto、encoding is HEVC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MINI_CAPABILITY_1300';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager or cameraDeviceArray is null.');
          expect().assertFail();
        } else {
          // 遍历所有支持的相机设备
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            console.info(TAG, `${testName} Checking camera device ${i}`);
            // 获取支持的场景模式
            mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            // 获取相机能力
            mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], mSupportedModes[0]);
            // 创建拍照会话
            const session = mCameraManager.createSession(mSupportedModes[0]);
            // 开始配置会话
            await session.beginConfig();
            // 创建相机输入
            const cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(mCameraInput)).assertFalse();
            await cameraInput.open();
            await session.addInput(cameraInput);
            // 创建预览输出
            const previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
            await session.addOutput(previewOutput);
            // 创建照片输出
            const photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
            await session.addOutput(photoOutput);
            // 提交配置
            await session.commitConfig();
            // 启动会话
            await session.start();
            // 检查是否支持动态照片
            const isMovingPhotoSupported = photoOutput.isMovingPhotoSupported();
            if (!isMovingPhotoSupported) {
              console.error(TAG, testName + ' does not support moving photo');
            } else {
              // 启用动态照片功能
              photoOutput.enableMovingPhoto(true);
              // 设置视频编码类型为AVC
              photoOutput.setMovingPhotoVideoCodecType(camera.VideoCodecType.HEVC);
              console.info(TAG, testName + ' set encoding HEVC success');
              // 验证编码类型设置
              const currentCodecType: Array<camera.VideoCodecType> = photoOutput.getSupportedMovingPhotoVideoCodecTypes();
              expect(currentCodecType.includes(camera.VideoCodecType.HEVC)).assertTrue();
              console.info(TAG, testName + ' check endoding is HEVC success');
              // 监听
              let triggered: boolean = false;
              let receivedAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
              photoOutput.on('photoAssetAvailable', (err: BusinessError, asset: photoAccessHelper.PhotoAsset) => {
                console.info(TAG + " start triggered");
                triggered = true;
                receivedAsset = asset;
              });
              // 拍照
              await photoOutput.capture();
              console.info(TAG, testName + ' HEVC encoding capture success');
              let result: boolean = await waitForTrigger((): boolean => triggered);
              console.info(TAG, testName + " triggered is " + result);
              expect(result).assertTrue();
              // 获取文件URI
              const fileUri = receivedAsset!.uri;
              console.info(TAG, testName + " fileUri is " + fileUri);
              // 检查URI是否以.jpg结尾（不区分大小写）
              const isJpg: boolean = fileUri.toLowerCase().endsWith('.jpg');
              console.info(TAG, testName + " isJpg is " + isJpg);
              expect(isJpg).assertTrue();
            }
            // 释放资源
            await photoOutput.release();
            await previewOutput.release();
            await session.release();
            }
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

  })
}
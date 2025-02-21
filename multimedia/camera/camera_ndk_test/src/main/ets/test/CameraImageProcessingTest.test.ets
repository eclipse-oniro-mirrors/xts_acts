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

import MediaUtils from './MediaUtils';
import cameraObj from 'libentry.so';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { mContext } from '../testability/pages/Index';

// 创建视频录制的参数
let mediaUtil = MediaUtils.getInstance()

const TAG = "CameraXts CameraImageProcessingTest: ";

let mPreviewSurface: string;
let mVideoSurface: string;
let mVideoReceiver: image.ImageReceiver;
let fdNumber: number;
let receiver: image.ImageReceiver;
let ret: number;

async function getPreviewReceiverSurface() {
  console.log(TAG + 'Entering getPreviewReceiverSurface');
  receiver = image.createImageReceiver(320, 240, 2000, 8);
  console.log(TAG + 'before receiver check');
  if (receiver !== undefined) {
    console.log(TAG + 'Preview receiver is created successfully');
    mPreviewSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Preview received id: ' + JSON.stringify(mPreviewSurface));
  } else {
    console.log(TAG + 'Preview receiver is created failed');
  }
  console.log(TAG + 'Exit getPreviewReceiverSurface');
}

async function getVideoReceiverSurface() {
  console.log(TAG + 'Entering getVideoReceiverSurface');
  mVideoReceiver = image.createImageReceiver(320, 240, 2000, 8);
  try {
    mVideoReceiver.on('imageArrival', () => {
      console.info('imageArrival start');
      mVideoReceiver.readNextImage((err, image) => {
        console.info('readNextImage start');
        if (err || image === undefined) {
          console.error('readNextImage failed');
          return;
        }
        image.getComponent(4, async (errMsg, img) => {
          console.info('getComponent start');
          if (errMsg || img === undefined) {
            console.error('getComponent failed');
            return;
          }
          let buffer = new ArrayBuffer(2048);
          if (img.byteBuffer) {
            buffer = img.byteBuffer;
          } else {
            console.error('img.byteBuffer is undefined');
          }
          // 读取图像
          try {
            console.info('savePicture start');
            let imgFd = `fd://${await mediaUtil.createAndGetUri(mediaLibrary.MediaType.VIDEO, mContext)}`;
            let file = fs.openSync(imgFd, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, buffer);
            fs.closeSync(file.fd);
            console.info('save image End');
          } catch (err) {
            console.error('savePicture err');
          }
        })
      })
    })
  } catch {
    console.error('savePicture err');
  }
  console.info('before ImageReceiver check');
  if (mVideoReceiver !== undefined) {
    console.info('ImageReceiver is ok');
    mVideoSurface = await mVideoReceiver.getReceivingSurfaceId();
    console.info(`ImageReceived id: ${JSON.stringify(mVideoSurface)}`);
  } else {
    console.info('ImageReceiver is not ok');
  }
}

async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
}

async function getCameraManagerInstance() {
  let ret = cameraObj.initCamera(mPreviewSurface);
  if (ret) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  cameraObj.getSupportedCameras();
  return true;
}

async function createInput() {
  console.info(TAG + 'Enter createInput');
  ret = cameraObj.createCameraInput();
  if (ret) {
    console.info(TAG + "createCameraInput FAILED");
    return false;
  }
  await cameraObj.cameraInputOpen();
  console.info(TAG + 'Exit createInput');
  return true;
}

function beginCameraSessionConfig() {
  console.info(TAG + 'Enter beginCameraSessionConfig');
  cameraObj.sessionBegin();
  console.info(TAG + 'Exit beginCameraSessionConfig');
  return true;
}

function createCameraSessionInstance() {
  console.info(TAG + 'Enter createCameraSessionInstance');
  try {
    ret = cameraObj.createSession();
  }
  catch {
    console.info(TAG + 'createCaptureSession FAILED');
  }
  if (ret) {
    console.info(TAG + "createCaptureSession FAILED");
    return false;
  }
  beginCameraSessionConfig();
  console.info(TAG + 'Exit createCameraSessionInstance');
  return true;
}

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface')
  mVideoReceiver.release((err) => {
    console.info(TAG + 'Entering release video receiver')
  })
  await closeFd();
  console.log(TAG + 'Exit releaseVideoReceiveSurface')
}

function createPreviewOutput() {
  console.info(TAG + 'Enter createPreviewOutput');
  ret = cameraObj.createPreviewOutput();

  if (ret) {
    console.info(TAG + "createPreviewOutput FAILED");
  }
  console.info(TAG + "createPreviewOutput: " + ret);
  console.info(TAG + 'Exit createPreviewOutputs');
  return true;
}

function createVideoOutput(mVideoSurface: string) {
  cameraObj.getSupportedOutputCapability();
  ret = cameraObj.createVideoOutput(mVideoSurface);

  if (ret) {
    console.info(TAG + "createVideoOutput FAILED");
  }
  console.info(TAG + "createVideoOutput: " + ret);
  console.info(TAG + 'Exit createVideoOutput');
  return true;
}

async function commitCameraSessionConfig() {
  console.info(TAG + 'Enter commitCameraSessionConfig');
  await cameraObj.sessionCommitConfig();
  console.info(TAG + 'Exit commitCameraSessionConfig');
  return true;
}

export default function CameraImageProcessingTest() {
  describe('CameraImageProcessingTest', () => {
    console.info(TAG + '-------------CameraImageProcessingTest--------------');
    beforeAll(async () => {
      await getPreviewReceiverSurface();
      await getVideoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      cameraObj.getSupportedOutputCapability();
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseVideoReceiveSurface();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPreviewOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.previewOutputStart();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      ;
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW_AND_VIDEO
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW_AND_VIDEO', 0, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW_AND_VIDEO--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPreviewOutput();
      cameraObj.sessionAddPreviewOutput();
      createVideoOutput(mVideoSurface);
      cameraObj.sessionAddVideoOutput();
      await commitCameraSessionConfig();
      await cameraObj.previewOutputStart();
      try {
        await cameraObj.videoOutputStart();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW_AND_VIDEO FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SECONDARY_IMAGE_PROCESSING_PREVIEW_AND_VIDEO ends here");
      cameraObj.videoOutputStop();
      cameraObj.previewOutputStop();
    });
  })
}
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import { camera } from '@kit.CameraKit';
import { image } from "@kit.ImageKit";
import { AppStorage, Context } from "@kit.ArkUI";
import { getPermission, sleep } from "../ImageCommon.test";
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';

const TAG = 'ImageXts.ImageReceiverTestSupp'
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mReceiverSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let testContext: Context = Hypium.get("Context") as Context;
let mImageReceiver: image.ImageReceiver | undefined;

let isEmpty = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmpty01 = (data: Array<camera.CameraDevice> | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmpty02 = (data: camera.CameraInput | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

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
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmpty01(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    if (isEmpty02(mCameraInput)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![0]);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.photoProfiles.find((indexPhotoProfile: camera.Profile) => {
      console.log(TAG, 'find photoProfile: w: ' + indexPhotoProfile.size.width + 'h: ' + indexPhotoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexPhotoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexPhotoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      photoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'photoProfile: w: ' + photoProfile.size.width + 'h: ' + photoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, mReceiverSurfaceId!);
  mPhotoOutput = mCameraManager!.createPhotoOutput(photoProfile);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession!.beginConfig();
  mPhotoSession!.addInput(mCameraInput!);
  await mCameraInput!.open();
  mPhotoSession!.addOutput(previewOutput);
  mPhotoSession!.addOutput(photoOutput);
  await mPhotoSession!.commitConfig();
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

export default function ImageReceiverSupp(): void {
  describe('ImageReceiverSupp', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();

      const size: image.Size = { height: 8192, width: 8192 };
      mImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      mReceiverSurfaceId =await mImageReceiver?.getReceivingSurfaceId();
      console.info(TAG, 'mReceiverSurfaceId:', mReceiverSurfaceId);
    })
    beforeEach(async (): Promise<void> => {
      await sleep(500);
      console.info('beforeEach case');
    })
    afterEach(async (): Promise<void> => {
      console.info('afterEach case');
      await sleep(500)
    })
    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readNextImage_callback_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_readNextImage_callback_static_0100
     * @tc.desc       receiver.readNextImage return valve:img.size,img.clipRect, img.format,img.timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readNextImage_callback_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_readNextImage_callback_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          receiver!.readNextImage((err: BusinessError | null, img: image.Image | undefined) => {
            if (err) {
              console.error(TAG, testName,
                `Failed to read the next Image.code ${err.code},message is ${err.message}`);
            } else {
              console.info(TAG, testName, 'Succeeded in reading the next Image.', img!.clipRect);
              expect(img!.clipRect.size.height > 0 && img!.clipRect.size.width > 0).assertTrue();
              console.info(TAG, testName, 'Succeeded in reading the next Image.', img!.size);
              expect(img!.size.height > 0 && img!.size.width > 0).assertTrue();
              console.info(TAG, testName, 'Succeeded in reading the next Image.', img!.format);
              expect(img!.format > 0).assertTrue();
              console.info(TAG, testName, 'Succeeded in reading the next Image.', img!.timestamp);
              expect(img!.timestamp != undefined).assertTrue();
            }
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
        }
      })
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readNextImage_callback_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_readNextImage_callback_static_0200
     * @tc.desc       receiver.readNextImage return valve:img.clipRect.x,img.clipRect.y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readNextImage_callback_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_readNextImage_callback_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          receiver!.readNextImage((err: BusinessError | null, img: image.Image | undefined) => {
            if (err) {
              console.error(TAG, testName,
                `Failed to read the next Image.code ${err.code},message is ${err.message}`);
            } else {
              console.info(TAG, testName, 'Succeeded in reading the next Image.', JSON.stringify(img!.clipRect));
              expect(img!.clipRect.x).assertEqual(0);
              expect(img!.clipRect.y).assertEqual(0);
            }
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
        }
      })
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readNextImage_promise_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_readNextImage_promise_static_0300
     * @tc.desc       receiver.readNextImage return valve:img.format,img.clipRect,img.size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readNextImage_promise_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_readNextImage_promise_static_0300';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        receiver!.onImageArrival(() => {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.format);
            expect(img.format > 0).assertTrue();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.size);
            expect(img.size.height > 0 && img.size.width > 0).assertTrue();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.clipRect);
            expect(img.clipRect.size.height > 0 && img.clipRect.size.width > 0).assertTrue();
          })
        })
      } catch (error) {
        console.info(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readNextImage_promise_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_readNextImage_promise_static_0400
     * @tc.desc       receiver.readNextImage return valve:img.clipRect.x,img.clipRect.y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readNextImage_promise_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_readNextImage_promise_static_0400';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        receiver!.onImageArrival(() => {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', JSON.stringify(img.clipRect));
            expect(img.clipRect.x).assertEqual(0);
            expect(img.clipRect.y).assertEqual(0);
          })
        })
      } catch (error) {
        console.info(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readLatestImage_promise_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_readLatestImage_promise_static_0100
     * @tc.desc       receiver.readLatestImage return Value: img.size,clipRect.x & clipRect.y,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readLatestImage_promise_static_0100', Level.LEVEL0, async (done: () => void): Promise<void>  => {
      const testName = 'SUB_MEDIA_IMAGE_readLatestImage_promise_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readLatestImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.size);
            expect(img.size.height > 0 && img.size.width > 0).assertTrue();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.clipRect.x);
            expect(img.clipRect.x).assertEqual(0);
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.clipRect.y);
            expect(img.clipRect.y).assertEqual(0);
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.format);
            expect(img.format > 0).assertTrue();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.timestamp);
            expect(img.timestamp >= 0).assertTrue();
          })
        } catch (err) {
          console.info(TAG, testName, err.message, err.code);
          expect().assertFail();
        }
      })
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_readLatestImage_promise_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_readLatestImage_promise_static_0200
     * @tc.desc       receiver.readLatestImage return Value: img.size,clipRect.x & clipRect.y,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readLatestImage_promise_static_0200', Level.LEVEL0, async (done: () => void): Promise<void>  => {
      const testName = 'SUB_MEDIA_IMAGE_readLatestImage_promise_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          receiver!.readLatestImage((err: BusinessError | null, img: image.Image | undefined) => {
            if (err) {
              console.error(TAG, testName,
                `Failed to read the latest Image.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img!.size);
              expect(img!.size.height > 0 && img!.size.width > 0).assertTrue();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img!.clipRect.x);
              expect(img!.clipRect.x).assertEqual(0);
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img!.clipRect.y);
              expect(img!.clipRect.y).assertEqual(0);
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img!.format);
              expect(img!.format > 0).assertTrue();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img!.timestamp);
              expect(img!.timestamp >= 0).assertTrue();
            }
          })
        } catch (err) {
          console.info(TAG, testName, err.message, err.code);
          expect().assertFail();
        }
      })
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoSession!.start();
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.desc       image.createImageReceiver return Value: capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0100', Level.LEVEL0, async (done: () => void)=> {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0100';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'Succeed', receiver?.capacity);
        expect(receiver?.capacity).assertEqual(8);
      } catch (err) {
        console.info(TAG, testName, err.message, err.code);
        expect().assertFail();
      }
      done();
    })
  })
}
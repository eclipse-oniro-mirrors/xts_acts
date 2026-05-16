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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from "../../../../../hypium";
import { BusinessError } from '@ohos.base';
import { camera } from '@kit.CameraKit';
import { image } from "@kit.ImageKit";
import { AppStorage, Context } from "@kit.ArkUI";
import { getPermission, sleep } from "../../ImageCommon.test";


const TAG = 'ImageXts.GetComponentTestSupp'
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mReceiverSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let testContext: Context = Hypium.get("Context") as Context;
let counter: number = 0;
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

export default function ImageGetComponentSupp(): void {
  describe('ImageGetComponentSupp', (): void => {
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0100
     * @tc.desc       Image.getComponent,ComponentType ComponentType.JPEG
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            img.getComponent(image.ComponentType.JPEG, (err: BusinessError | null, component) => {
              if (err) {
                console.error(TAG, testName, `Failed to get the component.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in getting component.', component!.componentType);
                expect(component!.componentType).assertEqual(4);
              }
            })
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0200
     * @tc.desc       Image.getComponent,ComponentType.YUV_Y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            img.getComponent(image.ComponentType.YUV_Y,
              (err: BusinessError | null, component: image.Component | undefined) => {
                if (err) {
                  console.error(TAG, testName,
                    `Failed to get the component.code ${err.code},message is ${err.message}`);
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component!.componentType);
                  expect().assertFail();
                }
              })
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0300
     * @tc.desc       Image.getComponent,ComponentType ComponentType.YUV_U
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0300';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);

            img.getComponent(image.ComponentType.YUV_U,
              (err: BusinessError | null, component: image.Component | undefined) => {
                if (err) {
                  console.error(TAG, testName,
                    `Failed to get the component.code ${err.code},message is ${err.message}`);
                  expect().assertFail();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component!.componentType);
                  expect().assertFail();
                }
              })
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0400
     * @tc.desc       Image.getComponent,ComponentType ComponentType.YUV_V
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_AsyncCallback_static_0400';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            img.getComponent(image.ComponentType.YUV_V,
              (err: BusinessError | null, component: image.Component | undefined) => {
                if (err) {
                  console.error(TAG, testName,
                    `Failed to get the component.code ${err.code},message is ${err.message}`);
                  expect().assertFail();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component!.componentType);
                  expect().assertFail();
                }
              })
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.desc       Image.release
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_release_callback_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_release_callback_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            img.release((err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to release the image instance.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in releasing the image instance.', img);
                expect(img).assertTrue();
              }
            })
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
     * @tc.number     SUB_MEDIA_IMAGE_release_callback_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_release_callback_static_0200
     * @tc.desc       Image.release
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_release_callback_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_release_callback_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then(async (img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            let Image = await img.release();
            console.info(TAG, testName, 'Succeeded in releasing the image instance.', Image);
            expect(img).assertTrue();
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_Promise_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_Promise_static_0100
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.JPEG
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_Promise_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_Promise_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then(async (img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            let component = await img.getComponent(image.ComponentType.JPEG);
            console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
            expect(component.componentType).assertEqual(image.ComponentType.JPEG);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_Promise_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_Promise_static_0200
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_Y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_Promise_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_Promise_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then(async (img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            let component = await img.getComponent(image.ComponentType.YUV_Y);
            console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
            expect().assertFail();
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_Promise_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_Promise_static_0300
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_U
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_Promise_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_Promise_static_0300';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then(async (img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            let component = await img.getComponent(image.ComponentType.YUV_U);
            console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
            expect().assertFail();
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_Promise_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_Promise_static_0400
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_V
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_Promise_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_Promise_static_0400';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then(async (img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            let component = await img.getComponent(image.ComponentType.YUV_V);
            console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
            expect().assertFail();
          })
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(Number(error.code)).assertEqual(1);
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
     * @tc.number     SUB_MEDIA_IMAGE_getComponent_Promise_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_getComponent_Promise_static_0500
     * @tc.desc       Image.getComponent,return valve:img.timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getComponent_Promise_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_Promise_static_0500';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.timestamp);
            expect(img.timestamp != undefined).assertTrue();
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
     * @tc.number     SUB_MEDIA_IMAGE_readNextImage_Promise_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_readNextImage_Promise_static_0100
     * @tc.desc       Image.getComponent,ComponentType,cover timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_readNextImage_Promise_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_readNextImage_Promise_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver!.onImageArrival(() => {
        try {
          console.info(TAG, testName, ' receiver.on begin');
          receiver!.readNextImage().then((img: image.Image) => {
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.timestamp);
            expect(img.timestamp >= 0).assertTrue();
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
     * @tc.number     SUB_MEDIA_IMAGE_getBufferData_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_getBufferData_static_0100
     * @tc.desc       Image.getBufferData23 cover rowStride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getBufferData_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getBufferData_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        if (isEmpty01(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
          console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
          receiver!.onImageArrival(() => {
            receiver!.readNextImage().then((img: image.Image) => {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              try {
                let bufferData = img.getBufferData();
                console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData?.rowStride);
                expect(bufferData!.rowStride.length > 0).assertTrue();
              } catch (error) {
                console.error(TAG, testName, 'getBufferData', error.message, error.code);
                expect().assertFail();
              }
              done();
            })
          })
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoSession!.start();
          await sleep(2000);
          done();
        }
      } catch (error) {
        console.info(TAG, testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_getBufferData_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_getBufferData_static_0200
     * @tc.desc       Image.getBufferData23 cover pixelStride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getBufferData_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getBufferData_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        if (isEmpty01(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
          console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);

          receiver!.onImageArrival(() => {
            receiver!.readNextImage().then((img: image.Image) => {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              try {
                let bufferData = img.getBufferData();
                console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData?.pixelStride);
                expect(bufferData!.pixelStride.length > 0).assertTrue();
              } catch (error) {
                console.error(TAG, testName, 'getBufferData', error.message, error.code);
                expect().assertFail();
              }
              done();
            })
          })
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoSession!.start();
          await sleep(2000);
          receiver!.offImageArrival();
          done();
        }
      } catch (error) {
        console.info(TAG, testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_getBufferData_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_getBufferData_static_0300
     * @tc.desc       Image.getBufferData23 cover byteBuffer
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_getBufferData_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getBufferData_static_0300';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        if (isEmpty01(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
          console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
          receiver!.onImageArrival(() => {
            receiver!.readNextImage().then((img: image.Image) => {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              try {
                let bufferData = img.getBufferData();
                console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData?.byteBuffer);
                expect(bufferData!.byteBuffer.byteLength > 0).assertTrue();
              } catch (error) {
                console.error(TAG, testName, 'getBufferData', error.message, error.code);
                expect().assertFail();
              }
              done();
            })
          })
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoSession!.start();
          await sleep(2000);
          done();
        }
      } catch (error) {
        console.info(TAG, testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getMetadata_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getMetadata_static_0100
     * @tc.desc   getMetadata image.HdrMetadataKey.HDR_GAINMAP_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getMetadata_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getMetadata_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        if (isEmpty01(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
          console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
          receiver!.onImageArrival(() => {
            counter = 1;
            receiver!.readNextImage().then((img: image.Image) => {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              try {
                console.info(TAG, testName, "get receiver SurfaceId success");
                let value = img.getMetadata(image.HdrMetadataKey.HDR_GAINMAP_METADATA);
                console.info(TAG, testName, 'img.getMetadata succeeded.', value);
                expect(value).assertFail();
              } catch (error) {
                console.error(TAG, testName, 'getMetadata', error.message, error.code);
                expect(Number(error.code)).assertEqual(7600302)
              }
              done();
            })
          })
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoSession!.start();
          await sleep(2000);
          expect(counter).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBufferData_static_0400
     * @tc.number SUB_MEDIA_IMAGE_getBufferData_static_0400
     * @tc.desc   getBufferData  返回值属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBufferData_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_getBufferData_static_0400';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      try {
        if (isEmpty01(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
          console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
          receiver!.onImageArrival(() => {
            counter = 1;
            console.info(TAG, testName, 'counter.', counter);
            receiver!.readNextImage().then((img: image.Image) => {
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              try {
                console.info(TAG, testName, "get receiver SurfaceId success");
                let value = img.getBufferData()
                console.info(TAG, testName, 'img.getBufferData succeeded.', value);
                expect(value?.rowStride).not().assertUndefined()
                expect(value?.pixelStride).not().assertUndefined()
                expect(value?.byteBuffer).not().assertUndefined()
              } catch (error) {
                console.error(TAG, testName, 'getBufferData', error.message, error.code);
                expect().assertFail();
              }
              done();
            })
          })
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoSession!.start();
          await sleep(2000);
          expect(counter).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })
  })
}

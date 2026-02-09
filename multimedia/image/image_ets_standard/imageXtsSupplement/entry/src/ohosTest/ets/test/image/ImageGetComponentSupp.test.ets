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
import { image, sendableImage } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
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
import { media } from '@kit.MediaKit';
import { tag } from '@kit.ConnectivityKit';

const TAG = 'ImageGetComponentTestSupp'
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mReceiverSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let receiver : image.ImageReceiver;
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

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
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
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, mReceiverSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
}

async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      videoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'videoProfile: w: ' + videoProfile.size.width + 'h: ' + videoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + videoProfile,'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(videoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput,'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
}

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

async function ImageGetComponent(done: Function, testName: string, callback: (receiver:image.ImageReceiver) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
      console.info(TAG,testName,"get receiver SurfaceId success");
      callback(receiver);
      await releasePhotoSession();
      done();
    }
  } catch (error) {
    console.info(TAG ,testName, error.message, error.code);
    await releasePhotoSession();
    done();
  }
}

async function sendableGetComponent(done: Function, testName: string, callback: (receiver:sendableImage.ImageReceiver) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
      console.info(TAG,testName,"get receiver SurfaceId success");
      callback(receiver);
      await releasePhotoSession();
      done();
    }
  } catch (error) {
    console.info(TAG ,testName, error.message, error.code);
    await releasePhotoSession();
    done();
  }
}
export default function ImageGetComponentSupp() {
  describe('ImageGetComponentSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty','')
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
      await getVideoSurfaceId();
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('empty')
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_001
     * @tc.name       image_getComponent_AsyncCallback_001
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_001';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          console.info(TAG, testName, ' receiver.on begin');
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          img.getComponent(image.ComponentType.JPEG,(err: BusinessError, component: image.Component) => {
            if (err) {
              console.error(TAG, testName,`Failed to get the component.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in getting component.');
            }
          })
          await releasePhotoSession();
          console.info(TAG,testName,"releasePhotoSession success");
          done();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })

  /**
     * @tc.number     image_getComponent_AsyncCallback_002
     * @tc.name       image_getComponent_AsyncCallback_002
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_002';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          img.getComponent(image.ComponentType.YUV_Y, (err: BusinessError, component: image.Component) => {
            if (err) {
              console.error(TAG, testName,`Failed to get the component.code ${err.code},message is ${err.message}`);
            } else {
              console.info(TAG, testName,'Succeeded in getting component.');
              expect().assertFail();
            }
          })
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_getComponent_AsyncCallback_003
     * @tc.name       image_getComponent_AsyncCallback_003
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_003';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          img.getComponent(image.ComponentType.YUV_U, (err: BusinessError, component: image.Component) => {
            if (err) {
              console.error(TAG, testName,`Failed to get the component.code ${err.code},message is ${err.message}`);
            } else {
              console.info(TAG, testName,'Succeeded in getting component.');
              expect().assertFail();
            }
          })
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_getComponent_AsyncCallback_004
     * @tc.name       image_getComponent_AsyncCallback_004
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_004';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          img.getComponent(image.ComponentType.YUV_V, (err: BusinessError, component: image.Component) => {
            if (err) {
              console.error(TAG, testName,`Failed to get the component.code ${err.code},message is ${err.message}`);
            } else {
              console.info(TAG, testName,'Succeeded in getting component.');
              expect().assertFail();
            }
          })
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })

    /**
     * @tc.number     image_getComponent_Promise_001
     * @tc.name       image_getComponent_Promise_001
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_001', Level.LEVEL0, async (done: Function,img : image.Image) => {
      const testName = 'image_getComponent_Promise_001';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.JPEG);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect(component.componentType).assertEqual(image.ComponentType.JPEG);
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })

    /**
     * @tc.number     image_getComponent_Promise_002
     * @tc.name       image_getComponent_Promise_002
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_002', Level.LEVEL0, async (done: Function,img : image.Image) => {
      const testName = 'image_getComponent_Promise_002';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_Y);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })

    /**
     * @tc.number     image_getComponent_Promise_003
     * @tc.name       image_getComponent_Promise_003
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_003', Level.LEVEL0, async (done: Function,img : image.Image) => {
      const testName = 'image_getComponent_Promise_003';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_U);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })

    /**
     * @tc.number     image_getComponent_Promise_004
     * @tc.name       image_getComponent_Promise_004
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_004', Level.LEVEL0, async (done: Function,img : image.Image) => {
      const testName = 'image_getComponent_Promise_004';
      ImageGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_V);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_sendableImage_getComponent_Promise_001
     * @tc.name       image_sendableImage_getComponent_Promise_001
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_sendableImage_getComponent_Promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_sendableImage_getComponent_Promise_001';
      sendableGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.JPEG);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect(component.componentType).assertEqual(image.ComponentType.JPEG);
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_sendableImage_getComponent_Promise_002
     * @tc.name       image_sendableImage_getComponent_Promise_002
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_sendableImage_getComponent_Promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_sendableImage_getComponent_Promise_002';
      sendableGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_Y);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_sendableImage_getComponent_Promise_003
     * @tc.name       image_sendableImage_getComponent_Promise_003
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_sendableImage_getComponent_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_sendableImage_getComponent_Promise_003';
      sendableGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_U);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
    /**
     * @tc.number     image_sendableImage_getComponent_Promise_004
     * @tc.name       image_sendableImage_getComponent_Promise_004
     * @tc.desc       Image.getComponent,ComponentType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_sendableImage_getComponent_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_sendableImage_getComponent_Promise_004';
      sendableGetComponent(done,testName, async (receiver) => {
        receiver.on('imageArrival', async () => {
          let img = await receiver.readNextImage();
          console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
          let component = await img.getComponent(image.ComponentType.YUV_V);
          console.info(TAG, testName, 'Succeeded in getting component.',component.componentType);
          expect().assertFail();
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.start();
      })
    })
/**
     * @tc.number     image_getMetadata_Error_test_001
     * @tc.name       image_getMetadata_Error_test_001
     * @tc.desc       Image.getMetadata23 error 7600302
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getMetadata_Error_test_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getMetadata_Error_test_001';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          let size: image.Size = {
            height: 8192,
            width: 8
          }
          let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
          mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
          console.info(TAG,testName,"get receiver SurfaceId success",mReceiverSurfaceId);
          receiver.on('imageArrival', async () => {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.',img);
            try {
              let value = img.getMetadata(-1);
              console.info(TAG, testName, 'img.getMetadata succeeded.',value);
              expect().assertFail();
            } catch (error) {
              console.error(TAG ,testName, 'getMetadata',error.message, error.code);
              expect(error.code).assertEqual('7600302');
            }
            done();
          });
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          mPhotoSession.start();
          await sleep(2000);
          done();
        }
      } catch (error) {
        console.info(TAG ,testName, error.message, error.code);
        await releasePhotoSession();
        done();
      }
    })

  })
}


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
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Driver, ON } from '@ohos.UiTest';
import { GlobalThis } from './Constants';

let mContext = getContext(this) as common.Context;
let driver: Driver = Driver.create();

interface PhotoSettings {
  quality: number, // Photo quality
  rotation: number, // Photo direction
  mirror: boolean, // Mirror Enable
  latitude: number, // geographic location
  longitude: number, // geographic location
  altitude: number // geographic location
};

let photoSettings: PhotoSettings = {
  quality: 0,
  rotation: 0,
  mirror: false,
  latitude: 12.9698,
  longitude: 77.7500,
  altitude: 1000
};

const TAG = "CameraXts CameraFunctionTest: ";

// 创建录像输出流
let mPhotoSurface: string;
let fdNumber: number;
let receiver: image.ImageReceiver;

// multi-device
let camera: cameraObj.cameraInfo;

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getPhotoReceiverSurface() {
  console.log(TAG + 'Entering getPhotoReceiverSurface');
  receiver = image.createImageReceiver(640, 480, 4, 8);
  console.log(TAG + 'before receiver check');
  if (receiver !== undefined) {
    console.log(TAG + 'Photo receiver is created successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + 'Photo receiver is created failed');
  }
  console.log(TAG + 'Exit getPhotoReceiverSurface');
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
  let previewSurfaceId = GlobalThis.getInstance().getValue();
  console.info(TAG, 'previewSurfaceId = ' + JSON.stringify(previewSurfaceId));
  let ret = cameraObj.initCamera(previewSurfaceId);
  if (ret) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
  return true;
}

async function createInput() {
  console.info(TAG + 'Enter createInput');
  let ret = cameraObj.createCameraInput();
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
  let ret = cameraObj.createSession();
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
  await closeFd();
  console.log(TAG + 'Exit releaseVideoReceiveSurface')
}

function createPreviewOutput() {
  console.info(TAG + 'Enter createPreviewOutput');
  let ret = cameraObj.createPreviewOutput();

  if (ret) {
    console.info(TAG + "createPreviewOutput FAILED");
  }
  console.info(TAG + "createPreviewOutput: " + ret);
  console.info(TAG + 'Exit createPreviewOutputs');
  return true;
}

function createPhotoOutput() {
  console.info(TAG + 'Enter createPhotoOutput');
  cameraObj.getSupportedOutputCapability();
  let ret = cameraObj.createPhotoOutput(mPhotoSurface);

  if (ret) {
    console.info(TAG + "createPhotoOutput FAILED");
  }
  console.info(TAG + "createPhotoOutput: " + ret);
  console.info(TAG + 'Exit createPhotoOutput');
  return true;
}

async function commitCameraSessionConfig() {
  console.info(TAG + 'Enter commitCameraSessionConfig');
  await cameraObj.sessionCommitConfig();
  console.info(TAG + 'Exit commitCameraSessionConfig');
  return true;
}

async function getPermission() {
  console.info(TAG + 'Exit getPermission');
  abilityAccessCtrl.createAtManager().requestPermissionsFromUser(mContext, [
    'ohos.permission.CAMERA',
    'ohos.permission.MICROPHONE',
    'ohos.permission.READ_MEDIA',
    'ohos.permission.WRITE_MEDIA'
  ]).then(() => {
  })
}

async function driveFn() {
  await driver.delayMs(1000);
  await driver.assertComponentExist(ON.text('允许'));
  let btnStart = await driver.findComponent(ON.text('允许'));
  await btnStart.click();
  let i = 0;
  while (i < 3) {
    btnStart = await driver.findComponent(ON.text('允许'));
    if (btnStart != null) {
      await btnStart.click();
    }
    i++;
  }
}

export default function CameraFunctionTest() {

  describe('CameraFunctionTest', () => {
    console.info(TAG + '-------------CameraFunctionTest--------------');
    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await getPhotoReceiverSurface();
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW--------------");
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
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_001
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_001', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput();
      cameraObj.sessionAddPhotoOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.photoOutputCapture();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO ends here");
      cameraObj.getCameraCallbackCode();
      // done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_002
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_002', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_002--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput();
      cameraObj.sessionAddPhotoOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.takePictureWithSettings(photoSettings);
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PHOTO_002 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPreviewOutput();
      createPhotoOutput();
      cameraObj.sessionAddPhotoOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      await cameraObj.previewOutputStart();
      try {
        await cameraObj.photoOutputCapture();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001 ends here");
      cameraObj.previewOutputStop();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput();
      cameraObj.sessionAddPhotoOutput();
      createPreviewOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      await cameraObj.previewOutputStart();
      try {
        await cameraObj.takePictureWithSettings(photoSettings);
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 ends here");
      cameraObj.previewOutputStop();
    });
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100
      * @tc.name      : CameraInput  open api
      * @tc.desc      : CameraInput  open api
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100--------------");
      if (isEmpty(camera)) {
        console.info(TAG + "Entering createInputs FAILED with NoCamera");
      }
      let ret = cameraObj.createCameraInput();
    
      if (ret != 0) {
        console.info(TAG + "createCameraInput FAILED");
        expect().assertFail();
      }
      await cameraObj.cameraInputOpen();
      await cameraObj.cameraInputOpen();
    });
  })
}
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
import { cameraInfo } from 'libentry.so';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { Camera_FlashMode, GlobalThis, Camera_ImageRotation } from './Constants';

const CAMERA_OK = 0;
const TAG = "CameraXts CameraSessionCameraRotationTest: ";

let mPhotoSurface: string;
let mFdNumber: number;
let mCameraNum: number;
let mIsFlashModeSupportedArray: Array<boolean>;
let mHasFlashArray: Array<boolean>;
let receiver: image.ImageReceiver;
let fdNumber: number;
function isEmpty(data: cameraInfo) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
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

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface');
  await closeFd();

  console.log(TAG + 'Exit releaseVideoReceiveSurface');
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
  let camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  mHasFlashArray = new Array(mCameraNum);
  mIsFlashModeSupportedArray = new Array(mCameraNum);
  console.info('Exit getCameraSupportDevicesArray');

  return true;
}

function createCameraSessionInstance() {
  console.info('Enter createCameraSessionInstance');
  try {
    cameraObj.createSession();
  }
  catch {
    console.info('createCaptureSession FAILED');
    expect().assertFail();
  }
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin FAILED");
    expect().assertFail();
  }

  console.info('Exit createCameraSessionInstance');
  return true;
}

async function releaseCameraSessionInstance() {
  await cameraObj.sessionRelease();
}

async function createInput() {
  console.info('Enter createInput');
  let ret = cameraObj.createCameraInput();

  if (ret != 0) {
    console.info(TAG + "createCameraInput FAILED");
    expect().assertFail();
    return false;
  }

  await cameraObj.cameraInputOpen();
  console.info('Exit createInput');
  return true;
}

async function releaseInput() {
  console.info('Enter releaseInput');
  await cameraObj.cameraInputClose();

  console.info('Exit releaseInput');
  return true;
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  let mPreviewOutput = cameraObj.createPreviewOutput();
  if (mPreviewOutput != 0) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
  console.info('Exit createOutputs');
  return true;
}

async function releaseOutput() {
  console.info('Enter releaseOutput');

  await cameraObj.previewOutputRelease();
  await cameraObj.photoOutputRelease();
  console.info('Exit releaseOutput');
  return true;
}

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  await createInput();
  createOutput();

  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin had been execute, please check your operation");
  }
  let addInput = cameraObj.sessionAddInput();
  if (addInput != 0) {
    console.info(TAG + "addInput FAILED");
  }
  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "addPreviewOutput FAILED");
  }
  let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
  if (addPhotoOutput != 0) {
    console.info(TAG + "addPhotoOutput FAILED");
  }

  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "CommitConfig FAILED");
  }

  console.info(TAG + "Exit startCameraSession");

  return true;
}

async function stopCameraSession() {
  console.info(TAG + "Enter stopCameraSession");
  let ret = cameraObj.sessionStop();
  if (ret != 0) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
  cameraObj.sessionRemovePreviewOutput();
  cameraObj.sessionRemovePhotoOutput();

  await releaseInput();
  await releaseOutput();

  console.info(TAG + "Exit stopCameraSession");

  return true;
}

export default function cameraSessionCameraRotationTest() {
  describe('cameraSessionCameraRotationTest', () => {
    console.info(TAG + '----------cameraSessionCameraRotationTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      console.info(TAG + 'Device type = ' + deviceInfo.deviceType);
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      stopCameraSession();
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001
     * @tc.desc   Check capture session camera photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001--------------");
      let cameraPhotoRotation = cameraObj.sessionGetPhotoRotation(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001 finish");
      if (cameraPhotoRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001 PASSED with cameraPhotoRotation is: " + cameraPhotoRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001 FAILED with cameraPhotoRotation is: " + cameraPhotoRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_001 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001
     * @tc.desc   Check capture session camera photo rotation without deviceDegree get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001--------------");
      let cameraPhotoRotation = cameraObj.sessionGetPhotoRotationWithoutDeviceDegree();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001 finish");
      if (cameraPhotoRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001 PASSED with cameraPhotoRotation is: " + cameraPhotoRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001 FAILED with cameraPhotoRotation is: " + cameraPhotoRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PHOTO_ROTATION_WITHOUT_DEVICEDEGREE_001 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001
     * @tc.desc   Check capture session camera video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001--------------");
      let cameraVideoRotation = cameraObj.sessionGetVideoRotation(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001 finish");
      if (cameraVideoRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001 PASSED with cameraVideoRotation is: " + cameraVideoRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001 FAILED with cameraVideoRotation is: " + cameraVideoRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_001 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001
     * @tc.desc   Check capture session camera video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001--------------");
      let cameraVideoRotation = cameraObj.sessionGetVideoRotationWithoutDeviceDegree();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001 finish");
      if (cameraVideoRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001 PASSED with cameraVideoRotation is: " + cameraVideoRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001 FAILED with cameraVideoRotation is: " + cameraVideoRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_VIDEO_ROTATION_WITHOUT_DEVICEDEGREE_001 ends here");
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001
      * @tc.desc   Check capture session camera preview rotation get success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001--------------");
       let cameraPreviewRotation = cameraObj.sessionGetPreviewRotation(0);
      cameraObj.sessionSetPreviewRotation(cameraPreviewRotation, false);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001 finish");
      if (cameraPreviewRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001 PASSED with cameraPreviewRotation is: " + cameraPreviewRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001 FAILED with cameraPreviewRotation is: " + cameraPreviewRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_001 ends here");
    });

    /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001
      * @tc.desc   Check capture session camera preview rotation without deviceDegree get success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001--------------");
       let cameraPreviewRotation = cameraObj.sessionGetPreviewRotationWithoutDisplayRotation();
      cameraObj.sessionSetPreviewRotation(cameraPreviewRotation, false);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001 finish");
      if (cameraPreviewRotation != null) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001 PASSED with cameraPreviewRotation is: " + cameraPreviewRotation);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001 FAILED with cameraPreviewRotation is: " + cameraPreviewRotation);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_WITHOUT_DISPLAYROTATION_001 ends here");
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_002
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_002
      * @tc.desc   Check capture session camera preview rotation set CAMERA_IMAGE_ROTATION_0 success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_002', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_002--------------");
      let ret = cameraObj.sessionSetPreviewRotation(Camera_ImageRotation.IMAGE_ROTATION_0, false);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_002 ends here");
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_003
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_003
      * @tc.desc   Check capture session camera preview rotation set CAMERA_IMAGE_ROTATION_90 success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_003', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_003--------------");
      let ret = cameraObj.sessionSetPreviewRotation(Camera_ImageRotation.IMAGE_ROTATION_90, false);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_003 ends here");
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_004
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_004
      * @tc.desc   Check capture session camera preview rotation set CAMERA_IMAGE_ROTATION_180 success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_004', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_004--------------");
      let ret = cameraObj.sessionSetPreviewRotation(Camera_ImageRotation.IMAGE_ROTATION_180, false);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_004 ends here");
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_005
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_005
      * @tc.desc   Check capture session camera preview rotation set CAMERA_IMAGE_ROTATION_270 success or not
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_005', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_005--------------");
      let ret = cameraObj.sessionSetPreviewRotation(Camera_ImageRotation.IMAGE_ROTATION_270, false);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_PREVIEW_ROTATION_005 ends here");
    });
  })
}

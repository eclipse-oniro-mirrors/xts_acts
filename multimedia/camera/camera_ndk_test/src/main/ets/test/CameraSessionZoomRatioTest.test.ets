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
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { GlobalThis } from './Constants';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';

const TAG = "CameraXts cameraSessionZoomRatioTest: ";

let mPhotoSurface: string;
let mFileAsset: mediaLibrary.FileAsset;
let mFdNumber: number;
let mCameraNum: number;
let mZoomRatioRangeArray: Array<number>;
let mZoomRatioMaxArray: Array<number>;
let mZoomRatioMinArray: Array<number>;
let receiver: image.ImageReceiver;

function isEmpty(data: cameraObj.zoomRatio) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function closeFd() {
  if (mFileAsset != null) {
    await mFileAsset[0].close(mFdNumber).then(() => {
      console.info('[mediaLibrary] case close fd success');
    }).catch(() => {
      console.info('[mediaLibrary] case close fd failed');
    });
  } else {
    console.info('[mediaLibrary] case fileAsset is null');
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
  console.info('Enter getCameraSupportDevicesArray');

  let cameraInfo = cameraObj.getSupportedCameras();
  if (cameraInfo.cameraId == null) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }

  mZoomRatioRangeArray = new Array(mCameraNum);
  mZoomRatioMaxArray = new Array(mCameraNum);
  mZoomRatioMinArray = new Array(mCameraNum);
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

async function createOutput() {
  console.info(TAG + 'Enter createOutput');

  cameraObj.getSupportedOutputCapability();
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

  console.info(TAG + "Start to sessionAddInput");
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin had been execute, please check your operation");
  }
  let addInput = cameraObj.sessionAddInput();
  if (addInput != 0) {
    console.info(TAG + "addInput FAILED");
    expect().assertFail();
  }
  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "addPreviewOutput FAILED");
    expect().assertFail();
  }
  let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
  if (addPhotoOutput != 0) {
    console.info(TAG + "addPhotoOutput FAILED");
    expect().assertFail();
  }
  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "CommitConfig FAILED");
    expect().assertFail();
  }

  console.info(TAG + "Entering startCameraSession start session begin");
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

  let RemovePreviewOutput = cameraObj.sessionRemovePreviewOutput();
  if (RemovePreviewOutput != 0) {
    console.info(TAG + "RemovePreviewOutput FAILED");
    expect().assertFail();
  }
  let RemovePhotoOutput = cameraObj.sessionRemovePhotoOutput();
  if (RemovePhotoOutput != 0) {
    console.info(TAG + "RemovePhotoOutput FAILED");
    expect().assertFail();
  }

  await releaseInput();
  await releaseOutput();

  console.info(TAG + "Exit stopCameraSession");

  return true;
}

export default function cameraSessionZoomRatioTest() {
  describe('cameraSessionZoomRatioTest', () => {
    console.info(TAG + '----------cameraSessionZoomRatioTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      await cameraObj.sessionStart();
      console.info('Device type = ' + deviceInfo.deviceType);
      console.info('beforeAll case');
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100
     * @tc.name      : Check capture session get zoom ratio range with promise
     * @tc.desc      : Check capture session get zoom ratio range with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100--------------");
      try {
        let zoomRatioRange = cameraObj.sessionGetZoomRatioRange();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 finish");
        if (!isEmpty(zoomRatioRange)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 PASSED with ZoomRatioRange length is: " + (zoomRatioRange.maxZoom - zoomRatioRange.minZoom));
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with ZoomRatioRange length is: " + (zoomRatioRange.maxZoom - zoomRatioRange.minZoom));
          expect().assertFail();
        }
      }
      catch {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100
     * @tc.name      : Check capture session set zoom ratio with promise
     * @tc.desc      : Check capture session set zoom ratio with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100--------------");
      cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 1));
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: 10.0 ");
      let zoomRatio = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
      if (zoomRatio != (mZoomRatioMaxArray[0] + 1)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " + zoomRatio);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with ZoomRatio is: " + zoomRatio);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101--------------");
      cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 1));
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] + 1));
      let zoomRatio = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
      if (zoomRatio != (mZoomRatioMaxArray[0] + 1)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + zoomRatio);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 FAILED with ZoomRatio is: " + zoomRatio);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102--------------");
      cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 0.1));
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] + 0.1));
      let zoomRatio = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
      if (zoomRatio != (mZoomRatioMaxArray[0] + 0.1)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + zoomRatio);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 FAILED with ZoomRatio is: " + zoomRatio);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103--------------");
      cameraObj.sessionSetZoomRatio((mZoomRatioMinArray[0] - 1));
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] - 1));
      let zoomRatio = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
      if (zoomRatio != (mZoomRatioMinArray[0] - 1)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + zoomRatio);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 FAILED with ZoomRatio is: " + zoomRatio);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104--------------");
      cameraObj.sessionSetZoomRatio((mZoomRatioMinArray[0] - 0.1));
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] - 0.1));
      let zoomRatio = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
      if (zoomRatio != (mZoomRatioMinArray[0] - 0.1)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + zoomRatio);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 FAILED with ZoomRatio is: " + zoomRatio);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 ends here");
    });
  })
}
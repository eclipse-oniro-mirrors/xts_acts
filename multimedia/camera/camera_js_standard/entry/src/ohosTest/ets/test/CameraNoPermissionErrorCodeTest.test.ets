/*
 * Copyright (C) 2024-2024 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

const TAG = "CameraPreconfigTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let receiver: image.ImageReceiver;
let context = getContext();

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

export default function cameraPreconfigTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = (sceneMode: camera.SceneMode) => {
    console.info('Enter createCameraSessionInstance' + sceneMode);
    try {
      mCameraSession = mCameraManager.createSession(sceneMode);
    } catch {
      console.info('createCaptureSession FAILED');
    }
    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    if (!isEmpty(mCameraSession)) {
      await mCameraSession.release();
      // mCameraSession = null;
    }
  }

  let createVideoSessionInstance = () => {
    console.info('Enter createVideoSessionInstance');

    try {
      mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
    } catch {
      console.info('createVideoSession FAILED');
    }

    if (isEmpty(mVideoSession)) {
      console.info(TAG + "createVideoSession FAILED");
      return false;
    }

    mVideoSession.beginConfig();

    console.info('Exit createVideoSessionInstance');

    return true;
  }


  describe('CameraNoPermissionErrorCodeTest', () => {
    console.info(TAG + '----------CameraPreconfigTest--------------')

    beforeAll(async () => {
      sleep(100);
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createVideoSessionInstance();
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO)
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
    })

    afterAll(async () => {
      await releaseCameraSessionInstance();
      await sleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200
     * @tc.name      : test Photo session canpreconfig api with error code 7400201
     * @tc.desc      : test Photo session canpreconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200--------------");
      try {
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200 SUCCESS");
        let canPreconfig = mCameraSession.canPreconfig(0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400201');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200
     * @tc.name      : test Photo session preconfig api with error code 7400201
     * @tc.desc      : test Photo session preconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200 SUCCESS");
        mCameraSession.preconfig(0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400201');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100
     * @tc.name      : test video session preconfig api with error code 7400201
     * @tc.desc      : test video session preconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100', 2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100 SUCCESS");
          mVideoSession.preconfig(0);
          done();
        } catch (error) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
          expect(err.code).assertEqual('7400201');
          done();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100
     * @tc.name      : test video session canpreconfig api with error code 7400201
     * @tc.desc      : test video session canpreconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100', 2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100 SUCCESS");
          mVideoSession.canPreconfig(0);
          done();
        } catch (error) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
          expect(err.code).assertEqual('7400201');
          done();
        }
        done();
    })
  })
}
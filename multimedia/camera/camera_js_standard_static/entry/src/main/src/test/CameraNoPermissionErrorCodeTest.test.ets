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

import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraNoPermissionErrorCodeTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession
let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;
let receiver: image.ImageReceiver | undefined;

export default function cameraNoPermissionErrorCodeTest() {

  let isEmpty01 = (data: camera.CameraManager) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty02 = (data: Array<camera.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty03 = (data: camera.PhotoSession) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty04 = (data: camera.VideoSession) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({ width: 640, height: 480 }, image.ImageFormat.JPEG, 4,)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = camera.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
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
      mCameraSession = mCameraManager.createSession<camera.PhotoSession>(sceneMode);
    } catch (error:BusinessError) {
      console.info('createCaptureSession FAILED');
    }
    if (isEmpty03(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    if (!isEmpty03(mCameraSession)) {
      await mCameraSession.release();
    }
  }

  let createVideoSessionInstance = () => {
    console.info('Enter createVideoSessionInstance');

    try {
      mVideoSession = mCameraManager.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
    } catch (error:BusinessError) {
      console.info('createVideoSession FAILED');
    }

    if (isEmpty04(mVideoSession)) {
      console.info(TAG + "createVideoSession FAILED");
      return false;
    }

    mVideoSession.beginConfig();

    console.info('Exit createVideoSessionInstance');

    return true;
  }


  describe('CameraNoPermissionErrorCodeTest', () => {
    console.info(TAG + '----------CameraNoPermissionErrorCodeTest--------------')

    beforeAll(() => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createVideoSessionInstance();
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO)
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      await releaseCameraSessionInstance();
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200
     * @tc.desc   test Photo session canpreconfig api with error code 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200--------------");
      try {
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200 SUCCESS");
        let canPreconfig = mCameraSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P);
        done();
      } catch (error:BusinessError) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400201).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200
     * @tc.desc   test Photo session preconfig api with error code 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200 SUCCESS");
        mCameraSession.preconfig(camera.PreconfigType.PRECONFIG_720P);
        done();
      } catch (error:BusinessError) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400201).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.desc   test video session preconfig api with error code 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100 SUCCESS");
          mVideoSession.preconfig(camera.PreconfigType.PRECONFIG_720P);
          done();
        } catch (error:BusinessError) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100 ERRORCODE: " + err.code);
          expect(err.code == 7400201).assertTrue();
          done();
        }
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.desc   test video session canpreconfig api with error code 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100 SUCCESS");
          mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P);
          done();
        } catch (error:BusinessError) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100 ERRORCODE: " + err.code);
          expect(err.code == 7400201).assertTrue();
          done();
        }
        done();
    })
  })
}
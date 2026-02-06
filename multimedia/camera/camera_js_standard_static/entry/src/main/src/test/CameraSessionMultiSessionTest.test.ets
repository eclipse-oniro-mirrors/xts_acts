/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraSessionMultiSessionTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];

export default function cameraSessionMultiSessionTest() {

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (mCameraManager == null) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraDevicesArray.length);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  describe('CameraSessionMultiSessionTest', () => {
    console.info(TAG + '----------CameraSessionMultiSessionTest--------------')
    beforeAll(() => {
      Utils.msSleep(100);
      getCameraManagerInstance();
      mCameraManager!.offCameraStatus();
      mCameraManager!.offTorchStatusChange();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await Utils.msSleep(500);
    })

    beforeEach(() => {
      await Utils.msSleep(100);
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      await Utils.msSleep(100);
    })

    afterAll(() => {
      Utils.msSleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100
     * @tc.desc   Check capture create multi session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100--------------");
      let cameraInput: cameraObj.CameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[0]);
      let cameraConcurrentInfos: Array<cameraObj.CameraConcurrentInfo> = [];
      cameraConcurrentInfos = mCameraManager!.getCameraConcurrentInfos(mCameraDevicesArray);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 cameraConcurrentInfos = "+ JSON.stringify(cameraConcurrentInfos));
      if (cameraConcurrentInfos.length > 0) {
        await cameraInput.open(cameraObj.CameraConcurrentType.CAMERA_LIMITED_CAPABILITY);
        let firstSession: cameraObj.PhotoSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
        if (firstSession == null || firstSession === undefined) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 create first session FAILED");
          expect().assertFail();
          done();
        }
        try {
          firstSession.beginConfig();
        } catch (err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 first session beginConfig FAILED" + err.code);
          expect().assertFail();
          done();
        }

        let secondSession: cameraObj.PhotoSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
        if (secondSession == null || secondSession === undefined) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 create second session FAILED");
          expect().assertFail();
          done();
        }
        try {
          secondSession.beginConfig();
        } catch (err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 second session beginConfig FAILED" + err.code);
          expect().assertFail();
          done();
        }
        await firstSession.release();
        await secondSession.release();
        await cameraInput.close();
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_STATIC_0100 get concurrent camera ability no supported ");
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100
     * @tc.desc   Check on cameraStatus callback register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100--------------");
      let isTriggerStatusCallback = false;
      mCameraManager!.onCameraStatus((err: BusinessError | null, data: cameraObj.CameraStatusInfo | undefined) => {
        if (!err || err!.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100 camera:" +
          JSON.stringify(data!.camera));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100 status:" +
          JSON.stringify(data!.status));
          isTriggerStatusCallback = true;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_STATIC_0100 FAILED: " + err.message);
        }
      })
      await Utils.msSleep(500);
      mCameraManager!.offCameraStatus();
      expect(isTriggerStatusCallback).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100
     * @tc.desc   Check on torchStatusChange callback register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100--------------");
      let isTriggerTorchStatusCallback = false;
      mCameraManager!.onTorchStatusChange((err: BusinessError | null, data: cameraObj.TorchStatusInfo | undefined) => {
        if (!err || err!.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100 status:" +
          JSON.stringify(data));
          isTriggerTorchStatusCallback = true;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_STATIC_0100 FAILED: " + err.message);
        }
      })
      await Utils.msSleep(500);
      mCameraManager!.offTorchStatusChange();
      expect(isTriggerTorchStatusCallback).assertTrue();
      done();
    })
  })
}
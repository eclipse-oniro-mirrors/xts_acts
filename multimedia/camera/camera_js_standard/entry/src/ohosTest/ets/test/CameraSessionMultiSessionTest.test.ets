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

import cameraObj from '@ohos.multimedia.camera';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG = "CameraSessionMultiSessionTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

let power: ESObject;

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

export default function cameraSessionMultiSessionTest() {
  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }
  let context = getContext();

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = cameraObj.getCameraManager(context);
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
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraDevicesArray.length);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  describe('CameraSessionMultiSessionTest', () => {
    console.info(TAG + '----------CameraSessionMultiSessionTest--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      sleep(100);
      getCameraManagerInstance();
      mCameraManager.off('cameraStatus');
      mCameraManager.off('torchStatusChange');
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
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
      sleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100
     * @tc.desc   Check capture create multi session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100--------------");
      let cameraInput: cameraObj.CameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
      let cameraconcurrentinfos: Array<cameraObj.CameraConcurrentInfo> = [];
      cameraconcurrentinfos = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 cameraconcurrentinfos = "+ JSON.stringify(cameraconcurrentinfos));
      if (cameraconcurrentinfos.length>0) {
        await cameraInput.open(cameraObj.CameraConcurrentType.CAMERA_LIMITED_CAPABILITY);
        let firstSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
        if (!firstSession) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 create first session FAILED");
          expect().assertFail();
          done();
          return;
        }
        try {
          firstSession.beginConfig();
        } catch (err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 first session beginConfig FAILED" + err.code);
          expect().assertFail();
          done();
          return;
        }

        let secondSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
        if (!secondSession) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 create second session FAILED");
          expect().assertFail();
          done();
          return;
        }
        try {
          secondSession.beginConfig();
        } catch (err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 second session beginConfig FAILED" + err.code);
          expect().assertFail();
          done();
          return;
        }

        await firstSession.release();
        await secondSession.release();
        await cameraInput.close();
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MULTI_SESSION_CREATE_0100 get concurrent camera ability no supported ");
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100
     * @tc.desc   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100--------------");
      let isTriggerStatusCallback = false;
      mCameraManager.on('cameraStatus', async (err, cameraStatusInfo) => {
        if (!err || err.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100 camera:" +
          JSON.stringify(cameraStatusInfo.camera));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100 status:" +
          JSON.stringify(cameraStatusInfo.status));
          isTriggerStatusCallback = true;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_CAMERA_STATUS_0100 FAILED: " + err.message);
        }
      })
      await sleep(500);
      mCameraManager.off('cameraStatus');
      expect(isTriggerStatusCallback).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100
     * @tc.desc   SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100--------------");
      let isTriggerTorchStatusCallback = false;
      mCameraManager.on('torchStatusChange', async (err, torchStatus) => {
        if (!err || err.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100 status:" +
          JSON.stringify(torchStatus));
          isTriggerTorchStatusCallback = true;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_MANAGER_LISTENER_CALLBACK_REGISTER_TORCH_STATUS_0100 FAILED: " + err.message);
        }
      })
      await sleep(500);  
      mCameraManager.off('torchStatusChange');
      expect(isTriggerTorchStatusCallback).assertTrue();
      done();
    })
  })
}
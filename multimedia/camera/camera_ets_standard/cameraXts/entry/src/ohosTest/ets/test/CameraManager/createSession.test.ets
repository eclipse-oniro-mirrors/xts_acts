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
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { cameraErrorCode, isEmpty, sceneMode } from '../common';

const TAG = "CameraXts.createSessionTest";
const abnormalMode = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
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

async function createSessionOrAbnormal(done: Function, testName: string, sMode: camera.SceneMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    let session = mCameraManager.createSession(sMode);
    expect(isEmpty(session)).assertFalse();
    console.info(TAG, testName + ' pass.');
    await session.release();
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function createSessionTest() {
  describe('createSessionTest', () => {
    beforeAll(() => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_001
     * @tc.name      : createSession_001
     * @tc.desc      : No abnormal scenarios-sceneMode->NORMAL_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createSession_001', Level.LEVEL0, (done: Function) => {
      const testName = 'createSession_001';
      createSessionOrAbnormal(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_002
     * @tc.name      : createSession_002
     * @tc.desc      : no supported sceneMode: sceneMode->NORMAL_VIDEO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createSession_002', Level.LEVEL0, (done: Function) => {
      const testName = 'createSession_002';
      createSessionOrAbnormal(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_003
     * @tc.name      : createSession_003
     * @tc.desc      : no supported sceneMode: secure_mode->SECURE_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createSession_003', Level.LEVEL0, (done: Function) => {
      const testName = 'createSession_003';
      createSessionOrAbnormal(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_004
     * @tc.name      : createSession_abnormal_001
     * @tc.desc      : sceneMode->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createSession_abnormal_001', Level.LEVEL2, (done: Function) => {
      const testName = 'createSession_abnormal_001';
      createSessionOrAbnormal(done, testName, null);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_005
     * @tc.name      : createSession_abnormal_002
     * @tc.desc      : sceneMode->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createSession_abnormal_002', Level.LEVEL2, (done: Function) => {
      const testName = 'createSession_abnormal_002';
      createSessionOrAbnormal(done, testName, undefined);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_SESSION_006
     * @tc.name      : createSession_abnormal_003
     * @tc.desc      : abnormal sceneMode -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createSession_abnormal_003', Level.LEVEL2, (done: Function) => {
      const testName = 'createSession_abnormal_003';
      createSessionOrAbnormal(done, testName, abnormalMode);
    })
  })
}
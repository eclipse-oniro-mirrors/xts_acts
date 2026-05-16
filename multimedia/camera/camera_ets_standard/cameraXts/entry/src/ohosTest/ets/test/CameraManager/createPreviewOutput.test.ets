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
import { image } from '@kit.ImageKit';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = "CameraXts.createPreviewOutputTest";
const abnormalIndex = -1;
const abnormalSurfaceId = 'error_value';
let mPhotoSurfaceId: string;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraOutputCap: camera.CameraOutputCapability;
let mPreviewProfile: camera.Profile;
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

async function getSurfaceId() {
  console.info(TAG, 'getSurfaceId begin.');
  let size: image.Size = {
    height: 480,
    width: 640
  };
  let receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
  if (receiver !== undefined) {
    console.info(TAG, 'receiver created successfully.');
    mPhotoSurfaceId = await receiver.getReceivingSurfaceId();
    console.info(TAG, 'receiver id: ' + mPhotoSurfaceId);
  } else {
    console.info(TAG, 'receiver is failed.');
  }
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], sceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
  mPreviewProfile = mCameraOutputCap.previewProfiles[0];
  expect(isEmpty(mPreviewProfile)).assertFalse();
}

function createPreviewOutputWithProfile(done: Function, testName: string, surfaceId: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      for (let i = 0; i < mCameraDeviceArray.length; i++) {
        let sceneModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
        if (sceneModes !== null && sceneModes.length > 0) {
          for (const mode of sceneModes) {
            let cameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], mode);
            expect(isEmpty(cameraOutputCapability)).assertFalse();
            console.info(TAG, testName + ' camera : ' + i + ', mode: ' + mode + ', output cap: ' +
            JSON.stringify(cameraOutputCapability));
            console.info(TAG,
              testName + ' profiles: ' + cameraOutputCapability.previewProfiles[i] + ', surfaceId: ' + surfaceId);
            let previewOutput =
              mCameraManager.createPreviewOutput(cameraOutputCapability.previewProfiles[i], surfaceId);
            console.info(TAG, testName + ' previewOutput: ' + JSON.stringify(previewOutput));
            expect(isEmpty(previewOutput)).assertFalse();
          }
        }
      }
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

function createPreviewOutputAbnormal(done: Function, testName: string, previewProfile: camera.Profile,
  surfaceId: string | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let previewOutput = mCameraManager.createPreviewOutput(previewProfile, surfaceId as string);
      console.info(TAG, testName + ' previewOutput: ' + JSON.stringify(previewOutput));
      expect(isEmpty(previewOutput)).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

function createPreviewOutputNoProfile(done: Function, testName: string, surfaceId: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let previewOutput = mCameraManager.createPreviewOutput(surfaceId as string);
      console.info(TAG, testName + ' previewOutput: ' + JSON.stringify(previewOutput));
      expect(isEmpty(previewOutput)).assertFalse();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

function createPreviewOutputNoProfileAbnormal(done: Function, testName: string, surfaceId: string | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let previewOutput = mCameraManager.createPreviewOutput(surfaceId as string);
      console.info(TAG, testName + ' previewOutput: ' + JSON.stringify(previewOutput));
      expect(isEmpty(previewOutput)).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function createPreviewOutputTest() {
  describe('createPreviewOutputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getOutputCapability();
      await getSurfaceId();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      mPhotoSurfaceId = '';
    });

    /**
     * @tc.name   createPreviewOutput_with_profile_001
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_001
     * @tc.desc   No abnormal scenarios-with previewProfiles, image surfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPreviewOutput_with_profile_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_001';
      createPreviewOutputWithProfile(done, testName, mPhotoSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_002
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_002
     * @tc.desc   No abnormal scenarios-with previewProfiles, Index surfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPreviewOutput_with_profile_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_002';
      createPreviewOutputWithProfile(done, testName, indexSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_001
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_003
     * @tc.desc   surfaceId->undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_001';
      createPreviewOutputAbnormal(done, testName, mPreviewProfile, undefined);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_002
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_004
     * @tc.desc   surfaceId->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_002';
      createPreviewOutputAbnormal(done, testName, mPreviewProfile, null);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_003
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_005
     * @tc.desc   abnormal surfaceId -> previewOutput->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_003';
      createPreviewOutputAbnormal(done, testName, mPreviewProfile, abnormalSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_004
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_006
     * @tc.desc   new previewProfile, with image surfaceId -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_004';
      let newProfile: Array<camera.Profile> = new Array<camera.Profile>();
      createPreviewOutputAbnormal(done, testName, newProfile[0], mPhotoSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_005
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_007
     * @tc.desc   new previewProfile, with Index surfaceId -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_005';
      let newProfile: Array<camera.Profile> = new Array<camera.Profile>();
      createPreviewOutputAbnormal(done, testName, newProfile[0], indexSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_006
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_008
     * @tc.desc   abnormal previewProfile, image surfaceId -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_006';
      createPreviewOutputAbnormal(done, testName, mCameraOutputCap.previewProfiles[abnormalIndex], mPhotoSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_with_profile_abnormal_007
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_009
     * @tc.desc   abnormal previewProfile, image surfaceId -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_with_profile_abnormal_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_with_profile_abnormal_007';
      createPreviewOutputAbnormal(done, testName, mCameraOutputCap.previewProfiles[abnormalIndex], indexSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_001
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_010
     * @tc.desc   No abnormal scenarios-no previewProfiles, only image surfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPreviewOutput_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPreviewOutput_001';
      createPreviewOutputNoProfile(done, testName, mPhotoSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_002
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_011
     * @tc.desc   No abnormal scenarios-no previewProfiles, only Index surfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPreviewOutput_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPreviewOutput_002';
      createPreviewOutputNoProfile(done, testName, indexSurfaceId);
    })

    /**
     * @tc.name   createPreviewOutput_abnormal_001
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_012
     * @tc.desc   only surfaceId->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_abnormal_001';
      createPreviewOutputNoProfileAbnormal(done, testName, null);
    })

    /**
     * @tc.name   createPreviewOutput_abnormal_002
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_013
     * @tc.desc   only surfaceId->undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_abnormal_002';
      createPreviewOutputNoProfileAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   createPreviewOutput_abnormal_003
     * @tc.number CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_014
     * @tc.desc   only abnormal surfaceId -> previewOutput->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPreviewOutput_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPreviewOutput_abnormal_003';
      createPreviewOutputNoProfileAbnormal(done, testName, abnormalSurfaceId);
    })
  })
}
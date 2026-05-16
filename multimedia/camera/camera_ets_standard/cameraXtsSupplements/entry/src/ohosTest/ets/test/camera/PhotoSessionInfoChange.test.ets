/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it,  TestType, Level, Size, expect } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { closeFd, driveFn, getFd, getPermission, isEmpty, resourceName, sleep } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { JSON } from '@kit.ArkTS';

const TAG = "CameraXts.CameraSessionIsoInfoChangeTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mPhotoSession: camera.PhotoSession;
let fdNumber: number;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
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
async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}
export default function PhotoSessIsoInfoChangeTest() {
  describe('PhotoSessIsoInfoChangeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('string1')
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_0100
     * @tc.desc   offIsoInfoChange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
     console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅ISO信息变化事件
        mPhotoSession.onIsoInfoChange((isoInfo: camera.IsoInfo)=> {
          console.info(TAG, `${testName} ISO info changed,, isoInfo: ${JSON.stringify(isoInfo)}`);
          callbackTriggered = true;
        });
        // 检测是否支持ISO控制
        const hasIso: number = mPhotoSession.getIso();
        console.info(TAG, `${testName} getIso: ${hasIso}`);
        mPhotoSession.setIso(0);
        console.info(TAG, `${testName} setIsoFir: ${hasIso}`);
        // mPhotoSession.setIso(3.3);
        // console.info(TAG, `${testName} getIsoSec: ${hasIso}`);
        await sleep(1000);
        mPhotoSession.offIsoInfoChange();
        await sleep(500);
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }


      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });


   /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_0100
     * @tc.desc   onExposureInfoChange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
   it('SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
     const testName = 'SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅onExposureInfoChange信息变化事件
        mPhotoSession.onExposureInfoChange((expInfo: camera.ExposureInfo)=> {
          console.info(TAG, `${testName} ononExposureInfoChange info changed, exposureInfo: ${JSON.stringify(expInfo)}`);
          callbackTriggered = true;
        });
        console.info(TAG, `${testName} onIsoInfoChange success.`);
        mPhotoSession.offExposureInfoChange();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

  });
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd,
  COMMON_WAIT_DURATION,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { JSON } from '@kit.ArkTS';

const TAG = "CameraXts.CameraSessionInputOutputTest";
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
  console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
  console.info(TAG, 'getCreatePhotoSession.success',);
}

export default function CameraManagerGetSupportedOutputCapabilityTest() {
  describe('CameraManagerGetSupportedOutputCapabilityTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '')
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('string1')
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_METERING_POINT_001
     * @tc.number SUB_CAMERA_MANAGER_SET_METERING_POINT_001
     * @tc.desc   AutoExposure-setMeteringPoint-null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_METERING_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_METERING_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setMeteringPoint(null)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_METERING_POINT_002
     * @tc.number SUB_CAMERA_MANAGER_SET_METERING_POINT_002
     * @tc.desc   AutoExposure-setMeteringPoint-undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_METERING_POINT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_METERING_POINT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setMeteringPoint(undefined)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_001
     * @tc.number SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_001
     * @tc.desc   AutoExposure-setExposureBias-null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setExposureBias(null)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_002
     * @tc.number SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_002
     * @tc.desc   AutoExposure-setExposureBias-undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_EXPOSURE_BIAS_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setExposureBias(undefined)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_FOCUS_POINT_001
     * @tc.number SUB_CAMERA_MANAGER_SET_FOCUS_POINT_001
     * @tc.desc   Focus-setFocusPoint-null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_FOCUS_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_FOCUS_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setFocusPoint(null)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_SET_FOCUS_POINT_002
     * @tc.number SUB_CAMERA_MANAGER_SET_FOCUS_POINT_002
     * @tc.desc   Focus-setFocusPoint-undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_SET_FOCUS_POINT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_SET_FOCUS_POINT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoSession.setFocusPoint(undefined)
        console.info(TAG, testName, 'Success');
        expect(mPhotoSession != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_001
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_001
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraId -"".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = {
        cameraId: "",
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_002
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_002
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_003
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_003
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_004
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_004
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraPosition -CAMERA_POSITION_FRONT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_005
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_005
     * @tc.desc   CameraManager -getSupportedOutputCapability -connectionType -CAMERA_CONNECTION_BUILT_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_006
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_006
     * @tc.desc   CameraManager -getSupportedOutputCapability -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_007
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_007
     * @tc.desc   CameraManager -getSupportedOutputCapability -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_008
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_008
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_009
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_009
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraType -CAMERA_TYPE_WIDE_ANGLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_010
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_010
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_011
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_011
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_012
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_012
     * @tc.desc   CameraManager -getSupportedOutputCapability -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_013
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_013
     * @tc.desc   CameraManager -getSupportedOutputCapability -hostDeviceName -"".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: " ",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_014
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_014
     * @tc.desc   CameraManager -getSupportedOutputCapability -hostDeviceType -UNKNOWN_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_015
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_015
     * @tc.desc   CameraManager -getSupportedOutputCapability -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_016
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_016
     * @tc.desc   CameraManager -getSupportedOutputCapability -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedOutputCapability(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_017
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_017
     * @tc.desc   CameraManager -getSupportedOutputCapability -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedOutputCapability(null);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_018
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_018
     * @tc.desc   CameraManager -getSupportedOutputCapability -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_018';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedOutputCapability(undefined);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_002
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_002
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_003
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_003
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_004
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_004
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_006
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_006
     * @tc.desc   CameraManager -getSupportedSceneModes -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_007
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_007
     * @tc.desc   CameraManager -getSupportedSceneModes -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_009
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_009
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraType -CAMERA_TYPE_WIDE_ANGLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_010
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_010
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_011
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_011
     * @tc.desc   CameraManager -getSupportedSceneModes --cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_012
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_012
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_015
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_015
     * @tc.desc   CameraManager -getSupportedSceneModes -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_016
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_016
     * @tc.desc   CameraManager -getSupportedSceneModes -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedSceneModes(useDevice);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_017
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_017
     * @tc.desc   CameraManager -getSupportedSceneModes -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedSceneModes(null);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_018
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_018
     * @tc.desc   CameraManager -getSupportedSceneModes -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_018';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedSceneModes(undefined);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_001
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_001
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_002
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_002
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_003
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_003
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_004
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_004
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FRONT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_005
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_005
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_006
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_006
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_007
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_007
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_008
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_008
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_009
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_009
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_010
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_010
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_011
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_011
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_012
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_012
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_013
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_013
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -isRetractable -true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: true
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_014
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_014
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_015
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_015
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 90,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_016
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_016
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 180,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_017
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_017
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -360.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 360,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_018
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_018
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_018';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 45,
        isRetractable: false
      }
      try {
        let result: camera.CameraOutputCapability =
          mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_001
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_001
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, null);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_002
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_002
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, undefined);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_003
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_003
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(null, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_004
     * @tc.number SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_004
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_ERROR_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(undefined, camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_001
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_001
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_002
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_002
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_003
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_003
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_004
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_004
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FRONT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_005
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_005
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_006
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_006
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_007
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_007
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_008
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_008
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_009
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_009
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_010
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_010
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_011
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_011
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_012
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_012
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_013
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_013
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -isRetractable -true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: true
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_014
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_014
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_015
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_015
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_015';

      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 90,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_016
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_016
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 180,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_017
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_017
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -360.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 360,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_018
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_018
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_018';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 45,
        isRetractable: false
      }
      try {
        let result: camera.CameraOutputCapability =
          mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_019
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_019
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_019';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, null);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_020
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_020
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_020';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, undefined);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_021
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_021
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_021';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(null, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_022
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_022
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_NORMAL_VIDEO_022';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(undefined, camera.SceneMode.NORMAL_VIDEO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_001
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_001
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_002
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_002
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_003
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_003
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_004
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_004
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraPosition -CAMERA_POSITION_FRONT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_005
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_005
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_006
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_006
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_007
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_007
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_008
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_008
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_009
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_009
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_010
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_010
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_011
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_011
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_012
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_012
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_013
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_013
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -isRetractable -true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 270,
        isRetractable: true
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_014
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_014
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_015
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_015
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 90,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_016
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_016
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 180,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_017
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_017
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -360.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 360,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_018
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_018
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -cameraOrientation -45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_018';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 45,
        isRetractable: false
      }
      try {
        let result: camera.CameraOutputCapability =
          mCameraManager.getSupportedFullOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect(result != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_019
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_019
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_019';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, null);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_020
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_020
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -mode -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_020';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        let result = mCameraManager.getSupportedFullOutputCapability(useDevice, undefined);
        console.info(TAG, testName, 'Success', JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_021
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_021
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_021';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(null, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })

    /**
     * @tc.name   SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_022
     * @tc.number SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_022
     * @tc.desc   CameraManager -getSupportedFullOutputCapability -camera -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_SECURE_PHOTO_022';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        mCameraManager.getSupportedFullOutputCapability(undefined, camera.SceneMode.SECURE_PHOTO);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      }
      done();
    })
  })
}

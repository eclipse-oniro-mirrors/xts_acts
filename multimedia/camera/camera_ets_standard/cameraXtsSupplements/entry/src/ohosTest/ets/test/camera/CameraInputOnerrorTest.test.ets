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
  closeFd, COMMON_WAIT_DURATION, driveFn, getPermission, isEmpty, sleep
} from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.CameraSessionInputOutputTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraInput: camera.CameraInput;
let fdNumber: number;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let count = 0;

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

let callbackOn = (err: BusinessError) => {
  console.error(TAG, `Camera input error code: ${err.code}`);
  count = count + 1;
}

export default function CameraInputOnerrorTest() {
  describe('CameraInputOnerrorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
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
    });

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014
     * @tc.desc   CameraInput -off_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.off(null, useDevice[0]);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015
     * @tc.desc   CameraInput -off_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.off(undefined, useDevice[0]);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016
     * @tc.desc   CameraInput -off_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.off('error', null);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017
     * @tc.desc   CameraInput -off_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.off('error', undefined);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001
     * @tc.desc   CameraInput -on_error -cameraId -" ".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = {
        cameraId: " ",
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
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002
     * @tc.desc   CameraInput -on_error -hostDeviceName -" ".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: " ",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006
     * @tc.desc   CameraInput -on_error -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007
     * @tc.desc   CameraInput -on_error -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012
     * @tc.desc   CameraInput -on_error -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013
     * @tc.desc   CameraInput -on_error -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014
     * @tc.desc   CameraInput -on_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.on(null, useDevice[0], (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015
     * @tc.desc   CameraInput -on_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.on(undefined, useDevice[0], (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016
     * @tc.desc   CameraInput -on_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.on('error', null, (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017
     * @tc.desc   CameraInput -on_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.on('error', undefined, (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })
  })
}
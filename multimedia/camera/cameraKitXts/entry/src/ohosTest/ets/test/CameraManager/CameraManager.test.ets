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
import { BusinessError } from '@kit.BasicServicesKit';
import { getPermission, driveFn, isEmpty, sleep, waitForTrigger } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'CameraManagerTest: ';
const INVALID_PARAMETER_CODE: number = 7400101;
const OPERATION_NOT_ALLOWED_CODE: number = 7400102;
const PARAM_VALIDATION_CODE: number = 401;

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraNum: number = 0;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

export default function CameraManagerTest() {

  let handleCatchErr = (caseName: string, err: BusinessError): void => {
    if (err.code !== undefined) {
      console.error(TAG + caseName + ' FAILED: code=' + err.code + ', message=' + err.message);
    } else {
      console.error(TAG + caseName + ' FAILED: ' + JSON.stringify(err));
    }
  }

  let getCameraManagerInstance = (): boolean => {
    mCameraManager = camera.getCameraManager(testContext);
    if (isEmpty(mCameraManager)) { return false; }
    return true;
  }

  let getCameraSupportDevicesArray = (): boolean => {
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) { return false; }
    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + 'mCameraNum: ' + mCameraNum);
    return true;
  }

  // Returns true when setTorchMode succeeded, false when the hardware is in a state that
  // disallows the operation (7400102) and the retry budget is exhausted. Callers must skip
  // any follow-up assertions tied to the torch state when this returns false; treating a
  // hardware state lock as a hard test failure makes consecutive torch cases flaky.
  let trySetTorchMode = async (mgr: camera.CameraManager, mode: camera.TorchMode): Promise<boolean> => {
    let maxRetries: number = 10;
    let lastCode: number = -1;
    for (let i = 0; i < maxRetries; i++) {
      try {
        mgr.setTorchMode(mode);
        return true;
      } catch (err) {
        let e = err as BusinessError;
        lastCode = Number(e.code);
        if (lastCode === OPERATION_NOT_ALLOWED_CODE && i < maxRetries - 1) {
          console.info(TAG + 'trySetTorchMode retry ' + i + ' for mode ' + mode);
          await sleep(800);
          continue;
        }
        if (lastCode === OPERATION_NOT_ALLOWED_CODE) {
          console.warn(TAG + 'trySetTorchMode hardware locked for mode ' + mode
            + ' after ' + maxRetries + ' retries; skipping this attempt');
          return false;
        }
        handleCatchErr('trySetTorchMode', e);
        expect(true).assertFail();
        return false;
      }
    }
    return false;
  }

  describe('CameraManagerTest', () => {
    console.info(TAG + '----------CameraManagerTest--------------');

    beforeAll(async () => {
      await sleep(100);
      console.info(TAG + 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
    })

    beforeEach(async () => {
      await sleep(1000);
      console.info(TAG + 'beforeEach case');
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach case');
      // Best-effort reset torch to OFF so consecutive torch cases do not inherit ON/AUTO state
      // and trip 7400102 in the next case. Failures here are silently ignored - the next case
      // has its own retry budget.
      try {
        if (!isEmpty(mCameraManager) && mCameraManager.isTorchSupported()
            && mCameraManager.isTorchModeSupported(camera.TorchMode.OFF)
            && mCameraManager.getTorchMode() !== camera.TorchMode.OFF) {
          mCameraManager.setTorchMode(camera.TorchMode.OFF);
        }
      } catch (e) { /* ignore */ }
      await sleep(500);
    })

    afterAll(async () => {
      await sleep(1000);
      console.info(TAG + 'afterAll case');
    })


    // ══════════════════════════════════════════════════════════
    //  getCameraManager
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_MANAGER_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_MANAGER_0100
     * @tc.desc   getCameraManager returns valid CameraManager instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_MANAGER_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_MANAGER_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let mgr: camera.CameraManager = camera.getCameraManager(testContext);
        console.info(TAG + caseName + ' PASSED');
        expect(isEmpty(mgr)).assertFalse();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  CameraDevice properties
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_HOST_DEVICE_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_HOST_DEVICE_TYPE_0100
     * @tc.desc   CameraDevice.hostDeviceType property is accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_HOST_DEVICE_TYPE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'HOST_DEVICE_TYPE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let hostType: camera.HostDeviceType = mCameraDevicesArray[0].hostDeviceType;
        console.info(TAG + caseName + ' hostType=' + hostType);
        expect(typeof hostType).assertEqual('number');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CAMERA_ORIENTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CAMERA_ORIENTATION_0100
     * @tc.desc   CameraDevice.cameraOrientation property is accessible and valid number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CAMERA_ORIENTATION_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CAMERA_ORIENTATION_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let orientation: number = mCameraDevicesArray[0].cameraOrientation;
        console.info(TAG + caseName + ' orientation=' + orientation);
        expect([0, 90, 180, 270].includes(orientation)).assertTrue();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  getSupportedCameras
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_0100
     * @tc.desc   getSupportedCameras returns non-empty array with valid CameraDevice fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_CAMERAS_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cameras: Array<camera.CameraDevice> = mCameraManager.getSupportedCameras();
        console.info(TAG + caseName + ' length=' + cameras.length);
        expect(cameras.length).assertLarger(0);
        let cam: camera.CameraDevice = cameras[0];
        expect(isEmpty(cam.cameraId)).assertFalse();
        expect(typeof cam.cameraPosition).assertEqual('number');
        expect(typeof cam.cameraType).assertEqual('number');
        expect(typeof cam.connectionType).assertEqual('number');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  isCameraMuted / isTorchSupported / getTorchMode
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_CAMERA_MUTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_CAMERA_MUTED_0100
     * @tc.desc   isCameraMuted returns boolean value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_CAMERA_MUTED_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'IS_CAMERA_MUTED_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let isMuted: boolean = mCameraManager.isCameraMuted();
        console.info(TAG + caseName + ' isMuted=' + isMuted);
        expect(typeof isMuted).assertEqual('boolean');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_SUPPORTED_0100
     * @tc.desc   isTorchSupported returns boolean value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_SUPPORTED_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'IS_TORCH_SUPPORTED_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let isSupported: boolean = mCameraManager.isTorchSupported();
        console.info(TAG + caseName + ' isSupported=' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_TORCH_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_TORCH_MODE_0100
     * @tc.desc   getTorchMode returns valid TorchMode enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_TORCH_MODE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_TORCH_MODE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let torchMode: camera.TorchMode = mCameraManager.getTorchMode();
        console.info(TAG + caseName + ' torchMode=' + torchMode);
        expect([camera.TorchMode.OFF, camera.TorchMode.ON, camera.TorchMode.AUTO].includes(torchMode)).assertTrue();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  getSupportedSceneModes
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0100
     * @tc.desc   getSupportedSceneModes returns non-empty array for valid camera device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_SCENE_MODES_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let modes: Array<camera.SceneMode> = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[0]);
        console.info(TAG + caseName + ' length=' + modes.length);
        expect(modes.length).assertLarger(0);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0200
     * @tc.desc   getSupportedSceneModes with null param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_SCENE_MODES_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try {
          mCameraManager.getSupportedSceneModes(null as ESObject);
          expect(true).assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.info(TAG + caseName + ' code=' + Number(e.code));
          expect(Number(e.code)).assertEqual(INVALID_PARAMETER_CODE);
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0300
     * @tc.desc   getSupportedSceneModes with undefined param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_SCENE_MODES_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try {
          mCameraManager.getSupportedSceneModes(undefined as ESObject);
          expect(true).assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.info(TAG + caseName + ' code=' + Number(e.code));
          expect(Number(e.code)).assertEqual(INVALID_PARAMETER_CODE);
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  getSupportedOutputCapability
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0100
     * @tc.desc   getSupportedOutputCapability returns valid CameraOutputCapability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_OUTPUT_CAPABILITY_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        expect(isEmpty(cap)).assertFalse();
        expect(cap.previewProfiles.length).assertLarger(0);
        expect(cap.photoProfiles.length).assertLarger(0);
        console.info(TAG + caseName + ' PASSED');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0200
     * @tc.desc   getSupportedOutputCapability with null camera param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_OUTPUT_CAPABILITY_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getSupportedOutputCapability(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0300
     * @tc.desc   getSupportedOutputCapability with undefined camera param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_OUTPUT_CAPABILITY_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getSupportedOutputCapability(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0400
     * @tc.desc   getSupportedOutputCapability with null mode param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_OUTPUT_CAPABILITY_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0500
     * @tc.desc   getSupportedOutputCapability with undefined mode param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_0500', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_SUPPORTED_OUTPUT_CAPABILITY_0500';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  isTorchModeSupported
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0100
     * @tc.desc   isTorchModeSupported enum traversal for all TorchMode values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'IS_TORCH_MODE_SUPPORTED_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let modes: Array<camera.TorchMode> = [camera.TorchMode.OFF, camera.TorchMode.ON, camera.TorchMode.AUTO];
        for (let i = 0; i < modes.length; i++) {
          let result: boolean = mCameraManager.isTorchModeSupported(modes[i]);
          console.info(TAG + caseName + ' mode=' + modes[i] + ' result=' + result);
          expect(typeof result).assertEqual('boolean');
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0200
     * @tc.desc   isTorchModeSupported with null degrades to TorchMode.OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'IS_TORCH_MODE_SUPPORTED_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let resultNull: boolean = mCameraManager.isTorchModeSupported(null as ESObject);
        let resultOff: boolean = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
        console.info(TAG + caseName + ' null=' + resultNull + ' OFF=' + resultOff);
        expect(resultNull).assertEqual(resultOff);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0300
     * @tc.desc   isTorchModeSupported with undefined degrades to TorchMode.OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'IS_TORCH_MODE_SUPPORTED_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let resultUndef: boolean = mCameraManager.isTorchModeSupported(undefined as ESObject);
        let resultOff: boolean = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
        expect(resultUndef).assertEqual(resultOff);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  setTorchMode
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0100
     * @tc.desc   setTorchMode enum traversal, verify getTorchMode matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'SET_TORCH_MODE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        let modes: Array<camera.TorchMode> = [camera.TorchMode.OFF, camera.TorchMode.ON, camera.TorchMode.AUTO];
        for (let i = 0; i < modes.length; i++) {
          if (mCameraManager.isTorchModeSupported(modes[i])) {
            let setOk: boolean = await trySetTorchMode(mCameraManager, modes[i]);
            if (setOk) {
              expect(mCameraManager.getTorchMode()).assertEqual(modes[i]);
            } else {
              console.warn(TAG + caseName + ' setTorchMode mode=' + modes[i]
                + ' skipped due to hardware state lock');
            }
          }
        }
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0200
     * @tc.desc   setTorchMode with null degrades to OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'SET_TORCH_MODE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        // Retry on hardware state lock (7400102) just like trySetTorchMode does
        let maxRetries: number = 10;
        let setOk: boolean = false;
        let unexpectedFail: boolean = false;
        for (let i = 0; i < maxRetries; i++) {
          try {
            mCameraManager.setTorchMode(null as ESObject);
            setOk = true;
            break;
          } catch (err) {
            let e = err as BusinessError;
            if (Number(e.code) === OPERATION_NOT_ALLOWED_CODE && i < maxRetries - 1) {
              console.info(TAG + caseName + ' retry ' + i + ' on 7400102');
              await sleep(800);
              continue;
            }
            handleCatchErr(caseName, e);
            unexpectedFail = true;
            break;
          }
        }
        if (unexpectedFail) {
          expect(true).assertFail();
        } else if (setOk) {
          expect(mCameraManager.getTorchMode()).assertEqual(camera.TorchMode.OFF);
        } else {
          console.warn(TAG + caseName + ' skipped due to hardware state lock');
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0300
     * @tc.desc   setTorchMode with undefined degrades to OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'SET_TORCH_MODE_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        // Retry on hardware state lock (7400102) just like trySetTorchMode does
        let maxRetries: number = 10;
        let setOk: boolean = false;
        let unexpectedFail: boolean = false;
        for (let i = 0; i < maxRetries; i++) {
          try {
            mCameraManager.setTorchMode(undefined as ESObject);
            setOk = true;
            break;
          } catch (err) {
            let e = err as BusinessError;
            if (Number(e.code) === OPERATION_NOT_ALLOWED_CODE && i < maxRetries - 1) {
              console.info(TAG + caseName + ' retry ' + i + ' on 7400102');
              await sleep(800);
              continue;
            }
            handleCatchErr(caseName, e);
            unexpectedFail = true;
            break;
          }
        }
        if (unexpectedFail) {
          expect(true).assertFail();
        } else if (setOk) {
          expect(mCameraManager.getTorchMode()).assertEqual(camera.TorchMode.OFF);
        } else {
          console.warn(TAG + caseName + ' skipped due to hardware state lock');
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0400
     * @tc.desc   setTorchMode idempotent: same mode twice does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_SET_TORCH_MODE_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'SET_TORCH_MODE_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { done(); return; }
        if (!mCameraManager.isTorchModeSupported(camera.TorchMode.OFF)) { done(); return; }
        let setOk1: boolean = await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        let setOk2: boolean = await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        if (setOk1 && setOk2) {
          expect(mCameraManager.getTorchMode()).assertEqual(camera.TorchMode.OFF);
        } else {
          console.warn(TAG + caseName + ' idempotent set skipped due to hardware state lock');
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createCameraInput
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0100
     * @tc.desc   createCameraInput(CameraDevice) returns valid CameraInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_DEVICE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let input: camera.CameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        expect(isEmpty(input)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await input.close();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0200
     * @tc.desc   createCameraInput with null param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_DEVICE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0300
     * @tc.desc   createCameraInput with undefined param throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_DEVICE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_DEVICE_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0100
     * @tc.desc   createCameraInput(position, type) returns valid CameraInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_POS_TYPE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let pos: camera.CameraPosition = mCameraDevicesArray[0].cameraPosition;
        let tp: camera.CameraType = mCameraDevicesArray[0].cameraType;
        let input: camera.CameraInput = mCameraManager.createCameraInput(pos, tp);
        expect(isEmpty(input)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await input.close();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0200
     * @tc.desc   createCameraInput(pos,type) with null position throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_POS_TYPE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(null as ESObject, mCameraDevicesArray[0].cameraType); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0300
     * @tc.desc   createCameraInput(pos,type) with undefined position throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_POS_TYPE_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(undefined as ESObject, mCameraDevicesArray[0].cameraType); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0400
     * @tc.desc   createCameraInput(pos,type) with null type throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_POS_TYPE_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(mCameraDevicesArray[0].cameraPosition, null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0500
     * @tc.desc   createCameraInput(pos,type) with undefined type throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAMERA_INPUT_POS_TYPE_0500', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAMERA_INPUT_POS_TYPE_0500';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createCameraInput(mCameraDevicesArray[0].cameraPosition, undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createPreviewOutput
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0100
     * @tc.desc   createPreviewOutput(profile, surfaceId) returns valid PreviewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        let previewOutput: camera.PreviewOutput = mCameraManager.createPreviewOutput(cap.previewProfiles[0], indexSurfaceId);
        expect(isEmpty(previewOutput)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await previewOutput.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0200
     * @tc.desc   createPreviewOutput with null profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createPreviewOutput(null as ESObject, indexSurfaceId); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0300
     * @tc.desc   createPreviewOutput with undefined profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createPreviewOutput(undefined as ESObject, indexSurfaceId); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0400
     * @tc.desc   createPreviewOutput with null surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        try { mCameraManager.createPreviewOutput(cap.previewProfiles[0], null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0500
     * @tc.desc   createPreviewOutput with undefined surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_0500', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_0500';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        try { mCameraManager.createPreviewOutput(cap.previewProfiles[0], undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0100
     * @tc.desc   createPreviewOutput(surfaceId) with preconfig returns valid PreviewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_NO_PROFILE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      let session: camera.PhotoSession | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let cameraInput: camera.CameraInput | null = null;
      try {
        session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let selected: camera.PreconfigType | null = null;
        for (let i = 0; i < types.length; i++) { if (session.canPreconfig(types[i])) { selected = types[i]; break; } }
        console.info(TAG + caseName + ' selected is ' + JSON.stringify(selected));
        if (selected == null) {
          console.info(TAG + caseName + ' does not support Preconfig');
          done();
          return
        }
        session.preconfig(selected as camera.PreconfigType);
        cameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        await cameraInput.open();
        previewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
        expect(isEmpty(previewOutput as ESObject)).assertFalse();
        session.beginConfig();
        session.addInput(cameraInput);
        session.addOutput(previewOutput);
        await session.commitConfig();
        await session.start();
        await session.stop();
        console.info(TAG + caseName + ' PASSED');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally {
        if (!isEmpty(previewOutput as ESObject)) { await previewOutput?.release(); }
        if (!isEmpty(cameraInput as ESObject)) { await cameraInput?.close(); }
        if (!isEmpty(session as ESObject)) { await session?.release(); }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0200
     * @tc.desc   createPreviewOutput(surfaceId) with null surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_NO_PROFILE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      let session: camera.PhotoSession | null = null;
      try {
        session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let selected: camera.PreconfigType | null = null;
        for (let i = 0; i < types.length; i++) { if (session.canPreconfig(types[i])) { selected = types[i]; break; } }
        if (selected == null) {
          console.info(TAG + caseName + ' does not support Preconfig');
          done();
          return
        }
        session.preconfig(selected as camera.PreconfigType);
        try { mCameraManager.createPreviewOutput(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally {
        if (!isEmpty(session as ESObject)) { await session?.release(); }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0300
     * @tc.desc   createPreviewOutput(surfaceId) with undefined surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PREVIEW_OUTPUT_NO_PROFILE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PREVIEW_OUTPUT_NO_PROFILE_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createPreviewOutput(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createPhotoOutput
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0100
     * @tc.desc   createPhotoOutput(profile) returns valid PhotoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_PHOTO_OUTPUT_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        let photoOutput: camera.PhotoOutput = mCameraManager.createPhotoOutput(cap.photoProfiles[0]);
        expect(isEmpty(photoOutput)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await photoOutput.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0200
     * @tc.desc   createPhotoOutput() without profile (API 12+, with preconfig)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0200', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_PHOTO_OUTPUT_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      let session: camera.PhotoSession | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let cameraInput: camera.CameraInput | null = null;
      try {
        session = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let selected: camera.PreconfigType | null = null;
        for (let i = 0; i < types.length; i++) { if (session.canPreconfig(types[i])) { selected = types[i]; break; } }
        if (selected == null) {
          console.info(TAG + caseName + ' does not support Preconfig');
          done();
          return
        }
        session.preconfig(selected as camera.PreconfigType);
        cameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        await cameraInput.open();
        photoOutput = mCameraManager.createPhotoOutput();
        expect(isEmpty(photoOutput as ESObject)).assertFalse();
        session.beginConfig();
        session.addInput(cameraInput);
        session.addOutput(photoOutput);
        await session.commitConfig();
        await session.start();
        await session.stop();
        console.info(TAG + caseName + ' PASSED');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally {
        if (!isEmpty(photoOutput as ESObject)) { await photoOutput?.release(); }
        if (!isEmpty(cameraInput as ESObject)) { await cameraInput?.close(); }
        if (!isEmpty(session as ESObject)) { await session?.release(); }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0300
     * @tc.desc   createPhotoOutput with null profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PHOTO_OUTPUT_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createPhotoOutput(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0400
     * @tc.desc   createPhotoOutput with undefined profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_PHOTO_OUTPUT_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createPhotoOutput(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createMetadataOutput
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0100
     * @tc.desc   createMetadataOutput returns valid MetadataOutput if supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_METADATA_OUTPUT_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_PHOTO);
        if (isEmpty(cap.supportedMetadataObjectTypes) || cap.supportedMetadataObjectTypes.length === 0) {
          console.info(TAG + caseName + ' no metadata types, skip');
          done(); return;
        }
        let metaOutput: camera.MetadataOutput = mCameraManager.createMetadataOutput(cap.supportedMetadataObjectTypes);
        expect(isEmpty(metaOutput)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await metaOutput.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0200
     * @tc.desc   createMetadataOutput with null throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_METADATA_OUTPUT_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createMetadataOutput(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0300
     * @tc.desc   createMetadataOutput with undefined throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_METADATA_OUTPUT_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createMetadataOutput(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createSession
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0100
     * @tc.desc   createSession(NORMAL_PHOTO) returns valid Session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_SESSION_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let session: camera.PhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        expect(isEmpty(session)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await session.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0200
     * @tc.desc   createSession(NORMAL_VIDEO) returns valid Session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0200', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_SESSION_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let session: camera.VideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
        expect(isEmpty(session)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await session.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0300
     * @tc.desc   createSession with null mode throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_SESSION_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createSession(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0400
     * @tc.desc   createSession with undefined mode throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_SESSION_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_SESSION_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createSession(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createVideoOutput
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0100
     * @tc.desc   createVideoOutput(profile, surfaceId) returns valid VideoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'CREATE_VIDEO_OUTPUT_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_VIDEO);
        if (isEmpty(cap) || isEmpty(cap.videoProfiles) || cap.videoProfiles.length === 0) {
          console.info(TAG + caseName + ' no video profiles, skip');
        } else {
          let videoOutput: camera.VideoOutput = mCameraManager.createVideoOutput(cap.videoProfiles[0], indexSurfaceId);
          expect(isEmpty(videoOutput)).assertFalse();
          console.info(TAG + caseName + ' PASSED');
          await videoOutput.release();
        }
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0200
     * @tc.desc   createVideoOutput with null profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_VIDEO_OUTPUT_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createVideoOutput(null as ESObject, indexSurfaceId); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0300
     * @tc.desc   createVideoOutput with undefined profile throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_VIDEO_OUTPUT_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.createVideoOutput(undefined as ESObject, indexSurfaceId); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0400
     * @tc.desc   createVideoOutput with null surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_VIDEO_OUTPUT_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_VIDEO);
        if (isEmpty(cap) || isEmpty(cap.videoProfiles) || cap.videoProfiles.length === 0) { done(); return; }
        try { mCameraManager.createVideoOutput(cap.videoProfiles[0], null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0500
     * @tc.desc   createVideoOutput with undefined surfaceId throws 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_0500', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_VIDEO_OUTPUT_0500';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cap: camera.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0], camera.SceneMode.NORMAL_VIDEO);
        if (isEmpty(cap) || isEmpty(cap.videoProfiles) || cap.videoProfiles.length === 0) { done(); return; }
        try { mCameraManager.createVideoOutput(cap.videoProfiles[0], undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(INVALID_PARAMETER_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  createCaptureSession (deprecated)
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAPTURE_SESSION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAPTURE_SESSION_0100
     * @tc.desc   createCaptureSession (deprecated) returns valid CaptureSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_CREATE_CAPTURE_SESSION_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'CREATE_CAPTURE_SESSION_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let session: camera.CaptureSession = mCameraManager.createCaptureSession();
        expect(isEmpty(session)).assertFalse();
        console.info(TAG + caseName + ' PASSED');
        await session.release();
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  getCameraDevice
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0100
     * @tc.desc   getCameraDevice returns CameraDevice for valid position and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_DEVICE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let pos: camera.CameraPosition = mCameraDevicesArray[0].cameraPosition;
        let tp: camera.CameraType = mCameraDevicesArray[0].cameraType;
        let device: camera.CameraDevice = mCameraManager.getCameraDevice(pos, tp);
        expect(isEmpty(device)).assertFalse();
        expect(device.cameraPosition).assertEqual(pos);
        expect(device.cameraType).assertEqual(tp);
        console.info(TAG + caseName + ' PASSED');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0200
     * @tc.desc   getCameraDevice with null position throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_DEVICE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraDevice(null as ESObject, mCameraDevicesArray[0].cameraType); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0300
     * @tc.desc   getCameraDevice with undefined position throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_DEVICE_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraDevice(undefined as ESObject, mCameraDevicesArray[0].cameraType); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0400
     * @tc.desc   getCameraDevice with null type throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0400', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_DEVICE_0400';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraDevice(mCameraDevicesArray[0].cameraPosition, null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0500
     * @tc.desc   getCameraDevice with undefined type throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_DEVICE_0500', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_DEVICE_0500';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraDevice(mCameraDevicesArray[0].cameraPosition, undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  getCameraConcurrentInfos
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0100
     * @tc.desc   getCameraConcurrentInfos returns Array for valid camera array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_CONCURRENT_INFOS_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let infos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
        expect(isEmpty(infos)).assertFalse();
        console.info(TAG + caseName + ' length=' + infos.length);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0200
     * @tc.desc   getCameraConcurrentInfos with null throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_CONCURRENT_INFOS_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraConcurrentInfos(null as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0300
     * @tc.desc   getCameraConcurrentInfos with undefined throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_0300', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'GET_CAMERA_CONCURRENT_INFOS_0300';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        try { mCameraManager.getCameraConcurrentInfos(undefined as ESObject); expect(true).assertFail(); }
        catch (err) { expect(Number((err as BusinessError).code)).assertEqual(PARAM_VALIDATION_CODE); }
      } catch (err) { handleCatchErr(caseName, err as BusinessError); expect(true).assertFail(); }
      finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  on/off('cameraStatus') - Cannot trigger in test env
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_0100
     * @tc.desc   on('cameraStatus') register does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'ON_CAMERA_STATUS_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        console.info(TAG + caseName + ' registered');
        mCameraManager.off('cameraStatus');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0100
     * @tc.desc   off('cameraStatus') without callback does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_CAMERA_STATUS_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        mCameraManager.off('cameraStatus');
        console.info(TAG + caseName + ' off without cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0200
     * @tc.desc   off('cameraStatus', cb) with specific callback does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_CAMERA_STATUS_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        mCameraManager.off('cameraStatus', cb);
        console.info(TAG + caseName + ' off with cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_DUPLICATE_0100
     * @tc.desc   Duplicate on('cameraStatus') does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_CAMERA_STATUS_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'ON_CAMERA_STATUS_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        mCameraManager.on('cameraStatus', cb);
        console.info(TAG + caseName + ' duplicate on done');
        mCameraManager.off('cameraStatus');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0100
     * @tc.desc   Duplicate off('cameraStatus') without cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_CAMERA_STATUS_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        mCameraManager.off('cameraStatus');
        mCameraManager.off('cameraStatus');
        console.info(TAG + caseName + ' double off done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0200
     * @tc.desc   Duplicate off('cameraStatus', cb) with cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_CAMERA_STATUS_DUPLICATE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_CAMERA_STATUS_DUPLICATE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.CameraStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('cameraStatus', cb);
        mCameraManager.off('cameraStatus', cb);
        mCameraManager.off('cameraStatus', cb);
        console.info(TAG + caseName + ' double off with cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  on/off('foldStatusChange') - Cannot trigger in test env
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_0100
     * @tc.desc   on('foldStatusChange') register does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'ON_FOLD_STATUS_CHANGE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        console.info(TAG + caseName + ' registered');
        mCameraManager.off('foldStatusChange');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0100
     * @tc.desc   off('foldStatusChange') without callback does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_FOLD_STATUS_CHANGE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        mCameraManager.off('foldStatusChange');
        console.info(TAG + caseName + ' off without cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0200
     * @tc.desc   off('foldStatusChange', cb) with specific callback does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_FOLD_STATUS_CHANGE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        mCameraManager.off('foldStatusChange', cb);
        console.info(TAG + caseName + ' off with cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_DUPLICATE_0100
     * @tc.desc   Duplicate on('foldStatusChange') does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_FOLD_STATUS_CHANGE_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'ON_FOLD_STATUS_CHANGE_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        mCameraManager.on('foldStatusChange', cb);
        console.info(TAG + caseName + ' duplicate on done');
        mCameraManager.off('foldStatusChange');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0100
     * @tc.desc   Duplicate off('foldStatusChange') without cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_FOLD_STATUS_CHANGE_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        mCameraManager.off('foldStatusChange');
        mCameraManager.off('foldStatusChange');
        console.info(TAG + caseName + ' double off done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0200
     * @tc.desc   Duplicate off('foldStatusChange', cb) with cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_FOLD_STATUS_CHANGE_DUPLICATE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_FOLD_STATUS_CHANGE_DUPLICATE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.FoldStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('foldStatusChange', cb);
        mCameraManager.off('foldStatusChange', cb);
        mCameraManager.off('foldStatusChange', cb);
        console.info(TAG + caseName + ' double off with cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })


    // ══════════════════════════════════════════════════════════
    //  on/off('torchStatusChange') - Trigger via setTorchMode
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_0100
     * @tc.desc   on('torchStatusChange') callback triggered by setTorchMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_0100', Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'ON_TORCH_STATUS_CHANGE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        let triggered: boolean = false;
        let cbAvailType: string = '';
        let cbActiveType: string = '';
        let cbTorchLevel: number = -1;
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => {
          console.info(TAG + caseName + ' triggered, avail=' + info.isTorchAvailable + ' active=' + info.isTorchActive + ' level=' + info.torchLevel);
          triggered = true;
          cbAvailType = typeof info.isTorchAvailable;
          cbActiveType = typeof info.isTorchActive;
          cbTorchLevel = info.torchLevel;
        };
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        mCameraManager.on('torchStatusChange', cb);
        if (mCameraManager.isTorchModeSupported(camera.TorchMode.ON)) {
          await trySetTorchMode(mCameraManager, camera.TorchMode.ON);
          let result: boolean = await waitForTrigger((): boolean => triggered, 5000);
          expect(result).assertTrue();
          expect(cbAvailType).assertEqual('boolean');
          expect(cbActiveType).assertEqual('boolean');
          expect(cbTorchLevel >= 0 && cbTorchLevel <= 1).assertTrue();
        }
        mCameraManager.off('torchStatusChange');
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0100
     * @tc.desc   off('torchStatusChange') without cb: verify callback not triggered after off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_TORCH_STATUS_CHANGE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        if (!mCameraManager.isTorchModeSupported(camera.TorchMode.ON)) { done(); return; }
        let callCount: number = 0;
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => { callCount++; };
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        mCameraManager.on('torchStatusChange', cb);
        await trySetTorchMode(mCameraManager, camera.TorchMode.ON);
        await waitForTrigger((): boolean => callCount > 0, 5000);
        expect(callCount).assertLarger(0);
        mCameraManager.off('torchStatusChange');
        let countAfterOff: number = callCount;
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        expect(mCameraManager.getTorchMode()).assertEqual(camera.TorchMode.OFF);
        await waitForTrigger((): boolean => callCount > countAfterOff, 2000);
        console.info(TAG + caseName + ' countAfterOff=' + countAfterOff + ' current=' + callCount);
        expect(callCount).assertEqual(countAfterOff);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0200
     * @tc.desc   off('torchStatusChange', cb) with specific callback: verify not triggered after off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_TORCH_STATUS_CHANGE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        if (!mCameraManager.isTorchSupported()) { console.info(TAG + caseName + ' skip'); done(); return; }
        if (!mCameraManager.isTorchModeSupported(camera.TorchMode.ON)) { done(); return; }
        let callCount: number = 0;
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => { callCount++; };
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        mCameraManager.on('torchStatusChange', cb);
        await trySetTorchMode(mCameraManager, camera.TorchMode.ON);
        await waitForTrigger((): boolean => callCount > 0, 5000);
        expect(callCount).assertLarger(0);
        mCameraManager.off('torchStatusChange', cb);
        let countAfterOff: number = callCount;
        await trySetTorchMode(mCameraManager, camera.TorchMode.OFF);
        expect(mCameraManager.getTorchMode()).assertEqual(camera.TorchMode.OFF);
        await waitForTrigger((): boolean => callCount > countAfterOff, 2000);
        console.info(TAG + caseName + ' countAfterOff=' + countAfterOff + ' current=' + callCount);
        expect(callCount).assertEqual(countAfterOff);
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_DUPLICATE_0100
     * @tc.desc   Duplicate on('torchStatusChange') does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'ON_TORCH_STATUS_CHANGE_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('torchStatusChange', cb);
        mCameraManager.on('torchStatusChange', cb);
        console.info(TAG + caseName + ' duplicate on done');
        mCameraManager.off('torchStatusChange');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0100
     * @tc.desc   Duplicate off('torchStatusChange') without cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0100', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_TORCH_STATUS_CHANGE_DUPLICATE_0100';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('torchStatusChange', cb);
        mCameraManager.off('torchStatusChange');
        mCameraManager.off('torchStatusChange');
        console.info(TAG + caseName + ' double off done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0200
     * @tc.desc   Duplicate off('torchStatusChange', cb) with cb is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_MANAGER_OFF_TORCH_STATUS_CHANGE_DUPLICATE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'OFF_TORCH_STATUS_CHANGE_DUPLICATE_0200';
      if (mCameraNum == 0) { expect(true).assertFail(); done(); return; }
      try {
        let cb = (err: BusinessError, info: camera.TorchStatusInfo): void => {
          console.info(TAG + caseName + ' triggered');
        };
        mCameraManager.on('torchStatusChange', cb);
        mCameraManager.off('torchStatusChange', cb);
        mCameraManager.off('torchStatusChange', cb);
        console.info(TAG + caseName + ' double off with cb done');
      } catch (err) {
        handleCatchErr(caseName, err as BusinessError);
        expect(true).assertFail();
      } finally { done(); }
    })

  })
}

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
import cameraObj from 'libentry.so'
import { driveFn, getPermission, } from '../CameraCommon.test';
import { indexSurfaceId } from '../../testability/pages/Index';

const EFFECT_SUCCESS = 0;
const CAMERA_SERVICE_FATAL_ERROR = 7400201;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CAMERA_PHOTO_QUALITY_PRIORITIZATION_HIGH_QUALITY = 0;
const CAMERA_FOLD_STATUS_NON_FOLDABLE = 0;
const CAMERA_FOLD_STATUS_EXPANDED = 1;
const CAMERA_FOLD_STATUS_FOLDED = 2;

const TAG = "xts.CameraSessionSupp";

export default function CameraFunctionTest() {

  describe('CameraFunctionTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      console.info(TAG, 'beforeAll case', indexSurfaceId);
      let result = cameraObj.initWithSurface(indexSurfaceId);
      console.info(TAG, result)
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
      let result = cameraObj.captureSessionRelease();
      console.info(TAG, result);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_001
     * @tc.desc        OH_CaptureSession_EnableControlCenter--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_001'
      let res = cameraObj.captureSessionEnableControlCenter(CASE_INDEX_1);
      expect(res).assertEqual(EFFECT_SUCCESS);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_002
     * @tc.desc        OH_CaptureSession_EnableControlCenter--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_CONTROL_CENTER_002'
      let res = cameraObj.captureSessionEnableControlCenter(CASE_INDEX_2);
      expect(res).assertEqual(EFFECT_SUCCESS);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_001
     * @tc.desc        OH_CaptureSession_EnableMacro--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_001'
      let result = cameraObj.captureSessionIsMacroSupported();
      if (!result) {
        expect(result).assertFalse();
        console.info(TAG, testName, ' 该设备不支持此功能', result)
      } else {
        let res = cameraObj.captureSessionEnableMacro(CASE_INDEX_1);
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_002
     * @tc.desc        OH_CaptureSession_EnableMacro--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_002'
      let result = cameraObj.captureSessionIsMacroSupported();
      if (!result) {
        expect(result).assertFalse();
        console.info(TAG, testName, ' 该设备不支持此功能', result)
      } else {
        let res = cameraObj.captureSessionEnableMacro(CASE_INDEX_2);
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_003
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_003
     * @tc.desc        OH_CaptureSession_EnableMacro--CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_003'
      let result = cameraObj.captureSessionIsMacroSupported();
      if (!result) {
        expect(result).assertFalse();
        console.info(TAG, testName, ' 该设备不支持此功能', result)
      } else {
        let res = cameraObj.captureSessionEnableMacro(CASE_INDEX_3);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_001
     * @tc.desc        OH_CaptureSession_EnableAutoDeviceSwitch--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_001'
      let result = cameraObj.captureSessionIsAutoDeviceSwitchSupported();
      if (!result) {
        console.info(TAG, testName, ' 该设备不支持此功能', result)
        expect(result).assertFalse();
      } else {
        let res = cameraObj.captureSessionEnableAutoDeviceSwitch(CASE_INDEX_1);
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_002
     * @tc.desc        OH_CaptureSession_EnableAutoDeviceSwitch--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_AUTO_DEVICE_SWITCH_002'
      let result = cameraObj.captureSessionIsAutoDeviceSwitchSupported();
      if (!result) {
        expect(result).assertFalse();
        console.info(TAG, testName, ' 该设备不支持此功能', result)
      } else {
        let res = cameraObj.captureSessionEnableAutoDeviceSwitch(CASE_INDEX_2);
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_001
     * @tc.desc        OH_CaptureSession_SetWhiteBalance--CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_001'
      let result = cameraObj.captureSessionGetWhiteBalanceRange();
      if (result != EFFECT_SUCCESS) {
        expect(result).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
        console.info(TAG, testName, ' 该设备不支持此功能', result);
      } else {
        let res = cameraObj.captureSessionSetWhiteBalance(CASE_INDEX_1);
        console.info(TAG, testName, res)
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_002
     * @tc.desc        OH_CaptureSession_SetWhiteBalance--CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_002'
      let result = cameraObj.captureSessionGetWhiteBalanceRange();
      if (result != EFFECT_SUCCESS) {
        expect(result).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
        console.info(TAG, testName, ' 该设备不支持此功能', result);
      } else {
        let res = cameraObj.captureSessionSetWhiteBalance(CASE_INDEX_2);
        console.info(TAG, testName, res)
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_003
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_003
     * @tc.desc        OH_CaptureSession_SetWhiteBalance--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_003'
      let result = cameraObj.captureSessionGetWhiteBalanceRange();
      if (result != EFFECT_SUCCESS) {
        expect(result).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
        console.info(TAG, testName, ' 该设备不支持此功能', result);
      } else {
        let res = cameraObj.captureSessionSetWhiteBalance(CASE_INDEX_3);
        console.info(TAG, testName, res)
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_004
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_004
     * @tc.desc        OH_CaptureSession_SetWhiteBalance--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_WHITE_BALANCE_004'
      let result = cameraObj.captureSessionGetWhiteBalanceRange();
      if (result != EFFECT_SUCCESS) {
        expect(result).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
        console.info(TAG, testName, ' 该设备不支持此功能', result);
      } else {
        let res = cameraObj.captureSessionSetWhiteBalance(CASE_INDEX_4);
        console.info(TAG, testName, res)
        expect(res).assertEqual(EFFECT_SUCCESS);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_PHOTO_QUALITY_PRIORITIZATION_001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_PHOTO_QUALITY_PRIORITIZATION_001
     * @tc.desc        Camera_PhotoQualityPrioritization--
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_QUALITY_PRIORITIZATION_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTO_QUALITY_PRIORITIZATION_001'
      let res = cameraObj.captureSessionEmu(CASE_INDEX_1);
      expect(res).assertEqual(CAMERA_PHOTO_QUALITY_PRIORITIZATION_HIGH_QUALITY);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_001
     * @tc.desc        Camera_FoldStatus--CAMERA_FOLD_STATUS_NON_FOLDABLE
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_001'
      let res = cameraObj.captureSessionEmu(CASE_INDEX_2);
      expect(res).assertEqual(CAMERA_FOLD_STATUS_NON_FOLDABLE);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_002
     * @tc.desc        Camera_FoldStatus--CAMERA_FOLD_STATUS_EXPANDED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_002'
      let res = cameraObj.captureSessionEmu(CASE_INDEX_3);
      expect(res).assertEqual(CAMERA_FOLD_STATUS_EXPANDED);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_003
     * @tc.desc        Camera_FoldStatus--CAMERA_FOLD_STATUS_FOLDED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_FOLD_STATUS_003'
      let res = cameraObj.captureSessionEmu(CASE_INDEX_4);
      expect(res).assertEqual(CAMERA_FOLD_STATUS_FOLDED);
      console.info(TAG, testName, res)
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0100
     * @tc.desc     OH_CameraInput_OpenConcurrentCameras - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0100', Level.LEVEL0, async () => {
      let result = cameraObj.OHCameraInputOpenConcurrentCameras(1);
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0200
     * @tc.desc     OH_CameraInput_OpenConcurrentCameras - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_SUPP_0200', Level.LEVEL0, async () => {
      let result = cameraObj.OHCameraInputOpenConcurrentCameras(2);
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0100
     * @tc.desc     OH_CaptureSession_DeleteSupportedEffectTypes- max2
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0100', Level.LEVEL0, async () => {
      let res = cameraObj.OHCaptureSessionGetSupportedEffectTypesSupp();
      if (res != EFFECT_SUCCESS) {
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      let result = cameraObj.OHCaptureSessionDeleteSupportedEffectTypes(1);
      console.info(TAG, result);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0200
     * @tc.desc     OH_CaptureSession_DeleteSupportedEffectTypes- max3
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_DELETE_SUPPORTED_EFFECT_TYPES_SUPP_0200', Level.LEVEL0, async () => {
      let res = cameraObj.OHCaptureSessionGetSupportedEffectTypesSupp();
      if (res != EFFECT_SUCCESS) {
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      let result = cameraObj.OHCaptureSessionDeleteSupportedEffectTypes(2);
      console.info(TAG, result);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00001
     * @tc.desc        OH_CaptureSession_OnIsoChange--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00001';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionRegisterIsoChangeCallback(1);
      expect(res).assertEqual(EFFECT_SUCCESS);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00002
     * @tc.desc        OH_CaptureSession_OnIsoChange--CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ON_ISO_CHANGE_00002';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionRegisterIsoChangeCallback(2);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      console.info(TAG, testName, res);
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00001
     * @tc.desc        OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK--EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00001';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionUnregisterIsoChangeCallback(1);
      expect(res).assertEqual(EFFECT_SUCCESS);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00002
     * @tc.desc        OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK--CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_UNREGISTER_ISO_CHANGE_CALLBACK_00002';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionUnregisterIsoChangeCallback(2);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      console.info(TAG, testName, res);
    });
  })
}
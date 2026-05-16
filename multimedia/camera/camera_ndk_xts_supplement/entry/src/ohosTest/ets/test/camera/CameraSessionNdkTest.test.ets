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

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_ERR_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_ERR_0100
     * @tc.desc     OH_CameraInput_OpenConcurrentCameras - CAMERA_CONFLICT_CAMERA
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_OPEN_CONCURRENT_CAMERAS_ERR_0100', Level.LEVEL0, async () => {
      let result = cameraObj.OHCameraInputOpenConcurrentCamerasErr(1);
      console.info(TAG, result);
      expect(result).assertEqual(7400107);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0100
     * @tc.desc     OH_CameraManager_CreateDeferredPreviewOutput - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestCreateDeferredPreviewOutputSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0200
     * @tc.desc     OH_CameraManager_CreateDeferredPreviewOutput - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestCreateDeferredPreviewOutputWithNullArgs();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0300
     * @tc.desc     OH_CameraManager_CreateDeferredPreviewOutput - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_CREATE_DEFERRED_PREVIEW_OUTPUT_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestCreateDeferredPreviewOutputWithInvalidProfile();
      console.info(TAG, result);
      expect(result).assertEqual(7400201);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0100
     * @tc.desc     OH_CameraManager_IsTorchLevelControlSupported - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestIsTorchLevelControlSupportedErr();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0200
     * @tc.desc     OH_CameraManager_IsTorchLevelControlSupported - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_IS_TORCG_LEVEL_CONTROL_SUPPORTED_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestIsTorchLevelControlSupportedSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_TORCH_MODE_ON_WITH_LEVEL_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_TORCH_MODE_ON_WITH_LEVEL_0100
     * @tc.desc     OH_CameraManager_SetTorchModeOnWithLevel - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_TORCH_MODE_ON_WITH_LEVEL_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetTorchModeOnWithLevelErr();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0100
     * @tc.desc     OH_CaptureSession_GetPhysicalAperture - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetPhysicalApertureSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0200
     * @tc.desc     OH_CaptureSession_GetPhysicalAperture - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetPhysicalApertureWithNullSession();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0300
     * @tc.desc     OH_CaptureSession_GetPhysicalAperture - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_PHYSICAL_APERTRUE_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetPhysicalApertureWithUnconfiguredSession();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0100
     * @tc.desc     OH_CaptureSession_SetPhysicalAperture - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetPhysicalApertureSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0200
     * @tc.desc     OH_CaptureSession_SetPhysicalAperture - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetPhysicalApertureWithNullSession();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0300
     * @tc.desc     OH_CaptureSession_SetPhysicalAperture - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_PHYSICAL_APERTURE_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetPhysicalApertureWithUnconfiguredStream();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100
     * @tc.desc     OH_CaptureSession_GetSupportedExposureDurationRange - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetSupportedExposureDurationRangeSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200
     * @tc.desc     OH_CaptureSession_GetSupportedExposureDurationRange - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetSupportedExposureDurationRangeWithNullSession();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300
     * @tc.desc     OH_CaptureSession_GetSupportedExposureDurationRange - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetSupportedExposureDurationRangeWithUnconfiguredStream();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0100
     * @tc.desc     OH_CaptureSession_SetExposureDuration - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetExposureDurationSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0200
     * @tc.desc     OH_CaptureSession_SetExposureDuration - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetExposureDurationWithInvalidValue();
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0300
     * @tc.desc     OH_CaptureSession_SetExposureDuration - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_SET_EXPOSURE_DURATION_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestSetExposureDurationWithUnconfiguredStream();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0100
     * @tc.desc     OH_CaptureSession_GetExposureDuration - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetExposureDurationSucc();
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0200
     * @tc.desc     OH_CaptureSession_GetExposureDuration - CAMERA_SESSION_NOT_CONFIG
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_GET_EXPOSURE_DURATION_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestGetExposureDurationWithUnconfiguredStream();
      console.info(TAG, result);
      expect(result).assertEqual(7400103);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0300
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0300
     * @tc.desc     OH_PreviewOutput_AddDeferredSurface - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0300', Level.LEVEL0, async () => {
      let result = cameraObj.TestAddDeferredSurfaceWithEmptyStr("");
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0100
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0100
     * @tc.desc     OH_PreviewOutput_AddDeferredSurface - CAMERA_OK
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0100', Level.LEVEL0, async () => {
      let result = cameraObj.TestAddDeferredSurfaceSucc(indexSurfaceId);
      console.info(TAG, result);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0200
     * @tc.name     SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0200
     * @tc.desc     OH_PreviewOutput_AddDeferredSurface - CAMERA_INVALID_ARGUMENT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_ADD_DEFERRED_SURFACE_0200', Level.LEVEL0, async () => {
      let result = cameraObj.TestAddDeferredSurfaceErr(indexSurfaceId);
      console.info(TAG, result);
      expect(result).assertEqual(7400101);
    });
    
  })
}
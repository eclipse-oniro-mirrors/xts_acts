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
import { driveFn, getPermission, sleep, } from '../CameraCommon.test';
import { indexSurfaceId } from '../../testability/pages/Index';

const EFFECT_SUCCESS = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_SERVICE_FATAL_ERROR = 7400201;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020 = 4;

const TAG = "xts.CameraSessionSupp";

export default function CameraNdkTest() {
  describe('CameraNdkTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      console.info(TAG, 'beforeAll case', indexSurfaceId);
      let result = cameraObj.initWithSurfaces(indexSurfaceId);
      console.info(TAG, result)
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(200);
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00001
     * @tc.desc        OH_CameraManager_DeleteCameraDevices  --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00001'
      let res = cameraObj.captureDeleteCameraDevices(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00002
     * @tc.desc        OH_CameraManager_DeleteCameraDevices  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00002'
      let res = cameraObj.captureDeleteCameraDevices(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00003
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00003
     * @tc.desc        OH_CameraManager_DeleteCameraDevices  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00003'
      let res = cameraObj.captureDeleteCameraDevices(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00004
     * @tc.desc        OH_CameraManager_DeleteCameraDevices  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00004'
      let res = cameraObj.captureDeleteCameraDevices(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00005
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00005
     * @tc.desc        OH_CameraManager_DeleteCameraDevices  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_DELETE_CAMERA_DEVICE_00005'
      let res = cameraObj.captureDeleteCameraDevices(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00001
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00001
     * @tc.desc        OH_PreviewOutput_IsBandwidthCompressionSupported --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00001'
      let res = cameraObj.captureIsBandwidthCompressionSupported(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00002
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00002
     * @tc.desc        OH_PreviewOutput_IsBandwidthCompressionSupported  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00002'
      let res = cameraObj.captureIsBandwidthCompressionSupported(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00003
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00003
     * @tc.desc        OH_PreviewOutput_IsBandwidthCompressionSupported  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00003'
      let res = cameraObj.captureIsBandwidthCompressionSupported(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00004
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00004
     * @tc.desc        OH_PreviewOutput_IsBandwidthCompressionSupported --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00004'
      let res = cameraObj.captureIsBandwidthCompressionSupported(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00005
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00005
     * @tc.desc        OH_PreviewOutput_IsBandwidthCompressionSupported  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_IS_BANDWIDTH_COMPRESSION_SUPPORTED_00005'
      let res = cameraObj.captureIsBandwidthCompressionSupported(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00001
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00001
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00001'
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_1);
        console.info(TAG, testName, res);
        expect(res).assertEqual(EFFECT_SUCCESS);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00002
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00002
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00002'
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_1);
        console.info(TAG, testName, res);
        expect(res).assertEqual(EFFECT_SUCCESS);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00003
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00003
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00003'
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_3);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00004
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00004
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00004';
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_4);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00005
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00005
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00005';
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_5);
        console.info(TAG, testName, res);
        expect(res).assertEqual(EFFECT_SUCCESS);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00006
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00006
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00006', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00006';
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_6);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00007
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00007
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00007', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00007';
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_7);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00008
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00008
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00008', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_00008';
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompression(CASE_INDEX_8);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00001
     * @tc.desc        OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00001',
      Level.LEVEL0, async () => {
        const testName =
          'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00001'
        let result = cameraObj.captureIsGetCameraDevices();
        if (result) {
          let res = cameraObj.captureGetSupportedFullCameraOutputCapabilityWithSceneMode(CASE_INDEX_1);
          console.info(TAG, testName, res);
          expect(res).assertEqual(EFFECT_SUCCESS);
        } else {
          console.info(TAG, testName, ' 该设备不支持此功能', result);
          expect(result).assertFalse();
        }
      });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00004
     * @tc.desc        OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00004',
      Level.LEVEL0, async () => {
        const testName =
          'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00004'
        let res = cameraObj.captureGetSupportedFullCameraOutputCapabilityWithSceneMode(CASE_INDEX_4);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00005
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00005
     * @tc.desc        OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00005',
      Level.LEVEL0, async () => {
        const testName =
          'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00005'
        let res = cameraObj.captureGetSupportedFullCameraOutputCapabilityWithSceneMode(CASE_INDEX_5);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00006
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00006
     * @tc.desc        OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode  --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00006',
      Level.LEVEL0, async () => {
        const testName =
          'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_SUPPORTED_FULL_CAMERA_OUTPUT_CAPABILITY_WITH_SCENE_MODE_00006'
        let res = cameraObj.captureGetSupportedFullCameraOutputCapabilityWithSceneMode(CASE_INDEX_6);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
      });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001
     * @tc.desc        OH_CameraInput_RegisterOcclusionDetectionCallback --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001'
      let res = cameraObj.captureRegisterOcclusionDetectionCallback(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002
     * @tc.desc        OH_CameraInput_RegisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002'
      let res = cameraObj.captureRegisterOcclusionDetectionCallback(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003
     * @tc.desc        OH_CameraInput_RegisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003'
      let res = cameraObj.captureRegisterOcclusionDetectionCallback(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004
     * @tc.desc        OH_CameraInput_RegisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004'
      let res = cameraObj.captureRegisterOcclusionDetectionCallback(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005
     * @tc.desc        OH_CameraInput_RegisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005'
      let res = cameraObj.captureRegisterOcclusionDetectionCallback(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001
     * @tc.desc        OH_CameraInput_UnregisterOcclusionDetectionCallback --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00001'
      let res = cameraObj.captureUnregisterOcclusionDetectionCallback(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002
     * @tc.desc        OH_CameraInput_UnregisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00002'
      let res = cameraObj.captureUnregisterOcclusionDetectionCallback(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003
     * @tc.desc        OH_CameraInput_UnregisterOcclusionDetectionCallback --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00003'
      let res = cameraObj.captureUnregisterOcclusionDetectionCallback(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004
     * @tc.desc        OH_CameraInput_UnregisterOcclusionDetectionCallback --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00004'
      let res = cameraObj.captureUnregisterOcclusionDetectionCallback(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005
     * @tc.desc        OH_CameraInput_UnregisterOcclusionDetectionCallback --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_INPUT_UN_REGISTER_OCCLUSION_DETECTION_CALLBACK_00005'
      let res = cameraObj.captureUnregisterOcclusionDetectionCallback(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_PRECONFIG_TYPE_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_PRECONFIG_TYPE_00001
     * @tc.desc        CAMERA_PRECONFIG_TYPE --PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_PRECONFIG_TYPE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PRECONFIG_TYPE_00001'
      let res = cameraObj.captureCameraPreconfigType();
      console.info(TAG, testName, res);
      expect(res).assertEqual(PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00001
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00001'
      let res = cameraObj.captureGetCameraDevices(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00002
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00002'
      let res = cameraObj.captureGetCameraDevices(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00003
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00003
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00003'
      let res = cameraObj.captureGetCameraDevices(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00004
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00004'
      let res = cameraObj.captureGetCameraDevices(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00005
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00005
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_00005'
      let res = cameraObj.captureGetCameraDevices(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00001
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00001
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00001'
      let res = cameraObj.captureGetCameraDevicesError(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00002
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00002
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00002'
      let res = cameraObj.captureGetCameraDevicesError(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00003
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00003
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00003'
      let res = cameraObj.captureGetCameraDevicesError(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00004
     * @tc.name        SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00004
     * @tc.desc        OH_CameraManager_GetCameraDevices --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAMERA_MANAGER_GET_CAMERA_DEVICE_ERROR_00004'
      let res = cameraObj.captureGetCameraDevicesError(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00001
     * @tc.desc        cameraType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00001'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraType(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00002
     * @tc.desc        cameraType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00002'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraType(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00003
     * @tc.desc        cameraType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00003'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraType(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00004
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00004
     * @tc.desc        cameraType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00004'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraType(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00005
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00005
     * @tc.desc        cameraType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_00005'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraType(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00006
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00006
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00006', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00006'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionTypes(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00007
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00007
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00007', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00007'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionTypes(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00008
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00008
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00008', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00008'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionTypes(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00009
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00009
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00009', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00009'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionTypes(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00010
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00010
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00010', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00010'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionTypes(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00001
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00001'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionType(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00002
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00002'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionType(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00003
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00003'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionType(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00004
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00004
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00004'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionType(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00005
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00005
     * @tc.desc        connectionType --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CONNECTION_TYPE_00005'
      let res = cameraObj.captureCameraDeviceQueryInfoConnectionType(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00001
     * @tc.desc        cameraPosition --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00001'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraPositions(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00002
     * @tc.desc        cameraPosition --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00002'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraPositions(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00003
     * @tc.desc        cameraPosition --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00003'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraPositions(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00004
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00004
     * @tc.desc        cameraPosition --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00004'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraPositions(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00005
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00005
     * @tc.desc        cameraPosition --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_POSITION_00005'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraPositions(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00001
     * @tc.desc        cameraTypeSize --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00001'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSize(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00002
     * @tc.desc        cameraTypeSize --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00002'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSize(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00003
     * @tc.desc        cameraTypeSize --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00003'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSize(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00004
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00004
     * @tc.desc        cameraTypeSize --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00004'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSize(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00005
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00005
     * @tc.desc        cameraTypeSize --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00005'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSize(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00006
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00006
     * @tc.desc        cameraTypeSize --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00006', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00006'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSizes(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00007
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00007
     * @tc.desc        cameraTypeSize --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00007', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00007'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSizes(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00008
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00008
     * @tc.desc        cameraTypeSize --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00008', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00008'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSizes(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00009
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00009
     * @tc.desc        cameraTypeSize --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00009', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00009'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSizes(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00010
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00010
     * @tc.desc        cameraTypeSize --EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00010', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_CAMERA_TYPE_SIZE_00010'
      let res = cameraObj.captureCameraDeviceQueryInfoCameraTypeSizes(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00001
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00001
     * @tc.desc        Camera_DeviceQueryInfo --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00001'
      let res = cameraObj.captureCameraDeviceQueryInfo(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00002
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00002
     * @tc.desc        Camera_DeviceQueryInfo --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00002'
      let res = cameraObj.captureCameraDeviceQueryInfo(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00003
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00003
     * @tc.desc        Camera_DeviceQueryInfo --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00003'
      let res = cameraObj.captureCameraDeviceQueryInfo(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00004
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00004
     * @tc.desc        Camera_DeviceQueryInfo --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00004'
      let res = cameraObj.captureCameraDeviceQueryInfo(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00005
     * @tc.name        SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00005
     * @tc.desc        Camera_DeviceQueryInfo --CAMERA_SERVICE_FATAL_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00005', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_DEVICE_QUERY_INFO_00005'
      let res = cameraObj.captureCameraDeviceQueryInfo(CASE_INDEX_5);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00001
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00001
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression --CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00001'
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompressionError(CASE_INDEX_1);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00002
     * @tc.name        SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00002
     * @tc.desc        OH_PreviewOutput_EnableBandwidthCompression --CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_PREVIEW_OUTPUT_ENABLE_BANDWIDTH_COMPRESSION_ERROR_00002'
      let result = cameraObj.captureSessionIsBandwidthCompressionSupportedTest();
      if (result) {
        let res = cameraObj.captureEnableBandwidthCompressionError(CASE_INDEX_2);
        console.info(TAG, testName, res);
        expect(res).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      } else {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00001
     * @tc.name        SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00001
     * @tc.desc        OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00001'
      let res = cameraObj.getPreviewRotationWithoutDisplayRotation(CASE_INDEX_1);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00002
     * @tc.name        SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00002
     * @tc.desc        OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00002', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00002'
      let res = cameraObj.getPreviewRotationWithoutDisplayRotation(CASE_INDEX_2);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00003
     * @tc.name        SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00003
     * @tc.desc        OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00003', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00003'
      let res = cameraObj.getPreviewRotationWithoutDisplayRotation(CASE_INDEX_3);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00004
     * @tc.name        SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00004
     * @tc.desc        OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation --CAMERA_INVALID_ARGUMENT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00004', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_GET_PREVIEW_ROTATION_WITHOUT_DISPLAY_ROTATION_00004'
      let res = cameraObj.getPreviewRotationWithoutDisplayRotation(CASE_INDEX_4);
      console.info(TAG, testName, res);
      expect(res).assertEqual(CAMERA_INVALID_ARGUMENT);
    });
  })
}

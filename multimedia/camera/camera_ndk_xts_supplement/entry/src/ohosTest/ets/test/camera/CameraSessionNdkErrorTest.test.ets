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

const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
const CAMERA_SESSION_CONFIG_LOCKED = 7400105;

const TAG = "xts.CameraSessionErrorSupp";

export default function CameraFunctionErrorTest() {
  describe('CameraFunctionErrorTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll case');
      await getPermission();
      await driveFn();
      console.info(TAG + 'beforeAll case', indexSurfaceId);
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
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_001
     * @tc.desc        OH_CaptureSession_AddPreviewOutput--CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_001'
      let res = cameraObj.captureSessionAddPreviewOutput(indexSurfaceId);
      expect(res).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_REMOVE_PREVIEW_OUTPUT_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_REMOVE_PREVIEW_OUTPUT_001
     * @tc.desc        OH_CaptureSession_RemovePreviewOutput--CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_REMOVE_PREVIEW_OUTPUT_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_REMOVE_PREVIEW_OUTPUT_001'
      let res = cameraObj.captureSessionRemovePreviewOutput(indexSurfaceId);
      expect(res).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_BEGIN_CONFIG_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_BEGIN_CONFIG_001
     * @tc.desc        OH_CaptureSession_BeginConfig--CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_BEGIN_CONFIG_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_BEGIN_CONFIG_001'
      let res = cameraObj.captureSessionBeginConfig(indexSurfaceId);
      expect(res).assertEqual(CAMERA_SESSION_CONFIG_LOCKED);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_CONFIG_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_CONFIG_001
     * @tc.desc        OH_CaptureSession_EnableMacro--CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_CONFIG_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_ENABLE_MACRO_CONFIG_001'
      cameraObj.initWithSurface(indexSurfaceId);
      let result = cameraObj.captureSessionIsMacroSupported();
      cameraObj.captureSessionRelease();
      if (!result) {
        console.info(TAG, testName, ' 该设备不支持此功能', result);
        expect(result).assertFalse();
      } else {
        let res = cameraObj.captureSessionEnableMacroConfigAllow();
        console.info(TAG, testName, result);
        expect(res).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_START_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_START_001
     * @tc.desc        OH_CaptureSession_Start--CAMERA_SESSION_NOT_CONFIG
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_START_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_START_001';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionStart();
      expect(res).assertEqual(CAMERA_SESSION_NOT_CONFIG);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001
     * @tc.desc        OH_CaptureSession_IsVideoStabilizationModeSupported--CAMERA_SESSION_NOT_CONFIG
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionIsVideoStabilizationModeSupported();
      expect(res).assertEqual(CAMERA_SESSION_NOT_CONFIG);
      console.info(TAG, testName, res);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001
     * @tc.name        SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001
     * @tc.desc        OH_CaptureSession_SetVideoStabilizationMode--CAMERA_SESSION_NOT_CONFIG
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001', Level.LEVEL0, async () => {
      const testName = 'SUB_MULTIMEDIA_OH_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001';
      console.info(TAG, testName, 'start');
      let res = cameraObj.captureSessionSetVideoStabilizationMode();
      expect(res).assertEqual(CAMERA_SESSION_NOT_CONFIG);
      console.info(TAG, testName, res);
    });
  })
}
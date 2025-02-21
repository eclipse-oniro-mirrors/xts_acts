/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import CameraFunctionTest from './CameraFunctionTest.test';
import CameraInputTest from './CameraInputTest.test';
import CameraSessionExposureTest from './CameraSessionExposureTest.test';
import CameraSessionBaseTest from './CameraSessionBaseTest.test';
import CameraSessionFlashTest from './CameraSessionFlashTest.test';
import CameraSessionFocusTest from './CameraSessionFocusTest.test';
import CameraSessionZoomRatioTest from './CameraSessionZoomRatioTest.test';
import CameraSessionVideoStabilizationTest from './CameraSessionVideoStabilizationTest.test';
import CameraImageProcessingTest from './CameraImageProcessingTest.test';
import CameraErrorCodeUsecaseTest from './CameraErrorCodeUsecaseTest.test';
import cameraJSUnitOutput from './CameraJSUnitOutput.test';
import call from  '@ohos.telephony.call'
import CameraManagerTest from './CameraManager.test';
import SessionTest from './Session.test';
import SecureCameraTest from './SecureCamera.test';
import PhotoTest from './PhotoTest.test';
import CameraSessionCameraRotationTest from './CameraSessionCameraRotationTest.test';

let voice = call.hasVoiceCapability()

export default function testsuite() {
    if (!voice){
          CameraSessionExposureTest();
          CameraSessionBaseTest();
          CameraSessionFlashTest();
          CameraSessionFocusTest();
          CameraSessionZoomRatioTest();
          CameraSessionVideoStabilizationTest();
          CameraImageProcessingTest();
          CameraErrorCodeUsecaseTest();
          cameraJSUnitOutput();
          SessionTest();
          PhotoTest();
          SecureCameraTest();
          CameraManagerTest();
          CameraSessionCameraRotationTest();
    }else{
          CameraFunctionTest();
          CameraInputTest();
    }
    
}
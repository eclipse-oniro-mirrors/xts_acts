/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import cameraJSUnitOutput from './CameraJSUnitOutput.test.ets'
import cameraSessionFlashTest from './CameraSessionFlashTest.test.ets'
import cameraSessionExposureTest from './CameraSessionExposureTest.test.ets'
import cameraSessionFocusTest from './CameraSessionFocusTest.test.ets'
import cameraSessionZoomRatioTest from './CameraSessionZoomRatioTest.test.ets'
import cameraSessionVideoStabilizationTest from './CameraSessionVideoStabilizationTest.test.ets'
import cameraSessionBaseTest from './CameraSessionBaseTest.test.ets'
import cameraInputTest from './CameraInputTest.test.ets'
import CameraErrorCodeUsecaseTest from './CameraErrorCodeUsecaseTest.test.ets'
import cameraManagerTest from './CameraManagerTest.test.ets'
import cameraPreconfigTest from './CameraPreconfigTest.test.ets'
import cameraEnumTest from './CameraEnumTest.test.ets'
import cameraVideoSuperStabilizationTest from './CameraVideoSuperStabilizationTest.test.ets'
import cameraTorchTest from './CameraTorchTest.test.ets'
import cameraSecureSessionTest from './CameraSecureSessionTest.test.ets'
import CameraSessionCameraRotationTest from './CameraSessionCameraRotationTest.test.ets'
import CameraVideoCodecTypeTest from './CameraVideoCodecTypeTest.test.ets'
import cameraSessionAutoDeviceSwitchTest from './CameraSessionAutoDeviceSwitchTest.test.ets'
import CameraMirrorTest from './CameraMirrorTest.test.ets'
import CameraVideoQualityPrioritizationTest from './CameraVideoQualityPrioritizationTest.test.ets'

let TAG = 'CameraModuleTest: '

export default function cameraKit() {
  console.info(TAG + 'Entering cameraKit')
  CameraVideoQualityPrioritizationTest()
  cameraTorchTest()
  cameraInputTest()
  cameraVideoSuperStabilizationTest()
  cameraJSUnitOutput()
  cameraSessionFlashTest()
  cameraSessionExposureTest()
  cameraSessionFocusTest()
  cameraSessionZoomRatioTest()
  cameraSessionVideoStabilizationTest()
  cameraSessionBaseTest()
  CameraErrorCodeUsecaseTest()
  cameraManagerTest()
  cameraPreconfigTest()
  cameraEnumTest()
  cameraSecureSessionTest()
  CameraSessionCameraRotationTest()
  CameraVideoCodecTypeTest()
  cameraSessionAutoDeviceSwitchTest()
  CameraMirrorTest()
}

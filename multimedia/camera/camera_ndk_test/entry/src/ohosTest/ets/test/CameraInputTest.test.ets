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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import cameraObj from 'libentry.so';
import { GlobalThis } from './Constants';
import { cameraInfo } from '../../../main/cpp/types/libentry';
import { camera } from '@kit.CameraKit';

const TAG = "CameraXts CameraInputTest: ";

let mCameraSession: number;

async function getCameraManagerInstance() {
  let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
  if (ret) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getCameraSupportDevicesArray() {
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  let cameraInfo: cameraObj.cameraInfo = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + cameraInfo.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + cameraInfo.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + cameraInfo.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + cameraInfo.cameraId);
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
  return true;
}

function beginCameraSessionConfig() {
  console.info('Enter beginCameraSessionConfig');
  console.info(TAG + "Entering beginConfig start");
  cameraObj.sessionBegin();
  console.info(TAG + "Entering beginConfig end");
  console.info('Exit beginCameraSessionConfig');
  return true;
}

async function commitCameraSessionConfig() {
  console.info('Enter commitCameraSessionConfig');
  cameraObj.sessionCommitConfig();

  console.info('Exit commitCameraSessionConfig');
  return true;
}

function createCameraSessionInstance() {
  console.info(TAG + 'Enter createCameraSessionInstance');
  let ret = cameraObj.createSession();
  if (ret) {
    console.info(TAG + "createCaptureSession FAILED");
    return false;
  }
  beginCameraSessionConfig();
  console.info(TAG + 'Exit createCameraSessionInstance');
  return true;
}

async function releaseCameraSessionInstance() {
  await cameraObj.sessionRelease();
}

async function createInput() {
  console.info(TAG + 'Enter createInput');
  let ret = cameraObj.createCameraInput();
  if (ret) {
    console.info(TAG + "createCameraInput FAILED");
    return false;
  }
  await cameraObj.cameraInputOpen();
  console.info(TAG + 'Exit createInput');
  return true;
}

async function releaseInput() {
  console.info('Enter releaseInput');
  cameraObj.cameraInputClose();
  console.info('Exit releaseInput');
  return true;
}

function createOutput() {
  console.info('Enter createOutput');
  cameraObj.getSupportedOutputCapability();
  console.info('Exit createOutputs');

  return true;
}

function createPreviewOutput() {
  console.info(TAG + 'Enter createPreviewOutput');
  let ret = cameraObj.createPreviewOutput();
  if (ret) {
    console.info(TAG + "createPreviewOutput FAILED");
  }
  console.info(TAG + "createPreviewOutput: " + ret);

  console.info(TAG + 'Exit createPreviewOutputs');
  return true;
}

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  await createInput();
  cameraObj.sessionAddInput();

  createPreviewOutput();
  cameraObj.sessionAddPreviewOutput();

  await commitCameraSessionConfig();
  cameraObj.sessionStart();

  console.info(TAG + "Exit startCameraSession");

  return true;
}

function getIsCameraPositionWithTypeSupported(cameraPosition: number, cameraType: number): boolean {
  let cameraInfos: Array<cameraInfo> = cameraObj.oHCameraManagerGetSupportedCameraInfos(0);
  for (let i = 0; i < cameraInfos.length; i++) {
    if(cameraInfos[i].cameraPosition == cameraPosition && cameraInfos[i].cameraType == cameraType) {
      return true;
    }
  }
  return false;
}

export default function CameraInputTest() {
  describe('CameraInputTest', () => {
    console.info(TAG + '----------CameraInputTest--------------');
    beforeAll(async () => {
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createOutput();
      createCameraSessionInstance();
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100
     * @tc.desc   camera status callback on CameraInput async api for error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100 start for camera");
      await startCameraSession();
      await createInput();
      let ret = cameraObj.cameraInputOpen();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ON_ERROR_0100 end for camera");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
     * @tc.desc   open/close Camera with cameraInput callback api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100--------------");
      await startCameraSession();
      let ret = cameraObj.sessionBegin();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + "CameraCallbackCode = " + cameraObj.getCameraCallbackCode());
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
     * @tc.desc   open/close Camera with cameraInput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100', Level.LEVEL0, async () => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100";
      console.info(functionTag);
      await startCameraSession();
      let ret = cameraObj.cameraInputClose();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_UNREGISTER_CALLBACK_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_UNREGISTER_CALLBACK_PROMISE_0100
     * @tc.desc   unregister Camera with cameraInput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_UNREGISTER_CALLBACK_PROMISE_0100', Level.LEVEL0, async () => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_UNREGISTER_CALLBACK_PROMISE_0100";
      console.info(functionTag);
      await startCameraSession();
      let ret = cameraObj.cameraInputRelease();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_UNREGISTER_CALLBACK_PROMISE_0100 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100
     * @tc.desc   create CameraInput with position and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100--------------");
      let functionTag = "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100";

      if (!getIsCameraPositionWithTypeSupported(camera.CameraPosition.CAMERA_POSITION_FRONT, camera.CameraType.CAMERA_TYPE_WIDE_ANGLE)) {
        let ret = cameraObj.createCameraInputWithPositionAndType(camera.CameraPosition.CAMERA_POSITION_FRONT, camera.CameraType.CAMERA_TYPE_WIDE_ANGLE);
        expect(ret).assertEqual(camera.CameraErrorCode.SERVICE_FATAL_ERROR);
        return;
      }
      let ret = cameraObj.createCameraInputWithPositionAndType(camera.CameraPosition.CAMERA_POSITION_FRONT, camera.CameraType.CAMERA_TYPE_WIDE_ANGLE);
      if (ret) {
        expect().assertFail();
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_WITHPOSITIONANDTYPE_ON_ERROR_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100
     * @tc.desc   query whether physical camera orientation is variable under different fold status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100--------------");
      await createInput();

      let obj = cameraObj.oHCameraInputIsPhysicalCameraOrientationVariable();
      if (obj.errorCode) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + obj.errorCode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_ISPHYSICALCAMERAORIENTATIONVARIABLE_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100
     * @tc.desc   get physical camera orientation under current fold status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100--------------");
      await createInput();

      let obj = cameraObj.oHCameraInputGetPhysicalCameraOrientation();
      if (obj.errorCode) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + obj.errorCode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100
     * @tc.desc   choose whether to use the physical camera orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100--------------");
      await createInput();

      let obj = cameraObj.oHCameraInputIsPhysicalCameraOrientationVariable();
      if (obj.errorCode) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + obj.errorCode);
        expect().assertFail();
      }

      if (obj.isVariable) {
        let ret = cameraObj.oHCameraInputUsePhysicalCameraOrientation(true);
        if (ret) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 set true FAILED");
          console.info(TAG + "ERRORCODE: " + obj.errorCode);
          expect().assertFail();
        }

        ret = cameraObj.oHCameraInputUsePhysicalCameraOrientation(false);
        if (ret) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 set false FAILED");
          console.info(TAG + "ERRORCODE: " + obj.errorCode);
          expect().assertFail();
        }
     }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100
     * @tc.desc   camera status callback on CameraInput async api for CameraInputOcclusionDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 start for camera");
      await startCameraSession();
      await createInput();
      let ret = cameraObj.cameraInputOcclusionDetection();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 end for camera");
    });
  })
}
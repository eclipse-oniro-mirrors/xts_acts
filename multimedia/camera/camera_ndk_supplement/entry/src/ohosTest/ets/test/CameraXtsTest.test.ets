/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import cameraObj from 'libentry.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import camera from '@ohos.multimedia.camera';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { abilityAccessCtrl, PermissionRequestResult, Permissions, common} from '@kit.AbilityKit';


const TAG = "CAMERA_XTS_TEST_TAG ";
const TEST_OK = 0;
const SLEEP_500 = 500;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }

  ret = cameraObj.cameraManagerGetSupportedCameras();
  console.info(TAG + "cameraManagerGetSupportedCameras ret" + ret);
  if (ret != 0) {
    console.error(TAG + "cameraManagerGetSupportedCameras FAILED");
    expect().assertFail();
  }
  return TEST_OK
}

async function getPhotoReceiverSurface() {
  receiver = image.createImageReceiver({ width: 1280, height: 960 }, 4, 8);
  if (receiver !== undefined) {
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + '创建ImageReceiver实例 failed');
  }
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(SLEEP_500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), SLEEP_500);
  await sleep(SLEEP_500);
  await power?.click();
}

function releaseCamera() {
  return cameraObj.releaseCameraManger();
}

let getPermissions = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
  atManager.requestPermissionsFromUser(testContext, permissions).then((data: PermissionRequestResult) => {
    console.info(TAG + 'data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error(TAG + 'data:' + JSON.stringify(err))
  })
}

export default function CameraXtsTest() {
  describe("CameraXtsTest", () => {
    beforeAll(async () => {
      await getPermissions()
      await driveFn();
      await getPhotoReceiverSurface()
      getCameraManagerInstance()
      console.info(TAG + "beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.")
    })
    beforeEach(async () => {
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.")
    })
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.")
    })
    afterAll(() => {
      if (releaseCamera() != TEST_OK) {
        console.error(TAG + " releaseCamera FAILED");
        expect().assertFail();
      }
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed")
    })

    /**
     * @tc.name   testCAMERAOPERATIONNOTALLOWED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0100
     * @tc.desc   Test CAMERA_OPERATION_NOT_ALLOWED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAOPERATIONNOTALLOWED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(TAG + "testCAMERAOPERATIONNOTALLOWED start..");
      let ret = cameraObj.cameraErrorCode('CAMERA_OPERATION_NOT_ALLOWED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASESSIONNOTCONFIG
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0200
     * @tc.desc   Test CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASESSIONNOTCONFIG", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_CONFIG')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASESSIONNOTRUNNING
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0300
     * @tc.desc   Test CAMERA_SESSION_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASESSIONNOTRUNNING", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_RUNNING')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASESSIONCONFIGLOCKED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0400
     * @tc.desc   Test CAMERA_SESSION_CONFIG_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASESSIONCONFIGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_CONFIG_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERADEVICESETTINGLOCKED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0500
     * @tc.desc   Test CAMERA_DEVICE_SETTING_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERADEVICESETTINGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_SETTING_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERACONFLICTCAMERA
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0600
     * @tc.desc   Test CAMERA_CONFLICT_CAMERA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERACONFLICTCAMERA", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_CONFLICT_CAMERA')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERADEVICEDISABLED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0700
     * @tc.desc   Test CAMERA_DEVICE_DISABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERADEVICEDISABLED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_DISABLED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERADEVICEPREEMPTED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0800
     * @tc.desc   Test CAMERA_DEVICE_PREEMPTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERADEVICEPREEMPTED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_PREEMPTED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode0900
     * @tc.desc   Test CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASTATUSAPPEAR
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1000
     * @tc.desc   Test CAMERA_STATUS_APPEAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASTATUSAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_APPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASTATUSDISAPPEAR
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1100
     * @tc.desc   Test CAMERA_STATUS_DISAPPEAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASTATUSDISAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_DISAPPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASTATUSAVAILABLE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1200
     * @tc.desc   Test CAMERA_STATUS_AVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASTATUSAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_AVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERASTATUSUNAVAILABLE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1300
     * @tc.desc   Test CAMERA_STATUS_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERASTATUSUNAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERACONNECTIONBUILTIN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1400
     * @tc.desc   Test CAMERA_CONNECTION_BUILT_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERACONNECTIONBUILTIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_BUILT_IN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERACONNECTIONUSBPLUGIN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1500
     * @tc.desc   Test CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERACONNECTIONUSBPLUGIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_USB_PLUGIN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERACONNECTIONREMOTE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1600
     * @tc.desc   Test CAMERA_CONNECTION_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERACONNECTIONREMOTE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_REMOTE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAFORMATRGBA8888
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1700
     * @tc.desc   Test CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAFORMATRGBA8888", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_RGBA_8888)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAFORMATYCBCRP010
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1800
     * @tc.desc   Test CAMERA_FORMAT_YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAFORMATYCBCRP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAFORMATYCRCBP010
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode1900
     * @tc.desc   Test CAMERA_FORMAT_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAFORMATYCRCBP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFLASHMODECLOSE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2000
     * @tc.desc   Test FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFLASHMODECLOSE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_CLOSE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFLASHMODEOPEN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2100
     * @tc.desc   Test FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFLASHMODEOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFLASHMODEAUTO
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2200
     * @tc.desc   Test FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFLASHMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFLASHMODEALWAYSOPEN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2300
     * @tc.desc   Test FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFLASHMODEALWAYSOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testEXPOSUREMODEAUTO
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2400
     * @tc.desc   Test EXPOSURE_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEXPOSUREMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testEXPOSUREMODECONTINUOUSAUTO
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2500
     * @tc.desc   Test EXPOSURE_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEXPOSUREMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSMODEMANUAL
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2600
     * @tc.desc   Test FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSMODEMANUAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_MANUAL)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSMODECONTINUOUSAUTO
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2700
     * @tc.desc   Test FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSMODELOCKED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2800
     * @tc.desc   Test FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSMODELOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_LOCKED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSSTATESCAN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode2900
     * @tc.desc   Test FOCUS_STATE_SCAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSSTATESCAN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_SCAN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSSTATEFOCUSED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3000
     * @tc.desc   Test FOCUS_STATE_FOCUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSSTATEFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_FOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFOCUSSTATEUNFOCUSED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3100
     * @tc.desc   Test FOCUS_STATE_UNFOCUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFOCUSSTATEUNFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_UNFOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSTABILIZATIONMODEOFF
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3200
     * @tc.desc   Test STABILIZATION_MODE_OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSTABILIZATIONMODEOFF", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.OFF)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSTABILIZATIONMODELOW
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3300
     * @tc.desc   Test STABILIZATION_MODE_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSTABILIZATIONMODELOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSTABILIZATIONMODEMIDDLE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3400
     * @tc.desc   Test STABILIZATION_MODE_MIDDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSTABILIZATIONMODEMIDDLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.MIDDLE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSTABILIZATIONMODEHIGH
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3500
     * @tc.desc   Test STABILIZATION_MODE_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSTABILIZATIONMODEHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testIAMGEROTATION0
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3600
     * @tc.desc   Test IAMGE_ROTATION_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIAMGEROTATION0", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_0, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testIAMGEROTATION90
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3700
     * @tc.desc   Test IAMGE_ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIAMGEROTATION90", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testIAMGEROTATION180
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3800
     * @tc.desc   Test IAMGE_ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIAMGEROTATION180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_180, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testIAMGEROTATION270
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode3900
     * @tc.desc   Test IAMGE_ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIAMGEROTATION270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_270, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testQUALITYLEVELHIGH
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4000
     * @tc.desc   Test QUALITY_LEVEL_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testQUALITYLEVELHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testQUALITYLEVELMEDIUM
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4100
     * @tc.desc   Test QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testQUALITYLEVELMEDIUM", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_MEDIUM)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testQUALITYLEVELLOW
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4200
     * @tc.desc   Test QUALITY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testQUALITYLEVELLOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testFACEDETECTION
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4300
     * @tc.desc   Test FACE_DETECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFACEDETECTION", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIG720P
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4400
     * @tc.desc   Test PRECONFIG_720P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIG720P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_720P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIG1080P
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4500
     * @tc.desc   Test PRECONFIG_1080P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIG1080P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_1080P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIG4K
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4600
     * @tc.desc   Test PRECONFIG_4K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIG4K", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_4K)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIGHIGHQUALITY
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4700
     * @tc.desc   Test PRECONFIG_HIGH_QUALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIGHIGHQUALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIGRATIO11
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4800
     * @tc.desc   Test PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIGRATIO11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_1_1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIGRATIO43
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode4900
     * @tc.desc   Test PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIGRATIO43", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_4_3)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPRECONFIGRATIO169
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5000
     * @tc.desc   Test PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPRECONFIGRATIO169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_16_9)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraStatusInfocamera
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5100
     * @tc.desc   Test CAMERA_STATUS_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraStatusInfocamera", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraStatusInfostatus
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5200
     * @tc.desc   Test CAMERA_STATUS_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraStatusInfostatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFrameShutterInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5300
     * @tc.desc   Test Camera_FrameShutterInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFrameShutterInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFrameShutterInfocaptureId
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5400
     * @tc.desc   Test Camera_FrameShutterInfo captureId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFrameShutterInfocaptureId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFrameShutterInfotimestamp
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5500
     * @tc.desc   Test Camera_FrameShutterInfo timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFrameShutterInfotimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraRect
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode5900
     * @tc.desc   Test Camera_Rect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraRect", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraRecttopLeftX
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6000
     * @tc.desc   Test Camera_Rect topLeftX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraRecttopLeftX", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraRecttopLeftY
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6100
     * @tc.desc   Test Camera_Rect topLeftY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraRecttopLeftY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraRectwidth
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6200
     * @tc.desc   Test Camera_Rect width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraRectwidth", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraRectheight
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6300
     * @tc.desc   Test Camera_Rect height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraRectheight", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraMetadataObject
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6400
     * @tc.desc   Test Camera_MetadataObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraMetadataObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraMetadataObjecttype
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6500
     * @tc.desc   Test Camera_MetadataObject type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraMetadataObjecttype", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraMetadataObjecttimestamp
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6600
     * @tc.desc   Test Camera_MetadataObject timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraMetadataObjecttimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraMetadataObjectboundingBox
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6700
     * @tc.desc   Test Camera_MetadataObject boundingBox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraMetadataObjectboundingBox", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraTorchStatusInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6800
     * @tc.desc   Test Camera_TorchStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraTorchStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraTorchStatusInfoisTorchAvailable
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode6900
     * @tc.desc   Test Camera_TorchStatusInfo isTorchAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraTorchStatusInfoisTorchAvailable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraTorchStatusInfoisTorchActive
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7000
     * @tc.desc   Test Camera_TorchStatusInfo isTorchActive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraTorchStatusInfoisTorchActive", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraTorchStatusInfotorchLevel
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7100
     * @tc.desc   Test Camera_TorchStatusInfo torchLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraTorchStatusInfotorchLevel", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraSmoothZoomInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7200
     * @tc.desc   Test Camera_SmoothZoomInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraSmoothZoomInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.captureSessionRegisterSmoothZoomInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraSmoothZoomInfoduration
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7300
     * @tc.desc   Test Camera_SmoothZoomInfo duration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraSmoothZoomInfoduration", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.captureSessionRegisterSmoothZoomInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraCaptureStartInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7400
     * @tc.desc   Test Camera_CaptureStartInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraCaptureStartInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraCaptureStartInfocaptureId
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7500
     * @tc.desc   Test Camera_CaptureStartInfo captureId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraCaptureStartInfocaptureId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraCaptureStartInfotime
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7600
     * @tc.desc   Test Camera_CaptureStartInfo time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraCaptureStartInfotime", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFoldStatusInfoNONFOLDABLE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode7900
     * @tc.desc   Test Camera_FoldStatusInfo NON_FOLDABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFoldStatusInfoNONFOLDABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFoldStatusInfoEXPANDED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8000
     * @tc.desc   Test Camera_FoldStatusInfo EXPANDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFoldStatusInfoEXPANDED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFoldStatusInfoFOLDED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8100
     * @tc.desc   Test Camera_FoldStatusInfo FOLDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFoldStatusInfoFOLDED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraFoldStatusInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8200
     * @tc.desc   Test Camera_FoldStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraFoldStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfosupportedCameras
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8300
     * @tc.desc   Test Camera_FoldStatusInfo supportedCameras
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfosupportedCameras", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfocameraSize
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8400
     * @tc.desc   Test Camera_FoldStatusInfo cameraSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfocameraSize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfofoldStatus
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8500
     * @tc.desc   Test Camera_FoldStatusInfo foldStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfofoldStatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8600
     * @tc.desc   Test Camera_AutoDeviceSwitchStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfoisDeviceSwitched
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8700
     * @tc.desc   Test Camera_AutoDeviceSwitchStatusInfo isDeviceSwitched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfoisDeviceSwitched", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraAutoDeviceSwitchStatusInfoisDeviceCapabilityChanged
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode8800
     * @tc.desc   Test Camera_AutoDeviceSwitchStatusInfo isDeviceCapabilityChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraAutoDeviceSwitchStatusInfoisDeviceCapabilityChanged", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testHIGHQUALITY
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9100
     * @tc.desc   Test HIGH_QUALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHIGHQUALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionSetQualityPrioritization(camera.QualityPrioritization.HIGH_QUALITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testPOWERBALANCE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9200
     * @tc.desc   Test POWER_BALANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPOWERBALANCE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionSetQualityPrioritization(camera.QualityPrioritization.POWER_BALANCE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERACONCURRENTTYPEFULLCAPABILITY
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9300
     * @tc.desc   Test CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERACONCURRENTTYPEFULLCAPABILITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraOpenConcurrentCameras(camera.CameraConcurrentType.CAMERA_FULL_CAPABILITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraConcurrentInfocamera
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9400
     * @tc.desc   Test Camera_ConcurrentInfo camera
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraConcurrentInfocamera", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraConcurrentInfotype
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9500
     * @tc.desc   Test Camera_ConcurrentInfo type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraConcurrentInfotype", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraConcurrentInfosceneModes
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9600
     * @tc.desc   Test Camera_ConcurrentInfo sceneModes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraConcurrentInfosceneModes", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraConcurrentInfooutputCapabilities
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9700
     * @tc.desc   Test Camera_ConcurrentInfo outputCapabilities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraConcurrentInfooutputCapabilities", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraConcurrentInfomodeAndCapabilitySize
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9800
     * @tc.desc   Test Camera_ConcurrentInfo modeAndCapabilitySize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraConcurrentInfomodeAndCapabilitySize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAWHITEBALANCEMODEINCANDESCENT
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode9900
     * @tc.desc   Test CAMERA_WHITE_BALANCE_MODE_INCANDESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAWHITEBALANCEMODEINCANDESCENT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.INCANDESCENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAWHITEBALANCEMODEFLUORESCENT
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10000
     * @tc.desc   Test CAMERA_WHITE_BALANCE_MODE_FLUORESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAWHITEBALANCEMODEFLUORESCENT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.INCANDESCENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAWHITEBALANCEMODEDAYLIGHT
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10100
     * @tc.desc   Test CAMERA_WHITE_BALANCE_MODE_DAYLIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAWHITEBALANCEMODEDAYLIGHT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.DAYLIGHT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAWHITEBALANCEMODEMANUAL
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10200
     * @tc.desc   Test CAMERA_WHITE_BALANCE_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAWHITEBALANCEMODEMANUAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.MANUAL)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCAMERAWHITEBALANCEMODELOCKED
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10300
     * @tc.desc   Test CAMERA_WHITE_BALANCE_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCAMERAWHITEBALANCEMODELOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.LOCKED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSYSTEMPRESSURENORMAL
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10400
     * @tc.desc   Test SYSTEM_PRESSURE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSYSTEMPRESSURENORMAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSYSTEMPRESSUREMILD
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10500
     * @tc.desc   Test SYSTEM_PRESSURE_MILD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSYSTEMPRESSUREMILD", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSYSTEMPRESSURESEVERE
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10600
     * @tc.desc   Test SYSTEM_PRESSURE_SEVERE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSYSTEMPRESSURESEVERE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSYSTEMPRESSURECRITICAL
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10700
     * @tc.desc   Test SYSTEM_PRESSURE_CRITICAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSYSTEMPRESSURECRITICAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testSYSTEMPRESSURESHUTDOWN
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10800
     * @tc.desc   Test SYSTEM_PRESSURE_SHUTDOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSYSTEMPRESSURESHUTDOWN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEBEAUTY
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode10900
     * @tc.desc   Test CONTROL_CENTER_EFFECT_TYPE_BEAUTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEBEAUTY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.BEAUTY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEPORTRAIT
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode11000
     * @tc.desc   Test CONTROL_CENTER_EFFECT_TYPE_PORTRAIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEPORTRAIT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.PORTRAIT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraControlCenterStatusInfo
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode11100
     * @tc.desc   Test Camera_ControlCenterStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraControlCenterStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.PORTRAIT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraControlCenterStatusInfoeffectType
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode11200
     * @tc.desc   Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraControlCenterStatusInfoeffectType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerControlCenterEffectStatusChange()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   testCameraControlCenterStatusInfoisActive
     * @tc.number SUB_MULTIMEIDA_OH_Camera_ErrorCode11300
     * @tc.desc   Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCameraControlCenterStatusInfoisActive", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerControlCenterEffectStatusChange()
      expect(ret).assertEqual(TEST_OK)
      done()
    })
  })
}


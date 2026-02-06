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
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0100
     * @tc.name       testCAMERAOPERATIONNOTALLOWED
     * @tc.desc       Test CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAOPERATIONNOTALLOWED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(TAG + "testCAMERAOPERATIONNOTALLOWED start..");
      let ret = cameraObj.cameraErrorCode('CAMERA_OPERATION_NOT_ALLOWED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0200
     * @tc.name       testCAMERASESSIONNOTCONFIG
     * @tc.desc       Test CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASESSIONNOTCONFIG", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_CONFIG')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0300
     * @tc.name       testCAMERASESSIONNOTRUNNING
     * @tc.desc       Test CAMERA_SESSION_NOT_RUNNING
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASESSIONNOTRUNNING", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_RUNNING')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0400
     * @tc.name       testCAMERASESSIONCONFIGLOCKED
     * @tc.desc       Test CAMERA_SESSION_CONFIG_LOCKED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASESSIONCONFIGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_CONFIG_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0500
     * @tc.name       testCAMERADEVICESETTINGLOCKED
     * @tc.desc       Test CAMERA_DEVICE_SETTING_LOCKED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERADEVICESETTINGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_SETTING_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0600
     * @tc.name       testCAMERACONFLICTCAMERA
     * @tc.desc       Test CAMERA_CONFLICT_CAMERA
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERACONFLICTCAMERA", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_CONFLICT_CAMERA')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0700
     * @tc.name       testCAMERADEVICEDISABLED
     * @tc.desc       Test CAMERA_DEVICE_DISABLED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERADEVICEDISABLED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_DISABLED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0800
     * @tc.name       testCAMERADEVICEPREEMPTED
     * @tc.desc       Test CAMERA_DEVICE_PREEMPTED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERADEVICEPREEMPTED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_PREEMPTED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode0900
     * @tc.name       testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS
     * @tc.desc       Test CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1000
     * @tc.name       testCAMERASTATUSAPPEAR
     * @tc.desc       Test CAMERA_STATUS_APPEAR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASTATUSAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_APPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1100
     * @tc.name       testCAMERASTATUSDISAPPEAR
     * @tc.desc       Test CAMERA_STATUS_DISAPPEAR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASTATUSDISAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_DISAPPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1200
     * @tc.name       testCAMERASTATUSAVAILABLE
     * @tc.desc       Test CAMERA_STATUS_AVAILABLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASTATUSAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_AVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1300
     * @tc.name       testCAMERASTATUSUNAVAILABLE
     * @tc.desc       Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERASTATUSUNAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1400
     * @tc.name       testCAMERACONNECTIONBUILTIN
     * @tc.desc       Test CAMERA_CONNECTION_BUILT_IN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERACONNECTIONBUILTIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_BUILT_IN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1500
     * @tc.name       testCAMERACONNECTIONUSBPLUGIN
     * @tc.desc       Test CAMERA_CONNECTION_USB_PLUGIN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERACONNECTIONUSBPLUGIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_USB_PLUGIN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1600
     * @tc.name       testCAMERACONNECTIONREMOTE
     * @tc.desc       Test CAMERA_CONNECTION_REMOTE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERACONNECTIONREMOTE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_REMOTE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1700
     * @tc.name       testCAMERAFORMATRGBA8888
     * @tc.desc       Test CAMERA_FORMAT_RGBA_8888
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAFORMATRGBA8888", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_RGBA_8888)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1800
     * @tc.name       testCAMERAFORMATYCBCRP010
     * @tc.desc       Test CAMERA_FORMAT_YCBCR_P010
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAFORMATYCBCRP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode1900
     * @tc.name       testCAMERAFORMATYCRCBP010
     * @tc.desc       Test CAMERA_FORMAT_YCRCB_P010
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAFORMATYCRCBP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2000
     * @tc.name       testFLASHMODECLOSE
     * @tc.desc       Test FLASH_MODE_CLOSE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFLASHMODECLOSE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_CLOSE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2100
     * @tc.name       testFLASHMODEOPEN
     * @tc.desc       Test FLASH_MODE_OPEN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFLASHMODEOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2200
     * @tc.name       testFLASHMODEAUTO
     * @tc.desc       Test FLASH_MODE_AUTO
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFLASHMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2300
     * @tc.name       testFLASHMODEALWAYSOPEN
     * @tc.desc       Test FLASH_MODE_ALWAYS_OPEN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFLASHMODEALWAYSOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2400
     * @tc.name       testEXPOSUREMODEAUTO
     * @tc.desc       Test EXPOSURE_MODE_AUTO
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testEXPOSUREMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2500
     * @tc.name       testEXPOSUREMODECONTINUOUSAUTO
     * @tc.desc       Test EXPOSURE_MODE_CONTINUOUS_AUTO
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testEXPOSUREMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2600
     * @tc.name       testFOCUSMODEMANUAL
     * @tc.desc       Test FOCUS_MODE_MANUAL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSMODEMANUAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_MANUAL)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2700
     * @tc.name       testFOCUSMODECONTINUOUSAUTO
     * @tc.desc       Test FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2800
     * @tc.name       testFOCUSMODELOCKED
     * @tc.desc       Test FOCUS_MODE_LOCKED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSMODELOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_LOCKED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode2900
     * @tc.name       testFOCUSSTATESCAN
     * @tc.desc       Test FOCUS_STATE_SCAN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSSTATESCAN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_SCAN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3000
     * @tc.name       testFOCUSSTATEFOCUSED
     * @tc.desc       Test FOCUS_STATE_FOCUSED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSSTATEFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_FOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3100
     * @tc.name       testFOCUSSTATEUNFOCUSED
     * @tc.desc       Test FOCUS_STATE_UNFOCUSED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFOCUSSTATEUNFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_UNFOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3200
     * @tc.name       testSTABILIZATIONMODEOFF
     * @tc.desc       Test STABILIZATION_MODE_OFF
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSTABILIZATIONMODEOFF", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.OFF)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3300
     * @tc.name       testSTABILIZATIONMODELOW
     * @tc.desc       Test STABILIZATION_MODE_LOW
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSTABILIZATIONMODELOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3400
     * @tc.name       testSTABILIZATIONMODEMIDDLE
     * @tc.desc       Test STABILIZATION_MODE_MIDDLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSTABILIZATIONMODEMIDDLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.MIDDLE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3500
     * @tc.name       testSTABILIZATIONMODEHIGH
     * @tc.desc       Test STABILIZATION_MODE_HIGH
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSTABILIZATIONMODEHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3600
     * @tc.name       testIAMGEROTATION0
     * @tc.desc       Test IAMGE_ROTATION_0
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testIAMGEROTATION0", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_0, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3700
     * @tc.name       testIAMGEROTATION90
     * @tc.desc       Test IAMGE_ROTATION_90
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testIAMGEROTATION90", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3800
     * @tc.name       testIAMGEROTATION180
     * @tc.desc       Test IAMGE_ROTATION_180
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testIAMGEROTATION180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_180, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode3900
     * @tc.name       testIAMGEROTATION270
     * @tc.desc       Test IAMGE_ROTATION_270
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testIAMGEROTATION270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_270, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4000
     * @tc.name       testQUALITYLEVELHIGH
     * @tc.desc       Test QUALITY_LEVEL_HIGH
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testQUALITYLEVELHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4100
     * @tc.name       testQUALITYLEVELMEDIUM
     * @tc.desc       Test QUALITY_LEVEL_MEDIUM
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testQUALITYLEVELMEDIUM", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_MEDIUM)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4200
     * @tc.name       testQUALITYLEVELLOW
     * @tc.desc       Test QUALITY_LEVEL_LOW
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testQUALITYLEVELLOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4300
     * @tc.name       testFACEDETECTION
     * @tc.desc       Test FACE_DETECTION
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testFACEDETECTION", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4400
     * @tc.name       testPRECONFIG720P
     * @tc.desc       Test PRECONFIG_720P
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIG720P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_720P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4500
     * @tc.name       testPRECONFIG1080P
     * @tc.desc       Test PRECONFIG_1080P
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIG1080P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_1080P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4600
     * @tc.name       testPRECONFIG4K
     * @tc.desc       Test PRECONFIG_4K
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIG4K", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_4K)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4700
     * @tc.name       testPRECONFIGHIGHQUALITY
     * @tc.desc       Test PRECONFIG_HIGH_QUALITY
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIGHIGHQUALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4800
     * @tc.name       testPRECONFIGRATIO11
     * @tc.desc       Test PRECONFIG_RATIO_1_1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIGRATIO11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_1_1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode4900
     * @tc.name       testPRECONFIGRATIO43
     * @tc.desc       Test PRECONFIG_RATIO_4_3
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIGRATIO43", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_4_3)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5000
     * @tc.name       testPRECONFIGRATIO169
     * @tc.desc       Test PRECONFIG_RATIO_16_9
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPRECONFIGRATIO169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_16_9)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5100
     * @tc.name       testCameraStatusInfocamera
     * @tc.desc       Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraStatusInfocamera", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5200
     * @tc.name       testCameraStatusInfostatus
     * @tc.desc       Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraStatusInfostatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5300
     * @tc.name       testCameraFrameShutterInfo
     * @tc.desc       Test Camera_FrameShutterInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFrameShutterInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5400
     * @tc.name       testCameraFrameShutterInfocaptureId
     * @tc.desc       Test Camera_FrameShutterInfo captureId
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFrameShutterInfocaptureId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5500
     * @tc.name       testCameraFrameShutterInfotimestamp
     * @tc.desc       Test Camera_FrameShutterInfo timestamp
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFrameShutterInfotimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode5900
     * @tc.name       testCameraRect
     * @tc.desc       Test Camera_Rect
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraRect", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6000
     * @tc.name       testCameraRecttopLeftX
     * @tc.desc       Test Camera_Rect topLeftX
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraRecttopLeftX", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6100
     * @tc.name       testCameraRecttopLeftY
     * @tc.desc       Test Camera_Rect topLeftY
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraRecttopLeftY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6200
     * @tc.name       testCameraRectwidth
     * @tc.desc       Test Camera_Rect width
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraRectwidth", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6300
     * @tc.name       testCameraRectheight
     * @tc.desc       Test Camera_Rect height
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraRectheight", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6400
     * @tc.name       testCameraMetadataObject
     * @tc.desc       Test Camera_MetadataObject
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraMetadataObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6500
     * @tc.name       testCameraMetadataObjecttype
     * @tc.desc       Test Camera_MetadataObject type
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraMetadataObjecttype", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6600
     * @tc.name       testCameraMetadataObjecttimestamp
     * @tc.desc       Test Camera_MetadataObject timestamp
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraMetadataObjecttimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6700
     * @tc.name       testCameraMetadataObjectboundingBox
     * @tc.desc       Test Camera_MetadataObject boundingBox
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraMetadataObjectboundingBox", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6800
     * @tc.name       testCameraTorchStatusInfo
     * @tc.desc       Test Camera_TorchStatusInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraTorchStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode6900
     * @tc.name       testCameraTorchStatusInfoisTorchAvailable
     * @tc.desc       Test Camera_TorchStatusInfo isTorchAvailable
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraTorchStatusInfoisTorchAvailable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7000
     * @tc.name       testCameraTorchStatusInfoisTorchActive
     * @tc.desc       Test Camera_TorchStatusInfo isTorchActive
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraTorchStatusInfoisTorchActive", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7100
     * @tc.name       testCameraTorchStatusInfotorchLevel
     * @tc.desc       Test Camera_TorchStatusInfo torchLevel
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraTorchStatusInfotorchLevel", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterTorchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7200
     * @tc.name       testCameraSmoothZoomInfo
     * @tc.desc       Test Camera_SmoothZoomInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraSmoothZoomInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.captureSessionRegisterSmoothZoomInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7300
     * @tc.name       testCameraSmoothZoomInfoduration
     * @tc.desc       Test Camera_SmoothZoomInfo duration
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraSmoothZoomInfoduration", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.captureSessionRegisterSmoothZoomInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7400
     * @tc.name       testCameraCaptureStartInfo
     * @tc.desc       Test Camera_CaptureStartInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraCaptureStartInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7500
     * @tc.name       testCameraCaptureStartInfocaptureId
     * @tc.desc       Test Camera_CaptureStartInfo captureId
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraCaptureStartInfocaptureId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7600
     * @tc.name       testCameraCaptureStartInfotime
     * @tc.desc       Test Camera_CaptureStartInfo time
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraCaptureStartInfotime", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode7900
     * @tc.name       testCameraFoldStatusInfoNONFOLDABLE
     * @tc.desc       Test Camera_FoldStatusInfo NON_FOLDABLE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFoldStatusInfoNONFOLDABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8000
     * @tc.name       testCameraFoldStatusInfoEXPANDED
     * @tc.desc       Test Camera_FoldStatusInfo EXPANDED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFoldStatusInfoEXPANDED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8100
     * @tc.name       testCameraFoldStatusInfoFOLDED
     * @tc.desc       Test Camera_FoldStatusInfo FOLDED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFoldStatusInfoFOLDED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8200
     * @tc.name       testCameraFoldStatusInfo
     * @tc.desc       Test Camera_FoldStatusInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraFoldStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8300
     * @tc.name       testCameraAutoDeviceSwitchStatusInfosupportedCameras
     * @tc.desc       Test Camera_FoldStatusInfo supportedCameras
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfosupportedCameras", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8400
     * @tc.name       testCameraAutoDeviceSwitchStatusInfocameraSize
     * @tc.desc       Test Camera_FoldStatusInfo cameraSize
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfocameraSize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8500
     * @tc.name       testCameraAutoDeviceSwitchStatusInfofoldStatus
     * @tc.desc       Test Camera_FoldStatusInfo foldStatus
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfofoldStatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraManagerRegisterFoldStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8600
     * @tc.name       testCameraAutoDeviceSwitchStatusInfo
     * @tc.desc       Test Camera_AutoDeviceSwitchStatusInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8700
     * @tc.name       testCameraAutoDeviceSwitchStatusInfoisDeviceSwitched
     * @tc.desc       Test Camera_AutoDeviceSwitchStatusInfo isDeviceSwitched
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfoisDeviceSwitched", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode8800
     * @tc.name       testCameraAutoDeviceSwitchStatusInfoisDeviceCapabilityChanged
     * @tc.desc       Test Camera_AutoDeviceSwitchStatusInfo isDeviceCapabilityChanged
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraAutoDeviceSwitchStatusInfoisDeviceCapabilityChanged", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9100
     * @tc.name       testHIGHQUALITY
     * @tc.desc       Test HIGH_QUALITY
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testHIGHQUALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionSetQualityPrioritization(camera.QualityPrioritization.HIGH_QUALITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9200
     * @tc.name       testPOWERBALANCE
     * @tc.desc       Test POWER_BALANCE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testPOWERBALANCE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionSetQualityPrioritization(camera.QualityPrioritization.POWER_BALANCE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9300
     * @tc.name       testCAMERACONCURRENTTYPEFULLCAPABILITY
     * @tc.desc       Test CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERACONCURRENTTYPEFULLCAPABILITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraOpenConcurrentCameras(camera.CameraConcurrentType.CAMERA_FULL_CAPABILITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9400
     * @tc.name       testCameraConcurrentInfocamera
     * @tc.desc       Test Camera_ConcurrentInfo camera
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraConcurrentInfocamera", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9500
     * @tc.name       testCameraConcurrentInfotype
     * @tc.desc       Test Camera_ConcurrentInfo type
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraConcurrentInfotype", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9600
     * @tc.name       testCameraConcurrentInfosceneModes
     * @tc.desc       Test Camera_ConcurrentInfo sceneModes
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraConcurrentInfosceneModes", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9700
     * @tc.name       testCameraConcurrentInfooutputCapabilities
     * @tc.desc       Test Camera_ConcurrentInfo outputCapabilities
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraConcurrentInfooutputCapabilities", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9800
     * @tc.name       testCameraConcurrentInfomodeAndCapabilitySize
     * @tc.desc       Test Camera_ConcurrentInfo modeAndCapabilitySize
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraConcurrentInfomodeAndCapabilitySize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode9900
     * @tc.name       testCAMERAWHITEBALANCEMODEINCANDESCENT
     * @tc.desc       Test CAMERA_WHITE_BALANCE_MODE_INCANDESCENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAWHITEBALANCEMODEINCANDESCENT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.INCANDESCENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10000
     * @tc.name       testCAMERAWHITEBALANCEMODEFLUORESCENT
     * @tc.desc       Test CAMERA_WHITE_BALANCE_MODE_FLUORESCENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAWHITEBALANCEMODEFLUORESCENT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.INCANDESCENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10100
     * @tc.name       testCAMERAWHITEBALANCEMODEDAYLIGHT
     * @tc.desc       Test CAMERA_WHITE_BALANCE_MODE_DAYLIGHT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAWHITEBALANCEMODEDAYLIGHT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.DAYLIGHT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10200
     * @tc.name       testCAMERAWHITEBALANCEMODEMANUAL
     * @tc.desc       Test CAMERA_WHITE_BALANCE_MODE_MANUAL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAWHITEBALANCEMODEMANUAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.MANUAL)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10300
     * @tc.name       testCAMERAWHITEBALANCEMODELOCKED
     * @tc.desc       Test CAMERA_WHITE_BALANCE_MODE_LOCKED
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCAMERAWHITEBALANCEMODELOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.isWhiteBalanceSupported(camera.WhiteBalanceMode.LOCKED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10400
     * @tc.name       testSYSTEMPRESSURENORMAL
     * @tc.desc       Test SYSTEM_PRESSURE_NORMAL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSYSTEMPRESSURENORMAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10500
     * @tc.name       testSYSTEMPRESSUREMILD
     * @tc.desc       Test SYSTEM_PRESSURE_MILD
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSYSTEMPRESSUREMILD", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10600
     * @tc.name       testSYSTEMPRESSURESEVERE
     * @tc.desc       Test SYSTEM_PRESSURE_SEVERE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSYSTEMPRESSURESEVERE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10700
     * @tc.name       testSYSTEMPRESSURECRITICAL
     * @tc.desc       Test SYSTEM_PRESSURE_CRITICAL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSYSTEMPRESSURECRITICAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10800
     * @tc.name       testSYSTEMPRESSURESHUTDOWN
     * @tc.desc       Test SYSTEM_PRESSURE_SHUTDOWN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testSYSTEMPRESSURESHUTDOWN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerSystemPressureLevel()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode10900
     * @tc.name       testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEBEAUTY
     * @tc.desc       Test CONTROL_CENTER_EFFECT_TYPE_BEAUTY
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEBEAUTY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.BEAUTY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode11000
     * @tc.name       testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEPORTRAIT
     * @tc.desc       Test CONTROL_CENTER_EFFECT_TYPE_PORTRAIT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraControlCenterStatusInfoCONTROLCENTEREFFECTTYPEPORTRAIT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.PORTRAIT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode11100
     * @tc.name       testCameraControlCenterStatusInfo
     * @tc.desc       Test Camera_ControlCenterStatusInfo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraControlCenterStatusInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionGetSupportedEffectTypes(camera.ControlCenterEffectType.PORTRAIT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode11200
     * @tc.name       testCameraControlCenterStatusInfoeffectType
     * @tc.desc       Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraControlCenterStatusInfoeffectType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerControlCenterEffectStatusChange()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_ErrorCode11300
     * @tc.name       testCameraControlCenterStatusInfoisActive
     * @tc.desc       Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testCameraControlCenterStatusInfoisActive", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.registerControlCenterEffectStatusChange()
      expect(ret).assertEqual(TEST_OK)
      done()
    })
  })
}


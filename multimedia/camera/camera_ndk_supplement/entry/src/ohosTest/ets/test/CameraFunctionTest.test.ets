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
import { media } from '@kit.MediaKit';
import { fileIo } from '@kit.CoreFileKit';


const TAG = "CAMERA_FUNCTION_TEST_TAG ";
const TEST_OK = 0;
const SLEEP_500 = 500;
let receiver: image.ImageReceiver;
let videoRecorder: media.AVRecorder;
let mPhotoSurface: string;
let videoSurfaceId: string;

let getDefaultConfig = (): media.AVRecorderConfig  => {
  let config: media.AVRecorderConfig = {
    audioSourceType: 1,
    videoSourceType: 0,
    profile: {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: media.CodecMimeType.AUDIO_AAC,
      audioSampleRate: 48000,
      fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate: 8000000,
      videoCodec: media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth: 1920,
      videoFrameHeight: 1080,
      videoFrameRate: 30
    },
    url: '',
    rotation: 0
  };

  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
  let filesDir = testContext.filesDir;
  let filePath = filesDir + `/${Date.now()}.mp4`;
  AppStorage.setOrCreate<string>('videoFilePath', filePath);
  let file: fileIo.File = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  config.url = `fd://${file.fd.toString()}`;
  return config;
}

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

async function getVideoSurfaceId() {
  try {
    videoRecorder = await media.createAVRecorder();
  } catch (error) {
    console.error(TAG +`createAVRecorder call failed error code: ${error.code}`);
  }
  if (videoRecorder === undefined) {
    console.error(`createAVRecorder call failed`);
    return;
  }

  let videoConfig = getDefaultConfig();
  console.info(TAG + 'getVideoSurfaceID videoConfig.url : ' + JSON.stringify(videoConfig.url));
  try {
    await videoRecorder.prepare(videoConfig);
    console.info(TAG + 'getVideoSurfaceID  videoRecorder.prepare');
  } catch (err) {
    console.error(TAG + 'prepare failed with err: ' + err);
  }
  videoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(videoSurfaceId));
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

let getPermissions = (permission :Permissions) => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = [permission];
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
  atManager.requestPermissionsFromUser(testContext, permissions).then((data: PermissionRequestResult) => {
    console.info(TAG + 'data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error(TAG + 'error permission:' + JSON.stringify(err))
  })
}

export default function CameraFunctionTest() {
  describe("CameraFunctionTest", () => {
    beforeAll(async () => {
      await getPermissions('ohos.permission.CAMERA')
      await driveFn()
      await getPermissions('ohos.permission.MICROPHONE')
      await driveFn()
      await getPermissions('ohos.permission.WRITE_MEDIA')
      await driveFn()
      await getPhotoReceiverSurface()
      await getVideoSurfaceId()
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
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0100
     * @tc.name       testOH_Camera_GetCameraManager0100
     * @tc.desc       Test OH_Camera_GetCameraManager
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraManager0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_GetCameraManager", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0300
     * @tc.name       testOH_Camera_DeleteCameraManager0100
     * @tc.desc       Test OH_Camera_DeleteCameraManager return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_DeleteCameraManager0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_DeleteCameraManager", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0500
     * @tc.name       testOH_Camera_GetCameraOrientation0100
     * @tc.desc       Test OH_CameraDevice_GetCameraOrientation return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraOrientation0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetCameraOrientation", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0600
     * @tc.name       testOH_Camera_GetCameraOrientation0200
     * @tc.desc       Test OH_CameraDevice_GetCameraOrientation return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraOrientation0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetCameraOrientation", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0700
     * @tc.name       testOH_Camera_GetHostDeviceName100
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceName return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceName100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceName", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0900
     * @tc.name       testOH_Camera_GetHostDeviceType100
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceType return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceType100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceType", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION1100
     * @tc.name       testOH_Camera_RegisterCallback100
     * @tc.desc       Test OH_CameraInput_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_RegisterCallback100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_RegisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION1200
     * @tc.name       testOH_Camera_UnregisterCallback100
     * @tc.desc       Test OH_CameraInput_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_UnregisterCallback100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_UnregisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0100
     * @tc.name testOH_Camera_Input_FUNCTION0100
     * @tc.desc Test OH_CameraInput_Open return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0300
     * @tc.name testOH_Camera_Input_FUNCTION0300
     * @tc.desc Test OH_CameraInput_Open return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0400
     * @tc.name testOH_Camera_Input_FUNCTION0400
     * @tc.desc Test OH_CameraInput_Open return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0600
     * @tc.name testOH_Camera_Input_FUNCTION0600
     * @tc.desc Test OH_CameraInput_OpenSecureCamera return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret =
          cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenSecureCamera", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0700
     * @tc.name testOH_Camera_Input_FUNCTION0700
     * @tc.desc Test OH_CameraInput_OpenSecureCamera return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret =
          cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenSecureCamera", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0800
     * @tc.name testOH_Camera_Input_FUNCTION0800
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1000
     * @tc.name testOH_Camera_Input_FUNCTION1000
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1100
     * @tc.name testOH_Camera_Input_FUNCTION1100
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1200
     * @tc.name testOH_Camera_Input_FUNCTION1200
     * @tc.desc Test OH_CameraInput_Close return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Close", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1400
     * @tc.name testOH_Camera_Input_FUNCTION1400
     * @tc.desc Test OH_CameraInput_Release return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Release", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0100
     * @tc.name       testOH_Camera_Manager_FUNCTION0100
     * @tc.desc       Test OH_CameraManager_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_RegisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0200
     * @tc.name       testOH_Camera_Manager_FUNCTION0200
     * @tc.desc       Test OH_CameraManager_UnregisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_UnregisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0300
     * @tc.name       testOH_Camera_Manager_FUNCTION0300
     * @tc.desc       Test OH_CameraManager_GetSupportedCameras return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0400
     * @tc.name       testOH_Camera_Manager_FUNCTION0400
     * @tc.desc       Test OH_CameraManager_GetSupportedCameras return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameras", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0500
     * @tc.name       testOH_Camera_Manager_FUNCTION0500
     * @tc.desc       Test OH_CameraManager_DeleteSupportedCameras return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_DeleteSupportedCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0600
     * @tc.name       testOH_Camera_Manager_FUNCTION0600
     * @tc.desc       Test OH_CameraManager_GetSupportedCameraOutputCapability return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameraOutputCapability", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0800
     * @tc.name       testOH_Camera_Manager_FUNCTION0800
     * @tc.desc       Test OH_CameraManager_DeleteSupportedCameraOutputCapability return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_DeleteSupportedCameraOutputCapability", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0900
     * @tc.name       testOH_Camera_Manager_FUNCTION0900
     * @tc.desc       Test OH_CameraManager_IsCameraMuted return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_IsCameraMuted", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION1000
     * @tc.name       testOH_Camera_Manager_FUNCTION1000
     * @tc.desc       Test OH_CameraManager_IsCameraMuted return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_IsCameraMuted", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION1100
     * @tc.name       testOH_Camera_Manager_FUNCTION1100
     * @tc.desc       Test OH_CameraManager_CreateCaptureSession return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreateCaptureSession", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION1400
     * @tc.name       testOH_Camera_Manager_FUNCTION1400
     * @tc.desc       Test OH_CameraManager_CreateCameraInput_WithPositionAndType return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreateCameraInput_WithPositionAndType", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION1500
     * @tc.name       testOH_Camera_Manager_FUNCTION1500
     * @tc.desc       Test OH_CameraManager_CreatePreviewOutput return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreatePreviewOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION1800
     * @tc.name       testOH_Camera_Manager_FUNCTION1800
     * @tc.desc       Test OH_CameraManager_CreatePhotoOutput return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreatePhotoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION2100
     * @tc.name       testOH_Camera_Manager_FUNCTION2100
     * @tc.desc       Test OH_CameraManager_CreatePhotoOutputWithoutSurface return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreatePhotoOutputWithoutSurface", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION2200
     * @tc.name       testOH_Camera_Manager_FUNCTION2200
     * @tc.desc       Test OH_CameraManager_CreatePhotoOutputWithoutSurface return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreatePhotoOutputWithoutSurface", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION2400
     * @tc.name       testOH_Camera_Manager_FUNCTION2400
     * @tc.desc       Test OH_CameraManager_CreateVideoOutput return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreateVideoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION2700
     * @tc.name       testOH_Camera_Manager_FUNCTION2700
     * @tc.desc       Test OH_CameraManager_CreateMetadataOutput return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreateMetadataOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION2800
     * @tc.name       testOH_Camera_Manager_FUNCTION2800
     * @tc.desc       Test OH_CameraManager_CreateMetadataOutput return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_CreateMetadataOutput", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION3000
     * @tc.name       testOH_Camera_Manager_FUNCTION3000
     * @tc.desc       Test OH_CameraManager_GetSupportedSceneModes return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedSceneModes", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION3400
     * @tc.name       testOH_Camera_Manager_FUNCTION3400
     * @tc.desc       Test OH_CameraManager_GetCameraDevice return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetCameraDevice", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION3600
     * @tc.name       testOH_Camera_Manager_FUNCTION3600
     * @tc.desc       Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetCameraConcurrentInfos", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION3700
     * @tc.name       testOH_Camera_Manager_FUNCTION3700
     * @tc.desc       Test OH_CameraManager_GetCameraConcurrentInfos return CAMERA_INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetCameraConcurrentInfos", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0200
     * @tc.name testOH_Capture_Session_FUNCTION0200
     * @tc.desc Test OH_CaptureSession_SetSessionMode return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetSessionMode", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0400
     * @tc.name testOH_Capture_Session_FUNCTION0400
     * @tc.desc Test OH_CaptureSession_BeginConfig return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_BeginConfig", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0500
     * @tc.name testOH_Capture_Session_FUNCTION0500
     * @tc.desc Test OH_CaptureSession_CommitConfig return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_CommitConfig", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0700
     * @tc.name testOH_Capture_Session_FUNCTION0700
     * @tc.desc Test OH_CaptureSession_AddInput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddInput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0800
     * @tc.name testOH_Capture_Session_FUNCTION0800
     * @tc.desc Test OH_CaptureSession_AddInput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddInput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION0900
     * @tc.name testOH_Capture_Session_FUNCTION0900
     * @tc.desc Test OH_CaptureSession_RemoveInput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveInput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1000
     * @tc.name testOH_Capture_Session_FUNCTION1000
     * @tc.desc Test OH_CaptureSession_RemoveInput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveInput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1100
     * @tc.name testOH_Capture_Session_FUNCTION1100
     * @tc.desc Test OH_CaptureSession_AddPreviewOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddPreviewOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1200
     * @tc.name testOH_Capture_Session_FUNCTION1200
     * @tc.desc Test OH_CaptureSession_RemovePreviewOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemovePreviewOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1300
     * @tc.name testOH_Capture_Session_FUNCTION1300
     * @tc.desc Test OH_CaptureSession_AddPhotoOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddPhotoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1400
     * @tc.name testOH_Capture_Session_FUNCTION1400
     * @tc.desc Test OH_CaptureSession_AddPhotoOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddPhotoOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1500
     * @tc.name testOH_Capture_Session_FUNCTION1500
     * @tc.desc Test OH_CaptureSession_RemovePhotoOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemovePhotoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1600
     * @tc.name testOH_Capture_Session_FUNCTION1600
     * @tc.desc Test OH_CaptureSession_RemovePhotoOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemovePhotoOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1700
     * @tc.name testOH_Capture_Session_FUNCTION1700
     * @tc.desc Test OH_CaptureSession_AddVideoOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddVideoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1800
     * @tc.name testOH_Capture_Session_FUNCTION1800
     * @tc.desc Test OH_CaptureSession_AddVideoOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddVideoOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION1900
     * @tc.name testOH_Capture_Session_FUNCTION1900
     * @tc.desc Test OH_CaptureSession_RemoveVideoOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveVideoOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2000
     * @tc.name testOH_Capture_Session_FUNCTION2000
     * @tc.desc Test OH_CaptureSession_RemoveVideoOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveVideoOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2100
     * @tc.name testOH_Capture_Session_FUNCTION2100
     * @tc.desc Test OH_CaptureSession_AddMetadataOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddMetadataOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2200
     * @tc.name testOH_Capture_Session_FUNCTION2200
     * @tc.desc Test OH_CaptureSession_AddMetadataOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_AddMetadataOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2300
     * @tc.name testOH_Capture_Session_FUNCTION2300
     * @tc.desc Test OH_CaptureSession_RemoveMetadataOutput return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveMetadataOutput", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2400
     * @tc.name testOH_Capture_Session_FUNCTION2400
     * @tc.desc Test OH_CaptureSession_RemoveMetadataOutput return CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Capture_Session_FUNCTION2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_RemoveMetadataOutput", camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2500
     * @tc.name       testOH_Capture_Session_FUNCTION2500
     * @tc.desc       Test OH_CaptureSession_Start return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_Start", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2700
     * @tc.name       testOH_Capture_Session_FUNCTION2700
     * @tc.desc       Test OH_CaptureSession_Stop return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_Stop", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION2900
     * @tc.name       testOH_Capture_Session_FUNCTION2900
     * @tc.desc       Test OH_CaptureSession_Release return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_Release", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })



    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3100
     * @tc.name       testOH_Capture_Session_FUNCTION3100
     * @tc.desc       Test OH_CaptureSession_HasFlash return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_HasFlash", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3300
     * @tc.name       testOH_Capture_Session_FUNCTION3300
     * @tc.desc       Test OH_CaptureSession_IsFlashModeSupported return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_IsFlashModeSupported", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3500
     * @tc.name       testOH_Capture_Session_FUNCTION3500
     * @tc.desc       Test OH_CaptureSession_GetFlashMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetFlashMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3700
     * @tc.name       testOH_Capture_Session_FUNCTION3700
     * @tc.desc       Test OH_CaptureSession_SetFlashMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetFlashMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3800
     * @tc.name       testOH_Capture_Session_FUNCTION3800
     * @tc.desc       Test OH_CaptureSession_SetFlashMode return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetFlashMode", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION3900
     * @tc.name       testOH_Capture_Session_FUNCTION3900
     * @tc.desc       Test OH_CaptureSession_IsExposureModeSupported return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_IsExposureModeSupported", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4100
     * @tc.name       testOH_Capture_Session_FUNCTION4100
     * @tc.desc       Test OH_CaptureSession_GetExposureMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetExposureMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4300
     * @tc.name       testOH_Capture_Session_FUNCTION4300
     * @tc.desc       Test OH_CaptureSession_SetExposureMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetExposureMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4400
     * @tc.name       testOH_Capture_Session_FUNCTION4400
     * @tc.desc       Test OH_CaptureSession_SetExposureMode return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetExposureMode", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4500
     * @tc.name       testOH_Capture_Session_FUNCTION4500
     * @tc.desc       Test OH_CaptureSession_GetMeteringPoint return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetMeteringPoint", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4600
     * @tc.name       testOH_Capture_Session_FUNCTION4600
     * @tc.desc       Test OH_CaptureSession_GetMeteringPoint return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetMeteringPoint", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4700
     * @tc.name       testOH_Capture_Session_FUNCTION4700
     * @tc.desc       Test OH_CaptureSession_SetMeteringPoint return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetMeteringPoint", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4800
     * @tc.name       testOH_Capture_Session_FUNCTION4800
     * @tc.desc       Test OH_CaptureSession_SetMeteringPoint return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetMeteringPoint", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION4900
     * @tc.name       testOH_Capture_Session_FUNCTION4900
     * @tc.desc       Test OH_CaptureSession_GetExposureBiasRange return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetExposureBiasRange", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5000
     * @tc.name       testOH_Capture_Session_FUNCTION5000
     * @tc.desc       Test OH_CaptureSession_GetExposureBiasRange return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetExposureBiasRange", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5100
     * @tc.name       testOH_Capture_Session_FUNCTION5100
     * @tc.desc       Test OH_CaptureSession_SetExposureBias return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetExposureBias", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5200
     * @tc.name       testOH_Capture_Session_FUNCTION5200
     * @tc.desc       Test OH_CaptureSession_GetExposureBias return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetExposureBias", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5400
     * @tc.name       testOH_Capture_Session_FUNCTION5400
     * @tc.desc       Test OH_CaptureSession_IsFocusModeSupported return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_IsFocusModeSupported", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5600
     * @tc.name       testOH_Capture_Session_FUNCTION5600
     * @tc.desc       Test OH_CaptureSession_GetFocusMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetFocusMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5800
     * @tc.name       testOH_Capture_Session_FUNCTION5800
     * @tc.desc       Test OH_CaptureSession_SetFocusMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetFocusMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION5900
     * @tc.name       testOH_Capture_Session_FUNCTION5900
     * @tc.desc       Test OH_CaptureSession_GetFocusPoint return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetFocusPoint", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6100
     * @tc.name       testOH_Capture_Session_FUNCTION6100
     * @tc.desc       Test OH_CaptureSession_SetFocusPoint return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetFocusPoint", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6200
     * @tc.name       testOH_Capture_Session_FUNCTION6200
     * @tc.desc       Test OH_CaptureSession_SetFocusPoint return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetFocusPoint", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6300
     * @tc.name       testOH_Capture_Session_FUNCTION6300
     * @tc.desc       Test OH_CaptureSession_GetZoomRatioRange return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetZoomRatioRange", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6500
     * @tc.name       testOH_Capture_Session_FUNCTION6500
     * @tc.desc       Test OH_CaptureSession_GetZoomRatio return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetZoomRatio", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })



    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6700
     * @tc.name       testOH_Capture_Session_FUNCTION6700
     * @tc.desc       Test OH_CaptureSession_SetZoomRatio return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetZoomRatio", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6800
     * @tc.name       testOH_Capture_Session_FUNCTION6800
     * @tc.desc       Test OH_CaptureSession_SetZoomRatio return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetZoomRatio", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION6900
     * @tc.name       testOH_Capture_Session_FUNCTION6900
     * @tc.desc       Test OH_CaptureSession_IsVideoStabilizationModeSupported return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_IsVideoStabilizationModeSupported", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION7100
     * @tc.name       testOH_Capture_Session_FUNCTION7100
     * @tc.desc       Test OH_CaptureSession_GetVideoStabilizationMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetVideoStabilizationMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION7300
     * @tc.name       testOH_Capture_Session_FUNCTION7300
     * @tc.desc       Test OH_CaptureSession_SetVideoStabilizationMode return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetVideoStabilizationMode", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION7600
     * @tc.name       testOH_Capture_Session_FUNCTION7600
     * @tc.desc       Test OH_CaptureSession_GetExposureValue return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION7600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetExposureValue", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION7700
     * @tc.name       testOH_Capture_Session_FUNCTION7700
     * @tc.desc       Test OH_CaptureSession_GetFocalLength return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION7700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetFocalLength", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION7800
     * @tc.name       testOH_Capture_Session_FUNCTION7800
     * @tc.desc       Test OH_CaptureSession_SetSmoothZoom return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION7800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetSmoothZoom", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION8000
     * @tc.name       testOH_Capture_Session_FUNCTION8000
     * @tc.desc       Test OH_CaptureSession_GetActiveColorSpace return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION8000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_GetActiveColorSpace", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Capture_Session_FUNCTION8100
     * @tc.name       testOH_Capture_Session_FUNCTION8100
     * @tc.desc       Test OH_CaptureSession_SetActiveColorSpace return CAMERA_SESSION_NOT_CONFIG
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Capture_Session_FUNCTION8100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CaptureSession_SetActiveColorSpace", camera.CameraErrorCode.SESSION_NOT_CONFIG)
      expect(ret).assertEqual(TEST_OK)
      done()
    })
  })
}
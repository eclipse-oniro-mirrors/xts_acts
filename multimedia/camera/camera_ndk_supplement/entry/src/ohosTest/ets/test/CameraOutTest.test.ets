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

import CameraOut from 'libcameraout.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';


const TAG = "CAMERA_OUT_XTS_TEST_TAG ";
const TEST_OK = 0;
const SLEEP_500 = 500;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

async function getPhotoReceiverSurface(): Promise<string> {
  console.log(TAG + '通过宽、高、图片格式、容量创建ImageReceiver实例。');
  receiver = image.createImageReceiver({ width: 1280, height: 960 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + '创建ImageReceiver实例 successfully');
    const surfaceid: string = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
    return surfaceid;
  } else {
    console.log(TAG + '创建ImageReceiver实例 failed');
    return '';
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
  if (true) {
    return true;
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId()
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.ohcameraxtstest', applicationFlags, userId)
    let tokenId: number = applicationInfo.accessTokenId
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1)
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`)
  }
  console.info('getPermission end')
};

export default function CameraOutTest() {
  describe("CameraOutTest", () => {
    beforeAll(async () => {
      await getPermissions()
      await driveFn();
      await getPhotoReceiverSurface()
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.")
    })
    beforeEach(async () => {
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.")
    })
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.")
    })
    afterAll(() => {
      if (!releaseCamera()) {
        console.error(TAG + "releaseCamera FAILED");
        expect().assertFail();
      }
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed")
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_RegisterCallbackInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_RegisterCallbackInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_RegisterCallbackInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.RegisterCallbackInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_UnregisterCallbackInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_UnregisterCallbackInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_UnregisterCallbackInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.UnregisterCallbackInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputStart_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputStart_0100
     * @tc.desc   Test VideoOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputStart_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.VideoOutputStart(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputStart_0200
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputStart_0200
     * @tc.desc   Test VideoOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputStart_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.VideoOutputStart(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputStopInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputStopInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputStopInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.VideoOutputStopInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputReleaseInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputReleaseInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputReleaseInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.VideoOutputReleaseInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputIsMirrorSupportedInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputIsMirrorSupportedInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputIsMirrorSupportedInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.VideoOutputIsMirrorSupportedInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputEnableMirrorInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputEnableMirrorInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputEnableMirrorInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.VideoOutputEnableMirrorInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputGetVideoRotationInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputGetVideoRotationInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputGetVideoRotationInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.VideoOutputGetVideoRotationInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputRegisterCallbackInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputRegisterCallbackInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputRegisterCallbackInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputRegisterCallbackInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0100
     * @tc.desc   Test PreviewOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputUnregisterCallback(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0200
     * @tc.desc   Test PreviewOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputUnregisterCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputUnregisterCallback(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputStart_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputStart_0100
     * @tc.desc   Test PreviewOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputStart_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputStart(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputStart_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputStart_0200
     * @tc.desc   Test PreviewOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputStart_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputStart(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputStopInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputStopInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputStopInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputStopInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputReleaseInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputReleaseInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputReleaseInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputReleaseInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveProfile_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveProfile_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveProfile_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputGetActiveProfile()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputDeleteProfile_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputDeleteProfile_0100
     * @tc.desc   Test PreviewOutputDeleteProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputDeleteProfile_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputDeleteProfile()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputGetPreviewRotationInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputGetPreviewRotationInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputGetPreviewRotationInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputGetPreviewRotationInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputSetPreviewRotationInvalidParm_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputSetPreviewRotationInvalidParm_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputSetPreviewRotationInvalidParm_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PreviewOutputSetPreviewRotationInvalidParm()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0100
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputIsSupported(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0200
     * @tc.desc   Test CAMERA_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputIsSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputIsSupported(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0100
     * @tc.desc   Test getPhotoReceiverSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputQuality(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0200
     * @tc.desc   Test getPhotoReceiverSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputQuality_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputQuality(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0100
     * @tc.desc   Test CaptureSessionRegisterMacroStatusChangeCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionRegisterMacroStatusChangeCallback(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0200
     * @tc.desc   Test CaptureSessionRegisterMacroStatusChangeCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionRegisterMacroStatusChangeCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionRegisterMacroStatusChangeCallback(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0100
     * @tc.desc   Test CaptureSessionUnregisterMacroStatusChangeCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterMacroStatusChangeCallback(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0200
     * @tc.desc   Test CaptureSessionUnregisterMacroStatusChangeCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterMacroStatusChangeCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterMacroStatusChangeCallback(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0100
     * @tc.desc   Test MetadataOutputRegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputRegisterCallback(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0200
     * @tc.desc   Test MetadataOutputRegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputRegisterCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputRegisterCallback(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0100
     * @tc.desc   Test MetadataOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputUnregisterCallback(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0200
     * @tc.desc   Test MetadataOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputUnregisterCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputUnregisterCallback(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputStart_0100
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputStart_0100
     * @tc.desc   Test MetadataOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputStart_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputStart(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputStart_0200
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputStart_0200
     * @tc.desc   Test MetadataOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputStart_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputStart(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputStart_0300
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputStart_0300
     * @tc.desc   Test MetadataOutputStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputStart_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputStart(2)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputStop_0100
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputStop_0100
     * @tc.desc   Test MetadataOutputStop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputStop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputStop(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputStop_0200
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputStop_0200
     * @tc.desc   Test MetadataOutputStop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputStop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputStop(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0100
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0100
     * @tc.desc   Test MetadataOutputRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputRelease(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0200
     * @tc.number SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0200
     * @tc.desc   Test MetadataOutputRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_MetadataOutputRelease_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.MetadataOutputRelease(1);
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0100
     * @tc.desc   Test PhotoNativeGetMainImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoNativeGetMainImage(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0200
     * @tc.desc   Test PhotoNativeGetMainImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoNativeGetMainImage_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoNativeGetMainImage(1,)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoNativeRelease_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoNativeRelease_0100
     * @tc.desc   Test PhotoNativeRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoNativeRelease_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoNativeRelease()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0100
     * @tc.desc   Test PhotoOutputRegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputRegisterCallback(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0200
     * @tc.desc   Test PhotoOutputRegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputRegisterCallback(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputUnregisterCallback(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0200
     * @tc.desc   Test PhotoOutputUnregisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputUnregisterCallback(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0100
     * @tc.desc   Test PhotoOutputRegisterCaptureStartWithInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputRegisterCaptureStartWithInfoCallback(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0200
     * @tc.desc   Test PhotoOutputRegisterCaptureStartWithInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureStartWithInfoCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputRegisterCaptureStartWithInfoCallback(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureStartWithInfoCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureStartWithInfoCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterCaptureStartWithInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureStartWithInfoCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputUnregisterCaptureStartWithInfoCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureEndCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureEndCallback_0100
     * @tc.desc   Test PhotoOutputRegisterCaptureEndCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterCaptureEndCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRegisterCaptureEndCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureEndCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureEndCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterCaptureEndCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterCaptureEndCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputUnregisterCaptureEndCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterFrameShutterEndCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterFrameShutterEndCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterCaptureEndCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterFrameShutterEndCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRegisterFrameShutterEndCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputGetPhotoRotation_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputGetPhotoRotation_0100
     * @tc.desc   Test PhotoOutputGetPhotoRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputGetPhotoRotation_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputGetPhotoRotation()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterEstimatedCaptureDurationCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterEstimatedCaptureDurationCallback_0100
     * @tc.desc   Test PhotoOutputRegisterEstimatedCaptureDurationCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterEstimatedCaptureDurationCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRegisterEstimatedCaptureDurationCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterEstimatedCaptureDurationCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterEstimatedCaptureDurationCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterEstimatedCaptureDurationCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterEstimatedCaptureDurationCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputUnregisterEstimatedCaptureDurationCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAvailableCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAvailableCallback_0100
     * @tc.desc   Test PhotoOutputRegisterPhotoAvailableCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAvailableCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRegisterPhotoAvailableCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAvailableCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAvailableCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterPhotoAvailableCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAvailableCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputUnregisterPhotoAvailableCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAssetAvailableCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAssetAvailableCallback_0100
     * @tc.desc   Test PhotoOutputRegisterPhotoAssetAvailableCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRegisterPhotoAssetAvailableCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRegisterPhotoAssetAvailableCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAssetAvailableCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAssetAvailableCallback_0100
     * @tc.desc   Test PhotoOutputUnregisterPhotoAssetAvailableCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputUnregisterPhotoAssetAvailableCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputUnregisterPhotoAssetAvailableCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputRelease_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputRelease_0100
     * @tc.desc   Test PhotoOutputRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputRelease_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputRelease()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputIsMirrorSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputIsMirrorSupported_0100
     * @tc.desc   Test PhotoOutputIsMirrorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputIsMirrorSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputIsMirrorSupported()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputEnableMirror_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputEnableMirror_0100
     * @tc.desc   Test PhotoOutputEnableMirror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputEnableMirror_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.PhotoOutputEnableMirror()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputGetActiveProfile_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputGetActiveProfile_0100
     * @tc.desc   Test VideoOutputGetActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputGetActiveProfile_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.VideoOutputGetActiveProfile(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputGetSupportedFrameRates_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputGetSupportedFrameRates_0100
     * @tc.desc   Test VideoOutputGetSupportedFrameRates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputGetSupportedFrameRates_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.VideoOutputGetSupportedFrameRates(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_VideoOutputGetActiveFrameRate_0100
     * @tc.number SUB_MULTIMEIDA_Camera_VideoOutputGetActiveFrameRate_0100
     * @tc.desc   Test VideoOutputGetActiveFrameRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_VideoOutputGetActiveFrameRate_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.VideoOutputGetActiveFrameRate(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputCapture_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputCapture_0100
     * @tc.desc   Test PhotoOutputCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputCapture_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputCapture(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputCaptureWithCaptureSetting_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputCaptureWithCaptureSetting_0100
     * @tc.desc   Test PhotoOutputCaptureWithCaptureSetting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputCaptureWithCaptureSetting_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputCaptureWithCaptureSetting(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputGetActiveProfile_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputGetActiveProfile_0100
     * @tc.desc   Test PhotoOutputGetActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputGetActiveProfile_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputGetActiveProfile(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputIsMovingPhotoSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputIsMovingPhotoSupported_0100
     * @tc.desc   Test PhotoOutputIsMovingPhotoSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputIsMovingPhotoSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputIsMovingPhotoSupported(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PhotoOutputEnableMovingPhoto_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PhotoOutputEnableMovingPhoto_0100
     * @tc.desc   Test PhotoOutputEnableMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PhotoOutputEnableMovingPhoto_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PhotoOutputEnableMovingPhoto(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputGetSupportedFrameRates_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputGetSupportedFrameRates_0100
     * @tc.desc   Test PreviewOutputGetSupportedFrameRates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputGetSupportedFrameRates_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputGetSupportedFrameRates(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveFrameRate_0100
     * @tc.number SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveFrameRate_0100
     * @tc.desc   Test PreviewOutputGetActiveFrameRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_PreviewOutputGetActiveFrameRate_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.PreviewOutputGetActiveFrameRate(0, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionRegisterAutoDeviceSwitchStatusCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionRegisterAutoDeviceSwitchStatusCallback_0100
     * @tc.desc   Test CaptureSessionRegisterAutoDeviceSwitchStatusCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionRegisterAutoDeviceSwitchStatusCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.CaptureSessionRegisterAutoDeviceSwitchStatusCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0100
     * @tc.desc   Test CaptureSessionUnregisterAutoDeviceSwitchStatusCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterAutoDeviceSwitchStatusCallback(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0200
     * @tc.desc   Test CaptureSessionUnregisterAutoDeviceSwitchStatusCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterAutoDeviceSwitchStatusCallback_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterAutoDeviceSwitchStatusCallback(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0100
     * @tc.desc   Test CaptureSessionIsAutoDeviceSwitchSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsAutoDeviceSwitchSupported(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0200
     * @tc.desc   Test CaptureSessionIsAutoDeviceSwitchSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsAutoDeviceSwitchSupported(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0300
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0300
     * @tc.desc   Test CaptureSessionIsAutoDeviceSwitchSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsAutoDeviceSwitchSupported_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsAutoDeviceSwitchSupported(2)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0100
     * @tc.desc   Test CaptureSessionEnableAutoDeviceSwitch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionEnableAutoDeviceSwitch(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0200
     * @tc.desc   Test CaptureSessionEnableAutoDeviceSwitch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionEnableAutoDeviceSwitch_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionEnableAutoDeviceSwitch(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0100
     * @tc.desc   Test CaptureSessionSetQualityPrioritization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetQualityPrioritization(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0200
     * @tc.desc   Test CaptureSessionSetQualityPrioritization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetQualityPrioritization_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetQualityPrioritization(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0100
     * @tc.desc   Test CaptureSessionIsMacroSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsMacroSupported(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0200
     * @tc.desc   Test CaptureSessionIsMacroSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsMacroSupported(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0300
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0300
     * @tc.desc   Test CaptureSessionIsMacroSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsMacroSupported_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsMacroSupported(2)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionEnableMacro_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionEnableMacro_0100
     * @tc.desc   Test CaptureSessionEnableMacro
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionEnableMacro_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionEnableMacro(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0100
     * @tc.desc   Test CaptureSessionIsWhiteBalanceModeSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.CaptureSessionIsWhiteBalanceModeSupported(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0200
     * @tc.desc   Test CaptureSessionIsWhiteBalanceModeSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.CaptureSessionIsWhiteBalanceModeSupported(1, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0300
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0300
     * @tc.desc   Test CaptureSessionIsWhiteBalanceModeSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsWhiteBalanceModeSupported_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let surfaceid = await getPhotoReceiverSurface();
      let ret = CameraOut.CaptureSessionIsWhiteBalanceModeSupported(2, surfaceid)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0100
     * @tc.desc   Test CaptureSessionGetWhiteBalanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalanceMode(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0200
     * @tc.desc   Test CaptureSessionGetWhiteBalanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalanceMode(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0300
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0300
     * @tc.desc   Test CaptureSessionGetWhiteBalanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceMode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalanceMode(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0100
     * @tc.desc   Test CaptureSessionGetWhiteBalanceRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalanceRange(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0200
     * @tc.desc   Test CaptureSessionGetWhiteBalanceRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalanceRange_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalanceRange(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0100
     * @tc.desc   Test CaptureSessionGetWhiteBalance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalance(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0200
     * @tc.desc   Test CaptureSessionGetWhiteBalance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetWhiteBalance_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetWhiteBalance(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0100
     * @tc.desc   Test CaptureSessionSetWhiteBalance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetWhiteBalance(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0200
     * @tc.desc   Test CaptureSessionSetWhiteBalance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalance_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetWhiteBalance(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0100
     * @tc.desc   Test CaptureSessionSetWhiteBalanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetWhiteBalanceMode(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0200
     * @tc.desc   Test CaptureSessionSetWhiteBalanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionSetWhiteBalanceMode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionSetWhiteBalanceMode(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionRegisterSystem_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionRegisterSystem_0100
     * @tc.desc   Test CaptureSessionRegisterSystem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionRegisterSystem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionRegisterSystem(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0100
     * @tc.desc   Test CaptureSessionUnregisterSystem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterSystem(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0200
     * @tc.desc   Test CaptureSessionUnregisterSystem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterSystem_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterSystem(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0100
     * @tc.desc   Test CaptureSessionIsControlCenterSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsControlCenterSupported(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0200
     * @tc.desc   Test CaptureSessionIsControlCenterSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionIsControlCenterSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionIsControlCenterSupported(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionGetSupportedEffectTypes_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionGetSupportedEffectTypes_0100
     * @tc.desc   Test CaptureSessionGetSupportedEffectTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionGetSupportedEffectTypes_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionGetSupportedEffectTypes(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionDeleteSupportedEffectTypes_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionDeleteSupportedEffectTypes_0100
     * @tc.desc   Test CaptureSessionDeleteSupportedEffectTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionDeleteSupportedEffectTypes_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionDeleteSupportedEffectTypes(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0100
     * @tc.desc   Test CaptureSessionEnableControlCenter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionEnableControlCenter(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0200
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0200
     * @tc.desc   Test CaptureSessionEnableControlCenter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionEnableControlCenter_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionEnableControlCenter(1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionRegisterControl_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionRegisterControl_0100
     * @tc.desc   Test CaptureSessionRegisterControl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionRegisterControl_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionRegisterControl(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterControl_0100
     * @tc.number SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterControl_0100
     * @tc.desc   Test CaptureSessionUnregisterControl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEIDA_Camera_CaptureSessionUnregisterControl_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = CameraOut.CaptureSessionUnregisterControl(0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })
  })
}

